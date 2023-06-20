--
-- Get apolice
--

select *
  from apolice
 where idestipulante in (
       select idestipulante
         from estipulante
        where dsnfantasia = 'PRALANA')
   and idoperadora in (
       select idoperadora
         from operadora
        where dsnfantasia = 'HAPVIDA')



--
-- First Query
--

use sigsaude

begin transaction

select *
  into sigsaude.dbo.bkp_qtdebnf_pralana_20230614
  from sigsaude.dbo.qtdebnf
 where idapolice in (
       6663)
-- (268 rows affected)

-- commit
-- rollback

begin transaction

delete
-- select *
  from qtdebnf
 where dtcompet >= '2022-04-01'
   and idapolice in (
       6663)
-- (290 rows affected)

-- commit
-- rollback


--
-- Second query
--

begin transaction

delete
-- select *
  from qtdebnf
 where dtcompet >= '2023-02-01'
   and idapolice in (
       5641, 5642, 5643, 5644)
-- (6 rows affected)

-- commit
-- rollback


--
-- Third query
--

begin transaction

delete
-- select *
  from sigsaude.dbo.qtdebnf
 where idapolice in (
       6671)
 -- (671 rows affected)

-- commit
-- rollback

begin transaction

insert into sigsaude.dbo.qtdebnf
select idapolice, idsubfatura, dtcompet, dstitularidade, nrqtde
from sigsaude.dbo.bkp_qtdebnf_aoyamas_20230607
-- (675 rows affected)

-- commit
-- rollback