-- ============================================================
-- File:    invoices_near_vendor_max.sql
-- Topic:   Correlated subquery
-- Business question: For each vendor, flag invoices that are
--          at least 80% of that vendor's highest invoice total.
--          Helps identify unusually large invoices per vendor.
-- Skills:  Correlated subquery, MAX, ORDER BY multiple columns
-- ============================================================

USE mgt4250;

SELECT
    vendor_id       AS 'Vendor ID',
    invoice_number  AS 'Invoice Number',
    invoice_total   AS 'Invoice Total'
FROM invoices i
WHERE i.invoice_total >= 0.8 * (
        SELECT MAX(invoice_total)
        FROM invoices
        WHERE vendor_id = i.vendor_id
    )
ORDER BY vendor_id, invoice_total;
