import os
import pandas as pd
import pyodbc
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

#Configurações do SQL Server
server = 'MCTAB086451'
database = 'KPIsProjetos'
table_name = 'Tabela_captura_planejamento_projeto'


# Configuração da conexão
conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database}')
cursor = conn.cursor()

# Função para carregar CSV para o SQL Server
def load_csv_to_sql(file_path):
    df = pd.read_csv(file_path)
    header = df.columns
    colunas = ', '.join(header)
    valores = ', '.join(['?']*len(header))
    for index, row in  df.iterrows():
        cursor.execute(f"INSERT INTO {table_name} ({colunas}) VALUES({valores})", tuple(row))
    conn.commit()



class NewFileHandler(FileSystemEventHandler):
    def on_created(self, event):
        if event.is_directory:
            return
        elif event.src_path.endswith('.csv'):
            load_csv_to_sql(event.src_path)
            print(f'{event.src_path} carregado com sucesso.')

# Caminho da pasta com os arquivos CSV
folder_path = 'C:\\Users\\guluciomir\\PosArqEngDados\\ProjetoFinal\\SPRINT 2\\Captura_de_dados\\Planejamento_horas'
# Configuração do observador
event_handler = NewFileHandler()
observer = Observer()
observer.schedule(event_handler, path=folder_path, recursive=False)
observer.start()

if __name__=='__main__':

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
