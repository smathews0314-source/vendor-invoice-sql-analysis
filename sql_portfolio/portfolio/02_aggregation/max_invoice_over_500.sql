-- ============================================================
-- File:    max_invoice_over_500.sql
-- Topic:   Aggregation with WHERE filter
-- Business question: For vendors with invoices over $500,
--          what is the largest single invoice? Supports
--          high-value spend analysis.
-- Skills:  JOIN, WHERE, GROUP BY, MAX, ORDER BY
-- ============================================================

USE mgt4250;

SELECT
    v.vendor_name               AS 'Vendor Name',
    MAX(i.invoice_total)        AS 'Maximum Invoice Total'
FROM invoices i
JOIN vendors v USING (vendor_id)
WHERE i.invoice_total > 500
GROUP BY v.vendor_name
ORDER BY v.vendor_id DESC;
