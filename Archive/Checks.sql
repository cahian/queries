use MetaInfoETL

-- Listar as datas de competência da tabela dos beneficiários
select DataCompetencia, count(DataCompetencia)
from Beneficiario
where NrApolice like '074635'
group by DataCompetencia
order by DataCompetencia desc


-- Checar a tabela de beneficiários (PC) do mês atual e a do mês passado
select *
from Beneficiario
where NrApolice like '074635'
and DataCompetencia = '2022-10-31'
order by DataCompetencia desc

select *
from Beneficiario
where NrApolice like '074635'
and DataCompetencia = '2022-09-30'
order by DataCompetencia desc


-- Checar a tabela de premios (FM) do mês atual e a do mês passado
select *
from Premio
where NrApolice like '074880'
and DataCompetencia = '2022-10-01'
order by DataCompetencia desc

select *
from Premio
where NrApolice like '074635'
and DataCompetencia = '2022-09-01'
order by DataCompetencia desc


-- Checar a tabela de sinistros (SN) do mês atual e a do mês passado
select *
from Sinistro
where NrApolice like '074635'
and DataCompetencia = '2022-10-01'
order by DataCompetencia desc

select *
from Sinistro
where NrApolice like '074635'
and DataCompetencia = '2022-09-01'
order by DataCompetencia desc


-- Checar a tabela de complemento dos sinistros (DM ou EXTR) do mês atual e a do mês passado
select *
from Sinistrocomp
where NrApolice like '074635'
and DataCompetencia = '2022-10-01'
order by DataCompetencia desc

select *
from Sinistrocomp
where NrApolice like '074635'
and DataCompetencia = '2022-09-01'
order by DataCompetencia desc
