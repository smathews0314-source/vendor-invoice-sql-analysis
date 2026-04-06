-- ============================================================
-- File:    invoices_by_year.sql
-- Topic:   Date functions & grouping
-- Business question: How many invoices were issued each year?
--          Useful for spotting volume trends over time.
-- Skills:  YEAR(), GROUP BY, COUNT
-- ============================================================

USE mgt4250;

SELECT
    YEAR(invoice_date)          AS 'Invoice Year',
    COUNT(YEAR(invoice_date))   AS 'Number of Invoices'
FROM invoices
GROUP BY YEAR(invoice_date);
