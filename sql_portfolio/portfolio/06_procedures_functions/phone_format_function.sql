-- ============================================================
-- File:    phone_format_function.sql
-- Topic:   Scalar user-defined function
-- Business question: Reformat vendor phone numbers from the
--          stored format (XXX) XXX-XXXX to a cleaner
--          dot-separated format XXX.XXX.XXXX for use in
--          exports or outbound communication tools.
-- Skills:  CREATE FUNCTION, nested REPLACE, string
--          manipulation, calling a UDF inside a SELECT
-- ============================================================

USE data4250_sara_assignment6;

DROP FUNCTION IF EXISTS format_phone;

DELIMITER $$
CREATE FUNCTION format_phone(phone VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
    RETURN REPLACE(
               REPLACE(
                   REPLACE(phone, '(', ''),
               ') ', '.'),
           '-', '.');
END $$
DELIMITER ;

-- Apply the function to the vendors table
SELECT
    vendor_id,
    vendor_name,
    vendor_phone                    AS 'Original Format',
    format_phone(vendor_phone)      AS 'Reformatted'
FROM vendors;
