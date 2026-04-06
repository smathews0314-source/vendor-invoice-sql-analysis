-- ============================================================
-- File:    vendor_invoice_count_proc.sql
-- Topic:   Stored procedure with OUT parameter
-- Business question: Same payment summary as vendor_balance_proc,
--          but also returns a formatted invoice count string
--          via an OUT parameter — useful for building
--          concatenated summary messages programmatically.
-- Skills:  IN + OUT parameters, SELECT INTO OUT param,
--          CONCAT, COUNT subquery, session variables
-- ============================================================

USE data4250_sara_assignment6;

DROP PROCEDURE IF EXISTS vendor_invoice_count;

DELIMITER $$
CREATE PROCEDURE vendor_invoice_count(
    IN  id_of_vendor        INT,
    OUT invoice_count_msg   VARCHAR(255)
)
BEGIN
    DECLARE sum_balance_due     DECIMAL(9,2);
    DECLARE sum_invoice_total   DECIMAL(9,2);
    DECLARE sum_payment_total   DECIMAL(9,2);
    DECLARE sum_credit_total    DECIMAL(9,2);
    DECLARE vendor_name_var     VARCHAR(255);

    SELECT vendor_name INTO vendor_name_var
    FROM vendors WHERE vendor_id = id_of_vendor;

    SELECT SUM(invoice_total - payment_total - credit_total) INTO sum_balance_due
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    SELECT SUM(invoice_total) INTO sum_invoice_total
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    SELECT SUM(payment_total) INTO sum_payment_total
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    SELECT SUM(credit_total) INTO sum_credit_total
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    IF vendor_name_var IS NOT NULL THEN
        SELECT vendor_name_var   AS 'Vendor Name',
               sum_invoice_total AS 'Invoice Total',
               sum_payment_total AS 'Payment Total',
               sum_credit_total  AS 'Credit Total',
               sum_balance_due   AS 'Balance Due';

        SELECT CONCAT(vendor_name_var, ' has ',
                   (SELECT COUNT(*) FROM invoices WHERE vendor_id = id_of_vendor),
                   ' invoice(s).')
        INTO invoice_count_msg;

    ELSE
        SELECT 'Vendor not found' AS 'Status';
        SELECT 'Vendor does not exist in the database.' INTO invoice_count_msg;
    END IF;

END $$
DELIMITER ;

-- Test calls — results stored in session variables
CALL vendor_invoice_count(110, @v110);  SELECT @v110;
CALL vendor_invoice_count(52,  @v52);   SELECT @v52;
CALL vendor_invoice_count(999, @v999);  SELECT @v999;

-- Combine messages into one output
SELECT CONCAT(@v110, ' | ', @v52, ' | ', @v999) AS 'Combined Summary';
