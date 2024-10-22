/* WSDA Database Queries
Created by: I Hull
Date: October 2024*/


-- Track names report with unit prices

SELECT 
	t.name AS "Track Name",
	t.UnitPrice AS Price
FROM 
	Track AS t
ORDER BY 
	t.Name
LIMIT 20;

-- Select tracks, composers, unit prices categorised by price
SELECT
	Name AS "Track Name",
	Composer,
	UnitPrice AS Price,
	CASE
		WHEN UnitPrice <= 0.99 THEN 'Budget'
		WHEN UnitPrice >0.99 AND UnitPrice <= 1.49 THEN 'Regular'
		WHEN UnitPrice >1.49 AND UnitPrice <= 1.99 THEN 'Premium'
		ELSE 'Exclusive'
	END AS PriceCategory
FROM Track
ORDER BY UnitPrice ASC;

-- Joins
-- Select from the customer and invoice tables with inner JOIN

SELECT
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	i.InvoiceDate,
	i.total
FROM 
	Invoice AS i
INNER JOIN
	Customer AS c
ON 
	c.CustomerId = i.CustomerId
ORDER BY i.Total DESC;

-- Joining on several tables to support reps and customers with highest total values
SELECT
	e.FirstName,
	e.LastName,
	e.EmployeeId,
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	i.CustomerId,
	i.total
FROM 
	Invoice AS i
INNER JOIN	
	Customer AS c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee AS e
ON e.EmployeeId = c.SupportRepId
ORDER BY
	i.total DESC
LIMIT 10;

-- Name of customers and their support reps, ordered by rep then customer Name

SELECT
	e.FirstName,
	e.LastName,
	e.EmployeeId,
	c.FirstName,
	c.LastName
FROM 
	Customer AS c
INNER JOIN	
	Employee AS e
ON c.SupportRepId = e.EmployeeId
ORDER BY e.LastName, c.LastName;

-- Functions

-- Concating 
SELECT	
	FirstName,
	LastName,
	FirstName||' '||LastName AS FullName
FROM Customer;

-- Create a mailing list of customers
SELECT
    FirstName,
	LastName,
	Address,
	FirstName||' '||LastName||' '||Address||','||City||' '||State||' '||Postalcode AS Details
FROM Customer
WHERE
	Country = 'USA'
	;

-- Dates
-- Adjust the birthdate to drop the time component
SELECT
	LastName,
	FirstName,
	BirthDate,
	strftime('%Y-%m-%d',BirthDate)AS 'Adj BirthDate'
FROM
	Employee;
	
-- Calculate the ages of all employees
SELECT
	LastName,
	FirstName,
	BirthDate,
	strftime('%Y-%m-%d',BirthDate)AS 'Adj BirthDate',
	strftime('%Y-%m-%d','now')-strftime('%Y-%m-%d',BirthDate) AS Age
FROM
	Employee;

-- Aggregates
-- Global Sales with Nesting Functions

SELECT
	SUM(Total) AS 'Total Sales',
	ROUND(AVG(Total),2) AS 'Average Sales',
	MAX(Total) AS 'Maximum Sale',
	MIN(Total) AS 'Minimum Sale',
	COUNT(InvoiceId) AS 'Number of Sales'
FROM
	Invoice;

-- Text Function Substring
-- Standardised Postcodes

SELECT
	c.FirstName||' '||c.LastName AS CustomerFullName,
	SUBSTR(c.PostalCode,1,5) AS StandardisedPostalCode
FROM
	Customer c
WHERE
	c.Country = 'USA'
ORDER BY
	CustomerFullName;

-- Grouping
-- Average invoice totals by billing country

SELECT
	BillingCountry,
	BillingCity,
	ROUND(AVG(Total),2) AS 'Average Invoice'
FROM
	Invoice
GROUP BY
	BillingCountry, BillingCity
ORDER BY 
	BillingCountry DESC;
	

-- Average spend of customers in each City
SELECT
	BillingCity AS City,
	AVG(Total) AS 'Average Spend'
FROM 
	Invoice i
GROUP BY BillingCity
ORDER BY
	City;
	
-- Subqueries in the WHERE clause
-- Get the Invoice details where the total spend is less than the average 

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice 
WHERE 
	Total < (SELECT AVG(Total) FROM Invoice)
ORDER BY
	Total DESC;


-- Compare the individual cities against the global average
-- Subquery in the SELECT so we can compare each city against the average

SELECT
	BillingCity,
	AVG(Total) AS 'City Average',
	(SELECT AVG(Total)FROM Invoice) AS 'Global Average'
FROM
	Invoice
GROUP BY
	BillingCity
ORDER BY
	BillingCity;


-- Select Subqueries in the WHERE clause 

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate > (SELECT 
						InvoiceDate 
					FROM 
						Invoice 
					WHERE
						InvoiceId = 251);


/*Returning multiple values from a subquery
If you just did a select on the invoice ids it would return less results */

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate IN 
				(SELECT
					InvoiceDate
				FROM
					Invoice
				WHERE
					InvoiceId IN (251,252,254));
					
SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceId IN (251,252,254);
	

-- Subqueries and DISTINCT

SELECT
	DISTINCT TrackId
FROM
	InvoiceLine
ORDER BY 
	TrackId;
	

-- Which tracks are NOT selling?

SELECT
	TrackId,
	Composer,
	Name
FROM
	Track
WHERE
	TrackId NOT IN (
		SELECT DISTINCT TrackId FROM InvoiceLine ORDER BY TrackId);
		

-- Identify Tracks that have never been sold

SELECT
	t.TrackId AS 'Track ID',
	t.Name AS 'Track Name',
	t.Composer AS 'Composer',
	g.Name AS 'Genre'
FROM 
	Track t
JOIN
	Genre g
ON t.TrackId - g.GenreId
WHERE
t.TrackId NOT IN 
				(SELECT DISTINCT 
					InvoiceLine.TrackId 
				FROM InvoiceLine)
ORDER BY 'Track Name';

-- Views
-- View to get the average total spend

CREATE VIEW V_AvgTotal AS
SELECT
	ROUND(AVG(Total),2) AS 'Average Total'
FROM 
	Invoice;
	
-- View to get the tracks

CREATE VIEW V_Tracks_InvoiceLine AS
	SELECT
		il.InvoiceId,
		il.UnitPrice,
		il.Quantity,
		t.Name,
		t.Composer,
		t.Milliseconds
	FROM
		InvoiceLine il
	INNER JOIN
		Track t
	ON 
	il.TrackId = t.TrackId;

