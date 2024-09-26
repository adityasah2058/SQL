create database practises1;

use practises1;

show tables;

CREATE TABLE dataofcustomer
   (
       custid VARCHAR(6)  PRIMARY KEY,
       fname VARCHAR(50),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       age int(10),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE
         
   );  -- table created with custid as primary key
   
   
INSERT INTO dataofcustomer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi',45,'9543198345','Service','1976-12-06');
INSERT INTO dataofcustomer VALUES('C00002','Avinash','Sunder','Minha','Delhi',32,'9876532109','Service','1974-10-16');
INSERT INTO dataofcustomer VALUES('C00003','Rahul',null,'Rastogi','Delhi',24,'9765178901','Student','1981-09-26');
INSERT INTO dataofcustomer VALUES('C00004','Parul',null,'Gandhi','Delhi',46,'9876532109','Housewife','1976-11-03');
INSERT INTO dataofcustomer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai',23,'8976523190','Service','1976-09-19');
INSERT INTO dataofcustomer VALUES('C00006','Chitresh',null,'Barwe','Mumbai',18,'7651298321','Student','1992-11-06');
INSERT INTO dataofcustomer VALUES('C00007','Amit','Kumar','Borkar','Mumbai',76,'9875189761','Student','1981-09-06');
INSERT INTO dataofcustomer VALUES('C00008','Nisha',null,'Damle','Mumbai',43,'7954198761','Service','1975-12-03');
INSERT INTO dataofcustomer VALUES('C00009','Abhishek',null,'Dutta','Kolkata',67,'9856198761','Service','1973-05-22');
INSERT INTO dataofcustomer  VALUES('C00010','Shankar',null,'Nair','Chennai',90,'8765489076','Service','1976-07-12');

select * from dataofcustomer;

select fname as name, min(age) from dataofcustomer; -- THIS RETURNS MINIMUM AGE ALONG WITH NAME.

select fname from dataofcustomer where age = 18; -- THIS WILL FETCH FNAME FROM TABLE WHERE AGE IS EQUAL TO 18.
select fname as name ,max(age)  from dataofcustomer; -- THIS RETURN MAX AGE ALONG WITH NAME.
select fname from dataofcustomer where age = 90; -- THIS WILL RETURN FNAME FROM TABLE WHERE AGE IS EQUAL TO 90.

select  count(*) from dataofcustomer; -- THIS SHOW TOTAL NUMBER OF ENTRY(COLOUMS) IN TABLE


select count(city) as customer_from_Delhi from dataofcustomer where city ="Delhi"; -- THIS SHOWS TOTAL NUMBER OF CUSTOMER FROM TABLE WHERE CITY IS 'DELHI'

select avg(age) as average_age from dataofcustomer; -- AVERAGE AGE FROM TABLE  AND 'as average_age will be the coloumn name'

select sum(age) as sum_of_age from dataofcustomer; -- SUM OF AGE OF ALL PEOPLE FROM TABLE

select count(fname),city from dataofcustomer group by city; -- THIS WILL COUNT TOTAL NUMBER OF CUSTOMER FROM DIFFERENT CITY

select count(fname),city from dataofcustomer group by city having count(fname)>2; -- TO RETURN COUNT OF CUSTOMER  FOR CITY WHO HAVE COUNT OF MORE THAN 2 MEANS MORE THAN 2 CUSTOMER ARE FROM DELHI AND MUMBAI. 

select count(fname),city from dataofcustomer group by city having count(fname)=1; -- RETURN COUNT OF CUSTOMER FOR CITY WHO HAVE COUNT OF ONE 

select * from dataofcustomer where custid in (select custid from dataofcustomer where age>=45); -- RETURNS ALL DETAILS FROM TABLE WHERE AGE IS GREATER THAN 45

SELECT fname, city, age
FROM dataofcustomer
ORDER BY
(CASE
    WHEN City IS NULL THEN "no city"
    ELSE City
END); -- RETURNS NAME, CITY AND AGE FROM 'DATAOFCUSTOMER' TABLE, CASE IS IF CITY IS NULL THEN GIVE OUTPUT NO CITY ELSE CITY NAME

select custid from dataofcustomer where custid = any (select custid from dataofcustomer where city = 'Delhi'); 

select custid from dataofcustomer where custid = all (select custid from dataofcustomer where city = 'Delhi'); 

select custid from dataofcustomer where city = 'Delhi'; -- SELECT CUSTID  WHERE CITY= 'DELHI'.

SELECT custid, fname,age,
CASE
    WHEN age > 30 THEN 'The age is greater than 30'
    WHEN age = 30 THEN 'The age is 30'
    ELSE 'The age is not group of 30'
END AS Age
FROM dataofcustomer; -- THIS REPLACE AGE INTEGER TO STRING AND SELECT FNAME, CUSTID AND AGE


CREATE TABLE account
   (
      acnumber VARCHAR(6),
      custid  VARCHAR(6),
      bid VARCHAR(6),
      opening_balance INT(7),
      aod DATE,
      atype VARCHAR(10),
      astatus VARCHAR(10),
      CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
      CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES dataofcustomer(custid)
      );
    
INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');

select * from account; 

select count(*), astatus from account group by astatus; -- RETURNS COUNT OF STATUS FOR ACCOUNT I.E ACTIVE, SUSPENDED OR TERMINATED.

select count(*), astatus from account group by astatus  having count(atype)=7; -- RETURNS ASTATUS OF ACCOUNT HAVING COUNT OF 7. 

select count(*) from account; -- TOTAL ENTRY IN TABLE 



create table customerss(
cust_id varchar(20), first_name varchar(20), last_name varchar(20), address_id int
);

insert into customerss value('1', 'Mary','Smith','5');
insert into customerss value('3', 'Linda','Williams','7');
insert into customerss value('4', 'Barbara','Jones','8');
insert into customerss value('2', 'Madan','Mohan','6');
select * from customerss;

create table payment(
cust_id varchar(20), amount int , mode varchar(20), payment_date date);

insert into payment values('1', '60','cash','2020-09-24');
insert into payment values('2', '30','credit Card','2020-04-27');
insert into payment values('8', '110','cash','2021-01-26');
insert into payment values('10', '70','mobile payment','2021-02-28');
insert into payment values('11', '80','cash','2021-03-01');
select * from payment;

-- INNER JOIN
-- TO FETCH AMOUNT PAID BY MOHAN ALONG WITH MODE AND PAYMENT DATE
select * from customerss as c inner join payment as p on c.cust_id= p.cust_id -- THIS GIVES ALL THE ROWS, AS IS USED TO GIVE A NAME FOR A TABLE.

select c.first_name ,p.amount,p.mode from customerss as c inner join payment as p on c.cust_id= p.cust_id  -- THIS GIVES ONLY NAME , AMOUNT AND MODE.

-- LEFT JOIN
select * from customerss as c left join payment as p on c.cust_id= p.cust_id


-- RIGHT JOIN
select * from customerss as c right join payment as p on c.cust_id= p.cust_id
select * from customerss as c outer join payment as p on c.cust_id= p.cust_id




		

	