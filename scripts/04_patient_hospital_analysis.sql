USE Healthcare_DB;
GO

-- Part 1: Retrieve patient demographic information
SELECT
    P.FirstName,
    P.LastName,
    P.City,
    P.State
FROM Health.dimPatient AS P
WHERE P.PatientNumber = '21383737';
GO

-- Part 2: Retrieve patient location and service date
SELECT DISTINCT
    P.FirstName,
    P.LastName,
    P.City,
    P.State,
    L.LocationName,
    F.dimDateServicePK
FROM Health.FactTable AS F
INNER JOIN Health.dimPatient AS P
    ON F.dimPatientPK = P.dimPatientPK
INNER JOIN Health.dimLocation AS L
    ON L.dimLocationPK = F.dimLocationPK
WHERE P.PatientNumber = '21383737'
  AND L.LocationName = 'Fairview General Hospital';
GO

-- Part 3: Retrieve patient, physician, hospital location, service date, and total gross charges
SELECT
    P.FirstName,
    P.LastName,
    P.City,
    P.State,
    L.LocationName,
    F.dimDateServicePK,
    PH.ProviderName,
    SUM(F.GrossCharge) AS Charges
FROM Health.FactTable AS F
INNER JOIN Health.dimPatient AS P
    ON P.dimPatientPK = F.dimPatientPK
INNER JOIN Health.dimLocation AS L
    ON L.dimLocationPK = F.dimLocationPK
INNER JOIN Health.dimPhysician AS PH
    ON PH.dimPhysicianPK = F.dimPhysicianPK
WHERE P.PatientNumber = '21383737'
  AND L.LocationName = 'Fairview General Hospital'
GROUP BY
    P.FirstName,
    P.LastName,
    P.City,
    P.State,
    L.LocationName,
    F.dimDateServicePK,
    PH.ProviderName;
GO

-- Part 4: Retrieve transaction breakdown for the patient and hospital
SELECT
    T.[Transaction],
    SUM(F.GrossCharge) AS Charges,
    SUM(F.Payment) AS Payments,
    SUM(F.Adjustment) AS Adjustments,
    SUM(F.AR) AS AR
FROM Health.FactTable AS F
INNER JOIN Health.dimPatient AS P
    ON P.dimPatientPK = F.dimPatientPK
INNER JOIN Health.dimLocation AS L
    ON L.dimLocationPK = F.dimLocationPK
INNER JOIN Health.dimTransaction AS T
    ON T.dimTransactionPK = F.dimTransactionPK
WHERE P.PatientNumber = '21383737'
  AND L.LocationName = 'Fairview General Hospital'
GROUP BY
    T.[Transaction];
GO

-- Part 5: Retrieve total financial summary for the patient and hospital
SELECT
    SUM(F.GrossCharge) AS Charges,
    SUM(F.Payment) AS Payments,
    SUM(F.Adjustment) AS Adjustments,
    SUM(F.AR) AS AR
FROM Health.FactTable AS F
INNER JOIN Health.dimPatient AS P
    ON P.dimPatientPK = F.dimPatientPK
INNER JOIN Health.dimLocation AS L
    ON L.dimLocationPK = F.dimLocationPK
WHERE P.PatientNumber = '21383737'
  AND L.LocationName = 'Fairview General Hospital';
GO
