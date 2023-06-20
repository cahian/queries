use MetaInfoETL

select sum(cast(replace(ValorLancamento, ',', '.') as decimal(10, 2)))
from Premio
where NrApolice = '16036' -- in ('1044', '1045')
  and DataCompetencia = '2022-09-01'


select sum(cast(replace(ValorSinistro, ',', '.') as decimal(10, 2))),
       sum(cast(replace(SinistroPago, ',', '.') as decimal(10, 2)))
from Sinistro
where NrApolice = '16036' -- in ('1044', '1045')
  and DataCompetencia = '2022-09-01'