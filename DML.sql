/*
B. DML Queries 
- Insert Queries: A. New payee; B. record transaction; C. multiple transactions. 
- Delete Queries: A. Delete payee with no transactions, B. remove cancelled transactions, C. delete old transactions. 
- Update Queries: A. Update payee bank info, B. mark transaction as completed, C. adjust transaction amount. 
*/

-- Insert Queries: A. New payee; B. record transaction; C. multiple transactions.
INSERT INTO Payees(PayId, PayeeName, AccountNo, BankName, RegisterDate, Email)
VALUES(1, 'John Smith', 'we2333334909', 'Guaranty Bank', '11/11/2023', 'john@example.org');

INSERT INTO Transactions(TransactionId, PayId, TransactionAmount, TransactionDate, Status, Email)
VALUES(33333, 1, 3456.44, '10/02/2023', 'Pending', 'john@example.org');

INSERT INTO Transactions(TransactionId, PayId, TransactionAmount, TransactionDate, Status, Email)
VALUES(22222, 793, 5400, '01/12/2024', 'Pending', 'zee@example.com'),
	  (11111,2114, 3289.50, '03/03/2023', 'Cancelled', 'kee@examlpe.uk'),
	  (44444, 126, 3892.89, '09/11/2022', 'Completed', 'show@example.org');
-- Delete Queries: A. Delete payee with no transactions, B. remove cancelled transactions, C. delete old transactions.
DELETE 
FROM Transactions
WHERE Status = 'Pending';

DELETE
FROM Transactions
WHERE Status = 'Cancelled';

DELETE
FROM Transactions
WHERE Status = 'Completed';

CREATE TABLE PayeesTem(
	PayId int PRIMARY KEY,
	PayeeName Varchar(25) NOT NULL,
	AccountNo Varchar(50) NOT NULL,
	BankName Varchar(255) NOT NULL,
	RegisterDate Date, 
	Email Varchar(255) UNIQUE
);


CREATE TABLE TransactionsTem(
	TransactionId int PRIMARY KEY,
	PayId int NOT NULL,
	TransactionAmount Decimal(15,2),
	TransactionDate date NOT NULL,
	Status Varchar(25) NOT NULL,
	FOREIGN KEY (PayId) REFERENCES Payees(PayId)
);

-- Update Queries: A. Update payee bank info, B. mark transaction as completed, C. adjust transaction amount.
UPDATE TransactionsTem
SET Status = 'Completed'
WHERE Status = 'Pending';


UPDATE TransactionsTem
SET TransactionAmount = TransactionAmount + 2700
WHERE TransactionId = 10;