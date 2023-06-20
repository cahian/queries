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
-- (40 rows affected)


BEGIN TRANSACTION

INSERT INTO logoperacao
SELECT GETDATE(), 'sinistropg', idsinistropg, 'D', NULL
  FROM sinistropg
 WHERE dtcompet = @competencia 
   AND idapolice in (SELECT id FROM @apolice)
-- (2192 rows affected)

DELETE
  FROM sinistropg
 WHERE dtcompet = @competencia 
   AND idapolice in (SELECT id FROM @apolice)
-- (2192 rows affected)

INSERT INTO logoperacao
SELECT GETDATE(), 'premio', idpremio, 'D', NULL
  FROM premio
 WHERE dtcompet = @competencia 
   AND idapolice in (SELECT id FROM @apolice)
-- (68 rows affected)

DELETE
  FROM premio
 WHERE dtcompet = @competencia 
   AND idapolice in (SELECT id FROM @apolice)
-- (68 rows affected)

DELETE
  FROM qtdebnf
 WHERE dtcompet = @competencia 
   AND idapolice in (SELECT id FROM @apolice)
-- (36 rows affected)

-- COMMIT
-- ROLLBACK


USE MetaInfoETL

BEGIN TRANSACTION

DELETE
  FROM Sinistro
 WHERE DataCompetencia = @competencia
   AND NrApolice in (SELECT numero FROM @apolice)
-- (2192 rows affected)

DELETE
  FROM Premio
 WHERE DataCompetencia = @competencia
   AND NrApolice in (SELECT numero FROM @apolice)
-- (68 rows affected)

DELETE
  FROM Beneficiario
 WHERE DataCompetencia = @competencia
   AND NrApolice in (SELECT numero FROM @apolice)
-- (498 rows affected)

DELETE
  FROM ArquivoLote
 WHERE DtCompet = @competencia
   AND NrApolice in (SELECT numero FROM @apolice)
-- (6 rows affected)

-- COMMIT
-- ROLLBACK
