/*
========================================================
Analysis 2: Healthcare Business Questions
Created by: Rosa Carolina Alvarez Tay
Project: Healthcare SQL Analytics Project

Purpose:
This script answers broader healthcare revenue cycle questions
using the full Healthcare_DB dataset.
========================================================
*/

USE Healthcare_DB;
GO

/* Question 1:
How many rows in the FactTable include a Gross Charge greater than $100?
*/

SELECT
    COUNT(*) AS CountOfRows
FROM Health.FactTable
WHERE GrossCharge > 100;
GO

/* Question 2:
How many unique patients exist in Healthcare_DB?
*/

SELECT
    COUNT(DISTINCT PatientNumber) AS UniquePatients
FROM Health.FactTable;
GO

/* Question 3:
How many CPT codes are in each CPT grouping?
*/

SELECT
    CptGrouping,
    COUNT(DISTINCT CptCode) AS CountOfCPTCodes
FROM Health.dimCptCode
GROUP BY CptGrouping
ORDER BY CountOfCPTCodes DESC;
GO

/* Question 4:
How many providers submitted a Medicare insurance claim?
*/

SELECT
    PY.PayerName,
    COUNT(DISTINCT P.ProviderNpi) AS CountOfProviders
FROM Health.FactTable AS F
INNER JOIN Health.dimPhysician AS P
    ON P.dimPhysicianPK = F.dimPhysicianPK
INNER JOIN Health.dimPayer AS PY
    ON PY.dimPayerPK = F.dimPayerPK
WHERE PY.PayerName LIKE '%Medicare%'
GROUP BY PY.PayerName
ORDER BY CountOfProviders DESC;
GO

/* Question 5:
Calculate Gross Collection Rate (GCR) for each location.
GCR = Payments divided by Gross Charges.
*/

SELECT
    L.LocationName,
    SUM(F.GrossCharge) AS TotalGrossCharges,
    SUM(F.Payment) AS TotalPayments,
    CAST(-SUM(F.Payment) / NULLIF(SUM(F.GrossCharge), 0) AS DECIMAL(10,4)) AS GrossCollectionRate
FROM Health.FactTable AS F
INNER JOIN Health.dimLocation AS L
    ON F.dimLocationPK = L.dimLocationPK
GROUP BY L.LocationName
ORDER BY GrossCollectionRate DESC;
GO

/* Question 6:
How many CPT codes have more than 100 units?
*/

SELECT
    COUNT(*) AS CountOfCPTCodesOver100Units
FROM (
    SELECT
        CPT.CptCode,
        CPT.CptDesc,
        SUM(F.CPTUnits) AS TotalCPTUnits
    FROM Health.FactTable AS F
    INNER JOIN Health.dimCptCode AS CPT
        ON CPT.dimCPTCodePK = F.dimCPTCodePK
    GROUP BY
        CPT.CptCode,
        CPT.CptDesc
    HAVING SUM(F.CPTUnits) >= 100
) AS CPTSummary;
GO

/* Question 7:
Find physician specialty payments by month.
*/

SELECT
    P.ProviderSpecialty,
    DATENAME(MONTH, CAST(F.dimDatePostPK AS DATE)) AS PaymentMonth,
    MONTH(CAST(F.dimDatePostPK AS DATE)) AS MonthNumber,
    -SUM(F.Payment) AS TotalPayments
FROM Health.FactTable AS F
INNER JOIN Health.dimPhysician AS P
    ON P.dimPhysicianPK = F.dimPhysicianPK
GROUP BY
    P.ProviderSpecialty,
    DATENAME(MONTH, CAST(F.dimDatePostPK AS DATE)),
    MONTH(CAST(F.dimDatePostPK AS DATE))
ORDER BY
    P.ProviderSpecialty,
    MonthNumber;
GO

/* Question 8:
How many CPT units by DiagnosisCodeGroup are assigned to a J code diagnosis?
*/

SELECT
    D.DiagnosisCodeGroup,
    SUM(F.CPTUnits) AS TotalCPTUnits
FROM Health.FactTable AS F
INNER JOIN Health.dimDiagnosisCode AS D
    ON D.dimDiagnosisCodePK = F.dimDiagnosisCodePK
WHERE D.DiagnosisCode LIKE '%J%'
GROUP BY D.DiagnosisCodeGroup
ORDER BY TotalCPTUnits DESC;
GO

/* Question 9:
Create a patient demographic report grouped by age bucket.
*/

SELECT DISTINCT
    CONCAT(P.FirstName, ' ', P.LastName) AS FullName,
    P.Email,
    P.PatientAge,
    CASE
        WHEN P.PatientAge < 18 THEN 'Under 18'
        WHEN P.PatientAge >= 18 AND P.PatientAge < 65 THEN '18 - 65'
        ELSE 'Over 65'
    END AS AgeGroup,
    CONCAT(P.City, ', ', P.State) AS Geolocation
FROM Health.FactTable AS F
INNER JOIN Health.dimPatient AS P
    ON P.dimPatientPK = F.dimPatientPK
ORDER BY
    AgeGroup,
    P.PatientAge;
GO

/* Question 10:
How many dollars were written off due to credentialing?
Which location had the highest credentialing adjustment?
How many physicians were impacted?
*/

SELECT
    L.LocationName,
    -SUM(F.Adjustment) AS CredentialingWriteOffAmount,
    COUNT(DISTINCT P.ProviderNpi) AS CountOfImpactedPhysicians
FROM Health.FactTable AS F
INNER JOIN Health.dimTransaction AS T
    ON T.dimTransactionPK = F.dimTransactionPK
INNER JOIN Health.dimLocation AS L
    ON L.dimLocationPK = F.dimLocationPK
INNER JOIN Health.dimPhysician AS P
    ON P.dimPhysicianPK = F.dimPhysicianPK
WHERE T.AdjustmentReason = 'Credentialing'
GROUP BY L.LocationName
ORDER BY CredentialingWriteOffAmount DESC;
GO

/* Question 11:
What is the average patient age by gender for patients seen at
Big Heart Community Hospital with a diagnosis that included Type 2 diabetes?
How many patients are included in that average?
*/

SELECT
    PatientGender,
    AVG(PatientAge) AS AveragePatientAge,
    COUNT(DISTINCT PatientNumber) AS CountOfPatients
FROM (
    SELECT DISTINCT
        F.PatientNumber,
        P.PatientGender,
        P.PatientAge
    FROM Health.FactTable AS F
    INNER JOIN Health.dimPatient AS P
        ON P.dimPatientPK = F.dimPatientPK
    INNER JOIN Health.dimLocation AS L
        ON L.dimLocationPK = F.dimLocationPK
    INNER JOIN Health.dimDiagnosisCode AS D
        ON D.dimDiagnosisCodePK = F.dimDiagnosisCodePK
    WHERE L.LocationName = 'Big Heart Community Hospital'
      AND D.DiagnosisCodeDescription LIKE '%Type 2%'
) AS DiabetesPatients
GROUP BY PatientGender
ORDER BY PatientGender;
GO
