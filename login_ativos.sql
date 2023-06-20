-- Caso o idusrentidades seja NULL, será necessário fazer uma inspeção
-- manual no login para ver quais estipulantes esse login tem permissão.

SELECT UserName, Email, dsnfantasia,
       idusrentidades, est.idestipulante -- , Password
  FROM controlacesso.dbo.aspnet_Users usr
       LEFT JOIN controlacesso.dbo.aspnet_Membership mem
         ON usr.UserId = mem.UserId
       LEFT JOIN sigsaude.dbo.usrentidades usre
         ON usr.UserName = usre.dsusuario
       LEFT JOIN sigsaude.dbo.estipulante as est
         ON usre.idestipulante = est.idestipulante
 WHERE (RIGHT(Email, LEN(Email) - CHARINDEX('@', Email))
       LIKE '%bestlife%'
    OR RIGHT(Email, LEN(Email) - CHARINDEX('@', Email))
       LIKE '%grupoepea%')
   AND IsLockedOut = 0
 ORDER BY
       CASE
           WHEN dsnfantasia = 'DEMONSTRAÇÃO'
           THEN 1
           ELSE 0
       END,
       dsnfantasia, UserName, Email

SELECT usrs.dsusuario, est.dsnfantasia, COUNT(*) AS countestipulante
  FROM sigsaude.dbo.usrsubfatura usrs
       LEFT JOIN sigsaude.dbo.subfatura sub
         ON usrs.idsubfatura = sub.idsubfatura
       LEFT JOIN sigsaude.dbo.apolice apo
         ON sub.idapolice = apo.idapolice
       LEFT JOIN sigsaude.dbo.estipulante est
         ON apo.idestipulante = est.idestipulante
 WHERE usrs.dsusuario = 'joaquim.bestlife'
 GROUP BY usrs.dsusuario, est.dsnfantasia
 ORDER BY countestipulante desc