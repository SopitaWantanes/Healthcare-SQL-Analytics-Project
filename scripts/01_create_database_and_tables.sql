USE master;
GO

-- Drop and recreate the Healthcare_DB database
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'Healthcare_DB'
)
BEGIN
    ALTER DATABASE Healthcare_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Healthcare_DB;
END;
GO

CREATE DATABASE Healthcare_DB;
GO

USE Healthcare_DB;
GO

CREATE SCHEMA Health;
GO

-- Drop tables if they already exist
IF OBJECT_ID('Health.FactTable', 'U') IS NOT NULL DROP TABLE Health.FactTable;
IF OBJECT_ID('Health.dimPatient', 'U') IS NOT NULL DROP TABLE Health.dimPatient;
IF OBJECT_ID('Health.dimPhysician', 'U') IS NOT NULL DROP TABLE Health.dimPhysician;
IF OBJECT_ID('Health.dimTransaction', 'U') IS NOT NULL DROP TABLE Health.dimTransaction;
IF OBJECT_ID('Health.dimPayer', 'U') IS NOT NULL DROP TABLE Health.dimPayer;
IF OBJECT_ID('Health.dimLocation', 'U') IS NOT NULL DROP TABLE Health.dimLocation;
IF OBJECT_ID('Health.dimDiagnosisCode', 'U') IS NOT NULL DROP TABLE Health.dimDiagnosisCode;
IF OBJECT_ID('Health.dimCptCode', 'U') IS NOT NULL DROP TABLE Health.dimCptCode;
IF OBJECT_ID('Health.dimDate', 'U') IS NOT NULL DROP TABLE Health.dimDate;
GO

CREATE TABLE Health.FactTable (
    FactTablePK VARCHAR(255) NOT NULL PRIMARY KEY,
    dimPatientPK VARCHAR(255) NOT NULL,
    dimPhysicianPK VARCHAR(255) NOT NULL,
    dimDatePostPK VARCHAR(255) NOT NULL,
    dimDateServicePK VARCHAR(255) NOT NULL,
    dimCPTCodePK VARCHAR(255) NOT NULL,
    dimPayerPK VARCHAR(255) NOT NULL,
    dimTransactionPK VARCHAR(255) NOT NULL,
    dimLocationPK VARCHAR(255) NOT NULL,
    PatientNumber VARCHAR(255) NOT NULL,
    dimDiagnosisCodePK VARCHAR(255) NOT NULL,
    CPTUnits DECIMAL(10,2) NULL DEFAULT 0,
    GrossCharge DECIMAL(10,2) NULL DEFAULT 0,
    Payment DECIMAL(10,2) NULL DEFAULT 0,
    Adjustment DECIMAL(10,2) NULL DEFAULT 0,
    AR DECIMAL(10,2) NULL DEFAULT 0
);
GO

CREATE TABLE Health.dimPatient (
    dimPatientPK VARCHAR(255) NOT NULL PRIMARY KEY,
    PatientNumber VARCHAR(255) NULL,
    FirstName VARCHAR(255) NULL,
    LastName VARCHAR(255) NULL,
    Email VARCHAR(255) NULL,
    PatientGender VARCHAR(50) NULL,
    PatientAge INT NULL,
    City VARCHAR(50) NULL,
    State VARCHAR(50) NULL
);
GO

CREATE TABLE Health.dimPhysician (
    dimPhysicianPK VARCHAR(255) NOT NULL PRIMARY KEY,
    ProviderNpi VARCHAR(255) NULL,
    ProviderName VARCHAR(255) NULL,
    ProviderSpecialty VARCHAR(255) NULL,
    ProviderFTE DECIMAL(10,2) NULL DEFAULT 0
);
GO

CREATE TABLE Health.dimTransaction (
    dimTransactionPK VARCHAR(255) NOT NULL PRIMARY KEY,
    TransactionType VARCHAR(255) NULL,
    [Transaction] VARCHAR(255) NULL,
    AdjustmentReason VARCHAR(255) NULL
);
GO

CREATE TABLE Health.dimPayer (
    dimPayerPK VARCHAR(255) NOT NULL PRIMARY KEY,
    PayerName VARCHAR(255) NULL
);
GO

CREATE TABLE Health.dimLocation (
    dimLocationPK VARCHAR(255) NOT NULL PRIMARY KEY,
    LocationName VARCHAR(255) NULL
);
GO

CREATE TABLE Health.dimDiagnosisCode (
    dimDiagnosisCodePK VARCHAR(255) NOT NULL PRIMARY KEY,
    DiagnosisCode VARCHAR(255) NULL,
    DiagnosisCodeDescription VARCHAR(255) NULL,
    DiagnosisCodeGroup VARCHAR(255) NULL
);
GO

CREATE TABLE Health.dimCptCode (
    dimCPTCodePK VARCHAR(255) NOT NULL PRIMARY KEY,
    CptCode VARCHAR(255) NULL,
    CptDesc VARCHAR(255) NULL,
    CptGrouping VARCHAR(255) NULL
);
GO

CREATE TABLE Health.dimDate (
    dimDatePostPK VARCHAR(255) NOT NULL PRIMARY KEY,
    [Date] DATE NULL,
    [Year] VARCHAR(255) NULL,
    [Month] VARCHAR(255) NULL,
    MonthPeriod VARCHAR(255) NULL,
    MonthYear VARCHAR(255) NULL,
    [Day] VARCHAR(255) NULL,
    DayName VARCHAR(255) NULL
);
GO
