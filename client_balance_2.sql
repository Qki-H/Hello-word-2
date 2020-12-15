CREATE OR REPLACE VIEW client_balance_2 AS
	SELECT i.client_id, c.name, CONCAT(address," ", city," ",state) AS full_address,
			SUM(invoice_total-payment_total) AS balance
	FROM invoices i
	JOIN clients c USING(client_id)
	WHERE (invoice_total-payment_total)>=100
    GROUP BY client_id, name
