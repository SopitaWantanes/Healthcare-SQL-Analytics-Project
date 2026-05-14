# 🏥 Healthcare SQL Analytics Project

### 👩‍💻 Created by Rosa Carolina Alvarez Tay

This project was inspired by Curtis Norman's healthcare SQL training project on Udemy.

The purpose of this project is to analyze healthcare revenue cycle and patient data using SQL Server, dimensional modeling, fact tables, dimension tables, joins, aggregations, and healthcare business [...]

---

# 🩺 Healthcare Revenue Cycle Workflow

![Healthcare Revenue Cycle Workflow](https://raw.githubusercontent.com/SopitaWantanes/Healthcare-SQL-Analytics-Project/main/docs/Pic0_Understanding%20the%20Hospital%20Workflow.png)

This workflow demonstrates the complete hospital revenue cycle process from patient care and physician services to coding, billing, insurance response, payments, adjustments, and accounts receivable m[...]

---

# 🎯 Project Objectives

- 🗄️ Create a healthcare database using SQL Server
- 🏗️ Build a custom Health schema
- 🔍 Validate fact and dimension tables
- 🔗 Add foreign key relationships
- 📊 Analyze patient and hospital activity
- 💰 Calculate healthcare financial metrics
- 📈 Perform healthcare business analytics using SQL

---

# 🧾 Database Information

## 📌 Database Name

```sql
Healthcare_DB
```

## 📌 Schema

```sql
Health
```

---

# 🏗️ Tables Used

## 📊 Fact Table

- Health.FactTable

## 📚 Dimension Tables

- Health.dimPatient
- Health.dimPhysician
- Health.dimTransaction
- Health.dimPayer
- Health.dimLocation
- Health.dimDiagnosisCode
- Health.dimCptCode
- Health.dimDate

---

# 🚀 Skills Demonstrated

- 💻 SQL Server
- 🏢 Data Warehousing
- ⭐ Fact & Dimension Modeling
- 🛠️ Database Design
- 🔗 Foreign Keys
- 🔄 Joins
- 📈 Aggregations
- 🪟 Window Functions
- 🏥 Healthcare Revenue Analytics
- 📊 Business Intelligence

---

# 📂 Project Structure

```text
Healthcare-SQL-Analytics-Project/
│
├── datasets/
│
├── docs/
│   └── Pic0_Understanding the Hospital Workflow.png
│
└── scripts/
    ├── 01_create_database.sql
    ├── 02_check_tables.sql
    ├── 03_add_foreign_keys.sql
    ├── 04_patient_hospital_analysis.sql
    └── 05_healthcare_business_questions.sql
```

---

# 📜 SQL Scripts

## 🏗️ 01_create_database.sql

Creates the Healthcare_DB database and the Health schema.

---

## 🔍 02_check_tables.sql

Validates the contents of the fact and dimension tables.

---

## 🔗 03_add_foreign_keys.sql

Creates foreign key relationships between the fact table and all dimension tables.

---

## 📊 04_patient_hospital_analysis.sql

Performs patient-level and hospital-level analysis including:

- 💰 Gross charges
- 💳 Payments
- 🧾 Adjustments
- 📌 Accounts receivable
- 👨‍⚕️ Physician analysis
- 🏥 Hospital reporting

---

## 📈 05_healthcare_business_questions.sql

Answers healthcare business questions including:

- 👥 Unique patient counts
- 💵 Gross Collection Rate (GRC)
- 🧬 CPT utilization analysis
- 👨‍⚕️ Physician specialty analysis
- 🩺 Diagnosis code reporting
- 🧾 Credentialing adjustments
- 👶 Patient demographic reporting

---

# ❓ Sample Business Questions

- 💰 How many rows have Gross Charges greater than $100?
- 👥 How many unique patients exist?
- 🧬 Which CPT groupings contain the most CPT codes?
- 🏥 Which providers submitted Medicare claims?
- 📈 Which locations have the highest Gross Collection Rate?
- 👨‍⚕️ Which physician specialties receive the highest payments?
- 📊 Which CPT codes exceed 100 units?
- 🧾 Which locations have the most credentialing write-offs?

---

# 💡 Example SQL Concepts Used

## 🔗 INNER JOIN

```sql
SELECT *
FROM Health.FactTable AS F
INNER JOIN Health.dimPatient AS P
ON F.dimPatientPK = P.dimPatientPK;
```

---

## 📊 GROUP BY

```sql
SELECT
LocationName,
SUM(Payment) AS TotalPayments
FROM Health.FactTable AS F
INNER JOIN Health.dimLocation AS L
ON F.dimLocationPK = L.dimLocationPK
GROUP BY LocationName;
```

---

## 🧠 CASE Statement

```sql
CASE
WHEN PatientAge < 18 THEN 'Under 18'
WHEN PatientAge BETWEEN 18 AND 65 THEN '18-65'
ELSE 'Over 65'
END
```

---

# 📸 Documentation

The `docs` folder contains:

- 🖼️ SQL Server screenshots
- 📊 Query outputs
- 🧩 ERD diagrams
- 📄 Project documentation

---

# 📁 Datasets

The `datasets` folder contains healthcare data files used for SQL analytics and reporting.

---

# 🌟 Key Project Highlights

✅ SQL Server Database Design  
✅ Healthcare Revenue Cycle Analytics  
✅ Fact & Dimension Modeling  
✅ Business Intelligence Reporting  
✅ Healthcare Financial Analysis  
✅ Advanced SQL Queries  
✅ Data Warehousing Concepts  

---

# 🙌 Credits

This project was inspired by Curtis Norman's healthcare SQL project on Udemy.

The SQL scripts were organized, corrected, documented, and analyzed by:

## 👩‍💻 Rosa Carolina Alvarez Tay

as part of a personal SQL and Data Analytics portfolio project.

---

# 📬 Author

## Rosa Carolina Alvarez Tay

### 🛠️ Skills

- SQL Server
- Data Analytics
- Data Warehousing
- Healthcare Analytics
- Business Intelligence
- Database Design

---
