IF OBJECT_ID('tempdb..#gerencial') IS NOT NULL
    DROP PROCEDURE #gerencial
GO

CREATE PROCEDURE #gerencial
    @estipulante AS VARCHAR(150),
    @operadora   AS VARCHAR(150),
    @competencia AS DATETIME
AS
BEGIN
    DECLARE @apolice AS TABLE (id INT, numero VARCHAR(256))

    INSERT INTO @apolice
    SELECT idapolice, CONVERT(VARCHAR(256), nrapolice)
      FROM sigsaude.dbo.apolice
     WHERE idestipulante in (
           SELECT idestipulante
             FROM sigsaude.dbo.estipulante
            WHERE dsnfantasia = @estipulante)
       AND idoperadora in (
           SELECT idoperadora
             FROM sigsaude.dbo.operadora
            WHERE dsnfantasia = @operadora)

    SELECT DataCompetencia, COUNT(*)
      FROM MetaInfoETL.dbo.Beneficiario
     WHERE NrApolice in (SELECT numero from @apolice)
     GROUP BY DataCompetencia
     ORDER BY DataCompetencia desc

    SELECT SUM(CAST(REPLACE(ValorLancamento, ',', '.') AS DECIMAL(10, 2))) as PremioValor
      FROM MetaInfoETL.dbo.Premio
     WHERE NrApolice in (SELECT numero from @apolice)
       AND DataCompetencia = @competencia

    SELECT SUM(CAST(REPLACE(ValorSinistro, ',', '.') AS DECIMAL(10, 2))) as SinistroValor,
           SUM(CAST(REPLACE(SinistroPago, ',', '.') AS DECIMAL(10, 2))) as SinistroPago
      FROM Sinistro
     WHERE NrApolice in (SELECT numero from @apolice)
       AND DataCompetencia = @competencia
END
GO

EXECUTE #gerencial 'guitta', 'amil', '2023-04-01'
