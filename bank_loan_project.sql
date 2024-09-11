CREATE DATABASE bank_loan_project;
USE bank_loan_project;
select count(*) from finance_1;
select * from finance_1;
DESC finance_1;
ALTER TABLE finance_1
RENAME COLUMN ï»¿id TO id;

select count(*) from finance_2;
select * from finance_2;
ALTER TABLE finance_2
RENAME COLUMN ï»¿id TO id;
/*
1. Year wise loan amount
2. Grade-Subgrade wise revolution balance
3. Total Payment for Verified Status VS Non Verified Status
4. State wise last credit pull _d wise loan status
5. Home ownership VS Last payment date stats

*/

-- KPI_1
SELECT YEAR(issue_d) AS issue_year , SUM(loan_amnt) AS total_loan_amnt
 FROM finance_1
 GROUP BY issue_year 
 ORDER BY issue_year;
 
-- KPI_2
select 
grade , sub_grade , SUM(revol_bal) AS total_revol_bal 
FROM finance_1 INNER JOIN finance_2
ON(finance_1.id = finance_2.id)
GROUP BY grade , sub_grade 
ORDER BY grade , sub_grade;

-- KPI_3
SELECT
verification_status , ROUND(SUM(total_pymnt),2) AS total_payment
FROM finance_1 INNER JOIN finance_2
ON(finance_1.id = finance_2.id)
GROUP BY verification_status;

-- KPI_4
SELECT
addr_state , last_Credit_pull_D , loan_Status
FROM finance_1 INNER JOIN finance_2
ON(finance_1.id = finance_2.id)
GROUP BY addr_state , last_Credit_pull_D , loan_Status
ORDER BY last_Credit_pull_D;

-- KPI_5
SELECT 
home_ownership , last_pymnt_d
FROM finance_1 INNER JOIN finance_2
ON(finance_1.id = finance_2.id)
GROUP BY home_ownership , last_pymnt_d
ORDER BY last_pymnt_d DESC , home_ownership DESC;




