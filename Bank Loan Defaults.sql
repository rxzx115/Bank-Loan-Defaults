-- To test the data that is loaded into the database and table
SELECT *
FROM molten-thought-441320-u6.Example.defaultrates
LIMIT 10


-- To confirm if there are any missing data in the loanid
SELECT *
FROM molten-thought-441320-u6.Example.defaultrates
WHERE loanid IS NULL


-- To confirm if there are any missing data in the loanamount
SELECT *
FROM molten-thought-441320-u6.Example.defaultrates
WHERE loanamount IS NULL


-- To confirm if there are any missing data in the age
SELECT *
FROM molten-thought-441320-u6.Example.defaultrates
WHERE age IS NULL


-- To find the distinct education to clean up any incomplete data
SELECT DISTINCT education
FROM molten-thought-441320-u6.Example.defaultrates


-- To find the distinct employmenttype to clean up any incomplete data
SELECT DISTINCT employmenttype
FROM molten-thought-441320-u6.Example.defaultrates


-- To find the distinct default to clean up any incomplete data
SELECT DISTINCT `default`
FROM molten-thought-441320-u6.Example.defaultrates


--To find the number of distinct loanid
SELECT
    COUNT(DISTINCT loanid) AS unique_loan_id_count,
    COUNT(*) AS total_loan_id_count
FROM molten-thought-441320-u6.Example.defaultrates


-- To identify the number of loanid that show up more than once in the data
SELECT loanid, COUNT(loanid) AS loan_id_count
FROM molten-thought-441320-u6.Example.defaultrates
GROUP BY loanid
HAVING COUNT(loanid) > 1


-- To review loanid further for BZ6O5YSSA8
SELECT *
FROM molten-thought-441320-u6.Example.defaultrates
WHERE loanid = 'BZ6O5YSSA8'


-- To review loanid further for TE1MRP009B
SELECT *
FROM molten-thought-441320-u6.Example.defaultrates
WHERE loanid = 'TE1MRP009B'


-- To find correlation between borrower demographics and loan default rates
SELECT
    ROUND(CORR(age, CAST(`default` AS BIGNUMERIC)), 2) AS age_to_default_correlation,
    ROUND(CORR(
        CASE
            WHEN education = 'High School' THEN 1
            WHEN education = 'Bachelor\'s' THEN 2
            WHEN education = 'Master\'s' THEN 3
            WHEN education = 'PhD' THEN 4
            ELSE NULL
        END,
        CAST(`default` AS BIGNUMERIC)
    )) AS education_to_default_correlation,
    ROUND(CORR(creditscore, CAST(`default` AS BIGNUMERIC)), 2) AS creditscore_to_default_correlation
FROM
    molten-thought-441320-u6.Example.defaultrates


-- To find correlation between loan characteristics and loan default rates
SELECT
    ROUND(CORR(loanamount, CAST(`default` AS BIGNUMERIC)), 2) AS loanamount_to_default_correlation,
    ROUND(CORR(interestrate, CAST(`default` AS BIGNUMERIC)), 2) AS interestrate_to_default_correlation,
    ROUND(CORR(loanterm, CAST(`default` AS BIGNUMERIC)), 2) AS loanterm_to_default_correlation,
    ROUND(CORR(dtiratio, CAST(`default` AS BIGNUMERIC)), 2) AS dtiratio_to_default_correlation,
    ROUND(CORR(numcreditlines, CAST(`default` AS BIGNUMERIC)), 2) AS numcreditlines_to_default_correlation,
    ROUND(CORR(
        CASE
            WHEN hascosigner = false THEN 0
            WHEN hascosigner = true THEN 1
            ELSE NULL
        END,
        CAST(`default` AS BIGNUMERIC)
    )) AS hascosigner_to_default_correlation,
FROM
    molten-thought-441320-u6.Example.defaultrates


-- To find correlation between borrower socioeconomic characteristics and loan default rates
SELECT
    ROUND(CORR(income, CAST(`default` AS BIGNUMERIC)), 2) AS income_to_default_correlation,
    ROUND(CORR(
        CASE
            WHEN hasmortgage = false THEN 0
            WHEN hasmortgage = true THEN 1
            ELSE NULL
        END,
        CAST(`default` AS BIGNUMERIC)
    )) AS hasmortgage_to_default_correlation,
    ROUND(CORR(monthsemployed, CAST(`default` AS BIGNUMERIC)), 2) AS monthsemployed_to_default_correlation
FROM
    molten-thought-441320-u6.Example.defaultrates


-- To find correlation between borrower family characteristics and loan default rates
SELECT
    ROUND(CORR(
            CASE
                WHEN hasdependents = false THEN 0
                WHEN hasdependents = true THEN 1
                ELSE NULL
            END,
            CAST(`default` AS BIGNUMERIC)
        )) AS hasdependents_to_default_correlation,
FROM
    molten-thought-441320-u6.Example.defaultrates


-- To calculate the loan default rates by education category
SELECT
    education,
    SUM(`default`) AS default_total,
    COUNT(*) AS count_total,
    ROUND(SUM(`default`) / COUNT(*) * 100, 1) AS default_percent
FROM
  molten-thought-441320-u6.Example.defaultrates
GROUP BY (education)
ORDER BY (education)


-- To calculate the loan default rates by number of credit lines category
SELECT
    numcreditlines,
    SUM(`default`) AS default_total,
    COUNT(*) AS count_total,
    ROUND(SUM(`default`) / COUNT(*) * 100, 1) AS default_percent
FROM
  molten-thought-441320-u6.Example.defaultrates
GROUP BY (numcreditlines)
ORDER BY (numcreditlines)


-- To calculate the loan default rates by marital status category
SELECT
    maritalstatus,
    SUM(`default`) AS default_total,
    COUNT(*) AS count_total,
    ROUND(SUM(`default`) / COUNT(*) * 100, 1) AS default_percent
FROM
  molten-thought-441320-u6.Example.defaultrates
GROUP BY (maritalstatus)
ORDER BY (maritalstatus)


-- To calculate the loan default rates by mortgage category
SELECT
    hasmortgage,
    SUM(`default`) AS default_total,
    COUNT(*) AS count_total,
    ROUND(SUM(`default`) / COUNT(*) * 100, 1) AS default_percent
FROM
  molten-thought-441320-u6.Example.defaultrates
GROUP BY (hasmortgage)
ORDER BY (hasmortgage)


-- To calculate the loan default rates by loanpurpose category
SELECT
    loanpurpose,
    SUM(`default`) AS default_total,
    COUNT(*) AS count_total,
    ROUND(SUM(`default`) / COUNT(*) * 100, 1) AS default_percent
FROM
  molten-thought-441320-u6.Example.defaultrates
GROUP BY (loanpurpose)
ORDER BY (loanpurpose)
