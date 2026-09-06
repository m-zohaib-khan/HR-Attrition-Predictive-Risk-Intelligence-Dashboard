CREATE DATABASE IF NOT EXISTS hr_attrition_dw;
USE hr_attrition_dw;

DROP TABLE IF EXISTS hr_attrition_staging;

CREATE TABLE hr_attrition_staging (
    Age INT,
    Attrition INT,
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(20),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    OverTime_Binary INT,
    SalaryBand VARCHAR(50),
    AgeGroup VARCHAR(20),
    TenureGroup VARCHAR(20),
    ReplacementCost INT,
    RiskScore INT,
    RiskTier VARCHAR(20)
);


-- check the data:
select * from hr_attrition_dw.hr_attrition_staging;
