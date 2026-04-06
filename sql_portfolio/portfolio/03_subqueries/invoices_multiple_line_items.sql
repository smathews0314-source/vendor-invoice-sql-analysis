-- ============================================================
-- File:    invoices_multiple_line_items.sql
-- Topic:   Subquery with IN + multi-table JOIN
-- Business question: Retrieve all invoices that contain more
--          than one line item, along with vendor and line
--          detail. Useful for auditing complex invoices.
-- Skills:  3-table JOIN, subquery with HAVING, GROUP BY
-- ============================================================

USE mgt4250;

SELECT
    v.vendor_name           AS 'Vendor Name',
    i.invoice_id            AS 'Invoice ID',
    ilt.invoice_sequence    AS 'Line Sequence',
    ilt.line_item_amount    AS 'Line Item Amount'
FROM vendors v
JOIN invoices i          USING (vendor_id)
JOIN invoice_line_items ilt USING (invoice_id)
WHERE i.invoice_id IN (
        SELECT invoice_id
        FROM invoice_line_items
        GROUP BY invoice_id
        HAVING COUNT(*) > 1
    );
