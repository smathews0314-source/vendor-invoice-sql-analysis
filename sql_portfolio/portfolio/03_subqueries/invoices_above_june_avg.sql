-- ============================================================
-- File:    invoices_above_june_avg.sql
-- Topic:   Scalar subquery
-- Business question: Which June invoices exceed the average
--          invoice total for that same month? Flags
--          above-average spend for month-end review.
-- Skills:  Subquery in WHERE, AVG, MONTH() date filtering
-- ============================================================

USE mgt4250;

SELECT
    invoice_id      AS 'Invoice ID',
    invoice_number  AS 'Invoice Number',
    invoice_total   AS 'Invoice Total'
FROM invoices
WHERE invoice_total >= (
        SELECT AVG(invoice_total)
        FROM invoices
        WHERE MONTH(invoice_date) = 6
    )
AND MONTH(invoice_date) = 6;
