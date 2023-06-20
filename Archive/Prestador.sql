use sigsaude

select *
 from prestador
where dscnpj is not null
  --and idcidade is null
  -- and dscpf is null
  idoperadora = '2'
order by idprestador

select p.idoperadora, o.dsnfantasia, count(*) as countprestador
 from prestador as p
 join operadora as o on p.idoperadora = o.idoperadora
where p.dscnpj is not null
  and p.idcidade is null
group by p.idoperadora, o.dsnfantasia
order by countprestador desc
