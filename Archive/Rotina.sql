use sigsaude

--
-- SigSaúde
--
 select dtrecebimento,
        dtfinalizacao,
        dsoperadora,
        dscorretora,
        dsestipulante,
        dtcompetoperadora,
        dsresponsavel
   from controlerotina
  where dtreferencia = '2023-06-01'
        and dsresponsavel in ('cahian')
        -- and dsestipulante like '%viasoft%'
  order by
		case
		    when dsoperadora like '%amil%'
              or dsoperadora like '%ana costa%'
              or dsoperadora like '%cnu%'
			then 0
            else 1
        end,
        cast(dtrecebimento + 0 as int),
        dsoperadora,
        dtfinalizacao,
        case
            when dsestipulante like '%moinhos%'
              or dsestipulante like '%cidadão%'
              or dsestipulante like '%pop%'
              or dsestipulante like '%zup%'
              or dsestipulante like '%blau%'
              or dsestipulante like '%mtrix%'
              or dsestipulante like '%anin%'
              or dsestipulante like '%silva e barbosa%'
              or dsestipulante like '%ice%'
              or dsestipulante like '%roldao%'
			then 0
            else 1
        end,
        dscorretora,
        dsestipulante


--
-- Power BI
--
-- select
--     dtrecebimento,
--     dsoperadora,
--     dtfinalizacao,
--     dscorretora,
--     dsestipulante,
--     dtcompetoperadora
-- from
--     controlerotina
-- where
--     dsresponsavel = 'cahian'
--     and dtreferencia = '2022-11-01'
-- order by
--     dscorretora,
--     dsestipulante

--
-- Count ControleRotina
--

-- select dsresponsavel, count(*) as ccresponsavel
--   from controlerotina
--  where dtreferencia = '2023-06-01'
--  group by dsresponsavel
--  order by ccresponsavel desc
