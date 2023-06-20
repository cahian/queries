use MetaInfoETL

select *
from ArquivoLote
where dtcompet >= '2022-11-01 00:00:00'
and nrapolice = '074620'
order by dtimport desc
