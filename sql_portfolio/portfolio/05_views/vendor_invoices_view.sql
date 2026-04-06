-- ============================================================
-- File:    vendor_invoices_view.sql
-- Topic:   CREATE VIEW
-- Business question: Build a reusable view that joins vendor
--          and invoice data for reporting dashboards, so
--          analysts don't need to write the JOIN every time.
-- Skills:  CREATE OR REPLACE VIEW, JOIN, ORDER BY in view
-- ============================================================

USE data4250_sara_assignment6;

CREATE OR REPLACE VIEW vendor_with_invoices AS
    SELECT
        vendor_name,
        invoice_number,
        invoice_date,
        payment_date,
        invoice_total,
        credit_total,
        payment_total
    FROM vendors
    JOIN invoices USING (vendor_id)
    ORDER BY vendor_name;

-- Query the view
SELECT * FROM vendor_with_invoices;
