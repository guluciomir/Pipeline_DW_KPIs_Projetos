import pandas as pd
from datetime import date
from datetime import datetime
import numpy as np

# Criar um Dataframe a partir do arquivo csv Dimensão_projeto 
dimensao_projeto_path_novo = 'c:\\Users\guluciomir\PosArqEngDados\ProjetoFinal\SPRINT 2\Dimensao_Projeto.csv'

df_dimensao_projeto_novo = pd.read_csv(dimensao_projeto_path_novo, delimiter=';', encoding='latin1')

df_dimensao_projeto_novo['data_inicio_projeto'] = pd.to_datetime(df_dimensao_projeto_novo['data_inicio_projeto'], format='%d/%m/%Y')
df_dimensao_projeto_novo['data_fim_projeto'] = pd.to_datetime(df_dimensao_projeto_novo['data_fim_projeto'], format='%d/%m/%Y')


# Função para gerar os meses e anos entre duas datas
def gerar_meses_anos(data_inicio, data_fim):
    data_atual = data_inicio
    meses = []
    while data_atual <= data_fim:
        meses.append((data_atual.month, data_atual.year))
        if data_atual.month == 12:
            data_atual = datetime(data_atual.year + 1, 1, 1)
        else:
            data_atual = datetime(data_atual.year, data_atual.month + 1, 1)
    return meses

# Criando um novo DataFrame com os meses, anos e os valores ajustados
linhas_novas = []

for _, row in df_dimensao_projeto_novo.iterrows():
    meses_anos = gerar_meses_anos(row['data_inicio_projeto'], row['data_fim_projeto'])
    num_meses = len(meses_anos)
    
    # Dividindo os valores de custo e receita pelos meses
    valor_custo_mensal = row['valor_custo_projeto'] / num_meses
    valor_receita_mensal = row['valor_receita_projeto'] / num_meses
    
    for mes, ano in meses_anos:
        linhas_novas.append({
            'mês': mes,
            'ano': ano,
            'id_projeto': row['id_projeto'],
            'valor_custo': valor_custo_mensal,
            'valor_receita': valor_receita_mensal
        })

# Criando o novo DataFrame com as linhas geradas
df_captura_planejamento_projeto = pd.DataFrame(linhas_novas)

# Exibindo as primeiras linhas do novo DataFrame
df_captura_planejamento_projeto.head(3)
