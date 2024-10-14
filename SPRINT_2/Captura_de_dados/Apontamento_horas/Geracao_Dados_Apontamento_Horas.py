from faker import Faker
import random
import pandas as pd
import string
from datetime import date

# Inicializa o gerador de dados fictícios
fake = Faker('pt_BR')

# Gera dados fictícios para apontamento de horas trabalhadas po projeto
num_apontamento_horas = 19000

Captura_apontamento_horas = [{
    "surrogate_key_captura_apontamento_horas": i,
    "data_apontamento": fake.date_between(start_date=date(2023,1,1), end_date=date(2023,1,30)), 
    "codigo_matricula_colaborador_apontado": random.randint(1,960),
    "codigo_filial_apontada": random.choice(['M1','F2','F3']),
    "codigo_projeto_apontado": random.randint(1,250),
    "codigo_cliente_projeto": random.randint(1,100),
    "codigo_segmento_mercado": random.randint(1,7),
    "indicador_tipo_hora_trabalhada": random.choice(['HN','HE']),
    "quantidade_horas_trabalhadas": round(random.uniform(1, 8), 2),
    "tipo_despesa_apontada": random.randint(1,5),
    "valor_despesa_apontada": round(random.uniform(1,150), 2)
} for i in range(1, num_apontamento_horas + 1)]

# Grava os dados gerados em um Dataframe
df_Captura_apontamento_horas = pd.DataFrame(Captura_apontamento_horas)

# Salvando o Dataframe criado como CSV 
df_Captura_apontamento_horas.to_csv('Tabela_Captura_apontamento_horas_202301.csv', index=False)