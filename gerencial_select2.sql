IF OBJECT_ID('tempdb..#Gerencial') IS NOT NULL
    DROP PROCEDURE #Gerencial
GO

/* Por enquanto, essa procedure não funciona com a Bradesco. */
/* É normal o número de vidas apresentado nessa procedure,
    não corresponder com o número de vidas apresentados
    no SigSaúde. */
/* Pelo que parece, fazer qualquer tipo de filtro where de
    competência nas querys torna a procedure muito muito
    lenta. */
CREATE PROCEDURE #Gerencial
    @Operadora   AS VARCHAR(150),
    @Estipulante AS VARCHAR(150),
    @Competencia AS DATETIME
AS
BEGIN
    WITH
    Apolice (NrApolice) AS (
        SELECT CAST(nrapolice AS VARCHAR(256))
          FROM sigsaude.dbo.apolice
         WHERE idoperadora in (
               SELECT idoperadora
                 FROM sigsaude.dbo.operadora
                WHERE dsnfantasia LIKE CONCAT('%', @Operadora, '%'))
           AND idestipulante in (
               SELECT idestipulante
                 FROM sigsaude.dbo.estipulante
                WHERE dsnfantasia LIKE CONCAT('%', @Estipulante, '%'))),
    Beneficiario (Competencia, Vidas) AS (
        SELECT DATEFROMPARTS(YEAR(DataCompetencia), MONTH(DataCompetencia), 1),
               COUNT(*)
          FROM MetaInfoETL.dbo.Beneficiario
         WHERE NrApolice IN (SELECT NrApolice from Apolice)
               -- SUBSTRING(NrApolice, PATINDEX('%[^0]%', NrApolice), 10) IN (SELECT NrApolice from Apolice)
               -- O "CONVERT(INT, NrApolice)" é muito lento.
         GROUP BY DataCompetencia),
    Premio (Competencia, Valor) AS (
        SELECT DataCompetencia,
               SUM(TRY_CAST(REPLACE(ValorLancamento, ',', '.') AS DECIMAL(10, 2)))
          FROM MetaInfoETL.dbo.Premio
         WHERE NrApolice IN (SELECT NrApolice from Apolice)
               -- SUBSTRING(NrApolice, PATINDEX('%[^0]%', NrApolice), 10) IN (SELECT NrApolice from Apolice)
               -- O "CONVERT(INT, NrApolice)" é muito lento.
         GROUP BY DataCompetencia),
    Sinistro (Competencia, Valor, Pago) AS (
        SELECT DataCompetencia,
               SUM(TRY_CAST(REPLACE(ValorSinistro, ',', '.') AS DECIMAL(18, 2))),
               SUM(TRY_CAST(REPLACE(SinistroPago, ',', '.') AS DECIMAL(18, 2)))
          FROM MetaInfoETL.dbo.Sinistro
         WHERE NrApolice IN (SELECT NrApolice from Apolice)
               -- SUBSTRING(NrApolice, PATINDEX('%[^0]%', NrApolice), 10) IN (SELECT NrApolice from Apolice)
               -- O "CONVERT(INT, NrApolice)" é muito lento.
         GROUP BY DataCompetencia)

    SELECT Beneficiario.Competencia,
           Beneficiario.Vidas,
           REPLACE(CAST(Premio.Valor AS VARCHAR(256)), '.', ',')   AS Premio,
           REPLACE(CAST(Sinistro.Valor AS VARCHAR(256)), '.', ',') AS SinistroValor,
           REPLACE(CAST(Sinistro.Pago AS VARCHAR(256)), '.', ',')  AS SinistroPago
      FROM Beneficiario
      JOIN Premio
        ON Premio.Competencia = Beneficiario.Competencia 
      JOIN Sinistro
        ON Sinistro.Competencia = Beneficiario.Competencia
     ORDER BY Beneficiario.Competencia ASC
END
GO

EXECUTE #Gerencial 'Saúde Beneficência', 'MCDONALDS - CAMPINAS', '2023-05-01'
