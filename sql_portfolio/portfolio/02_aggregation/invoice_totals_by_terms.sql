-- ============================================================
-- File:    invoice_totals_by_terms.sql
-- Topic:   Grouping by payment terms
-- Business question: What is the total invoice value grouped
--          by payment terms for invoices after Jan 2015?
--          Helps assess cash flow timing by terms type.
-- Skills:  GROUP BY, SUM, WHERE with date filter, ORDER BY
-- ============================================================

USE mgt4250;

SELECT
    terms_id                    AS 'Terms ID',
    SUM(invoice_total)          AS 'Sum of Invoice Total'
FROM invoices
WHERE invoice_date > '2015-01-01'
GROUP BY terms_id
ORDER BY SUM(invoice_total) DESC;
