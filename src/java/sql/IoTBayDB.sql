/*
NOTES:
    Line 26: 
        - Cant make an int size of 1 decided to use SMALLINT 
            which is a size of 2     
    Line 46: 
        - Made the price a bit bigger compared to the datadictionary
        - used decimal instead of double, couldnt get double to work
    Line 84 & 88:
        - diff values compared to the data dictionary
*/

CREATE TABLE Customer (
    CustomerID BIGINT,
    Name Varchar(50), -- this value seems too small might need to change it
    Password varchar(20),
    PhoneNumber varchar(20),
    Email varchar(100),
    Activated Boolean,
    DateOfBirth Date,
    PRIMARY KEY(CustomerID)
);

CREATE TABLE Staff(
    StaffID BIGINT,
    Name Varchar(50), -- changed varchar from 10 to 50
    Password Varchar(20),
    Email Varchar(20),
    PhoneNumber Varchar(10),
    -- Cant make an int size of 1 decided to use SMALLINT 
    --  which is a size of 2 
    AccountType SMALLINT, 
    PRIMARY KEY(StaffID)
);

CREATE TABLE Category (
    CategoryID BIGINT,
    Name Varchar(100),
    PRIMARY KEY(CategoryID)
);

CREATE TABLE Product (
    ProductID BIGINT,
    Name Varchar(100),
    Stock INT,
    Description Varchar(256),
    CategoryID BIGINT,
    Brand Varchar(100),
    -- made the price a bit bigger compared to the datadictionary
    -- used decimal instead of double couldnt get double to work
    Price DECIMAL(10, 2),
    PRIMARY KEY(ProductID),
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE "ORDER" (
    OrderID BIGINT,
    CustomerID BIGINT,
    OrderedDate DATE,
    Status Varchar(20),
    ShippedDate DATE,
    TotalPrice DECIMAL(10, 2), --changed to (10,2); not really sure what numbers are but this allows much bigger prices
    FullfilledBy BIGINT,
    AddressID BIGINT,
    Address Varchar(300),
    PaymentID BIGINT,
    Paid Boolean,
    DatePaid Date,
    PRIMARY KEY(OrderID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(FullfilledBy) REFERENCES Staff(StaffID),
    FOREIGN KEY(PaymentID) REFERENCES PaymentMethod(PaymentMethodID)
);

CREATE TABLE OrderLineItem (
    OrderLineID BIGINT,
    OrderID BIGINT,
    ProductID BIGINT,
    Quantity INT,
    PRIMARY KEY(OrderLineID),
    FOREIGN KEY(OrderID) REFERENCES "ORDER"(OrderID)
);

CREATE TABLE PaymentMethod (
    PaymentMethodID BIGINT,
    CustomerID BIGINT,
    -- diff from the data dictionary
    CardNumber FLOAT(16),
    CardExpiryYear SMALLINT,
    CardExpiryMonth SMALLINT,
    -- diff from the data dictionary
    CVC FLOAT(3),
    PRIMARY KEY(PaymentMethodID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CartLineItem (
    CartLineItemID BIGINT,
    CustomerID BIGINT,
    ProductID BIGINT,
    Quantity INT,
    PRIMARY KEY(CartLineItemID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Address (
    AddressID BIGINT,
    CustomerID BIGINT,
    AddressLine1 Varchar(150),
    AddressLine2 Varchar(150),
    City Varchar(40),
    State Varchar(30),
    PostalCode Varchar(6),
    Country Varchar(50),
    PRIMARY KEY(AddressID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE AccessLog (
    AccessLogID BIGINT,
    CustomerID BIGINT,
    LoginTime TIMESTAMP,
    LogoutTime TIMESTAMP,
    PRIMARY KEY(AccessLogID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);