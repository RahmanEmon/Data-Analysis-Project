SELECT distinct c.customer_code, c.custmer_name, c.customer_type, t.product_code, t.market_code,
d.date, d.year, m.markets_code, m.markets_name, m.zone
	FROM customers c
	   inner JOIN transactions t ON c.customer_code = t.customer_code
	   inner join date d on d.date = t.order_date
	   inner join markets m on m.markets_code = t.market_code
	       group by c.customer_code,t.product_code, t.market_code;