USE sigsaude

SELECT dtrecebimento, dtfinalizacao, dsoperadora,
       dscorretora, dsestipulante, dtcompetoperadora,
       dsresponsavel
  FROM controlerotina
 WHERE dtreferencia = '2023-06-01'
   AND dsresponsavel IN ('CAHIAN')
   -- AND dsoperadora = 'Saúde Beneficência'
   -- AND dscorretora = 'WINTAGE'
   -- AND dsestipulante like '%viasoft%'
 ORDER BY
       CASE
           WHEN dsoperadora IN (
                'AMIL', 'PLANO DE SAÚDE ANA COSTA', 'CNU')
           THEN 0
           ELSE 1
       END,
       CAST(dtrecebimento + 0 AS INT),
       dsoperadora, dtfinalizacao,
       CASE
           WHEN dsestipulante IN (
                'MOINHOS', 'SHOPPING DO CIDADÃO', 'POP TRADE',
                'ZUP', 'BLAU FARMACÊUTICA', 'MTRIX TECNOLOGIA',
                'ANIN', 'SILVA E BARBOSA', 'ICE CARTÕES',
                'ROLDAO')
           THEN 0
           ELSE 1
        END,
        dscorretora, dsestipulante
