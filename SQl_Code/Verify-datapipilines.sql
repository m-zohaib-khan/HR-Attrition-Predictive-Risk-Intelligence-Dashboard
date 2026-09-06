SELECT 'Fact_Attrition' AS Table_Name, COUNT(*) AS Record_Count FROM Fact_Attrition
UNION ALL
SELECT 'Dim_Employee', COUNT(*) FROM Dim_Employee
UNION ALL
SELECT 'Dim_Satisfaction', COUNT(*) FROM Dim_Satisfaction
UNION ALL
SELECT 'Dim_Department', COUNT(*) FROM Dim_Department
UNION ALL
SELECT 'Dim_JobRole', COUNT(*) FROM Dim_JobRole
UNION ALL
SELECT 'Dim_RiskTier', COUNT(*) FROM Dim_RiskTier;

USE hr_attrition_dw;

DROP TABLE IF EXISTS hr_attrition_staging;


show tables;