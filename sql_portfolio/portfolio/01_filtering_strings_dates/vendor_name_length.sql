-- ============================================================
-- File:    vendor_name_length.sql
-- Topic:   String functions
-- Business question: Calculate the character length of each
--          vendor name excluding spaces, which can inform
--          database storage optimization decisions.
-- Skills:  LENGTH, REPLACE to strip spaces
-- ============================================================

USE mgt4250;

SELECT
    vendor_name                                   AS 'Vendor Name',
    LENGTH(REPLACE(vendor_name, ' ', ''))         AS 'Vendor Name Length'
FROM vendors;
