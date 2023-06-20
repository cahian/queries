select idoperadora
  from operadora
 where dsnfantasia = 'Sul América'

 select idapolice
  from apolice
 where nrapolice = '70682'
   and idoperadora = '2'

select idsubfatura
  from subfatura
 where nrsubfaturadesc = '8LDRZ'
   and idapolice = '6124'

select dscartao
  from beneficiario
 where dsnome = 'premio manual'
   and idsubfatura = '141090'
   and idapolice = '6124'

select dscartao, nrcertificado, nrcodpend
  from beneficiario
 where dsnome = 'SINISTRO MANUAL'
   and idsubfatura = '141090'
   and idapolice = '6124'

select *
  from plano
 where idoperadora = '2'
 and dsplano = '9999'