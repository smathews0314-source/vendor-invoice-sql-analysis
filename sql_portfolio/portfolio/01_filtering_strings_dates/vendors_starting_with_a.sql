-- ============================================================
-- File:    vendors_starting_with_a.sql
-- Topic:   Pattern matching
-- Business question: Retrieve all vendors whose name begins
--          with the letter A (case-insensitive in MySQL).
-- Skills:  LIKE with wildcard
-- ============================================================

USE mgt4250;

SELECT *
FROM vendors
WHERE vendor_name LIKE 'A%';
