/*
In the rapidly evolving fintech sector, effective data management is critical for maintaining efficient operations and 
providing excellent customer service. A fintech startup is keen on developing a robust digital management system to handle 
transactions involving various payees. This system will leverage SQL to manage payee data, track transaction records, and 
handle dynamic changes in payee information efficiently. The primary goal is to ensure seamless integration of payee data 
management into the company's operations, facilitating easy updates and queries. 
*/
--Create Data 
--Payees: Stores information about each payee involved in transactions.
CREATE TABLE Payees(
	PayId int PRIMARY KEY,
	PayeeName Varchar(25) NOT NULL,
	AccountNo Varchar(50) NOT NULL,
	BankName Varchar(255) NOT NULL,
	RegisterDate Date, 
	Email Varchar(255) UNIQUE
);
ALTER TABLE Payees 
ALTER COLUMN PayeeName TYPE VARCHAR(225),
ALTER COLUMN PayeeName SET NOT NULL;


--Transactions: Logs each transaction made to and from payees. 
CREATE TABLE Transactions(
	TransactionId int PRIMARY KEY,
	PayId int NOT NULL,
	TransactionAmount Decimal(15,2),
	TransactionDate date NOT NULL,
	Status Varchar(25) NOT NULL,
	FOREIGN KEY (PayId) REFERENCES Payees(PayId)
);
/*
A. DDL Queries 
- Practice Truncate Queries: Truncate the Transactions table. 
- Alter Queries: 1. Add a column `Email` OF the Payees table TO Modify the `TransactionAmount`.
*/
TRUNCATE TABLE Transactions;
ALTER TABLE Transactions ADD COLUMN Email Varchar(255) UNIQUE;
DROP TABLE Transactions;
DROP TABLE Payees;

ALTER TABLE Transactions ADD CONSTRAINT Email 
FOREIGN KEY (Email) references Payees(Email);

