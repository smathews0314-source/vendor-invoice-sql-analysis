-- ============================================================
-- File:    vendor_balance_proc.sql
-- Topic:   Stored procedure with conditional logic
-- Business question: Given a vendor ID, return a full payment
--          summary and a human-readable status message
--          indicating whether the balance is paid, unpaid,
--          has no invoices, contains an error, or doesn't
--          exist. Useful for accounts payable call scripts.
-- Skills:  CREATE PROCEDURE, DECLARE variables, SELECT INTO,
--          IF / ELSEIF / END IF, SUM, DELIMITER
-- ============================================================

USE data4250_sara_assignment6;

DROP PROCEDURE IF EXISTS vendor_balance_summary;

DELIMITER $$
CREATE PROCEDURE vendor_balance_summary(IN id_of_vendor INT)
BEGIN
    DECLARE sum_balance_due     DECIMAL(9,2);
    DECLARE sum_invoice_total   DECIMAL(9,2);
    DECLARE sum_payment_total   DECIMAL(9,2);
    DECLARE sum_credit_total    DECIMAL(9,2);
    DECLARE vendor_name_var     VARCHAR(255);

    SELECT vendor_name
    INTO vendor_name_var
    FROM vendors
    WHERE vendor_id = id_of_vendor;

    SELECT SUM(invoice_total - payment_total - credit_total)
    INTO sum_balance_due
    FROM invoices
    WHERE vendor_id = id_of_vendor
    GROUP BY vendor_id;

    SELECT SUM(invoice_total)   INTO sum_invoice_total
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    SELECT SUM(payment_total)   INTO sum_payment_total
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    SELECT SUM(credit_total)    INTO sum_credit_total
    FROM invoices WHERE vendor_id = id_of_vendor GROUP BY vendor_id;

    IF vendor_name_var IS NOT NULL AND sum_balance_due = 0 THEN
        SELECT vendor_name_var      AS 'Vendor Name',
               sum_invoice_total    AS 'Invoice Total',
               sum_payment_total    AS 'Payment Total',
               sum_credit_total     AS 'Credit Total',
               sum_balance_due      AS 'Balance Due',
               'Balance paid in full' AS 'Status';

    ELSEIF vendor_name_var IS NOT NULL AND sum_balance_due > 0 THEN
        SELECT vendor_name_var      AS 'Vendor Name',
               sum_invoice_total    AS 'Invoice Total',
               sum_payment_total    AS 'Payment Total',
               sum_credit_total     AS 'Credit Total',
               sum_balance_due      AS 'Balance Due',
               'Balance NOT paid in full' AS 'Status';

    ELSEIF vendor_name_var IS NOT NULL AND sum_balance_due IS NULL THEN
        SELECT vendor_name_var      AS 'Vendor Name',
               sum_invoice_total    AS 'Invoice Total',
               sum_payment_total    AS 'Payment Total',
               sum_credit_total     AS 'Credit Total',
               sum_balance_due      AS 'Balance Due',
               'No invoices on record' AS 'Status';

    ELSEIF vendor_name_var IS NOT NULL AND sum_balance_due < 0 THEN
        SELECT vendor_name_var      AS 'Vendor Name',
               sum_invoice_total    AS 'Invoice Total',
               sum_payment_total    AS 'Payment Total',
               sum_credit_total     AS 'Credit Total',
               sum_balance_due      AS 'Balance Due',
               'Balance contains error — review required' AS 'Status';

    ELSEIF vendor_name_var IS NULL THEN
        SELECT vendor_name_var      AS 'Vendor Name',
               sum_invoice_total    AS 'Invoice Total',
               sum_payment_total    AS 'Payment Total',
               sum_credit_total     AS 'Credit Total',
               sum_balance_due      AS 'Balance Due',
               'Vendor not found' AS 'Status';
    END IF;

END $$
DELIMITER ;

-- Test calls
CALL vendor_balance_summary(110);   -- paid in full
CALL vendor_balance_summary(52);    -- balance remaining
CALL vendor_balance_summary(89);    -- no invoices
CALL vendor_balance_summary(999);   -- vendor not found
