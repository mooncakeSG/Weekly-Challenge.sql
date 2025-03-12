-- Create a new database called salesDB
CREATE DATABASE salesDB;

-- Drop (delete) the database called demo
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'demo')
BEGIN
	DROP DATABASE demo;
END