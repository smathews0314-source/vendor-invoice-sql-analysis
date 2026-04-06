-- ============================================================
-- File:    top_2_credit_vendors.sql
-- Topic:   Aggregation with LIMIT
-- Business question: Which two vendors have received the
--          highest total credit amounts? Helps flag vendors
--          with frequent billing adjustments.
-- Skills:  GROUP BY, SUM, ORDER BY DESC, LIMIT
-- ============================================================

USE mgt4250;

SELECT
    vendor_id           AS 'Vendor ID',
    SUM(credit_total)   AS 'Total Credit'
FROM invoices
GROUP BY vendor_id
ORDER BY SUM(credit_total) DESC
LIMIT 2;
