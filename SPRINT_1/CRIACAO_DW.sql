
CREATE TABLE Dicionario_dados (
                nome_tabela VARCHAR(30) NOT NULL,
                nome_atributo VARCHAR(30) NOT NULL,
                tipo_dado VARCHAR(20) NOT NULL,
                quantidade_caracteres VARCHAR(3) NOT NULL,
                indicador_obrigatorio VARCHAR(3) NOT NULL,
                valor_permitido VARCHAR(999) NOT NULL,
                indicador_chave_primaria VARCHAR(3) NOT NULL,
                indicador_chave_estrangeira VARCHAR(3) NOT NULL,
                descricao_atributo VARCHAR(999) NOT NULL
)

CREATE TABLE Tabela_captura_planejamento_horas (
                surrogate_key_captura_planejamento_horas NUMERIC(10) IDENTITY NOT NULL,
                mes_planejado NUMERIC(2) NOT NULL,
                ano_planejado NUMERIC(2) NOT NULL,
                codigo_projeto_planejado NUMERIC(10) NOT NULL,
                codigo_cliente_planejado NUMERIC(5) NOT NULL,
                codigo_tipo_projeto_planejado VARCHAR(1) NOT NULL,
                codigo_segmento_mercado VARCHAR(4) NOT NULL,
                codigo_cargo_colaborador_apontado VARCHAR(3) NOT NULL,
                quantidade_horas_trabalhadas_apontada NUMERIC(2,2) NOT NULL,
                tipo_despesa_apontada VARCHAR(20) NOT NULL,
                valor_despesa_apontada NUMERIC(5,2) NOT NULL,
                data_carga DATETIME NOT NULL,
                CONSTRAINT Tabela_captura_planejamento_horas_pk PRIMARY KEY (surrogate_key_captura_planejamento_horas)
)

CREATE TABLE Tabela_captura_apontamento_horas (
                surrogate_key_captura_apontamento_horas NUMERIC(10) IDENTITY NOT NULL,
                data_apontamento DATETIME NOT NULL,
                codigo_matricula_colaborador_apontado VARCHAR(5) NOT NULL,
                nome_colaborador_apontado VARCHAR(40) NOT NULL,
                tipo_contrato_trabalho_apontado VARCHAR(3) NOT NULL,
                codigo_cargo_colaborador_apontado VARCHAR(3) NOT NULL,
                codigo_filial_apontada NUMERIC(2) NOT NULL,
                nome_filial_apontada VARCHAR(20) NOT NULL,
                codigo_projeto_apontado NUMERIC(10) NOT NULL,
                codigo_cliente_apontado NUMERIC(5) NOT NULL,
                codigo_segmento_mercado VARCHAR(4) NOT NULL,
                indicador_tipo_hora_trabalhada_apontada VARCHAR NOT NULL,
                quantidade_horas_trabalhadas_apontada NUMERIC(2,2) NOT NULL,
                tipo_despesa_apontada VARCHAR(20) NOT NULL,
                valor_despesa_apontada NUMERIC(5,2) NOT NULL,
                data_carga DATETIME NOT NULL,
                CONSTRAINT Tabela_captura_apontamento_horas_pk PRIMARY KEY (surrogate_key_captura_apontamento_horas)
)

CREATE TABLE Dimensao_despesas_projeto (
                surrogate_key_despesa NUMERIC(2) IDENTITY NOT NULL,
                tipo_despesa VARCHAR(20) NOT NULL,
                CONSTRAINT Dimensao_despesas_projeto_pk PRIMARY KEY (surrogate_key_despesa)
)

CREATE TABLE Dimensao_calendario (
                ano_mes_calendario NUMERIC(6) IDENTITY NOT NULL,
                numero_ano_calendario NUMERIC(4) NOT NULL,
                numero_mes_calendario NUMERIC(2) NOT NULL,
                nome_mes_calendario VARCHAR(18) NOT NULL,
                dias_uteis_mes_calendario NUMERIC(2) NOT NULL,
                CONSTRAINT Dimensao_calendario_pk PRIMARY KEY (ano_mes_calendario)
)

CREATE TABLE Dimensao_cliente (
                surrogate_key_cliente NUMERIC(5) IDENTITY NOT NULL,
                nome_cliente VARCHAR(50) NOT NULL,
                codigo_cnpj_cliente NUMERIC(14) NOT NULL,
                endereco_email_cliente VARCHAR(40) NOT NULL,
                numero_telefone_cliente NUMERIC(10) NOT NULL,
                data_cadastro_cliente DATETIME NOT NULL,
                CONSTRAINT Dimensao_cliente_pk PRIMARY KEY (surrogate_key_cliente)
)

CREATE TABLE Dimensao_cargo (
                codigo_cargo VARCHAR(3) NOT NULL,
                descricao_cargo VARCHAR(40) NOT NULL,
                valor_custo_hora NUMERIC(5,2) NOT NULL,
                valor_custo_dia NUMERIC(5,2) NOT NULL,
                CONSTRAINT Dimensao_cargo_pk PRIMARY KEY (codigo_cargo)
)

CREATE TABLE Dimensao_projeto (
                codigo_projeto NUMERIC(5) NOT NULL,
                descricao_projeto VARCHAR(60) NOT NULL,
                codigo_matricula_gestor_projeto VARCHAR(5) NOT NULL,
                nome_gestor_projeto VARCHAR(40) NOT NULL,
                valor_receita_projeto NUMERIC(9,2) NOT NULL,
                valor_custo_projeto NUMERIC(9,2) NOT NULL,
                data_inicio_projeto DATETIME NOT NULL,
                data_fim_projeto DATETIME NOT NULL,
                numero_versao_projeto NUMERIC(2) NOT NULL,
                CONSTRAINT Dimensao_projeto_pk PRIMARY KEY (codigo_projeto)
)

CREATE TABLE Dimensao_filial (
                surrogate_key_filial NUMERIC(2) IDENTITY NOT NULL,
                nome_filial VARCHAR(20) NOT NULL,
                endereco_filial VARCHAR(40) NOT NULL,
                nome_cidade_filial VARCHAR(20) NOT NULL,
                nome_estado_filial VARCHAR(20) NOT NULL,
                codigo_cnpj_filial NUMERIC(14) NOT NULL,
                endereco_email_filial VARCHAR(40) NOT NULL,
                numero_telefone_filial NUMERIC(10) NOT NULL,
                CONSTRAINT Dimensao_filial_pk PRIMARY KEY (surrogate_key_filial)
)

CREATE TABLE Dimensao_segmento_mercado (
                surrogate_key_segmento_mercado NUMERIC(2) NOT NULL,
                nome_segmento_mercado_consolidado VARCHAR(30) NOT NULL,
                nome_segmento_mercado_detalhado VARCHAR(30) NOT NULL,
                CONSTRAINT Dimensao_segmento_mercado_pk PRIMARY KEY (surrogate_key_segmento_mercado)
)

CREATE TABLE Fato_projeto_planejado (
                surrogate_key_projeto_planejado NUMERIC(10) IDENTITY NOT NULL,
                ano_mes_calendario NUMERIC(6) NOT NULL,
                codigo_cargo VARCHAR(3) NOT NULL,
                surrogate_key_cliente NUMERIC(5) NOT NULL,
                surrogate_key_segmento_mercado NUMERIC(2) NOT NULL,
                surrogate_key_despesa NUMERIC(2) NOT NULL,
                codigo_projeto NUMERIC(5) NOT NULL,
                data_carga DATETIME NOT NULL,
                quantidade_trabalho_hora_normal NUMERIC(2,2) NOT NULL,
                quantidade_trabalho_hora_extra NUMERIC(2,2) NOT NULL,
                valor_despesa NUMERIC(5,2) NOT NULL,
                CONSTRAINT Fato_projeto_planejado_pk PRIMARY KEY (surrogate_key_projeto_planejado)
)

CREATE TABLE Dimensao_colaborador (
                surrogate_key_colaborador NUMERIC(5) IDENTITY NOT NULL,
                codigo_matricula_colaborador VARCHAR(5) NOT NULL,
                nome_colaborador VARCHAR(40) NOT NULL,
                tipo_contrato_trabalho VARCHAR(3) NOT NULL,
                codigo_cargo_colaborador VARCHAR(3) NOT NULL,
                data_nascimento_colaborador DATETIME NOT NULL,
                nome_cidade_coaborador VARCHAR(30) NOT NULL,
                numero_cpf_colaborador VARCHAR(11) NOT NULL,
                endereco_email_colaborador VARCHAR(40) NOT NULL,
                data_admissao_colaborador DATETIME NOT NULL,
                CONSTRAINT Dimensao_colaborador_pk PRIMARY KEY (surrogate_key_colaborador)
)

CREATE TABLE Fato_projeto_realizado (
                surrogate_key_projeto_realizado NUMERIC(10) IDENTITY NOT NULL,
                ano_mes_calendario NUMERIC(6) NOT NULL,
                surrogate_key_colaborador NUMERIC(5) NOT NULL,
                codigo_cargo VARCHAR(3) NOT NULL,
                surrogate_key_cliente NUMERIC(5) NOT NULL,
                surrogate_key_segmento_mercado NUMERIC(2) NOT NULL,
                surrogate_key_filial NUMERIC(2) NOT NULL,
                surrogate_key_despesa NUMERIC(2) NOT NULL,
                data_carga DATETIME NOT NULL,
                indicador_tipo_hora_trabalhada VARCHAR(2) NOT NULL,
                quantidade_horas_trabalhadas NUMERIC(2,2) NOT NULL,
                valor_despesa NUMERIC(5,2) NOT NULL,
                codigo_projeto NUMERIC(5) NOT NULL,
                CONSTRAINT Fato_projeto_realizado_pk PRIMARY KEY (surrogate_key_projeto_realizado)
)

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_despesas_projeto_Fato_projeto_realizado_fk
FOREIGN KEY (surrogate_key_despesa)
REFERENCES Dimensao_despesas_projeto (surrogate_key_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_planejado ADD CONSTRAINT Dimensao_despesas_projeto_Fato_projeto_planejado_fk
FOREIGN KEY (surrogate_key_despesa)
REFERENCES Dimensao_despesas_projeto (surrogate_key_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_calendario_Fato_projeto_realizado_fk
FOREIGN KEY (ano_mes_calendario)
REFERENCES Dimensao_calendario (ano_mes_calendario)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_planejado ADD CONSTRAINT Dimensao_calendario_Fato_projeto_planejado_fk
FOREIGN KEY (ano_mes_calendario)
REFERENCES Dimensao_calendario (ano_mes_calendario)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_cliente_Fato_projeto_realizado_fk
FOREIGN KEY (surrogate_key_cliente)
REFERENCES Dimensao_cliente (surrogate_key_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_planejado ADD CONSTRAINT Dimensao_cliente_Fato_projeto_planejado_fk
FOREIGN KEY (surrogate_key_cliente)
REFERENCES Dimensao_cliente (surrogate_key_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_cargo_Fato_projeto_realizado_fk
FOREIGN KEY (codigo_cargo)
REFERENCES Dimensao_cargo (codigo_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_planejado ADD CONSTRAINT Dimensao_cargo_Fato_projeto_planejado_fk
FOREIGN KEY (codigo_cargo)
REFERENCES Dimensao_cargo (codigo_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_projeto_Fato_projeto_realizado_fk
FOREIGN KEY (codigo_projeto)
REFERENCES Dimensao_projeto (codigo_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_planejado ADD CONSTRAINT Dimensao_projeto_Fato_projeto_planejado_fk
FOREIGN KEY (codigo_projeto)
REFERENCES Dimensao_projeto (codigo_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_filial_Fato_projeto_realizado_fk
FOREIGN KEY (surrogate_key_filial)
REFERENCES Dimensao_filial (surrogate_key_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dimensao_segmento_mercado_Fato_projeto_realizado_fk
FOREIGN KEY (surrogate_key_segmento_mercado)
REFERENCES Dimensao_segmento_mercado (surrogate_key_segmento_mercado)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_planejado ADD CONSTRAINT Dimensao_segmento_mercado_Fato_projeto_planejado_fk
FOREIGN KEY (surrogate_key_segmento_mercado)
REFERENCES Dimensao_segmento_mercado (surrogate_key_segmento_mercado)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Fato_projeto_realizado ADD CONSTRAINT Dim_colaborador_Fato_projeto_realizado_fk
FOREIGN KEY (surrogate_key_colaborador)
REFERENCES Dimensao_colaborador (surrogate_key_colaborador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
