-- ============================================================
-- File:    repeat_vendors_may.sql
-- Topic:   Subquery with IN / set intersection
-- Business question: Which vendors submitted invoices in May
--          AND had prior invoice history before May? Identifies
--          established repeat vendors active during that month.
-- Skills:  Subquery with IN, BETWEEN for date ranges,
--          DISTINCT, multiple subqueries
-- ============================================================

USE mgt4250;

SELECT DISTINCT v.vendor_id, v.vendor_name
FROM vendors v
WHERE v.vendor_id IN (
        SELECT i.vendor_id
        FROM invoices i
        WHERE i.invoice_date BETWEEN '2018-05-01' AND '2018-05-31'
    )
AND v.vendor_id IN (
        SELECT i.vendor_id
        FROM invoices i
        WHERE i.invoice_date < '2018-05-01'
    )
ORDER BY v.vendor_id;
