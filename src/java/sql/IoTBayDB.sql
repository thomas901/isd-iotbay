/*
    NOTE:
        Missing payment types, not sure what to use 


*/

CREATE TABLE Customer (
    CustomerID Int,
    Name Varchar(10),
    Password varchar(20),
    PhoneNumber varchar(10),
    Email varchar(20),
    Activated Boolean,
    DateOfBirth Date,
    PRIMARY KEY(CustomerID)
);

CREATE TABLE Staff(
    StaffID Int,
    Name Varchar(10),
    Password Varchar(20),
    Email Varchar(20),
    PhoneNumber Varchar(10),
    AccountType Int,
    PRIMARY KEY(StaffID)
);

CREATE TABLE Category (
    CategoryID int,
    Name Varchar(100),
    PRIMARY KEY(CategoryID)
);

CREATE TABLE Product (
    ProductID INT,
    Name Varchar(16),
    Stock Int,
    Description Varchar(256),
    CategoryID Int,
    Brand Varchar(100),
    -- Price Double,
    PRIMARY KEY(ProductID),
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE "ORDER" (
    OrderID INT,
    CustomerID INT,
    OrderedDate DATE,
    Status Varchar(20),
    ShippedDate DATE,
    --TotalPrice Double,
    FullfilledBy INT,
    AddressID INT,
    Address Varchar(300),
    PRIMARY KEY(OrderID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(FullfilledBy) REFERENCES Staff(StaffID)
);

CREATE TABLE OrderLineItem (
    OrderLineID Int,
    OrderID Int,
    ProductID Int,
    Quantity Int(4),
    PRIMARY KEY(OrderLineID),
    FOREIGN KEY(OrderID) REFERENCES "ORDER"(OrderID)
);

CREATE TABLE PaymentMethod (
    PaymentMethodID Int,
    CustomerID Int,
    CardNumber Int,
    CardExpiryYear Int,
    CardExpiryMonth Int,
    CVC INT,
    PRIMARY KEY(PaymentMethodID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CartLineItem (
    CartLineItemID Int,
    CustomerID int,
    ProductID int,
    Quantity int,
    PRIMARY KEY(CartLineItemID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Invoice (
    InvoiceID Int,
    CustomerID Int,
    OrderID Int,
    PaymentID int,
    -- Amount
    DateSent Date,
    Paid Boolean,
    DatePaid Date,
    PRIMARY KEY(InvoiceID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(OrderID) REFERENCES "ORDER"(OrderID), 
    FOREIGN KEY(PaymentID) REFERENCES PaymentMethod(PaymentMethodID)
);

CREATE TABLE Address (
    AddressID int,
    CustomerID int,
    AddressLine1 Varchar(150),
    AddressLine2 Varchar(150),
    City Varchar(40),
    State Varchar(30),
    PostalCode Varchar(6),
    Country Varchar(50),
    PRIMARY KEY(AddressID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);