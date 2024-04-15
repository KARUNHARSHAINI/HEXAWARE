-- HMBank
CREATE DATABASE HMBank
USE HMBank
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT  PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
--Tasks 2: 
--1. Insert at least 10 sample records into each of the following tables.
--• Customers
--• Accounts
--• Transactions
INSERT INTO Customers (customer_id,first_name, last_name, DOB, email, phone_number, address)
VALUES
(1,'John', 'Doe', '1995-05-15', 'john.doe@example.com', '123-456-7890','123 Main St, City'),
(2,'Alice', 'Smith', '1998-10-20', 'alice.smith@example.com', '987-654-3210','456 Oak St, Town'),
(3,'Emma', 'Johnson', '1997-07-12', 'emma.johnson@example.com', '456-789-0123','1234 Main St, City'),
(4,'Michael', 'Brown', '1996-02-28', 'michael.brown@example.com', '789-012-3456','899 Oak St, City'),
(5,'Sophia', 'Wilson', '1999-11-03', 'sophia.wilson@example.com', '234-567-8901','1235 Main St, City'),
(6,'James', 'Taylor', '1994-09-25', 'james.taylor@example.com', '567-890-1234','134 Oak St, City'),
(7,'Olivia', 'Anderson', '1998-04-17', 'olivia.anderson@example.com', '890-123-4567','456 Main St, City'),
(8,'William','Martinez', '1997-01-08', 'william.martinez@example.com','345-678-9012','1235 Oak St, City'),
(9,'Ava', 'Garcia', '1996-08-30', 'ava.garcia@example.com', '678-901-2345','789 Main St, City'),
(10,'Liam', 'Hernandez', '1995-12-10', 'liam.hernandez@example.com', '012-345-6789','1234 Oak St, City');
INSERT INTO Accounts (account_id,customer_id, account_type, balance)
VALUES
(11,1, 'savings', 5000.00),
(12,2, 'current', 10000.00),
(13,3, 'savings', 6000.00),
(14,4, 'current', 11000.00),
(15,5, 'savings', 8000.00),
(16,6, 'current', 1000.00),
(17,7, 'savings', 6500.00),
(18,8, 'current', 11500.00),
(19,9, 'savings', 8600.00),
(20,10, 'current', 1900.00)
INSERT INTO Transactions (transaction_id,account_id, transaction_type, amount, transaction_date)
VALUES
(21,11, 'deposit', 1000.00, '2024-04-01'),
(22,11, 'withdrawal', 500.00, '2024-04-05'),
(23,12, 'deposit', 1500.00, '2024-04-02'),
(24,12, 'withdrawal', 200.00, '2024-04-06'),
(25,13, 'deposit', 2000.00, '2024-04-03'),
(26,13, 'withdrawal', 1000.00, '2024-04-07'),
(27,14, 'deposit', 2500.00, '2024-04-04'),
(28,14, 'withdrawal', 300.00, '2024-04-08'),
(29,15, 'deposit', 3000.00, '2024-04-05'),
(30,15, 'withdrawal', 500.00, '2024-04-09');

--2. Write SQL queries for the following tasks:
--1. Write a SQL query to retrieve the name, account type and email of all customers.
SELECT c.first_name, c.last_name, a.account_type, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

--2. Write a SQL query to list all transaction corresponding customer.
SELECT c.first_name, c.last_name, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id;

--3. Write a SQL query to increase the balance of a specific account by a certain amount.
UPDATE Accounts
SET balance = balance + 1000
WHERE account_id = 11;

--4. Write a SQL query to Combine first and last names of customers as a full_name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers;

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';

--6. Write a SQL query to Find customers living in a specific city.
SELECT *
FROM Customers
WHERE address LIKE '% Oak%';

--7. Write a SQL query to Get the account balance for a specific account.
SELECT balance
FROM Accounts
WHERE account_id = 12;

--8. Write a SQL query to List all current accounts with a balance greater than $1,000.
SELECT *
FROM Accounts
WHERE account_type = 'current' AND balance > 1000.00;

--9. Write a SQL query to Retrieve all transactions for a specific account.
SELECT *
FROM Transactions
WHERE account_id = 12;

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest 
--rate.
SELECT account_id, balance * 1.5 AS interest_accrued
FROM Accounts
WHERE account_type = 'savings';

--11. Write a SQL query to Identify accounts where the balance is less than a specified
--overdraft limit.
SELECT *
FROM Accounts
WHERE balance < 5000;

--12. Write a SQL query to Find customers not living in a specific city.
SELECT *
FROM Customers
WHERE address NOT LIKE '%Oak%';

--Tasks 3: 
--1. Write a SQL query to Find the average account balance for all customers.
SELECT AVG(balance) AS average_balance
FROM Accounts;

--2. Write a SQL query to Retrieve the top 10 highest account balances.
SELECT *
FROM Accounts
ORDER BY balance DESC

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT SUM(amount) AS total_deposits
FROM Transactions
WHERE transaction_type = 'deposit'
AND transaction_date = '2024-04-06';

--4. Write a SQL query to Find the Oldest and Newest Customers.
SELECT MIN(DOB) AS oldest_customer_dob, MAX(DOB) AS newest_customer_dob
FROM Customers;

--5. Write a SQL query to Retrieve transaction details along with the account type.
SELECT t.*, a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id;

--6. Write a SQL query to Get a list of customers along with their account details.
SELECT c.*, a.*
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

--7. Write a SQL query to Retrieve transaction details along with customer information for a
--specific account.
SELECT c.*, t.*
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE a.account_id = 13;

--8. Write a SQL query to Identify customers who have more than one account.
SELECT customer_id, COUNT(* ) 
FROM Accounts
GROUP BY customer_id
HAVING COUNT(* ) > 1;

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS total_deposits,
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS total_withdrawals,
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS difference
FROM Transactions
GROUP BY account_id;

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period.
SELECT account_id, AVG(balance) AS average_daily_balance
FROM Accounts
GROUP BY account_id;

--11. Calculate the total balance for each account type.
SELECT account_type, 
       SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;

--12. Identify accounts with the highest number of transactions order by descending order.
SELECT account_id, COUNT(*) AS num_transactions
FROM Transactions
GROUP BY account_id
ORDER BY num_transactions DESC;

--13. List customers with high aggregate account balances, along with their account types.
SELECT c.customer_id, a.account_type, SUM(a.balance)
FROM Customers c , Accounts a
GROUP BY c.customer_id, a.account_type
HAVING SUM(a.balance) > 10000;

--14. Identify and list duplicate transactions based on transaction amount, date, and account.
SELECT transaction_id, transaction_type, amount, transaction_date, account_id, COUNT(*) 
FROM Transactions
GROUP BY transaction_type, amount, transaction_date, account_id,transaction_id
HAVING COUNT(*)> 1;

--Tasks 4: 
--1. Retrieve the customer(s) with the highest account balance.
SELECT customer_id
FROM Accounts
WHERE balance = (SELECT MAX(balance) FROM Accounts);

--2. Calculate the average account balance for customers who have more than one account.
SELECT AVG(balance)
FROM Accounts
WHERE customer_id IN (SELECT customer_id
                      FROM Accounts
                      GROUP BY customer_id
                      HAVING COUNT(*) > 1);

--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
SELECT account_id
FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions);

--4. Identify customers who have no recorded transactions.
SELECT customer_id
FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Transactions);

--5. Calculate the total balance of accounts with no recorded transactions.
SELECT SUM(balance)
FROM Accounts
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM Transactions);

--6. Retrieve transactions for accounts with the lowest balance.
SELECT t.transaction_id,t.account_id,t.transaction_type,t.amount,t.transaction_date,a.balance
FROM Transactions t, Accounts a
                     WHERE balance = 
					 (SELECT MIN(balance) FROM Accounts);

--7. Identify customers who have accounts of multiple types.
SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;

--8. Calculate the percentage of each account type out of the total number of accounts.
SELECT account_type, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;

--9. Retrieve all transactions for a customer with a given customer_id.
SELECT *
FROM Transactions
WHERE account_id = (Select account_id FROM Accounts
WHERE customer_id = 1);

--10. Calculate the total balance for each account type, including a subquery within the SELECT
clause.
SELECT account_type, (SELECT SUM(balance) FROM Accounts WHERE account_type = a.account_type) AS total_balance
FROM Accounts a
GROUP BY account_type;
