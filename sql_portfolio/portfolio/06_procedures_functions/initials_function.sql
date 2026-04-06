-- ============================================================
-- File:    initials_function.sql
-- Topic:   Scalar user-defined function
-- Business question: Extract the initials from a vendor
--          contact's first and last name for use in
--          reporting, labels, or display fields.
-- Skills:  CREATE FUNCTION, RETURNS, LEFT, UPPER, CONCAT,
--          calling a UDF inside a SELECT
-- ============================================================

USE data4250_sara_assignment6;

DROP FUNCTION IF EXISTS extract_initials;

DELIMITER $$
CREATE FUNCTION extract_initials(
    first_name  VARCHAR(255),
    last_name   VARCHAR(255)
)
RETURNS VARCHAR(10)
BEGIN
    RETURN UPPER(CONCAT(LEFT(first_name, 1), LEFT(last_name, 1)));
END $$
DELIMITER ;

-- Apply the function to the vendors table
SELECT
    vendor_id,
    vendor_contact_first_name,
    vendor_contact_last_name,
    extract_initials(vendor_contact_first_name, vendor_contact_last_name) AS 'Initials'
FROM vendors;
