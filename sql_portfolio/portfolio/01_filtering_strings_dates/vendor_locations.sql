-- ============================================================
-- File:    vendor_locations.sql
-- Topic:   String concatenation
-- Business question: Format vendor city, state, and zip into
--          a single readable location string for reporting.
-- Skills:  CONCAT, column aliasing
-- ============================================================

USE mgt4250;

SELECT CONCAT(vendor_city, ', ', vendor_state, ' ', vendor_zip_code) AS 'Vendor Location'
FROM vendors;
