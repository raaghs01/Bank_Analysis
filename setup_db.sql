-- Creates the banking schema, builds the banking-clients table, and loads the CSV.
-- Run with:  mysql --local-infile=1 -u root -p < setup_db.sql

SET GLOBAL local_infile = 1;

CREATE DATABASE IF NOT EXISTS banking;
USE banking;

DROP TABLE IF EXISTS `banking-clients`;
CREATE TABLE `banking-clients` (
  `Client ID` VARCHAR(20),
  `Name` VARCHAR(100),
  `Age` INT,
  `Location ID` INT,
  `Joined Bank` VARCHAR(20),
  `Banking Contact` VARCHAR(100),
  `Nationality` VARCHAR(50),
  `Occupation` VARCHAR(100),
  `Fee Structure` VARCHAR(20),
  `Loyalty Classification` VARCHAR(20),
  `Estimated Income` DOUBLE,
  `Superannuation Savings` DOUBLE,
  `Amount of Credit Cards` INT,
  `Credit Card Balance` DOUBLE,
  `Bank Loans` DOUBLE,
  `Bank Deposits` DOUBLE,
  `Checking Accounts` DOUBLE,
  `Saving Accounts` DOUBLE,
  `Foreign Currency Account` DOUBLE,
  `Business Lending` DOUBLE,
  `Properties Owned` INT,
  `Risk Weighting` INT,
  `BRId` INT,
  `GenderId` INT,
  `IAId` INT
);

LOAD DATA LOCAL INFILE 'c:/IMP DOCUMENTS/nothing/Banking-analysis-main/Banking-analysis-main/banking-clients.csv'
INTO TABLE `banking-clients`
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS rows_loaded FROM `banking-clients`;
