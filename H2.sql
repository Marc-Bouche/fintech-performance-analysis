USE fintech_analysis;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 1. Repayment Rate by Region
SELECT 
    region,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS repayment_rate,
    COUNT(*) AS total_loans,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) AS fully_paid_loans
FROM df_merged
GROUP BY region
ORDER BY repayment_rate DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 2. Income Distribution by Region
SELECT 
    region,
    CASE 
        WHEN annual_inc < 50000 THEN '<50K'
        WHEN annual_inc BETWEEN 50000 AND 100000 THEN '50K-100K'
        WHEN annual_inc BETWEEN 100001 AND 150000 THEN '100K-150K'
        ELSE '>150K'
    END AS income_range,
    COUNT(*) AS loan_count
FROM df_merged
GROUP BY region, income_range
ORDER BY region, income_range;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 3. Homeownership by Region
SELECT 
    region,
    home_ownership,
    COUNT(*) AS loan_count,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS fully_paid_rate
FROM df_merged
GROUP BY region, home_ownership
ORDER BY region, fully_paid_rate DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 4. Employment Length by Region
SELECT 
    region,
    emp_length,
    COUNT(*) AS loan_count,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS fully_paid_rate
FROM df_merged
GROUP BY region, emp_length
ORDER BY region, emp_length;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 5. Loan Purpose Distribution by Region
SELECT 
    region,
    purpose,
    COUNT(*) AS loan_count,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS fully_paid_rate
FROM df_merged
GROUP BY region, purpose
ORDER BY region, fully_paid_rate DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#
#6. Repayment Rates by Income Group
SELECT 
    region, 
    CASE 
        WHEN annual_inc < 50000 THEN '<50K'
        WHEN annual_inc BETWEEN 50000 AND 100000 THEN '50K-100K'
        WHEN annual_inc BETWEEN 100000 AND 150000 THEN '100K-150K'
        ELSE '>150K'
    END AS income_group,
    COUNT(*) AS loan_count,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS fully_paid_rate
FROM df_merged
GROUP BY region, income_group
ORDER BY fully_paid_rate DESC;

#-----------------------------------------------------------------------------------------------------------------------------------------------#
#7. Repayment Rates by Loan Purpose

SELECT 
    region,
    purpose,
    COUNT(*) AS loan_count,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS fully_paid_rate
FROM df_merged
GROUP BY region, purpose
ORDER BY fully_paid_rate DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#
#8. Repayment Rates by Loan Term

SELECT 
    region,
    term,
    COUNT(*) AS loan_count,
    COUNT(CASE WHEN loan_status = 'Fully Paid' THEN 1 END) * 100.0 / COUNT(*) AS fully_paid_rate
FROM df_merged
GROUP BY region, term
ORDER BY fully_paid_rate DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#