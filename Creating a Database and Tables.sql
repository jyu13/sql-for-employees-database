create database if not exists Sales;
#create schema if not exists Sales;

use Sales;

CREATE TABLE sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);

CREATE TABLE customers (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255),
    number_of_complaints INT,
    UNIQUE KEY (email_address)
);

alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;

alter table sales
drop foreign key sales_ibfk_1;

alter table customers
change column number_of_complaints number_of_complaints int default 0;

alter table customers
alter column number_of_complaints drop default;

alter table customers
drop index email_address;

alter table customers
add column gender enum('M','F') after last_name;

insert into customers(first_name,last_name,gender,email_address,number_of_complaints)
values('John', 'Mackinley','M', 'john.mckinley@gmail.com',0);

insert into customers (first_name, last_name, gender)
values('peter','Figaro', 'M');

CREATE TABLE IF NOT EXISTS items (
    item_id 	VARCHAR(255) NOT NULL,
    item 		VARCHAR(255) NOT NULL,
    unit_price	NUMERIC(10 , 2 ) NOT NULL,
    company_id  VARCHAR(255) NOT NULL,
    PRIMARY KEY	 (item_id)
);
    
CREATE TABLE companies (
    company_id VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
);

alter table companies
add unique key (headquarters_phone_number),
change column company_name company_name varchar(255) not null default 'X';

alter table companies
modify column company_name varchar(255) null;

alter table companies
change column company_name company_name varchar(255) not null;

insert into companies ( headquarters_phone_number, company_name)
values('1+(202) 555-0196', 'Company A' );

#drop table sales;
#drop table customers;
#drop table items;
#drop table companies;
