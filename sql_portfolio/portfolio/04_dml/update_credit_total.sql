-- ============================================================
-- File:    update_credit_total.sql
-- Topic:   UPDATE statement
-- Business question: Apply a 10% credit adjustment to a
--          specific invoice, then recalculate the invoice
--          total to reflect the credit.
-- Skills:  UPDATE with arithmetic, SET SQL_SAFE_UPDATES,
--          WHERE clause to target a single record
-- ============================================================

USE sara_m_assignment4;

SET SQL_SAFE_UPDATES = 0;

UPDATE Saras_Invoices
SET
    credit_total  = 0.10 * invoice_total,
    invoice_total = payment_total + credit_total
WHERE invoice_id = 999;

-- Verify the update
SELECT * FROM Saras_Invoices WHERE invoice_id = 999;
