-- Query 1, Comparação entre realizado e panejado
SELECT * 
FROM Fato_projeto_planejado fpp 
FULL OUTER JOIN ( 
SELECT 
fpr.ano_mes_calendario as ano_mes_calendario_realizado,
fpr.codigo_projeto as codigo_projeto_realizado,
SUM(fpr.quantidade_horas_trabalhadas * dc.valor_custo_hora) as custo_trabalho_realizado,
SUM(valor_despesa) as despesas_realizadas,
SUM((fpr.quantidade_horas_trabalhadas * dc.valor_custo_hora) + fpr.valor_despesa) as custo_total_realizado
FROM dbo.Fato_projeto_realizado fpr 
INNER JOIN dbo.Dimensao_cargo dc ON (fpr.codigo_cargo = dc.codigo_cargo)
GROUP BY fpr.ano_mes_calendario, fpr.codigo_projeto
) as tr 
ON (fpp.ano_mes_calendario = tr.ano_mes_calendario_realizado and fpp.codigo_projeto = tr.codigo_projeto_realizado);



-- Query 2, Visões Analíticas da Fato Projeto Realizado
SELECT *
FROM dbo.Fato_projeto_realizado fpr 
INNER JOIN Dimensao_colaborador dc ON fpr.surrogate_key_colaborador = dc.surrogate_key_colaborador 
INNER JOIN Dimensao_cargo dc2 ON fpr.codigo_cargo = dc2.codigo_cargo 
INNER JOIN Dimensao_cliente dc3 ON fpr.surrogate_key_cliente = dc3.surrogate_key_cliente 
INNER JOIN Dimensao_despesas_projeto ddp ON fpr.surrogate_key_despesa = ddp.surrogate_key_despesa 
INNER JOIN Dimensao_projeto dp ON fpr.codigo_projeto = dp.codigo_projeto 
INNER JOIN Dimensao_segmento_mercado dsm ON fpr.surrogate_key_segmento_mercado = dsm.surrogate_key_segmento_mercado 


















 