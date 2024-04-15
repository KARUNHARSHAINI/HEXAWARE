--   TechShop
CREATE DATABASE TechShop
USE TechShop

CREATE TABLE Customers (CustomerID INT PRIMARY KEY, FirstName VARCHAR (50), LastName VARCHAR (50), Email VARCHAR (100), Phone VARCHAR (20), Address VARCHAR (200));
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) 
VALUES (100,'John', 'Doe', 'john@example.com', '1234567890', '123 Main St'),
VALUES (200,'Jane', 'Smith', 'jane@example.com', '0987654321', '456 Elm St'),
VALUES (300,'Ken', 'Rosh', 'ken@example.com', '2345678901', '789 Down St'),
VALUES (400,'James', 'Kith', 'James@example.com', '3456789012', '1234 Main St'),
VALUES (500,'Ron', 'Steve', 'ron@example.com', '4567890123', '123 Elm St'),
VALUES (600,'David', 'Joe', 'david@example.com', '5678901234', '1234 Elm St'),
VALUES (700,'Mark', 'Antony', 'mark@example.com', '6789012345', '456 Main St'),
VALUES (800,'Don', 'Wreck', 'don@example.com', '7890123456', '123 Down St'),
VALUES (900,'Henry', 'Grace', 'henry@example.com', '8901234567', '456 Down St'),
VALUES (1000,'Mick', 'Rose', 'john@example.com', '9012345678', '1234 Down St');

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR (100), Description TEXT, Price DECIMAL (10, 2));
INSERT INTO Products (ProductID, ProductName, Description, Price) 
VALUES (2100,'Laptop', '15-inch laptop with SSD', 65999.00), 
VALUES (2200,'Smartphone', 'Latest smartphone model', 39699.00), 
VALUES (2300,'Headphone', 'Wireless', 999.00), 
VALUES (2400,'Oppo', 'Excellent camera', 17699.00),
VALUES (2500,'AppleLaptop', 'Thinnest and light weight', 233999.00),
VALUES (2600,'Samsung', 'Galaxy s series', 36699.00),
VALUES (2700,'Iphone', '15 Pro Max', 155999.00),
VALUES (2800,'Earphone', 'Noise cancellation', 5699.00),
VALUES (2900,'Lenovo', '14-inch laptop', 78999.00),
VALUES (30000,'Pendrive', 'HP-16GB', 699.00);

CREATE TABLE Orders (OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE, TotalAmount DECIMAL (10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID));
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES (3100,100, '2024-03-01', 65999.00),
VALUES (3200,200, '2024-03-02', 39699.00),
VALUES (3300,300, '2024-03-03', 999.00),
VALUES (3400,400, '2024-03-04', 17699.00),
VALUES (3500,500, '2024-03-05', 233999.00), 
VALUES (3600,600, '2024-03-06', 36699.00), 
VALUES (3700,700, '2024-03-07', 155999.00),
VALUES (3800,800, '2024-03-08', 5699.99),
VALUES (3900,900, '2024-03-09', 78999.00),
VALUES (4000,1000, '2024-03-10', 699.99);

CREATE TABLE OrderDetails (OrderDetailID INT PRIMARY KEY, OrderID INT, ProductID INT, Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID), 
FOREIGN KEY (ProductID) REFERENCES Products (ProductID));
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) 
VALUES (4100,3100, 2100, 1),
VALUES (4200,3200, 2200, 1),
VALUES (4300,3300, 2300, 1),
VALUES (4400,3400, 2400, 1),
VALUES (4500,3500, 2500, 1),
VALUES (4600,3600, 2600, 1),
VALUES (4700,3700, 2700, 1),
VALUES (4800,3800, 2800, 1),
VALUES (4900,3900, 2900, 1),
VALUES (5000,4000, 3000, 1);

CREATE TABLE Inventory (InventoryID INT PRIMARY KEY, ProductID INT, QuantityInStock INT, LastStockUpdate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) 
VALUES(5100,2100,5,'2024-04-08'),
VALUES(5200,2200,6,'2024-04-08'), 
VALUES(5300,2300,7,'2024-04-08'),
VALUES(5400,2400,8,'2024-04-08'),
VALUES(5500,2500,9,'2024-04-08'),
VALUES(5600,2600,5,'2024-04-08'), 
VALUES(5700,2700,4,'2024-04-08'),
VALUES(5800,2800,6,'2024-04-08'),
VALUES(5900,2900,7,'2024-04-08'),
VALUES(6000,3000,8,'2024-04-08');

ALTER TABLE Orders ADD OrderStatus VARCHAR (20) NULL;

--TASK 2
--1. Write an SQL query to retrieve the names and emails of all customers.
SELECT FirstName,LastName,Email FROM TechShop.dbo.Customers

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT FirstName,OrderDate,OrderID FROM TechShop.dbo.Orders 
INNER JOIN TechShop.dbo.Customers ON Orders.CustomerID = Customers.CustomerID

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include
--customer information such as name, email, and address.
INSERT INTO TechShop.dbo.Customers(CustomerID,FirstName, LastName, Email, Phone, Address) 
VALUES (8000,'Jim', 'Carrey', 'jim@example.com', '1424567890', '123456 Main St');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
--increasing them by 10%.
UPDATE TechShop.dbo.Products SET Price = Price * 1.1 WHERE ProductID=2100 OR ProductID=2200 OR 
ProductID=2300 OR ProductID=2400 OR ProductID=2500 OR ProductID=2600 OR ProductID=2700 OR 
ProductID=2800 OR ProductID=2900 OR ProductID=3000 

--5. Write an SQL query to delete a specific order and its associated order details from the
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DECLARE @OrderID INT;
SET @OrderID = 3500 
DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
--order date, and any other necessary information.
INSERT INTO TechShop.dbo.Orders (OrderID,CustomerID, OrderDate, TotalAmount) 
VALUES (9000,8000, '2024-03-11', 63999.00);

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific
--customer in the "Customers" table. Allow users to input the customer ID and new contact information.
DECLARE @CustomerID INT; 
DECLARE @NewEmail NVARCHAR(255); 
DECLARE @NewAddress NVARCHAR(255); 
SET @CustomerID = 100;
SET @NewEmail = 'doe@example.com';
SET @NewAddress = 'abc street';
UPDATE Customers
SET Email = @NewEmail,
    Address = @NewAddress
WHERE CustomerID = @CustomerID;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
--table based on the prices and quantities in the "OrderDetails" table.
UPDATE TechShop.dbo.Orders
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
    FROM TechShop.dbo.OrderDetails od
    INNER JOIN TechShop.dbo.Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
)
WHERE OrderID IN (
    SELECT OrderID
    FROM TechShop.dbo.OrderDetails
);

--9. Write an SQL query to delete all orders and their associated order details for a specific customer 
--from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DECLARE @CustomerID INT;
SET @CustomerID = 8000;
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);
DELETE FROM Orders WHERE CustomerID = @CustomerID;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
--including product name, category, price, and any other relevant details.
INSERT INTO TechShop.dbo.Products (ProductID, ProductName, Description, Price) 
VALUES(10000,'LaptopNew', 'New15-inch laptop with SSD', 165999.00);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.
DECLARE @OrderID INT; 
DECLARE @NewStatus NVARCHAR(50); 
SET @OrderID = 3700 ;
SET @NewStatus = 'PENDING';
UPDATE Orders
SET OrderStatus = @NewStatus
WHERE OrderID = @OrderID;

--12. Write an SQL query to calculate and update the number of orders placed by each customer
--in the "Customers" table based on the data in the "Orders" table
alter table TechShop.dbo.Customers add NumberOfOrders int
UPDATE TechShop.dbo.Customers SET NumberOfOrders = 0
UPDATE TechShop.dbo.Customers SET NumberOfOrders = NumberOfOrders + 1
WHERE CustomerID IN (SELECT CustomerID FROM TechShop.dbo.Orders);

--TASK 3
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order.
SELECT 
   O.OrderID,O.OrderDate,C.FirstName,C.LastName,C.Email,C.CustomerID,C.Phone,C.Address
FROM
    TechShop.dbo.Orders AS O
JOIN
    TechShop.dbo.Customers AS C ON O.CustomerID = C.CustomerID
ORDER BY
    O.OrderDate DESC;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue
SELECT
    P.ProductName,
    SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM
    TechShop.dbo.Products AS P
JOIN
    TechShop.dbo.OrderDetails AS OD ON P.ProductID = OD.ProductID
JOIN
    TechShop.dbo.Orders AS O ON OD.OrderID = O.OrderID
GROUP BY
    P.ProductName;

--3. Write an SQL query to list all customers who have made at least one purchase. Include their
--names and contact information
SELECT DISTINCT
    C.FirstName,C.LastName,C.Email,C.Phone,C.Address
FROM
    TechShop.dbo.Customers AS C
JOIN
    TechShop.dbo.Orders AS O ON C.CustomerID = O.CustomerID;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered
SELECT
    P.ProductName,SUM(OD.Quantity) AS TotalQuantityOrdered
FROM
    TechShop.dbo.Products AS P
JOIN
    TechShop.dbo.OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY
    P.ProductName
ORDER BY
    TotalQuantityOrdered DESC;

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
CREATE TABLE Categories (CategoryID INT PRIMARY KEY,CategoryName VARCHAR(50), ProductID INT
FOREIGN KEY (ProductID) REFERENCES Products (ProductID));
INSERT INTO Categories (CategoryID, CategoryName, ProductID) VALUES
(1,'LAPTOP',2100),
(2,'PHONE',2200),
(3,'HEADSET',2300),
(4,'PHONE',2400),
(5,'LAPTOP',2500),
(6,'PHONE',2600),
(7,'PHONE',2700),
(8,'HEADSET',2800),
(9,'LAPTOP',2900),
(10,'PENDRIVE',3000);
SELECT P.ProductName,Categories.CategoryName
FROM Products P
JOIN Categories ON P.ProductID = Categories.ProductID
WHERE Categories.CategoryName = 'LAPTOP';

--6. Write an SQL query to calculate the average order value for each customer. Include the
--customer's name and their average order value
SELECT c.FirstName, AVG(o.TotalAmount)
FROM TechShop.dbo.Customers c
JOIN TechShop.dbo.Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID,
--customer information, and the total revenue
SELECT o.CustomerID , c.FirstName, c.email , o.TotalAmount
FROM TechShop.dbo.Orders o
JOIN TechShop.dbo.Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT p.ProductName, COUNT(od.OrderID) AS NumberOfOrders
FROM Products p 
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
--Allow users to input the product name as a parameter.
DECLARE @ProductName NVARCHAR(255); 
SET @ProductName = 'Laptop';
SELECT DISTINCT Customers.CustomerID, Customers.FirstName
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = @ProductName;

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.
DECLARE @StartDate DATE = '2024-01-01'
DECLARE @EndDate DATE = '2024-03-31'
SELECT SUM(od.Quantity * p.Price) AS TotalRevenue FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN @StartDate AND @EndDate;

--TASK 4
--1.Write an SQL query to find out which customers have not placed any orders.
SELECT CustomerID, FirstName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
);

--2. Write an SQL query to find the total number of products available for sale.
SELECT COUNT(*) AS total_products
FROM Products
WHERE ProductID IN (
    SELECT DISTINCT ProductID
    FROM Inventory
    WHERE QuantityInStock > 0
);

--3. Write an SQL query to calculate the total revenue generated by TechShop.
SELECT SUM(total_price) AS total_revenue
FROM (
    SELECT SUM(Quantity * Price) AS total_price
    FROM Orders, OrderDetails , Products
    WHERE Orders.CustomerID IN (
        SELECT CustomerID
        FROM Customers
    )
) AS revenue_summary;

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
SELECT AVG(od.Quantity) AS average_quantity_ordered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN categories c ON p.ProductID = c.ProductID
WHERE c.CategoryName = 'LAPTOP';

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.
DECLARE @CustomerID INT = 600 
SELECT SUM(total_price) AS total_revenue
FROM (
    SELECT SUM(Quantity * Price) AS total_price
    FROM Orders , Products, OrderDetails
  --  JOIN Products ON orders.productID = products.product_id
    WHERE orders.CustomerID = @CustomerID
) AS revenue_summary;

--6. Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.
SELECT c.FirstName,max_orders.order_count
FROM (
    SELECT CustomerID, COUNT(*) AS order_count
    FROM Orders o
    GROUP BY CustomerID
    ORDER BY order_count DESC
	OFFSET 2 rows
) AS max_orders
JOIN customers c ON max_orders.CustomerID = c.CustomerID;

--7. Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.
SELECT p.ProductName AS most_popular_category, SUM(od.Quantity) AS total_quantity_ordered
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity_ordered DESC

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
--on electronic gadgets. List their name and total spending.
SELECT c.FirstName, SUM(p.Price * oi.Quantity) AS total_spending
FROM (
    SELECT OrderDetailID, ProductID, Quantity,OrderID
    FROM OrderDetails 
) AS oi
JOIN orders o ON oi.OrderID = o.OrderID
JOIN customers c ON o.CustomerID = c.CustomerID
JOIN products p ON oi.ProductID = p.ProductID
JOIN Categories ca ON p.ProductID = ca.ProductID
WHERE ca.categoryName = 'PHONE'
GROUP BY c.FirstName
ORDER BY total_spending DESC

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.
SELECT AVG(order_value) AS average_order_value
FROM (
    SELECT o.OrderID, SUM(p.Price * oi.quantity) AS order_value
    FROM Orders o , OrderDetails oi
    JOIN Products p ON oi.ProductID = p.ProductID
    GROUP BY o.OrderID
) AS order_values;

--10. Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.
SELECT 
    customers.FirstName,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.CustomerID = customers.CustomerID
    ) AS order_count
FROM 
    customers;
