# 📊 HR Attrition & Predictive Risk Intelligence Dashboard

An end-to-end Power BI analytics solution designed to transition HR operations from reactive exit tracking to proactive workforce retention. This interactive three-page dashboard leverages custom DAX risk-scoring models to identify retention drivers, quantify financial exposure, and provide actionable interventions before high-value employees leave.

---

## 📌 Problem Statement

Unplanned employee attrition creates significant operational friction and financial strain. Replacing a specialized employee can cost up to **2x their annual salary** due to recruitment costs, onboarding overhead, and lost productivity. Traditional HR reporting relies on historical exit data—analyzing turnover *after* employees have already left. 

Organizations lack a forward-looking early warning system to:
1. Identify active employees exhibiting key burnout and resignation risk indicators.
2. Quantify the future financial impact of potential attrition across key business units.
3. Target retention budgets toward high-risk, low-salaried critical roles.

---

## ❓ Key Business Questions Answered

* **Historical Attrition Drivers:** What are the primary demographic, compensation, and satisfaction factors driving employee turnover?
* **Financial Exposure:** What is the total projected financial cost if current active high-risk employees decide to resign?
* **Departmental Concentration:** Which departments and job roles house the highest concentration of high-risk talent?
* **Compensation vs. Risk Correlation:** Are low salary bands and excessive overtime directly correlating with higher burnout and attrition scores?
* **Intervention Priority:** Who are the specific active employees requiring immediate 1:1 HR retention interventions in the next 30 days?

---

## 💡 The 3 Biggest Findings & Business Case

### 1. Overtime is the #1 Attrition Driver
* **30.53%** turnover rate for overtime employees vs. **10.44%** for non-overtime staff.
* Overtime workers are **2.93x more likely to leave** at identical pay levels.
* **Core Insight:** Attrition is primarily driven by burnout rather than compensation alone.

### 2. First Year is the Danger Zone
* **34.88%** of new hires leave before completing 12 months (over **1 in 3** new employees).
* **Core Insight:** Signals critical gaps in onboarding and early-stage integration workflows.

### 3. Low Salary Band Drives Half of All Exits
* Employees earning **<$3K/month** experience **28.61%** attrition vs. **8.90%** for those earning **>$10K/month**.
* **47.7% of ALL exits** originate from just **26.9%** of the total workforce.
* **Financial Impact:** A **15% salary adjustment** for this cohort costs **~$1.8M** but saves **$5.67M** in replacement costs (**3.15x ROI**).

---

## 💰 Strategic Financial Impact & ROI Projection

| Intervention | Annual Financial Savings |
| :--- | :---: |
| **Overtime Audit & Workload Rebalancing** | **$8.7M** |
| **Targeted Low-Band Salary Adjustments** | **$3.9M** |
| **Onboarding & Early-Tenure Redesign** | **$7.7M** |
| **TOTAL GROSS SAVINGS** | **$20.3M / year** |
| **Total Cost of Action** | **~$1.8M** |
| **NET ROI** | **11.3x** |

---

## 🛠️ Tech Stack & Architecture

* **BI Tool:** Microsoft Power BI Desktop
* **Data Modeling:** Star Schema (`fact_attrition`, `dim_employee`, `dim_department`, `dim_jobrole`, `dim_satisfaction`, `dim_risktier`)
* **Analytics:** Custom DAX Measures (Risk Scoring, Financial Exposure Projections, Dynamic Attrition Rates)
* **Visualization Standards:** High-density Heatmaps, Interactive Scatter Plots, Multi-Condition Visual Tables, Synchronized Navigation Filters

---

## 📈 Executive Dashboard Breakdown & Page Summaries

### Page 1: Executive Attrition Overview
<img width="995" height="787" alt="Screenshot 2026-09-06 221411" src="https://github.com/user-attachments/assets/76769d76-e312-4bac-bfd8-565dd16b002f" />

*Focus: High-level historical performance metrics and macro workforce trends.*
* **Primary Objective:** Establish organizational attrition baselines across department, gender, and tenure groups.
* **Key Visuals:** Active Workforce Donut Chart, Attrition Rate by Department Bar Chart, Tenure vs. Attrition Matrix.

---

### Page 2: Attrition Drivers & Compensation Analytics
<img width="1067" height="722" alt="Screenshot 2026-09-06 221436" src="https://github.com/user-attachments/assets/0b82e40d-1482-41ff-aebf-251bbb1f00aa" />

*Focus: Root-cause analysis isolating salary bands, satisfaction scores, and work environment.*
* **Primary Objective:** Diagnose *why* employees leave by cross-analyzing compensation structures and employee feedback.
* **Key Visuals:** Salary Band Distribution, Overtime vs. Job Satisfaction Cluster Chart, Environment & WLB Metrics.

---

### Page 3: Risk Intelligence & Early Warning System
<img width="667" height="730" alt="Screenshot 2026-09-06 221454" src="https://github.com/user-attachments/assets/40bb72cb-231b-4d5c-81dd-40fe79c367c7" />

*Focus: Predictive forward-looking analytics targeting active employees for immediate HR intervention.*
* **Primary Objective:** Shift from post-mortem reporting to active financial loss prevention.
* **Key Visuals:** High Risk KPI Cards, Department × Risk Tier Heatmap Matrix, Risk Score vs. Monthly Income Scatter Plot, High-Risk Action Table with Multi-Column Conditional Formatting.

---

## 📋 30-Day HR Retention Action Framework

```text
WEEK 1: IDENTIFY  ➔ Export High Risk list (RiskScore 8-11) & flag for manager review.
WEEK 2: ENGAGE    ➔ Conduct targeted 1:1 stay interviews focusing on key frustrations.
WEEK 3: ACT       ➔ Fast-track salary reviews for low-income/high-risk roles; re-evaluate overtime.
WEEK 4: MONITOR   ➔ Re-score risk metrics and track intervention impact vs. financial exposure.
