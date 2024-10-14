-- Criação de gatilho que faz a carga da Tabela_captura_apontamento_horas para Fato_projeto_realizado
CREATE TRIGGER CapturaApontamentoHoras_to_FatoProjetoRealizado
ON KPIsProjetos.dbo.Tabela_captura_apontamento_horas 
AFTER INSERT
AS
BEGIN
    INSERT INTO KPIsProjetos.dbo.Fato_projeto_realizado (ano_mes_calendario, surrogate_key_colaborador, codigo_cargo, 
    surrogate_key_cliente, surrogate_key_segmento_mercado, surrogate_key_filial, surrogate_key_despesa, data_carga, indicador_tipo_hora_trabalhada,
    quantidade_horas_trabalhadas, valor_despesa, codigo_projeto)
    SELECT CONVERT(VARCHAR(6), i.data_apontamento, 112),
    Dcob.surrogate_key_colaborador,
    Dcob.codigo_cargo_colaborador,
    Dcli.surrogate_key_cliente,
    i.codigo_segmento_mercado,
    Dfil.surrogate_key_filial,
    i.tipo_despesa_apontada,
    i.data_carga,
    i.indicador_tipo_hora_trabalhada,
    i.quantidade_horas_trabalhadas,
    i.valor_despesa_apontada,
    i.codigo_projeto_apontado
    FROM inserted i
    INNER JOIN KPIsProjetos.dbo.Dimensao_colaborador Dcob ON (i.codigo_matricula_colaborador_apontado = Dcob.codigo_matricula_colaborador)
    INNER JOIN KPIsProjetos.dbo.Dimensao_cliente Dcli ON (i.codigo_cliente_projeto = Dcli.codigo_cliente)
    INNER JOIN KPIsProjetos.dbo.Dimensao_filial Dfil ON (i.codigo_filial_apontada = Dfil.codigo_filial)    
END;



-- Criação de gatilho que faz a carga da Tabela_captura_planejamento_projeto para Fato_projeto_planejado
CREATE TRIGGER CapturaPlanejamentoProjeto_to_FatoProjetoPlanejado
ON KPIsProjetos.dbo.Tabela_captura_planejamento_projeto 
AFTER INSERT
AS
BEGIN
    INSERT INTO KPIsProjetos.dbo.Fato_projeto_planejado (ano_mes_calendario, codigo_projeto, data_carga, valor_custo, valor_receita)
    SELECT 
    CAST(i.ano_planejado AS VARCHAR(4)) + RIGHT('0' + CAST(i.mes_planejado AS VARCHAR(2)), 2),
    i.id_projeto,
    i.data_carga,
    i.valor_custo,
    i.valor_receita
    FROM inserted i  
END;