USE fintech_analysis;
##-----------------------------------------------------------------------------------------------------------------------------------------------#

# 1. Default Rate by Loan Purpose
SELECT 
    purpose,
    COUNT(*) AS total_loans,
    COUNT(CASE WHEN loan_status = 'Default' THEN 1 END) AS defaulted_loans,
    COUNT(CASE WHEN loan_status = 'Default' THEN 1 END) * 100.0 / COUNT(*) AS default_rate
FROM 
    df_merged
GROUP BY 
    purpose
ORDER BY 
    default_rate ASC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 2. Average Loan Amount by Purpose
SELECT 
    purpose,
    AVG(loan_amount) AS avg_loan_amount,
    COUNT(*) AS total_loans
FROM 
    df_merged
GROUP BY 
    purpose
ORDER BY 
    avg_loan_amount DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 3. Combined Analysis of Default Rate and Average Loan Amount by Purpose
SELECT 
    purpose,
    COUNT(*) AS total_loans,
    COUNT(CASE WHEN loan_status = 'Default' THEN 1 END) AS defaulted_loans,
    COUNT(CASE WHEN loan_status = 'Default' THEN 1 END) * 100.0 / COUNT(*) AS default_rate,
    AVG(loan_amount) AS avg_loan_amount
FROM 
    df_merged
GROUP BY 
    purpose
ORDER BY 
    default_rate ASC, avg_loan_amount DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 4. Loan Status Distribution for Selected Purposes
SELECT purpose, loan_status, COUNT(*) AS loan_count
FROM df_merged
WHERE purpose IN ('Small_business', 'House', 'Home_improvement')
GROUP BY purpose, loan_status;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 5. Default Rate for Each Purpose (With Combined Status)
SELECT 
    purpose,
    COUNT(*) AS loan_count,
    SUM(CASE WHEN loan_status IN ('Default', 'Charged Off') THEN 1 ELSE 0 END) AS default_count,
    SUM(CASE WHEN loan_status IN ('Default', 'Charged Off') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS default_rate
FROM df_merged
GROUP BY purpose
ORDER BY default_rate ASC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 6. KPI 1: Default Rate Segmentation
SELECT 
    purpose,
    SUM(CASE WHEN loan_status IN ('Default', 'Charged Off') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS default_rate
FROM df_merged
GROUP BY purpose
ORDER BY default_rate ASC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 7. KPI 2: Average Loan Amount by Purpose
SELECT 
    purpose,
    AVG(loan_amount) AS avg_loan_amount
FROM df_merged
GROUP BY purpose
ORDER BY avg_loan_amount DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 8. Combined Default Rate and Average Loan Amount by Purpose
SELECT 
    purpose,
    SUM(CASE WHEN loan_status IN ('Default', 'Charged Off') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS default_rate,
    AVG(loan_amount) AS avg_loan_amount
FROM df_merged
GROUP BY purpose
ORDER BY default_rate ASC, avg_loan_amount DESC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 9. Default Rate by Loan Amount Range for Debt Consolidation
SELECT 
    purpose,
    CASE 
        WHEN loan_amount < 5000 THEN '<5K'
        WHEN loan_amount BETWEEN 5000 AND 15000 THEN '5K-15K'
        ELSE '>15K'
    END AS loan_amount_range,
    COUNT(*) AS loan_count,
    SUM(CASE WHEN loan_status IN ('Default', 'Charged Off') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS default_rate
FROM df_merged
WHERE purpose = 'Debt_consolidation'
GROUP BY purpose, loan_amount_range
ORDER BY loan_amount_range ASC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#

# 10. Default Rate Segmentation by Loan Amount Range for Debt Consolidation
# Investigate whether smaller or larger "Debt Consolidation" loans have different default rates.
SELECT 
    CASE 
        WHEN loan_amount < 5000 THEN '<5K'
        WHEN loan_amount BETWEEN 5000 AND 15000 THEN '5K-15K'
        ELSE '>15K'
    END AS loan_amount_range,
    COUNT(*) AS loan_count,
    SUM(CASE WHEN loan_status IN ('Default', 'Charged Off') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS default_rate
FROM df_merged
WHERE purpose = 'Debt_consolidation'
GROUP BY loan_amount_range
ORDER BY loan_amount_range ASC;
#-----------------------------------------------------------------------------------------------------------------------------------------------#