from faker import Faker
import random
import pandas as pd
import string
from datetime import date


# Gera dados para Dimensao_calendario
data_inicial = '1960-01-01'
data_final = '2030-12-31'

df_calendario = pd.DataFrame({
    'data': pd.date_range(start=data_inicial, end=data_final, freq='M')
})

df_calendario['ano_mes'] = df_calendario['data'].dt.to_period('M')
df_calendario['ano'] = df_calendario['data'].dt.year
df_calendario['mes'] = df_calendario['data'].dt.month
df_calendario['nome_mes'] = df_calendario['data'].dt.strftime('%B')
df_calendario['dia'] = 21


# Gera dados para Dimensao_cargo
Dimensao_cargo = [
    {'codigo_cargo': 'CDD', 'descricao_cargo':'Cientista de Dados', 'valor_custo_hora':83.13, 'valor_custo_dia':665},
    {'codigo_cargo': 'ADD', 'descricao_cargo':'Analista de Dados', 'valor_custo_hora':50.88, 'valor_custo_dia':407},
    { 'codigo_cargo': 'EDD', 'descricao_cargo':'Engenheiro de Dados', 'valor_custo_hora':73, 'valor_custo_dia':584},
    {'codigo_cargo': 'ADS', 'descricao_cargo':'Arquiteto de Soluções', 'valor_custo_hora':173.13, 'valor_custo_dia':1385},
    { 'codigo_cargo': 'SCM', 'descricao_cargo':'Scrum Master', 'valor_custo_hora':97, 'valor_custo_dia':776},
    { 'codigo_cargo': 'AGC', 'descricao_cargo':'Agile Coach', 'valor_custo_hora':36.5, 'valor_custo_dia':292},
    { 'codigo_cargo': 'ANF', 'descricao_cargo':'Analista Funcional', 'valor_custo_hora':39.75, 'valor_custo_dia':318},
    { 'codigo_cargo': 'PDO', 'descricao_cargo':'Product Owner', 'valor_custo_hora':96.13, 'valor_custo_dia':769},
    { 'codigo_cargo': 'AND', 'descricao_cargo':'Analista Desenvlvedor', 'valor_custo_hora':81, 'valor_custo_dia':648},
    { 'codigo_cargo': 'EPD', 'descricao_cargo':'Especialista Desenvolvedor', 'valor_custo_hora':169, 'valor_custo_dia':1352},
    { 'codigo_cargo': 'CCY', 'descricao_cargo':'Consultor Cybersecurity', 'valor_custo_hora':118.625, 'valor_custo_dia':949},
    { 'codigo_cargo': 'CCO', 'descricao_cargo':'Consultor Comercial', 'valor_custo_hora':67.875, 'valor_custo_dia':543},
    { 'codigo_cargo': 'EST', 'descricao_cargo':'Estagiário', 'valor_custo_hora':20, 'valor_custo_dia':160},
    { 'codigo_cargo': 'GRT', 'descricao_cargo':'Gerente Técnico', 'valor_custo_hora':206.5, 'valor_custo_dia':1652},
    { 'codigo_cargo': 'GRC', 'descricao_cargo':'Gerente Comercial', 'valor_custo_hora':206.5, 'valor_custo_dia':1652},
    { 'codigo_cargo': 'DUX', 'descricao_cargo':'Designer UX/UI', 'valor_custo_hora':52.88, 'valor_custo_dia':423},
    { 'codigo_cargo': 'AQA', 'descricao_cargo':'Analista de QA', 'valor_custo_hora':16.63, 'valor_custo_dia':853},
    { 'codigo_cargo': 'ANI', 'descricao_cargo':'Analista de Infraestrutura', 'valor_custo_hora':103.75, 'valor_custo_dia':830},
    { 'codigo_cargo': 'ANC', 'descricao_cargo':'Analista de Cloud', 'valor_custo_hora':103.75, 'valor_custo_dia':830},
    { 'codigo_cargo': 'EPC', 'descricao_cargo':'Especialista de Cloud', 'valor_custo_hora':195.25, 'valor_custo_dia':1562}
]


# Gera dados para Dimensao_despesas_projeto
Dimensao_despesas_projeto = [
    {'codigo_despesa':1,'tipo_despesa': 'Hospedagem'},
    {'codigo_despesa':2,'tipo_despesa': 'Passagem'},
    {'codigo_despesa':3,'tipo_despesa': 'Quilometragem'},
    {'codigo_despesa':4,'tipo_despesa': 'Refeição'},
    {'codigo_despesa':5,'tipo_despesa': 'Outros'}
]


# Gera dados para Dimensao_segmento_mercado
Dimensao_segmento_mercado = [
    {'codigo_segmento_mercado':1,'nome_segmento_mercado_consolidado': 'Enterprise','nome_segmento_mercado_detalhado': 'Energy & Utilities'},
    {'codigo_segmento_mercado':2,'nome_segmento_mercado_consolidado': 'Enterprise','nome_segmento_mercado_detalhado': 'Telco & Media'},
    {'codigo_segmento_mercado':3,'nome_segmento_mercado_consolidado': 'Enterprise','nome_segmento_mercado_detalhado': 'Mobility'},
    {'codigo_segmento_mercado':4,'nome_segmento_mercado_consolidado': 'Enterprise','nome_segmento_mercado_detalhado': 'Industry'},
    {'codigo_segmento_mercado':5,'nome_segmento_mercado_consolidado': 'Financial Services','nome_segmento_mercado_detalhado': 'Financial Services'},
    {'codigo_segmento_mercado':6,'nome_segmento_mercado_consolidado': 'Public Sector','nome_segmento_mercado_detalhado': 'Public Administration'},
    {'codigo_segmento_mercado':7,'nome_segmento_mercado_consolidado': 'Healt Care','nome_segmento_mercado_detalhado': 'Healt Care'}    
]


## Por motivo de Segurança e Proteção de Dados Sensíveis as demais tabelas terão dados fictícios 
# Inicializa o gerador de dados fictícios
fake = Faker('pt_BR')


# Gera dados para fictícios Dimensao_filial
Dimensao_filial = [
    {'codigo_filial': 'M1', 'endereco_filial': fake.address(), 'nome_cidade_filial': 'São Paulo', 'nome_Estado_filial': 'SP', 
     'codigo_cnpj_filial': fake.cnpj(), 'endereco_email_filial': fake.company_email(),'endereco_email_filial': fake.phone_number()},
    {'codigo_filial': 'F2', 'endereco_filial': fake.address(), 'nome_cidade_filial': 'Belo Horizonte', 'nome_Estado_filial': 'BH', 
     'codigo_cnpj_filial': fake.cnpj(), 'endereco_email_filial': fake.company_email(),'endereco_email_filial': fake.phone_number()},
    {'codigo_filial': 'F3', 'endereco_filial': fake.address(), 'nome_cidade_filial': 'Rio de Janeiro', 'nome_Estado_filial': 'RJ', 
     'codigo_cnpj_filial': fake.cnpj(), 'endereco_email_filial': fake.company_email(),'endereco_email_filial': fake.phone_number()},     
]
 

# Gera dados fictícios para Dimensao_cliente
num_clientes = 100

Dimensao_cliente = [{
    "codigo_cliente": i,
    "nome_cliente": fake.company(),
    "codigo_cnpj_cliente": fake.cnpj(),
    "endereco_email_cliente": fake.company_email(),
    "numero_telefone_cliente": fake.phone_number(),
    "data_cadastro_cliente": fake.date_this_decade()
} for i in range(1, num_clientes + 1)]


# Gera dados ficticios para Dimensao_colaborador
num_colaboradores = 1000

Dimensao_colaborador = [{
    "codigo_matricula_colaborador": i,
    "nome_colaborador": fake.name(),
    "tipo_contrato_trabalho": random.choice(['CLT','PJ']),
    "codigo_cargo_colaborador": random.choice(Dimensao_cargo)["codigo_cargo"],
    "data_nascimento_colaborador": fake.date_between(start_date=date(1960,1,1), end_date=date(1999,12,31)),
    "nome_cidade_colaborador": fake.city(),
    "numero_cpf_colaborador": fake.cpf(),
    "endereco_email_colaborador": fake.email(),
    "data_admissao_colaborador": fake.date_between(start_date=date(2010,1,1), end_date=date(2024,8,30))
} for i in range(1, num_colaboradores + 1)]


# Gera dados fictícios para Dimensao_projetos
num_projetos = 250

Dimensao_projeto = [{
    "id_projeto": i,
    "descricao_projeto": random.choice(['Desenvolvimento de software', 'Serviços de migração de infraestrutura','Processamento de dados',
                                        'Consultoria', 'Mão-de-Obra Especiaizada', 'Venda Licenca Software']),
    "codigo_matricula_gestor_projeto": random.choice([15,47,53,102,114]), 
    "nome_gestor_projeto": random.choice(['Alexia Marques','Liz Nascimento','Nathan Peixoto','Sr. Arthur Gabriel Silva','Dr. Otávio da Luz']),
    "valor_receita_projeto": random.randint(2000000,2500000),
    "valor_custo_projeto": random.randint(1800000,2000000),
    "data_inicio_projeto": fake.date_between(start_date=date(2023,1,1), end_date=date(2024,9,15)),
    "data_fim_projeto": fake.date_between(start_date=date(2024,12,31), end_date=date(2025,12,31)),
    "numero_versao_projeto": random.randint(1,3)
} for i in range(1, num_projetos + 1)]


# Salvando os Dataframes criados como CSV 
df_calendario.to_csv('Dimensao_calendario.csv', index=False)
Dimensao_cargo.to_csv('Dimensao_cargo.csv', index=False)
Dimensao_despesas_projeto.to_csv('Dimensao_despesas.csv', index=False)
Dimensao_segmento_mercado.to_csv('Dimensao_segmento.csv', index=False)
Dimensao_filial.to_csv('Dimensao_filial.csv', index=False)
Dimensao_cliente.to_csv('Dimensao_cliente.csv', index=False)
Dimensao_colaborador.to_csv('Dimensao_colaborador.csv', index=False)
Dimensao_projeto.to_csv('Dimensao_projeto.csv', index=False)