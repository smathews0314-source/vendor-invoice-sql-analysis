-- ============================================================
-- File:    avg_payment_by_vendor.sql
-- Topic:   Aggregation with HAVING on AVG
-- Business question: Which vendors receive an average payment
--          over $5,000? Flags high-value vendor relationships
--          for accounts payable review.
-- Skills:  JOIN, GROUP BY, HAVING, AVG, COUNT DISTINCT, ROUND
-- ============================================================

USE mgt4250;

SELECT
    v.vendor_name                           AS 'Vendor Name',
    v.default_account_number                AS 'Default Account Number',
    ROUND(AVG(i.payment_total), 2)          AS 'Average Payment Total',
    COUNT(DISTINCT i.invoice_id)            AS 'Total Number of Invoices'
FROM vendors v
JOIN invoices i USING (vendor_id)
GROUP BY v.vendor_name, v.default_account_number
HAVING ROUND(AVG(i.payment_total), 2) > 5000
ORDER BY ROUND(AVG(i.payment_total), 2) DESC;
