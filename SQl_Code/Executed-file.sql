-- Execute this script to extract unique dimensional records from staging and populate Fact_Attrition via foreign key joins:

USE hr_attrition_dw;

-- Populate Dim_Department
INSERT INTO Dim_Department (DepartmentName)
SELECT DISTINCT Department
FROM hr_attrition_staging;

-- Populate Dim_JobRole
INSERT INTO Dim_JobRole (JobRoleName, JobLevel)
SELECT DISTINCT JobRole, JobLevel
FROM hr_attrition_staging;

-- Populate Dim_RiskTier
INSERT INTO Dim_RiskTier (RiskTierName, SalaryBand)
SELECT DISTINCT RiskTier, SalaryBand
FROM hr_attrition_staging;

-- Populate Dim_Employee
INSERT INTO Dim_Employee (
    EmployeeNumber, Age, AgeGroup, Gender, MaritalStatus, Education, EducationField,
    NumCompaniesWorked, BusinessTravel, DistanceFromHome, TotalWorkingYears,
    YearsAtCompany, TenureGroup, YearsInCurrentRole, YearsSinceLastPromotion,
    YearsWithCurrManager, TrainingTimesLastYear, DailyRate, HourlyRate,
    StockOptionLevel, PercentSalaryHike
)
SELECT 
    EmployeeNumber, Age, AgeGroup, Gender, MaritalStatus, Education, EducationField,
    NumCompaniesWorked, BusinessTravel, DistanceFromHome, TotalWorkingYears,
    YearsAtCompany, TenureGroup, YearsInCurrentRole, YearsSinceLastPromotion,
    YearsWithCurrManager, TrainingTimesLastYear, DailyRate, HourlyRate,
    StockOptionLevel, PercentSalaryHike
FROM hr_attrition_staging;

-- Populate Dim_Satisfaction
INSERT INTO Dim_Satisfaction (
    EmployeeKey, EnvironmentSat, JobSatisfaction, RelationshipSat,
    WorkLifeBalance, JobInvolvement, PerformanceRating
)
SELECT 
    e.EmployeeKey,
    s.EnvironmentSatisfaction,
    s.JobSatisfaction,
    s.RelationshipSatisfaction,
    s.WorkLifeBalance,
    s.JobInvolvement,
    s.PerformanceRating
FROM hr_attrition_staging s
JOIN Dim_Employee e ON s.EmployeeNumber = e.EmployeeNumber;

-- Populate Fact_Attrition
INSERT INTO Fact_Attrition (
    EmployeeKey,
    DepartmentKey,
    JobRoleKey,
    RiskTierKey,
    Attrition_Binary,
    MonthlyIncome,
    RiskScore,
    OverTime_Binary
)
SELECT 
    e.EmployeeKey,
    d.DepartmentKey,
    j.JobRoleKey,
    rt.RiskTierKey,
    s.Attrition,
    s.MonthlyIncome,
    s.RiskScore,
    s.OverTime_Binary
FROM hr_attrition_staging s
JOIN Dim_Employee e ON s.EmployeeNumber = e.EmployeeNumber
JOIN Dim_Department d ON s.Department = d.DepartmentName
JOIN Dim_JobRole j ON s.JobRole = j.JobRoleName AND s.JobLevel = j.JobLevel
JOIN Dim_RiskTier rt ON s.RiskTier = rt.RiskTierName AND s.SalaryBand = rt.SalaryBand;


