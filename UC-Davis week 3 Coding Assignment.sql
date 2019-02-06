/* 1. Using a subquery, find the names of all the tracks for the album "Californication". */

select a.Title, t.Name FROM albums a LEFT JOIN tracks t ON a.AlbumID=t.AlbumID where a.Title='Californication';

SELECT AlbumId, TrackId, Name
FROM Tracks
WHERE AlbumId IN 
	(SELECT AlbumId
	 FROM Albums WHERE Title = 'Californication');

/* What is the title of the 8th track? */

/* 2. Find the total number of invoices for each customer along with the customer's full name, city and email. */

SELECT FirstName, LastName, City, Email,
      (SELECT COUNT(*) AS total_invoice
      FROM Invoices WHERE Invoices.CustomerId = Customers.CustomerId) AS total_invoices
		FROM Customers
		ORDER BY CustomerId
		limit 6;

/* After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter
the answer below (feel free to copy and paste). */

/* 3. Retrieve the track name, album, artistID, and trackID for all the albums. */

SELECT t.Name, b.Title, b.ArtistId, t.TrackID FROM tracks t, albums b 
WHERE t.AlbumId=b.AlbumId limit 10;

/* What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer
below. */

select t.Name, b.Title, b.ArtistId, t.TrackID from (albums b join tracks t ON t.albumid=b.albumid) where b.Title = "For Those About To Rock We Salute You";

/* 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her. */

SELECT a.LastName, a.ReportsTo, a.Title, b.LastName, b.Title FROM employees a, employees b;

select m.LastName MgmtLast, m.EmployeeId, e.ReportsTo, e.LastName EmpLast, e.Title Title FROM Employees m, Employees e ON m.EmployeeId = e.ReportsTo;

/* After running the query described above, who are the reports for the manager named Mitchell (select all that
apply)? */

/* 5. Find the name and ID of the artists who do not have albums */
select
    a.ArtistId, a.Name, b.Title
from
    artists a
    left outer join albums b
        on a.ArtistId = b.ArtistId
where
    b.AlbumId is null;

/* After running the query described above, two of the records returned have the same last name. Enter that name
below. */

/* 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last
name in descending order. */

select c.LastName, c.FirstName from customers c union 
select e.LastName, e.FirstName from employees e order by LastName desc limit 10;

/* After running the query described above, determine what is the last name of the 6th record? Enter it below.
Remember to order things in descending order to be sure to get the correct answer. */

/* 7. See if there are any customers who have a different city listed in their billing city versus their customer city.*/

select City FROM
(SELECT City FROM customers
UNION ALL  
SELECT BillingCity FROM invoices) data
group by City
having count(*)!=2;

select City FROM
(SELECT City FROM customers
UNION ALL  
SELECT BillingCity FROM invoices) data
group by City
having c.City <> i.BillingCity

select distinct c.City, i.BillingCity FROM customers c, invoices i;
(select distinct City from customers
Union All 
select distinct BillingCity from invoices)
group by City;
having count(*)!=2;

Select
  CustomerID,
  FirstName,
  LastName,
  City
From
  Customers
Where CustomerID In  
                  (
                  select distinct c.CustomerID
                  From Customers C
                  Inner Join Invoices I
                  On C.CustomerId = I.CustomerID
                  And C.City <> I.BillingCity
                  )
group by City;

select distinct c.CustomerID
From Customers c
Inner Join Invoices i
On C.CustomerId = I.CustomerID
And C.City = I.BillingCity;

