USE Healthcare_DB;
GO

-- Check the content of fact and dimension tables
SELECT * FROM Health.FactTable;
SELECT * FROM Health.dimPatient;
SELECT * FROM Health.dimPhysician;
SELECT * FROM Health.dimTransaction;
SELECT * FROM Health.dimPayer;
SELECT * FROM Health.dimLocation;
SELECT * FROM Health.dimDiagnosisCode;
SELECT * FROM Health.dimCptCode;
SELECT * FROM Health.dimDate;
GO

-- Check FactTable column names
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Health'
  AND TABLE_NAME = 'FactTable';
GO
