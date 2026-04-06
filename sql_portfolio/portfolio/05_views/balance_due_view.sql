-- ============================================================
-- File:    balance_due_view.sql
-- Topic:   CREATE VIEW with CHECK OPTION
-- Business question: Create a validated view that calculates
--          balance due on each invoice and enforces data
--          integrity rules — negative totals and invalid
--          date combinations are rejected on UPDATE.
-- Skills:  CREATE OR REPLACE VIEW, calculated column,
--          WHERE constraints, WITH CHECK OPTION,
--          testing valid vs. invalid UPDATE statements
-- ============================================================

USE data4250_sara_assignment6;

CREATE OR REPLACE VIEW invoices_balance_due AS
    SELECT
        *,
        invoice_total - payment_total - credit_total AS `Balance Due`
    FROM invoices
    WHERE invoice_total  >= 0
      AND payment_total  >= 0
      AND credit_total   >= 0
      AND invoice_date   <= invoice_due_date
    ORDER BY `Balance Due` DESC
    WITH CHECK OPTION;

-- Valid update: payment amount is positive, passes all constraints
UPDATE invoices_balance_due
SET payment_total = 3333.30
WHERE invoice_id = 112;

-- Invalid update examples (blocked by WITH CHECK OPTION):

-- Constraint 1: invoice_total cannot be negative
-- UPDATE invoices_balance_due SET invoice_total = -1000.00 WHERE invoice_id = 98;

-- Constraint 2: payment_total cannot be negative
-- UPDATE invoices_balance_due SET payment_total = -2000.00 WHERE invoice_id = 98;

-- Constraint 3: invoice_date cannot exceed invoice_due_date
-- UPDATE invoices_balance_due SET invoice_date = '2014-09-30' WHERE invoice_id = 105;
