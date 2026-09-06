USE hr_attrition_dw;

-- 1. Dim_Department
CREATE TABLE IF NOT EXISTS Dim_Department (
    DepartmentKey INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Dim_JobRole
CREATE TABLE IF NOT EXISTS Dim_JobRole (
    JobRoleKey INT AUTO_INCREMENT PRIMARY KEY,
    JobRoleName VARCHAR(50) NOT NULL,
    JobLevel INT
);

-- 3. Dim_RiskTier
CREATE TABLE IF NOT EXISTS Dim_RiskTier (
    RiskTierKey INT AUTO_INCREMENT PRIMARY KEY,
    RiskTierName VARCHAR(20) NOT NULL,
    SalaryBand VARCHAR(50)
);

-- 4. Dim_Employee
CREATE TABLE IF NOT EXISTS Dim_Employee (
    EmployeeKey INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeNumber INT NOT NULL UNIQUE,
    Age INT,
    AgeGroup VARCHAR(20),
    Gender VARCHAR(20),
    MaritalStatus VARCHAR(20),
    Education INT,
    EducationField VARCHAR(50),
    NumCompaniesWorked INT,
    BusinessTravel VARCHAR(50),
    DistanceFromHome INT,
    TotalWorkingYears INT,
    YearsAtCompany INT,
    TenureGroup VARCHAR(20),
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    TrainingTimesLastYear INT,
    DailyRate INT,
    HourlyRate INT,
    StockOptionLevel INT,
    PercentSalaryHike INT
);

-- 5. Dim_Satisfaction
CREATE TABLE IF NOT EXISTS Dim_Satisfaction (
    SatisfactionKey INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeKey INT NOT NULL UNIQUE,
    EnvironmentSat INT,
    JobSatisfaction INT,
    RelationshipSat INT,
    WorkLifeBalance INT,
    JobInvolvement INT,
    PerformanceRating INT,
    CONSTRAINT fk_sat_employee FOREIGN KEY (EmployeeKey) REFERENCES Dim_Employee(EmployeeKey)
);

-- 6. Fact_Attrition
CREATE TABLE IF NOT EXISTS Fact_Attrition (
    FactID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeKey INT NOT NULL,
    DepartmentKey INT NOT NULL,
    JobRoleKey INT NOT NULL,
    RiskTierKey INT NOT NULL,
    Attrition_Binary INT NOT NULL,
    MonthlyIncome INT NOT NULL,
    AnnualSalary INT GENERATED ALWAYS AS (MonthlyIncome * 12) STORED,
    ReplacementCost INT GENERATED ALWAYS AS (MonthlyIncome * 6) STORED,
    RiskScore INT,
    OverTime_Binary INT,
    CONSTRAINT fk_fact_employee FOREIGN KEY (EmployeeKey) REFERENCES Dim_Employee(EmployeeKey),
    CONSTRAINT fk_fact_department FOREIGN KEY (DepartmentKey) REFERENCES Dim_Department(DepartmentKey),
    CONSTRAINT fk_fact_jobrole FOREIGN KEY (JobRoleKey) REFERENCES Dim_JobRole(JobRoleKey),
    CONSTRAINT fk_fact_risktier FOREIGN KEY (RiskTierKey) REFERENCES Dim_RiskTier(RiskTierKey)
);