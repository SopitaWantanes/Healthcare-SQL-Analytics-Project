# Healthcare SQL Analytics Project

This project was inspired by Curtis Norman’s healthcare SQL training project on Udemy.

The goal of this project is to analyze healthcare revenue cycle data using SQL Server.

---

## Project Objectives

- Create a healthcare database
- Build a Health schema
- Validate fact and dimension tables
- Add foreign key relationships
- Analyze healthcare financial data
- Perform patient and hospital reporting
- Answer business questions using SQL

---

## Database

```sql
Healthcare_DB
```

Schema:

```sql
Health
```

---

## Tables Used

- FactTable
- dimPatient
- dimPhysician
- dimTransaction
- dimPayer
- dimLocation
- dimDiagnosisCode
- dimCptCode
- dimDate

---

## Skills Demonstrated

- SQL Server
- Data Warehousing
- Fact & Dimension Modeling
- Foreign Keys
- Joins
- Aggregations
- Window Functions
- Business Analytics
- Healthcare Revenue Analysis

---

## Project Structure

```text
Healthcare-SQL-Analytics-Project/
│
├── datasets/
├── docs/
└── scripts/
    ├── 01_create_database.sql
    ├── 02_check_tables.sql
    ├── 03_add_foreign_keys.sql
    ├── 04_patient_hospital_analysis.sql
    └── 05_healthcare_business_questions.sql
```

---

## Sample Business Questions

- How many unique patients exist?
- Which locations have the highest Gross Collection Rate?
- Which physician specialties receive the most payments?
- Which CPT codes exceed 100 units?
- Which hospitals have the most credentialing write-offs?

---

## Credits

This project was inspired by Curtis Norman’s healthcare SQL project on Udemy.

The SQL scripts were organized, corrected, and documented as part of my personal data analytics portfolio.
