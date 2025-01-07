# 📊 Fintech Performance Analysis
An analysis of the **BigQuery Fintech Dataset**, focusing on profitability, revenue growth, and cost optimization. Using **SQL**, **Python**, and **Tableau**, the project provides insights into financial performance and customer retention, showcasing skills in data analysis and visualization.

---

## Business Question, Hypotheses & KPIs

### **Business Question**  
💡 *How can the company optimize its loan offerings and risk management strategies by identifying key trends in customer demographics, loan purposes, and regional distributions?*

---

### **1. Customer Behavior Hypothesis**  
**Hypothesis**:  
Customers with higher income and homeownership (Own/Mortgage) are less likely to have loans in "Default" status. The distribution of all loan statuses (e.g., Fully Paid, Current, Default, Late, In Grace Period) varies across income ranges and homeownership categories.

**KPIs**:  
- **Loan Status Distribution**: Analyze the distribution of all loan statuses (e.g., Fully Paid, Current, Default, Late, In Grace Period) across income ranges and homeownership categories.  
- **Annual Income Distribution by Loan Status**: Visualize income ranges for each loan status (e.g., Fully Paid, Current, Default, Late, In Grace Period) to identify trends.  
- **Loan Amount Insights**: Analyze the average loan amount across income ranges and homeownership categories to understand borrowing patterns.  
- **Loan Status Percentage Rates**: Calculate and visualize the percentage rates of each loan status (e.g., Default Rate, Fully Paid Rate) across income ranges and homeownership categories.

---

### **2. Regional Performance Hypothesis**  
**Hypothesis**:  
Loans issued in the **West region** demonstrate higher repayment rates due to favorable customer demographics or loan purposes compared to other regions.

**KPIs**:  
- **Repayment Rate by Region**: Percentage of loans fully paid in each region, highlighting the performance of the West compared to others.

---

### **3. Loan Purpose Hypothesis**  
**Hypothesis**:  
Loans issued for **debt consolidation** have the lowest default rates compared to other purposes.

**KPIs**:  
- **Default Rate**: Percentage of loans not fully paid or in default status, segmented by loan purpose.  
- **Average Loan Amount by Purpose**: The mean loan amount for each purpose to understand customer needs and preferences.

---

### **Cross-Hypothesis KPI**  
- **Loan Count Trend**: Year-over-year trend of loans issued provides context for temporal trends and supports overall analysis but is not directly tied to a single hypothesis.

---

## 📂 Repository Structure  

### **Folders and Files**  

## 📂 Repository Structure  

| **Name**               | **Description**                                                                                  |
|------------------------|--------------------------------------------------------------------------------------------------|
| `.ipynb_checkpoints`   | Jupyter Notebook checkpoints folder for autosaved versions of notebooks.                         |
| `.DS_Store`            | macOS system file; can be ignored or removed.                                                   |
| `Data_cleaning.ipynb`  | Notebook for cleaning and preprocessing raw data into a merged dataset (`df_merged`).            |
| `EDA.ipynb`            | Notebook for exploratory data analysis (EDA), including generic visualizations from `df_merged`. |
| `H1.sql`               | SQL queries related to Hypothesis 1, focusing on customer behavior and loan status trends.       |
| `H2.sql`               | SQL queries for Hypotheses 2, analyzing regional performance.                                    |
| `H3.sql`               | SQL queries for Hypotheses 3, loan purpose trends.                                               |
| `README.md`            | Project overview, business questions, hypotheses, KPIs, and links to resources.                 |


### **Notes**  
- The `.ipynb_checkpoints` and `.DS_Store` files are automatically generated and not essential for analysis.  
- SQL files (`H1.sql`, `H2.sql`, `H3.sql`) contain queries supporting specific hypotheses.  
- All notebooks (`Data_cleaning.ipynb`, `EDA.ipynb`) use the merged dataset `df_merged` as the primary source.  


## 🔗 Links:  
- [📄 Conclusion & Insights](https://docs.google.com/document/d/1fJ9e7GndC3Xuc2muRaUYPHZyufXOJ8wf11g1f3UARL4/edit?tab=t.0)  
- [📊 Visualization on Tableau (WIP)](https://public.tableau.com/app/profile/marc.bouche/viz/WIPFinancialPerformanceAnalysis/Dashboard1)  
- [📂 Raw Data Set on Kaggle](https://www.kaggle.com/datasets/mustafakeser4/bigquery-fintech-dataset)
