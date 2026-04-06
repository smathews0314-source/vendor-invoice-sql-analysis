-- ============================================================
-- File:    overdue_days_case.sql
-- Topic:   Conditional logic
-- Business question: Flag unpaid invoices as overdue and
--          calculate how many days past due they are.
--          Paid invoices are labeled 'Not Overdue'.
-- Skills:  CASE WHEN, NULL checking, date arithmetic
-- ============================================================

USE mgt4250;

SELECT *,
    CASE
        WHEN payment_date IS NULL
            THEN DATEDIFF(CURRENT_DATE(), invoice_due_date)
        ELSE 'Not Overdue'
    END AS 'Days Overdue'
FROM invoices
ORDER BY invoice_id DESC;
