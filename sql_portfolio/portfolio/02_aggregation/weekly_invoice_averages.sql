-- ============================================================
-- File:    weekly_invoice_averages.sql
-- Topic:   Date-based grouping
-- Business question: What is the average invoice total and
--          invoice count for each week of the year?
--          Useful for identifying seasonal billing patterns.
-- Skills:  WEEK(), GROUP BY, AVG, COUNT, ROUND, ORDER BY
-- ============================================================

USE mgt4250;

SELECT
    WEEK(invoice_date)              AS 'Week Number',
    ROUND(AVG(invoice_total), 2)    AS 'Weekly Average Invoice Total',
    COUNT(invoice_total)            AS 'Weekly Total Number of Invoices'
FROM invoices
GROUP BY WEEK(invoice_date)
ORDER BY WEEK(invoice_date) ASC;
