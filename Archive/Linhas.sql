use MetaInfoETL

select *
from Sinistrocomp
where NrApolice = '073110'
and DataCompetencia = '2022-10-01'
order by DataCompetencia desc

select *
from Premio
where NrApolice = '073110'
and DataCompetencia = '2022-10-01'

select DataCompetencia, count(DataCompetencia)
from Beneficiario
where NrApolice = '073110'
group by DataCompetencia
order by DataCompetencia desc

select *
from Beneficiario
where NrApolice = '073110'
and DataCompetencia = '2022-10-31'
order by DataCompetencia desc

-- select *
-- from Coparticipacao
-- where NrApolice = '073110'
-- order by DataCompetencia desc

select *
from Sinistro
where NrApolice = '073110'
and DataCompetencia = '2022-10-01'
