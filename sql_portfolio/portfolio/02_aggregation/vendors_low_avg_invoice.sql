-- ============================================================
-- File:    vendors_low_avg_invoice.sql
-- Topic:   Aggregation with HAVING filter
-- Business question: Which vendors have an average invoice
--          total under $300? Identifies low-spend vendors
--          that may be candidates for vendor consolidation.
-- Skills:  JOIN, GROUP BY, HAVING, AVG, ROUND, ORDER BY
-- ============================================================

USE mgt4250;

SELECT
    v.vendor_name                           AS 'Vendor Name',
    ROUND(AVG(i.invoice_total), 2)          AS 'Average Invoice Total',
    COUNT(i.invoice_total)                  AS 'Total Number of Invoices'
FROM invoices i
JOIN vendors v USING (vendor_id)
GROUP BY v.vendor_name
HAVING ROUND(AVG(i.invoice_total), 2) < 300
ORDER BY ROUND(AVG(i.invoice_total), 2) DESC;
