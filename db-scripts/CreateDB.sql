drop database if exists productApi;
create database productApi;
use productApi;

CREATE TABLE supplier (
  id INT PRIMARY KEY AUTO_INCREMENT,
  suppliername VARCHAR(255),
  email VARCHAR(255),
  address VARCHAR(255),
  createdat DATETIME,
  updatedat DATETIME,
  deletedat DATETIME
);

CREATE TABLE product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  idsupplier INT,
  FOREIGN KEY (idsupplier) REFERENCES supplier(id),
  productname VARCHAR(255),
  productvalue DECIMAL(10,2),
  productstatus INT,
  quantity INT,
  createdat DATETIME,
  updatedat DATETIME,
  deletedat DATETIME
);

CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255),
  useremail VARCHAR(255),
  userpassword VARCHAR(255)
);

CREATE TABLE audit (
  id INT PRIMARY KEY AUTO_INCREMENT,
  iduser INT,
  FOREIGN KEY (iduser) REFERENCES user(id),
  identity INT,
  entitytype INT,
  operation INT,
  changes JSON,
  auditdate DATETIME
);

CREATE TABLE category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  categoryname VARCHAR(255)
);

CREATE TABLE product_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  idproduto INT,
  FOREIGN KEY (idproduto) REFERENCES product(id),
  idcategory INT,
  FOREIGN KEY (idcategory) REFERENCES category(id)
);

CREATE TABLE sale (
  id INT PRIMARY KEY AUTO_INCREMENT
);



CREATE TABLE sale_product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  idproduto INT,
  FOREIGN KEY (idproduto) REFERENCES product(id),
  idsale INT,
  FOREIGN KEY (idsale) REFERENCES sale(id)
);

select * from product;