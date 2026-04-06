-- ============================================================
-- File:    delete_invoice.sql
-- Topic:   DELETE statement
-- Business question: Remove a test invoice record from the
--          database cleanly using a targeted WHERE clause.
-- Skills:  DELETE with WHERE, safe update mode
-- Note:    Always use a WHERE clause with DELETE to avoid
--          removing unintended rows.
-- ============================================================

USE sara_m_assignment4;

DELETE FROM Saras_Invoices
WHERE invoice_id = 999;

-- Verify deletion
SELECT * FROM Saras_Invoices WHERE invoice_id = 999;
