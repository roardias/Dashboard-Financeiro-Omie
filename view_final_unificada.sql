-- ================================================================
-- VIEW FINAL UNIFICADA: vw_saldo_acumulado
-- ================================================================
-- Saldo inicial vira uma linha na data saldo_data
-- Movimentos permanecem como linhas normais
-- Resultado: dados unificados ordenados por data

-- Dropar view atual e dependências
DROP VIEW IF EXISTS vw_saldo_acumulado CASCADE;

-- Criar view final unificada
CREATE VIEW vw_saldo_acumulado AS
-- Movimentos normais
SELECT 
    mf.empresa,
    mf.conta_corrente_descricao,
    mf.chave_empresa_cod_c_corrente,
    mf.d_dt_pagamento,
    SUM(mf.valor_corrigido) as valor_corrigido,
    'MOVIMENTO' as tipo
FROM movimento_financeiro mf
GROUP BY 
    mf.empresa,
    mf.conta_corrente_descricao,
    mf.chave_empresa_cod_c_corrente,
    mf.d_dt_pagamento

UNION ALL

-- Saldo inicial como "movimento" na data saldo_data
SELECT 
    cc.empresa,
    mf_desc.conta_corrente_descricao,
    cc.chave_empresa_cod_c_corrente,
    cc.saldo_data as d_dt_pagamento,
    cc.saldo_inicial as valor_corrigido,
    'SALDO_INICIAL' as tipo
FROM contas_correntes cc
LEFT JOIN (
    SELECT DISTINCT chave_empresa_cod_c_corrente, conta_corrente_descricao
    FROM movimento_financeiro
) mf_desc ON cc.chave_empresa_cod_c_corrente = mf_desc.chave_empresa_cod_c_corrente
WHERE cc.saldo_inicial IS NOT NULL 
  AND cc.saldo_inicial != 0
  AND cc.saldo_data IS NOT NULL
  AND mf_desc.conta_corrente_descricao IS NOT NULL

ORDER BY empresa, conta_corrente_descricao, d_dt_pagamento, tipo DESC;

-- ================================================================
-- RECRIAR VIEW DEPENDENTE
-- ================================================================
CREATE VIEW vw_dashboard_resumo AS
SELECT 
    empresa,
    conta_corrente_descricao,
    0 as saldo_inicial,  -- Não faz mais sentido separar na nova estrutura
    SUM(valor_corrigido) as saldo_final,
    COUNT(*) as qtd_movimentos,
    MIN(d_dt_pagamento) as primeira_movimentacao,
    MAX(d_dt_pagamento) as ultima_movimentacao
FROM vw_saldo_acumulado
GROUP BY empresa, conta_corrente_descricao
ORDER BY empresa, saldo_final DESC;
