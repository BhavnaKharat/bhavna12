create database Bank_Loan_Project;
CREATE TABLE combined_finance AS
SELECT * FROM finance_1
UNION ALL
SELECT * FROM finance_2;


# KPI 1

SELECT YEAR(issue_date) AS loan_year, SUM(loan_amount) AS total_loan_amount
FROM combined_finance
GROUP BY YEAR(issue_date);


# KPI 2

SELECT grade, sub_grade, AVG(revol_bal) AS avg_revol_bal
FROM combined_finance
GROUP BY grade, sub_grade;


# KPI 3

SELECT verification_status, SUM(total_payment) AS total_payment_amount
FROM combined_finance
GROUP BY verification_status;


# KPI 4

SELECT state, MONTH(issue_date) AS loan_month, COUNT(*) AS loan_count
FROM combined_finance
GROUP BY state, MONTH(issue_date);


# KPI 5

SELECT home_ownership, AVG(DATEDIFF(CURDATE(), last_payment_date)) AS avg_days_since_last_payment
FROM combined_finance
GROUP BY home_ownership;
