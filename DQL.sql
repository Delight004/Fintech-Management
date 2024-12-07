--DQL
/*
- List all payees registered after January 1st, 2020.
- Retrieve all transactions for a specific payee by name.
- Count the total number of transactions per payee, and more.
- List transactions greater than a specific amount.
- Find payees who have not had any transactions in the last month.
- Fetch the total transaction amount for each payee.
- List all completed transactions.
- Show the average transaction amount.
- Retrieve transactions that were completed on the same day they were initiated.
- Display payee details including the most recent transaction date.
*/

--List all payees registered after January 1st, 2020.
SELECT *
FROM Payeestem
WHERE RegisterDate >= '2020-01-01';

--Retrieve all transactions for a specific payee by name.

SELECT *
FROM TransactionsTem
JOIN PayeesTem
ON PayeesTem.PayId = TransactionsTem.PayId
WHERE TransactionsTem.TransactionId = 2327;

--Count the total number of transactions per payee, and more.
SELECT PayeesTem.PayeeName, COUNT(TransactionsTem.TransactionId) AS TotalTransacction
FROM TransactionsTem
JOIN PayeesTem
ON PayeesTem.PayId = TransactionsTem.PayId
GROUP BY PayeesTem.PayeeName;

-- Find payees who have not had any transactions in the last month.
SELECT PayeesTem.PayeeName, TransactionsTem.TransactionDate
FROM PayeesTem
JOIN TransactionsTem
ON PayeesTem.PayId = TransactionsTem.PayId
WHERE TransactionDate <= '2024-09-01';

--Fetch the total transaction amount for each payee.
SELECT PayeesTem.PayeeName, SUM(TransactionsTem.TransactionId) AS TotalTransacction
FROM TransactionsTem
JOIN PayeesTem
ON PayeesTem.PayId = TransactionsTem.PayId
GROUP BY PayeesTem.PayeeName;

--List all completed transactions.
SELECT *
FROM TransactionsTem
WHERE Status = 'Completed'
ORDER BY Transactionamount DESC;

--Show the average transaction amount.
SELECT PayeesTem.PayeeName, AVG(TransactionsTem.TransactionId) AS AverageTransacction
FROM TransactionsTem
JOIN PayeesTem
ON PayeesTem.PayId = TransactionsTem.PayId
GROUP BY PayeesTem.PayeeName;

--- Retrieve transactions that were completed on the same day they were initiated.
SELECT PayeesTem.PayeeName, TransactionsTem.TransactionId, TransactionsTem.TransactionDate
FROM TransactionsTem
JOIN PayeesTem
ON PayeesTem.PayId = TransactionsTem.PayId
WHERE TransactionsTem.TransactionDate = '2023-11-09';


--- Retrieve transactions that were completed between 2023-11-01 and 2023-11-30.

SELECT PayeesTem.PayeeName, TransactionsTem.TransactionId, TransactionsTem.TransactionDate
FROM TransactionsTem
JOIN PayeesTem
ON PayeesTem.PayId = TransactionsTem.PayId
WHERE TransactionsTem.TransactionDate BETWEEN '2023-11-01' AND '2023-11-30';


--Display payee details including the most recent transaction date.
SELECT *
FROM Payeestem
RIGHT JOIN TransactionsTem
ON TransactionsTem.PayId = PayeesTem.PayId
ORDER BY TransactionsTem.TransactionDate DESC
LIMIT 10;






