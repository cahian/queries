use MetaInfoETL

select *
from ArquivoLote
where NrOperadora = '368253' and NrApolice is null

-- begin tran
--
-- delete
-- from ArquivoLote
-- where NrOperadora = '368253' and NrApolice = null

-- commit
-- rollback