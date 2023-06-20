use MetaInfoETL

-- Checar a tabela de beneficiários do mês atual e a do mês passado
select *
from Beneficiario
where NrOperadora = '417530'
  and NrApolice like '1234_'
  and DataCompetencia = '2022-09-01'
order by DataCompetencia desc

select *
from Beneficiario
where NrOperadora = '417530'
  and NrApolice like '1234_'
  and DataCompetencia = '2022-08-01'
order by DataCompetencia desc


-- Checar a tabela de premios do mês atual e a do mês passado
select *
from Premio
where NrOperadora = '417530'
  and NrApolice like '1234_'
  and DataCompetencia = '2022-09-01'
order by DataCompetencia desc

select *
from Premio
where NrOperadora = '417530'
  and NrApolice like '1234_'
  and DataCompetencia = '2022-08-01'
order by DataCompetencia desc


-- Checar a tabela de sinistros do mês atual e a do mês passado
select *
from Sinistro
where NrOperadora = '417530'
  and NrApolice like '1234_'
  and DataCompetencia = '2022-09-01'
order by DataCompetencia desc

select *
from Sinistro
where NrOperadora = '417530'
  and NrApolice like '1234_'
  and DataCompetencia = '2022-08-01'
order by DataCompetencia desc

-- 
-- select *
-- from Beneficiario
