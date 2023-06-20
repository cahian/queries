use MetaInfoETL

select *
from ArquivoLote
where dsnomearquivo like '%PremioMetainfo.txt%'
  and dtimport >= '2021-10-21 00:00:00'
order by dtimport desc