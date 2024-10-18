CREATE DATABASE InsuranceManageDB;
USE InsuranceManageDB;
GO

-- Create Users table
CREATE TABLE Users (
    userId INT PRIMARY KEY identity(101,1),
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    role NVARCHAR(50) NOT NULL
);

INSERT INTO Users (username, password, role) VALUES
('megha', 'meghaSecure01', 'admin'),
('rahul', 'rahulAgent99', 'agent'),
('kavita', 'kavita@2024', 'customer'),
('arjun', 'arjun$789', 'customer');

-- Create Clients table
CREATE TABLE Clients (
    clientId INT PRIMARY KEY identity(201,1),
    clientName NVARCHAR(100) NOT NULL,
    contactInfo NVARCHAR(100) NOT NULL,
    policy NVARCHAR(100) NOT NULL
);


INSERT INTO Clients (clientName, contactInfo, policy) VALUES
('Amit Sharma', 'amit.sharma@email.com', 'Life Insurance'),
('Priya Kapoor', 'priya.kapoor@email.com', 'Auto Insurance'),
('Ravi Iyer', '+91 9876543210', 'Health Insurance'),
('Sunita Patel', 'sunita.patel@email.com', 'Home Insurance');

-- Create Claims table
CREATE TABLE Claims (
    claimId INT PRIMARY KEY identity(301,1),
    claimNumber NVARCHAR(100) NOT NULL,
    dateFiled DATE NOT NULL,
    claimAmount DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50) NOT NULL,
    clientId INT,
    policy NVARCHAR(100),
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);

INSERT INTO Claims (claimNumber, dateFiled, claimAmount, status, policy, clientId) VALUES
('CLM2024005', '2024-10-15', 1800.00, 'Approved', 'Health Insurance', 201),
('CLM2024006', '2024-10-18', 3200.00, 'Pending', 'Vehicle Insurance', 202),
('CLM2024007', '2024-10-20', 500.00, 'Rejected', 'Home Insurance', 203),
('CLM2024008', '2024-10-25', 3900.00, 'Approved', 'Life Insurance', 204);

-- Create Payments table
CREATE TABLE Payments (
    paymentId INT PRIMARY KEY identity(401,1),
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(10, 2) NOT NULL,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);


INSERT INTO Payments (paymentDate, paymentAmount, clientId) VALUES
('2024-10-05', 1800.00, 201),  -- Payment for Amit Sharma
('2024-10-06', 2700.00, 202),  -- Payment for Priya Kapoor
('2024-10-07', 400.00, 203),   -- Payment for Ravi Iyer
('2024-10-08', 4500.00, 204);  -- Payment for Sunita Patel


-- Create Policies table
CREATE TABLE Policies (
    policyId INT PRIMARY KEY IDENTITY(1,1),
    policyName NVARCHAR(100) NOT NULL,
    policyDescription NVARCHAR(255) NOT NULL
);

-- Insert into Policies
INSERT INTO Policies (policyName, policyDescription)
VALUES ('Health Insurance', 'Offers coverage for medical costs, hospitalizations, and surgeries'),
       ('Life Insurance', 'Ensures financial protection for your family in case of death'),
       ('Vehicle Insurance', 'Provides coverage for vehicle damages and third-party liabilities'),
       ('Home Insurance', 'Protects your home from damages due to accidents or disasters');

SELECT * FROM Clients;
SELECT * FROM Users;
SELECT * FROM Claims;
SELECT * FROM Payments;
SELECT * FROM Policies;


--DROP DATABASE InsuranceManage;
--ALTER DATABASE [InsuranceManage] SET OFFLINE WITH ROLLBACK IMMEDIATE;
