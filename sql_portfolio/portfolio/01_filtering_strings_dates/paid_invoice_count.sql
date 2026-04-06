-- ============================================================
-- File:    paid_invoice_count.sql
-- Topic:   Aggregate functions
-- Business question: How many invoices in the system have a
--          recorded payment date (i.e. have been paid)?
-- Skills:  COUNT with a non-null column filter
-- Note:    COUNT(payment_date) ignores NULL values, so it
--          returns only invoices where payment was recorded.
-- ============================================================

USE mgt4250;

SELECT COUNT(payment_date) AS 'Paid Invoices'
FROM invoices;
