CREATE DATABASE product;
CREATE Table product.SalesPeople (
        Snum INT NOT NULL,
		Sname VARCHAR(40) UNIQUE NOT NULL,
        City VARCHAR(40) NOT NULL,
        Comm INT NOT NULL,
        PRIMARY KEY (Snum)
        );
INSERT INTO SalesPeople (Snum, Sname, City, Comm)
		VALUES (1001, 'Peel', 'London', 12),
			   (1002, 'Serres', 'Sanjose', 13),
               (1004, 'Motika', 'London', 11),
			   (1007, 'Rifkin', 'Barcelona', 15),
               (1003, 'Axelrod', 'Newyork', 10);
CREATE Table product.Customers (
        Cnum INT NOT NULL,
		Cname VARCHAR(40) UNIQUE NOT NULL,
        City VARCHAR(40) NOT NULL,
        Snum INT NOT NULL,
        PRIMARY KEY (Cnum),
        FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
        );
INSERT INTO Customers (Cnum, Cname, City, Snum)
		VALUES (2001, 'Hoffman', 'London', 1001),
               (2002, 'Giovanni', 'Rome', 1003),
			   (2003, 'Liu', 'Sanjose', 1002),
               (2004, 'Grass', 'Berlin', 1002),
			   (2006, 'Clemens', 'London', 1001),
               (2008, 'Cisneros', 'Sanjose', 1007),
               (2007, 'Pereira', 'Rome', 1004);
CREATE Table product.Orders (
        Onum INT NOT NULL,
		Amt FLOAT(15) NOT NULL,
        Odate VARCHAR(40) NOT NULL,
        Cnum INT NOT NULL,
        Snum INT NOT NULL,
        PRIMARY KEY (Onum),
        FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
        FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
        );
INSERT INTO Orders (Onum, Amt, Odate, Cnum, Snum)
		VALUES (3001, 18.69, '3-10-1990', 2008, 1007),
               (3003, 767.19, '3-10-1990', 2001, 1001),
			   (3002, 1900.10, '3-10-1990', 2007, 1004),
               (3005, 5160.45, '3-10-1990', 2003, 1002),
			   (3006, 1098.16, '3-10-1990', 2008, 1007),
               (3009, 1713.23, '4-10-1990', 2002, 1003),
               (3007, 75.75, '4-10-1990', 2004, 1002),
               (3008, 4273.00, '5-10-1990', 2006, 1001),
               (3010, 1309.95, '6-10-1990', 2004, 1002),
               (3011, 9891.88, '6-10-1990', 2006, 1001);
/*
On the basis of above tables perform given below questions
1. Count the number of Salesperson whose name begin with ‘a’/’A’.
*/
select count(*) from SalesPeople
where Sname LIKE 'a%';
/*
2. Display all the Salesperson whose all orders worth is more than Rs. 2000.
*/
select * from SalesPeople
LEFT JOIN orders
ON SalesPeople.Snum = orders.Snum
where Amt > 2000;
/*
3. Count the number of Salesperson belonging to Newyork.
*/
select count(*) from SalesPeople
where City = 'Newyork';
/*
4. Display the number of Salespeople belonging to London and belonging to Paris.
*/
select * from SalesPeople
where City = 'London' OR 'Paris';
/*
5. Display the number of orders taken by each Salesperson and their date of orders.
*/
select Sname, count(odate) AS number_of_orders_taken, Odate from Orders
RIGHT JOIN salespeople
ON orders.Snum = SalesPeople.Snum
group by Sname;


