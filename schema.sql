DROP TABLE INVENTORY CASCADE CONSTRAINTS;
CREATE TABLE INVENTORY(
  ProductID INTEGER primary key CHECK(ProductID > 0),
  ProductDesc VARCHAR(30),
  ProductPrice NUMERIC(8,2) CHECK (ProductPrice > 0),
  ProductStockAmount INTEGER CHECK (ProductStockAmount >= 0)
);

DROP TABLE ORDERS CASCADE CONSTRAINTS;
CREATE TABLE ORDERS(
  OrderID INTEGER primary key check(OrderID > 0),
  OrderType VARCHAR(30) CHECK (OrderType IN('InStore', 'Collection', 'Delivery')),
  OrderCompleted INTEGER CHECK (OrderCompleted = 0 OR OrderCompleted = 1),
  OrderPlaced DATE
);

DROP TABLE ORDER_PRODUCT CASCADE CONSTRAINTS;
CREATE TABLE ORDER_PRODUCT(
  OrderID INTEGER primary key check(OrderID > 0),
  ProductID integer check(ProductID >0),
  ProductQuantity INTEGER CHECK (ProductQuantity >0),
  foreign key (OrderID) references ORDERS(OrderID),
  foreign key (ProductID) references INVENTORY(ProductID)
);

DROP TABLE DELIVERIES CASCADE CONSTRAINTS;
CREATE TABLE DELIVERIES(
  OrderID INTEGER primary key check(OrderID > 0),
  FName VARCHAR(30) NOT NULL,
  LName VARCHAR(30) NOT NULL,
  DeliveryDate DATE NOT NULL,
  House VARCHAR(30) NOT NULL,
  Street VARCHAR(30) NOT NULL,
  City VARCHAR(30) NOT NULL,
  foreign key (OrderID) references ORDERS(OrderID)
);

DROP TABLE COLLECTIONS CASCADE CONSTRAINTS;
CREATE TABLE COLLECTIONS(
  OrderID INTEGER primary key check(OrderID > 0),
  FName VARCHAR(30) NOT NULL,
  LName VARCHAR(30) NOT NULL,
  CollectionDate DATE NOT NULL,
  foreign key (OrderID) references ORDERS(OrderID)
);

DROP TABLE STAFF CASCADE CONSTRAINTS;
CREATE TABLE STAFF(
  StaffID INTEGER CHECK(StaffID > 0),
  FName VARCHAR(30) NOT NULL,
  LName VARCHAR(30) NOT NULL,
  primary key (StaffID)
);

DROP TABLE STAFF_ORDERS CASCADE CONSTRAINTS;
CREATE TABLE STAFF_ORDERS(
  StaffID INTEGER CHECK(StaffID > 0),
  OrderID integer check(OrderID > 0),
  foreign key (OrderID) references ORDERS(OrderID),
  foreign key (StaffID) references STAFF(StaffID)
);
