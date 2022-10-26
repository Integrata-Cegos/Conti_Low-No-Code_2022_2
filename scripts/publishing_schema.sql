-- Anlegen der Tabelle BOOK mit Namenskürzel für den SQL Server)
DROP TABLE IF EXISTS BOOKS_SR
DROP TABLE IF EXISTS PUBLISHERS_SR
CREATE TABLE BOOKS_SR (ISBN VARCHAR(20) PRIMARY KEY, TITLE NVARCHAR(100) NOT NULL, PAGES SMALLINT, PRICE DECIMAL (5,2), AVAILABLE BIT) 
CREATE TABLE PUBLISHERS_SR (ID INT PRIMARY KEY, NAME NVARCHAR(50), CITY NVARCHAR(100), STREET NVARCHAR(100))