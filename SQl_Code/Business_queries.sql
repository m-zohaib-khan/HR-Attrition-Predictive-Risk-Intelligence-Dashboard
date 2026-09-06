USE hr_attrition_dw;

-- ══════════════════════════════════════════════
-- QUERY 1: Company-Wide Attrition Summary
-- ══════════════════════════════════════════════
SELECT
    COUNT(*)                                        AS total_employees,
    SUM(f.Attrition_Binary)                         AS employees_left,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct,
    ROUND(AVG(f.MonthlyIncome), 0)                  AS avg_salary,
    SUM(f.ReplacementCost)                          AS total_replacement_cost
FROM Fact_Attrition f;


-- ══════════════════════════════════════════════
-- QUERY 2: Attrition by Department
-- ══════════════════════════════════════════════
SELECT
    d.DepartmentName                                AS Department,
    COUNT(*)                                        AS total_employees,
    SUM(f.Attrition_Binary)                         AS left_count,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct,
    ROUND(AVG(f.MonthlyIncome), 0)                  AS avg_salary,
    SUM(f.ReplacementCost)                          AS replacement_cost,
    RANK() OVER (ORDER BY AVG(f.Attrition_Binary) DESC) AS risk_rank
FROM Fact_Attrition f
JOIN Dim_Department d ON f.DepartmentKey = d.DepartmentKey
GROUP BY d.DepartmentName
ORDER BY attrition_rate_pct DESC;


-- ══════════════════════════════════════════════
-- QUERY 3: Overtime Impact on Attrition
-- ══════════════════════════════════════════════
SELECT
    CASE WHEN f.OverTime_Binary = 1 THEN 'Yes' ELSE 'No' END AS OverTime,
    COUNT(*)                                        AS total_employees,
    SUM(f.Attrition_Binary)                         AS left_count,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct,
    ROUND(AVG(f.MonthlyIncome), 0)                  AS avg_salary
FROM Fact_Attrition f
GROUP BY f.OverTime_Binary
ORDER BY attrition_rate_pct DESC;


-- ══════════════════════════════════════════════
-- QUERY 4: Salary Band vs Attrition
-- ══════════════════════════════════════════════
SELECT
    rt.SalaryBand,
    COUNT(*)                                        AS total_employees,
    SUM(f.Attrition_Binary)                         AS left_count,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct,
    ROUND(AVG(f.MonthlyIncome), 0)                  AS avg_income,
    SUM(f.ReplacementCost)                          AS replacement_cost
FROM Fact_Attrition f
JOIN Dim_RiskTier rt ON f.RiskTierKey = rt.RiskTierKey
GROUP BY rt.SalaryBand
ORDER BY attrition_rate_pct DESC;


-- ══════════════════════════════════════════════
-- QUERY 5: Tenure vs Attrition
-- (When do employees leave?)
-- ══════════════════════════════════════════════
SELECT
    e.TenureGroup,
    COUNT(*)                                        AS total_employees,
    SUM(f.Attrition_Binary)                         AS left_count,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct
FROM Fact_Attrition f
JOIN Dim_Employee e ON f.EmployeeKey = e.EmployeeKey
GROUP BY e.TenureGroup
ORDER BY attrition_rate_pct DESC;


-- ══════════════════════════════════════════════
-- QUERY 6: Job Role Risk Ranking
-- ══════════════════════════════════════════════
SELECT
    j.JobRoleName                                   AS JobRole,
    d.DepartmentName                                AS Department,
    COUNT(*)                                        AS total_employees,
    SUM(f.Attrition_Binary)                         AS left_count,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct,
    ROUND(AVG(f.MonthlyIncome), 0)                  AS avg_salary,
    SUM(f.ReplacementCost)                          AS replacement_cost,
    RANK() OVER (ORDER BY AVG(f.Attrition_Binary) DESC) AS risk_rank
FROM Fact_Attrition f
JOIN Dim_JobRole j ON f.JobRoleKey = j.JobRoleKey
JOIN Dim_Department d ON f.DepartmentKey = d.DepartmentKey
GROUP BY j.JobRoleName, d.DepartmentName
ORDER BY attrition_rate_pct DESC;


-- ══════════════════════════════════════════════
-- QUERY 7: High Risk Active Employees
-- (Employees still working but flagged as high risk)
-- ══════════════════════════════════════════════
SELECT
    e.EmployeeNumber,
    d.DepartmentName                                AS Department,
    j.JobRoleName                                   AS JobRole,
    e.Age,
    f.MonthlyIncome,
    CASE WHEN f.OverTime_Binary = 1 THEN 'Yes' ELSE 'No' END AS OverTime,
    s.JobSatisfaction,
    s.WorkLifeBalance,
    e.YearsAtCompany,
    f.RiskScore,
    rt.RiskTierName                                 AS RiskTier
FROM Fact_Attrition f
JOIN Dim_Employee e ON f.EmployeeKey = e.EmployeeKey
JOIN Dim_Department d ON f.DepartmentKey = d.DepartmentKey
JOIN Dim_JobRole j ON f.JobRoleKey = j.JobRoleKey
JOIN Dim_RiskTier rt ON f.RiskTierKey = rt.RiskTierKey
JOIN Dim_Satisfaction s ON f.EmployeeKey = s.EmployeeKey
WHERE f.Attrition_Binary = 0
  AND rt.RiskTierName = 'High Risk'
ORDER BY f.RiskScore DESC;


-- ══════════════════════════════════════════════
-- QUERY 8: Satisfaction Score vs Attrition
-- ══════════════════════════════════════════════
SELECT
    s.JobSatisfaction,
    COUNT(*)                                        AS total_employees,
    ROUND(AVG(f.Attrition_Binary) * 100, 2)         AS attrition_rate_pct
FROM Fact_Attrition f
JOIN Dim_Satisfaction s ON f.EmployeeKey = s.EmployeeKey
GROUP BY s.JobSatisfaction
ORDER BY s.JobSatisfaction ASC;
