-- ============================================================
-- File:    vendors_5plus_invoices.sql
-- Topic:   Aggregation with multiple metrics
-- Business question: For active vendors (5+ invoices), what
--          is their largest invoice and average credit total?
--          Profiles high-volume vendors for AP risk review.
-- Skills:  GROUP BY, HAVING, COUNT, MAX, AVG, ORDER BY
-- ============================================================

USE mgt4250;

SELECT
    vendor_id                       AS 'Vendor ID',
    MAX(invoice_total)              AS 'Max Invoice Total',
    AVG(credit_total)               AS 'Average Credit Total'
FROM invoices
GROUP BY vendor_id
HAVING COUNT(invoice_total) >= 5
ORDER BY MAX(invoice_total) DESC;
