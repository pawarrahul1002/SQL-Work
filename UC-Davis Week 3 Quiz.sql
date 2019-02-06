select CompanyName,ContactName from Customer
where cust_id IN
	(select customerId from Order);

select c.ContactName, o.Id from Customer c left join Order o ON c.Id = o.CustomerId order by c.ContactName;

select b.name, count(a.title) from (albums a join artists b ON a.artistid=b.artistid) where b.name = "Led Zeppelin";

select a.title, t.UnitPrice from ((albums a join tracks t ON a.albumid=t.albumid) join artists b ON (b.artistid = a.artistid)) where b.name = "Audioslave";

select a.title, t.UnitPrice from ((albums a join tracks t ON a.albumid=t.albumid) join artists b ON (b.artistid = a.artistid)) where b.name = "Audioslave" limit 25;

select count(a.title) from ((albums a join tracks t ON a.albumid=t.albumid) join artists b ON (b.artistid = a.artistid)) where b.name = "Audioslave";

select c.FirstName, c.LastName, i.InvoiceId from customers c left join invoices i ON c.CustomerId=i.CustomerId where i.CustomerId IS NULL;

select count(distinct c.LastName), count(distinct i.CustomerId) from customers c left join invoices i ON c.CustomerId IS NULL;

SELECT FirstName, LastName, City, Email,
      (SELECT COUNT(*) AS total_invoice
      FROM Invoices WHERE Invoices.CustomerId = Customers.CustomerId) AS total_invoices
		FROM Customers
		ORDER BY CustomerId;


select a.albumid, t.trackid, ii.unitprice from ((albums a join tracks t ON a.albumid=t.albumid) join invoice_items ii ON (t.trackid=ii.trackid));


SELECT title, count (trackid), unitprice, (count (trackid) * unitprice) AS totalprice FROM albums, tracks WHERE albums.albumid = tracks.albumid and title LIKE 'Big Ones'

SELECT i.*,ii.* FROM invoices i CROSS JOIN invoice_items ii;

SELECT i.invoiceid, count(*) FROM invoices i CROSS JOIN invoice_items ii;

SELECT i.InvoiceId, count(*) FROM invoices i CROSS JOIN invoice_items ii ON i.InvoiceId=ii.InvoiceId GROUP BY i.InvoiceId;

select i.InvoiceId, ii.InvoiceLineId FROM invoices i CROSS JOIN invoice_items ii ON i.InvoiceId=ii.InvoiceId order by i.InvoiceId asc limit 25;

SELECT count(*) FROM invoices i -- count is 412
; 
SELECT count(*) FROM invoice_items ii -- count is 2240
;




