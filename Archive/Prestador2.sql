        select *
          from prestador
         where dscnpj is not null
           and idcidade is null

	   select * -- , count(*) as countprestador
         from sinistropg
        where idapolice in (
              select idapolice
	            from apolice
	           where nrapolice = '074148')


select *
  from prestador
 where idprestador in (
       select idprestador  -- , count(*) as countprestador
         from sinistropg
        where idapolice in (
              select idapolice
	            from apolice
	           where nrapolice = '074148')
        group by idprestador)
        -- order by countprestador desc)
   and dscnpj is not null
   and idcidade is null

select s.idprestador,
	   p.dsnfantasia,
	   p.dscnpj,
	   p.idcidade,
       sum(s.vlpago) as sumprestador,
	   count(*) as countprestador
  from sinistropg as s
  join prestador as p
    on s.idprestador = p.idprestador
 where s.idapolice in (
       select idapolice
         from apolice
        where nrapolice = '074148')
   and s.dtcompet between '2022-05-01' and '2023-04-01'
   and p.dscnpj is not null
   and p.idcidade is null
 group by s.idprestador,
          p.dsnfantasia,
		  p.dscnpj,
	      p.idcidade
 order by sumprestador desc,
          countprestador desc
 

         SELECT
            s.idprestador,
            p.dsnfantasia,
            p.dscnpj,
            p.idcidade,
            SUM(s.vlpago) AS sumprestador,
            COUNT(*) AS countprestador
        FROM
            sinistropg AS s
            JOIN prestador AS p ON s.idprestador = p.idprestador
        WHERE
            s.idapolice IN (
                SELECT
                    idapolice
                FROM
                    apolice
                WHERE
                    nrapolice = '?'
            )
            AND s.dtcompet BETWEEN '2022-05-01' AND '2023-04-01'
            AND p.dscnpj IS NOT NULL
            AND p.idcidade IS NULL
        GROUP BY
            s.idprestador,
            p.dsnfantasia,
            p.dscnpj,
            p.idcidade
        ORDER BY
            sumprestador DESC,
            countprestador DESC

select * from cidade

        SELECT
            c.idcidade,
			c.dscidade,
			e.dsestado
        FROM
            cidade      AS c
			JOIN estado AS e
			  ON c.idestado = e.idestado
        WHERE
            c.dscidade = 'São Paulo'

SELECT * FROM prestador
WHERE idprestador = ''