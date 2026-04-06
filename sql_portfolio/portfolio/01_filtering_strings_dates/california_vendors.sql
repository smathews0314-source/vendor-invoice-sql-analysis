-- ============================================================
-- File:    california_vendors.sql
-- Topic:   Filtering & multi-column SELECT
-- Business question: List all vendors located in California
--          with their city and state for regional reporting.
-- Skills:  WHERE, CONCAT, column aliasing
-- ============================================================

USE mgt4250;

SELECT
    vendor_name                                     AS 'Vendor Name',
    CONCAT(vendor_city, ', ', vendor_state)         AS 'City & State'
FROM vendors
WHERE vendor_state = 'CA';
