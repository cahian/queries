use sigsaude

select *
  from apolice
 where idestipulante in (
       select idestipulante
         from estipulante
        where dsnfantasia = 'AOYAMAS')
   and idoperadora in (
       select idoperadora
         from operadora
        where dsnfantasia = 'GNDI')

select dtcompet,
       max(idpremio) as lastpremio,
       max(idsubfatura) as lastsub
  from premio
 where idapolice in (6671)
 group by dtcompet
 order by dtcompet desc
