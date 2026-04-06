-- ============================================================
-- File:    overdue_invoices.sql
-- Topic:   Date filtering & calculated columns
-- Business question: Identify all invoices past their due date
--          and estimate the late fee at 5% of the invoice total.
-- Skills:  WHERE with date comparison, arithmetic on columns,
--          ORDER BY, CURRENT_DATE()
-- ============================================================

USE mgt4250;

SELECT
    invoice_number  AS 'Invoice Number',
    invoice_date    AS 'Invoice Date',
    0.05 * invoice_total AS 'Late Fee'
FROM invoices
WHERE invoice_due_date <= CURRENT_DATE()
ORDER BY invoice_date DESC;
