-- ============================================================
-- File:    vendors_3plus_invoices.sql
-- Topic:   Aggregation with HAVING
-- Business question: Which vendors have submitted 3 or more
--          invoices? Identifies high-activity vendors for
--          relationship management.
-- Skills:  JOIN, GROUP BY, HAVING, COUNT, ORDER BY
-- ============================================================

USE mgt4250;

SELECT
    v.vendor_name               AS 'Vendor Name',
    COUNT(i.invoice_number)     AS 'Total Invoices'
FROM invoices i
JOIN vendors v USING (vendor_id)
GROUP BY v.vendor_name
HAVING COUNT(i.invoice_number) >= 3
ORDER BY COUNT(i.invoice_number) DESC;
