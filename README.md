# Bank-Loan-Defaults

Objective: To determine the key factors contributing to loan defaults to reduce future default rates and operational losses


Guiding questions:
    - How do specific borrower demographics (age, education, credit score, employment type) correlate with loan default rates? What is the direction and strength of these individual relationships?
    - How do specific loan characteristics (loan amount, interest rate, loan term, debt-to-income ratio, number of credit lines, loan purpose, and the presence of a co-signer) correlate to loan default rates? What is the direction and strength of these individual relationships?
    - How do specific borrower socioeconomic characteristics (income, homeownership, employment length) correlate to loan default rates? What is the direction and strength of these individual relationships? 
    - How do specific borrower family characteristics such as marital status and dependents correlate to loan default rates? What is the direction and strength of these individual relationships?


Data collection: To retrieve data from Kaggle


Data cleaning:
    - Transformed the data to fields for dates and timestamp using SQL for further data analysis 
    - Reviewed duplicates in customer names to avoid errors or unusual events 
    - Investigated different date data formats for data quality


Data exploration:
    - Exploratory data analysis was performed in SQL to answer the guiding questions
    - Refer to the separate .sql file for further details


Data visualization
    - Data visualization was performed in Tableau
    - Refer to the separate Tableau data visualization on Tableau Public for further details


Insights and recommendations: 
    1) Elevated default rate with higher interest rates.
        - Implement a risk-based pricing model that adjusts interest rates based on borrower risk profiles, including credit score, credit history, loan to value ratio, debt to income ratio, etc. 
    2) Higher default rate with higher loan amounts. 
        - Re-evaluate the underwriting process for large loan applications such as financial scrutiny through cash flow, asset verification, stress testing, etc. 
    3) Increased default rate among unemployed individuals. 
        - Strengthen the verification process for 1) employment status (employer contact, employment documents, or third party verification) and for 2) income stability (bank statements, tax returns, etc.) 
    4) Higher default rates among younger borrowers. 
        - Implement stricter underwriting criteria for younger applicants, such as requiring co-signers, shorter loan terms, or lower initial credit limits.
