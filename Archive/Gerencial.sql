use MetaInfoETL

declare @Apolices as table (numbers int)
declare @Operadora as int
declare @DataDeCompetencia as date

insert into @Apolices values ('12362')
set @Operadora = '368253'
set @DataDeCompetencia = '20221201'


select
	DataCompetencia, count(DataCompetencia)
from
	Beneficiario
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
group by
	DataCompetencia
order by
	DataCompetencia desc



select
	sum(cast(replace(ValorLancamento, ',', '.') as decimal(10, 2)))
	-- , sum(cast(ValorLancamento as decimal(10, 2)))
from
	Premio
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
	and DataCompetencia = @DataDeCompetencia
	-- and CodigoSubFatura = '8TN5G'

--
-- Sinistro
--
select
	sum(cast(replace(ValorSinistro, ',', '.') as decimal(10, 2)))
	, sum(cast(replace(SinistroPago, ',', '.') as decimal(10, 2)))
from
	Sinistro
where
	NrApolice in (12362) -- (select numbers from @Apolices)
	-- and NrOperadora = @Operadora
	and DataCompetencia = '20221201' -- @DataDeCompetencia
-- 	and CodigoSubFatura = '8TJ7Q'

--
-- Beneficiário
--
select
	*
from
	Beneficiario
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
	and DataCompetencia = @DataDeCompetencia
	and CodigoBeneficiario = '9065983'


select
	DataCompetencia, count(DataCompetencia)
from
	Beneficiario
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
group by
	DataCompetencia
order by
	DataCompetencia desc


-- O número de vidas/beneficiários pode ser alterado, ao ser lançando no SigSaúde.
-- Ou seja, só da para obter o número de vidas correto dentro do sistema pelo SigSaúde
-- após o Lançamento.
select
	count(*)
from
	Beneficiario
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
	and DataCompetencia = @DataDeCompetencia


--
-- Premio
--
select
	*
from
	Premio
where
	NrApolice in (12362) -- (select numbers from @Apolices)
	-- and NrOperadora = @Operadora
	and DataCompetencia = '20221201'-- @DataDeCompetencia
	-- and NomeBeneficiario like '%MOACIR SANCHEZ FILHO%'
	-- and CodigoBeneficiario = '9065983'


select
	sum(cast(replace(ValorLancamento, ',', '.') as decimal(10, 2)))
	-- , sum(cast(ValorLancamento as decimal(10, 2)))
from
	Premio
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
	and DataCompetencia = @DataDeCompetencia
	-- and CodigoSubFatura = '8TN5G'


--
-- Sinistro
--
select
	NrApolice
from
	Sinistro
where
	NrApolice like '%9357%'
group by
	NrApolice
order by
	cast(NrApolice as int)


select
	*
from
	Sinistro
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
	and DataCompetencia = @DataDeCompetencia


select
	sum(cast(replace(ValorSinistro, ',', '.') as decimal(10, 2)))
	, sum(cast(replace(SinistroPago, ',', '.') as decimal(10, 2)))
from
	Sinistro
where
	NrApolice in (select numbers from @Apolices)
	and NrOperadora = @Operadora
	and DataCompetencia = @DataDeCompetencia
-- 	and CodigoSubFatura = '8TJ7Q'


--
-- Rascunho
--
-- 'ANTONIO RICARTE DA SILVA'
select *
  from Sinistro
 where
	NrApolice = '8617'
   and DataCompetencia = '2022-09-01'
   and NomeBeneficiario = 'ANTONIO RICARTE DA SILVA'
   and ValorSinistro = '149.53'

select *
  from Sinistro
 where NrApolice = '8617'
   and DataCompetencia = '2022-09-01'
order by CodSinistro desc