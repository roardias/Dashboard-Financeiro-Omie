-- ================================================================
-- FUNÇÃO CORRIGIDA: SEM FILTROS COMPLEXOS
-- ================================================================

CREATE OR REPLACE FUNCTION get_saldo_simples(
    filtro_empresa TEXT DEFAULT NULL
)
RETURNS TABLE(
    empresa TEXT,
    conta_corrente_descricao TEXT,
    saldo_inicial_conta NUMERIC,
    movimentos_do_periodo NUMERIC,
    saldo_final NUMERIC,
    qtd_movimentos BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        sa.empresa,
        sa.conta_corrente_descricao,
        -- Separar saldo inicial dos movimentos
        SUM(CASE WHEN sa.tipo = 'SALDO_INICIAL' THEN sa.valor_corrigido ELSE 0 END) as saldo_inicial_conta,
        SUM(CASE WHEN sa.tipo = 'MOVIMENTO' THEN sa.valor_corrigido ELSE 0 END) as movimentos_do_periodo,
        SUM(sa.valor_corrigido) as saldo_final,
        COUNT(CASE WHEN sa.tipo = 'MOVIMENTO' THEN 1 END) as qtd_movimentos
    FROM vw_saldo_acumulado sa
    WHERE 
        (filtro_empresa IS NULL OR sa.empresa = filtro_empresa)
    GROUP BY sa.empresa, sa.conta_corrente_descricao
    ORDER BY sa.empresa, saldo_final DESC;
END;
$$ LANGUAGE plpgsql;

-- TESTE SIMPLES
SELECT * FROM get_saldo_simples('ALLDAX 2') LIMIT 5;
