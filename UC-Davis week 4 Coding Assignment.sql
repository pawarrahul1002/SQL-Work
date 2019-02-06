-- UC-Davis week 4 Coding Assignment

/* Pull a list of customers ids with the customer's full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. */

select customerId, FirstName, LastName,Address, upper(City)||' ' ||upper(country) from customers limit 17;

-- What is the City and Country result for CustomerID 16?

/* Create a new employee uuser id by combining the first 4 letters of the employee's first name with the first 2 letters of the employee's last name. Make the new field lower case and pull each individual step to show your work.*/

select substr(FirstName,1,4)||substr(LastName,1,2) from employees limit 10;

-- What is the final result for Rovert King?

/* Show a list of employees who have worked for the company for 15 or more years using the current data function. Sort by lastname ascending. */

select lastname, DATE('now')-hiredate, hiredate from employees order by lastName asc;

-- What is the lastname of the last person on the list returned?

/* Profiling the Customers table, answer the following question. */

select * from customers where address is null or address = '';
select * from customers where PostalCode is null or PostalCode = '';
select * from customers where company is null or company = '';
select * from customers where FirstName is null or FirstName = '';
select * from customers where phone is null or phone = '';
select * from customers where fax is null or fax = '';

/* Find the cities with the most customers and rank in descending order. */
select count(customerid) as ccnt , city from customers group by city order by ccnt desc;

/* Create a new customer invoice id by combining a customer's invoice id with their first and last name while ordering your query in the following order: fistname, last name, and invoiceID. */

select (c.FirstName||c.LastName||i.invoiceid) invID from invoices i, customers c where c.CustomerId=i.CustomerId and invID like 'Ast%';
