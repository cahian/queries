USE sigsaude

DECLARE @competencia AS DATETIME
DECLARE @estipulante AS VARCHAR(150)
DECLARE @operadora AS VARCHAR(150)
DECLARE @apolice AS TABLE (id INT, numero VARCHAR(256))

SET @competencia = '2023-04-01'
SET @estipulante = 'guitta'
SET @operadora = 'amil'

INSERT INTO @apolice
SELECT idapolice, CONVERT(VARCHAR(256), nrapolice)
  FROM apolice
 WHERE idestipulante in (
       SELECT idestipulante
         FROM estipulante
        WHERE dsnfantasia = @estipulante)
   AND idoperadora in (
       SELECT idoperadora
         FROM operadora
        WHERE dsnfantasia = @operadora)


USE MetaInfoETL

SELECT DataCompetencia, COUNT(*)
  FROM Beneficiario
 WHERE NrApolice in (SELECT numero from @apolice)
 GROUP BY DataCompetencia
 ORDER BY DataCompetencia desc

SELECT SUM(CAST(REPLACE(ValorLancamento, ',', '.') AS DECIMAL(10, 2))) as PremioValor
  FROM Premio
 WHERE NrApolice in (SELECT numero from @apolice)
   AND DataCompetencia = @competencia

SELECT SUM(CAST(REPLACE(ValorSinistro, ',', '.') AS DECIMAL(10, 2))) as SinistroValor,
       SUM(CAST(REPLACE(SinistroPago, ',', '.') AS DECIMAL(10, 2))) as SinistroPago
  FROM Sinistro
 WHERE NrApolice in (SELECT numero from @apolice)
   AND DataCompetencia = @competencia
