-- ============================================================
-- File:    insert_invoice_and_lines.sql
-- Topic:   INSERT statements
-- Business question: Add a new invoice record and its
--          associated line items to the database.
--          Demonstrates inserting into related tables
--          while maintaining referential integrity.
-- Skills:  INSERT INTO with explicit column list,
--          multi-row INSERT for line items
-- ============================================================

USE sara_m_assignment4;

-- Insert the parent invoice record
INSERT INTO Saras_Invoices
    (invoice_id, vendor_id, invoice_number, invoice_date,
     invoice_total, payment_total, credit_total,
     terms_id, invoice_due_date, payment_date)
VALUES
    (999, 32, 'ZZ-014-027', '2014-08-01',
     434.58, 0.00, 0.00,
     2, '2014-08-31', NULL);

-- Insert the child line item records (multi-row INSERT)
INSERT INTO saras_invoice_line_items
    (invoice_id, invoice_sequence, account_number,
     line_item_amount, line_item_description)
VALUES
    (999, 1, 160, 180.23, 'Hard Drive'),
    (999, 2, 527, 254.35, 'Exchange Server Update');

-- Verify both inserts
SELECT * FROM Saras_Invoices        WHERE invoice_id = 999;
SELECT * FROM saras_invoice_line_items WHERE invoice_id = 999;
