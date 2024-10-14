import pandas as pd
import os
print(os.getcwd())

variavel = os.getcwd()

def load_csv_to_sql():
    df = pd.read_csv(variavel+'\\Tabela_Captura_apontamento_horas_202301.csv')
    for index, row in df.iterrows():
        print(row)

load_csv_to_sql()

print(os.listdir(variavel))