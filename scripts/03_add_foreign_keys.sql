USE Healthcare_DB;
GO

-- Drop existing foreign keys if they exist
IF OBJECT_ID('Health.FK_dimPatientPK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimPatientPK;
GO

IF OBJECT_ID('Health.FK_dimPhysicianPK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimPhysicianPK;
GO

IF OBJECT_ID('Health.FK_dimTransactionPK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimTransactionPK;
GO

IF OBJECT_ID('Health.FK_dimPayerPK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimPayerPK;
GO

IF OBJECT_ID('Health.FK_dimLocationPK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimLocationPK;
GO

IF OBJECT_ID('Health.FK_dimDiagnosisCodePK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimDiagnosisCodePK;
GO

IF OBJECT_ID('Health.FK_dimCptCodePK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimCptCodePK;
GO

IF OBJECT_ID('Health.FK_dimDatePK', 'F') IS NOT NULL
    ALTER TABLE Health.FactTable DROP CONSTRAINT FK_dimDatePK;
GO

-- Add foreign key relationships
ALTER TABLE Health.FactTable
ADD
    CONSTRAINT FK_dimPatientPK
        FOREIGN KEY (dimPatientPK)
        REFERENCES Health.dimPatient(dimPatientPK),

    CONSTRAINT FK_dimPhysicianPK
        FOREIGN KEY (dimPhysicianPK)
        REFERENCES Health.dimPhysician(dimPhysicianPK),

    CONSTRAINT FK_dimTransactionPK
        FOREIGN KEY (dimTransactionPK)
        REFERENCES Health.dimTransaction(dimTransactionPK),

    CONSTRAINT FK_dimPayerPK
        FOREIGN KEY (dimPayerPK)
        REFERENCES Health.dimPayer(dimPayerPK),

    CONSTRAINT FK_dimLocationPK
        FOREIGN KEY (dimLocationPK)
        REFERENCES Health.dimLocation(dimLocationPK),

    CONSTRAINT FK_dimDiagnosisCodePK
        FOREIGN KEY (dimDiagnosisCodePK)
        REFERENCES Health.dimDiagnosisCode(dimDiagnosisCodePK),

    CONSTRAINT FK_dimCptCodePK
        FOREIGN KEY (dimCPTCodePK)
        REFERENCES Health.dimCptCode(dimCPTCodePK),

    CONSTRAINT FK_dimDatePK
        FOREIGN KEY (dimDatePostPK)
        REFERENCES Health.dimDate(dimDatePostPK);
GO
