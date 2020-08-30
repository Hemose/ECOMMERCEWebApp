CREATE Database Ecommerce_Website;

CREATE TABLE Users(
username VARCHAR(20)PRIMARY KEY  ,
password VARCHAR(20) NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL
);

--EXEC sp_RENAME 'Users.LastName', 'last_name', 'COLUMN'
select *
from users
CREATE TABLE User_Mobile_Numbers(
mobile_number VARCHAR(20),
username VARCHAR(20) ,
PRIMARY KEY (username ,mobile_number),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE User_Addresses
(
address  VARCHAR(100),
username VARCHAR(20) ,
PRIMARY KEY (username ,address),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE Table Customer 
(
username VARCHAR(20) ,
points int ,
PRIMARY KEY (username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE Table admins
(
username VARCHAR(20) ,
PRIMARY KEY (username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE Table vendor 
(
username VARCHAR(20) UNIQUE,
activated BIT , 
company_name VARCHAR(20),
bank_acc_no VARCHAR(20),
admin_username VARCHAR(20) ,
PRIMARY KEY (username),
FOREIGN KEY(username) REFERENCES Users  ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(admin_username) REFERENCES admins --ON DELETE CASCADE ON UPDATE CASCADE
);

--WHY THRERE IS A PROBLEM HERE IN MAKEING BOTH UNDER CASCADE
CREATE Table Delivery_Person(
username VARCHAR(20) ,
is_activated BIT,
PRIMARY KEY (username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table Credit_Card(
number VARCHAR(20) primary KEY,
 Expiry_date date ,
  cvv_code  VARCHAR(4)
)
CREATE Table Delivery(
username VARCHAR(20) ,
id int identity ,
type VARCHAR(20) ,
time_duration int,
fees decimal(5,3),
PRIMARY KEY (id),
FOREIGN KEY(username) REFERENCES admins ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE TABLE Orders(
order_no INT IDENTITY ,
order_date DATE,
total_amount DECIMAL(10,2) ,
cash_amount DECIMAL (10,2) ,
credit_amount DECIMAL(10,2) ,
payment_type  VARCHAR(20) ,
order_status VARCHAR(20),
remaining_days INT,--IS IT CALCULATED ??
time_limit INT,-- is it int or date 
customer_name VARCHAR(20),
gift_card_code_used VARCHAR(10),
delivery_id Int,
creditCard_number VARCHAR(20),
PRIMARY KEY (order_no),
FOREIGN KEY(customer_name)  References Customer,-- ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY(delivery_id) References Delivery ,--ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(creditCard_number) References Credit_Card,-- ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(gift_card_code_used)  References Gift_card ON DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Product(
serial_no INT IDENTITY PRIMARY KEY ,
product_name VARCHAR(20),
category VARCHAR(20),
product_description TEXT,
price DECIMAL(10,2) ,
final_price DECIMAL(10,2) ,
color VARCHAR(20) ,
available BIT ,
rate INT ,
vendor_username VARCHAR(20),
customer_username VARCHAR(20),
customer_order_id INT,
FOREIGN KEY(vendor_username)  References Vendor ,--ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(customer_username)   References Customer ,--ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(customer_order_id)  References Orders ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE CustomerAddstoCartProduct(
serial_no INT,
customer_name VARCHAR(20) ,
PRIMARY KEY(serial_no,customer_name),
FOREIGN KEY(serial_no)  References Product ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY(customer_name) References Customer-- ON DELETE CASCADE ON UPDATE CASCADE ,
);

CREATE TABLE Todays_Deals(
deal_id INT  IDENTITY PRIMARY KEY,
deal_amount Int ,
expiry_date DATE,
admin_username VARCHAR(20),
FOREIGN KEY(admin_username)  References Admins ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE Todays_Deals_Product(
deal_id INT, 
serial_no INT,
PRIMARY KEY(deal_id,serial_no),
FOREIGN KEY(deal_id) References Todays_Deals ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(serial_no)References Product --ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE offer(
offer_id INT IDENTITY PRIMARY KEY,
offer_amount INT ,
expiry_date DATE,
);

CREATE TABLE offersOnProduct(
offer_id INT ,
serial_no  INT ,
PRIMARY KEY(offer_id,serial_no),
FOREIGN KEY(offer_id) References offer ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY(serial_no) References Product ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE Customer_Question_Product(
serial_no INT,
customer_name VARCHAR(20) ,
question VARCHAR(50),
answer TEXT,
);
CREATE TABLE Wishlist(
username VARCHAR(20),
name VARCHAR(20),
PRIMARY KEY(username,name) ,
FOREIGN KEY(username)References Customer ON DELETE CASCADE ON UPDATE CASCADE ,
);

CREATE TABLE Gift_card(
code VARCHAR(10) PRIMARY KEY,
expiry_date DATE ,
amount INT,
username VARCHAR (20),
FOREIGN KEY(username) References Admins ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Wishlist_Product(
username VARCHAR(20),
wish_name VARCHAR(20),
serial_no INT ,
PRIMARY KEY(username,wish_name,serial_no) ,
FOREIGN KEY(username,wish_name) References Wishlist ON DELETE CASCADE ON UPDATE CASCADE ,
--FOREIGN KEY(wish_name) References Wishlist ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY(serial_no) References product-- ON DELETE CASCADE ON UPDATE CASCADE ,
);

CREATE TABLE Admin_Customer_Giftcard(
code VARCHAR(10),
customer_name VARCHAR(20),
admin_username VARCHAR(20),
remaining_points Int,
PRIMARY KEY (code,customer_name,admin_username),
FOREIGN KEY(code) References Gift_Card ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY(customer_name)  References Customer,-- ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY(admin_username) References Admins -- ON DELETE CASCADE ON UPDATE CASCADE ,
);

Create TABLE Admin_Delivery_Order(
delivery_username VARCHAR(20),
order_no int identity ,
admin_username varchar(20),
delivery_window varchar(50),
PRIMARY KEY (delivery_username,order_no),
FOREIGN KEY(delivery_username) REFERENCES Delivery_Person ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(order_no) REFERENCES orders ,--ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(admin_username) REFERENCES admins --ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Customer_CreditCard(
customer_name varchar(20),
cc_number varchar(20),
PRIMARY KEY (customer_name,cc_number),
FOREIGN KEY(customer_name) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(cc_number) REFERENCES credit_card ON DELETE CASCADE ON UPDATE CASCADE,
);


-------PROC STATRT


go
create proc customerRegister
@username varchar (20),
@ﬁrst_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)
As
INSERT INTO users (username,password,first_name,last_name,email)
Values (@username ,@password,@first_name,@last_name,@email)
INSERT INTO Customer (username,points)
values (@username,0)

--------------    --------
go
create proc vendorRegister 
@username varchar (20),
@ﬁrst_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50),
@company_name varchar(20), 
@bank_acc_no varchar(20) 
As
INSERT INTO users (username,password,first_name,last_name,email)
Values (@username ,@password,@first_name,@last_name,@email)
INSERT INTO vendor (username,activated,company_name,bank_acc_no)
Values (@username ,0, @company_name, @bank_acc_no)



go

---------------------------    --------------------

create proc userLogin
@username varchar (20), 
@password varchar(20) ,
@success bit OUTPUT,
@type int output
AS
IF(EXISTS (Select * from users where @username=users.username AND PASSWORD =@password))
SET @success =1
ELSE
SET @success=0
IF(@success=1 AND EXISTS (Select * from customer where @username=customer.username))
SET @type=0
ELSE IF(@success=1 AND EXISTS (Select * from Vendor where @username=Vendor.username))
SET @type=1
ELSE IF(@success=1 AND EXISTS (Select * from Admins where @username=admins.username))
SET @type=2
ELSE IF(@success=1 AND EXISTS (Select * from Delivery_Person where @username=Delivery_Person.username))
SET @type=3




go 
create proc addMobile 
@username varchar (20),
@mobile_number varchar(20) 
As
INSERT INTO USER_MOBILE_Numbers (username,mobile_number)
values (@username,@mobile_number)


go
create proc addAddress 
@username varchar(20),
@address varchar(100) 
As
INSERT INTO USER_Addresses (username,address)
values (@username,@address)


GO
CREATE PROC showProducts
AS
SELECT product_name,product_description,price,final_price,color
FROM PRODUCT


GO
CREATE PROC ShowProductsbyPrice
AS
SELECT  *
FROM PRODUCT
ORDER BY price

GO
CREATE PROC Searchbyname 
@pname VARCHAR(20)
AS
SELECT  product_name,product_description,price,final_price,color
FROM PRODUCT
WHERE product_name like '%'+@pname+'%'



GO 
CREATE PROC AddQuestion
@serial int, 
@customer varchar(20), 
@Question varchar(50)
AS
INSERT INTO Customer_Question_Product(serial_no, customer_name ,question)
VALUES(@serial,@customer,@Question)


GO
CREATE PROC addToCart
@customername varchar(20),
@serial int
AS
INSERT INTO CustomerAddstoCartProduct(serial_no,customer_name)
VALUES(@serial,@customername)


GO
CREATE PROC removefromCart
@customername varchar(20),
@serial int
AS
DELETE
FROM CustomerAddstoCartProduct
WHERE serial_no=@serial AND customer_name=@customername



GO 
CREATE PROC createWishlist
@customername varchar(20),
@name varchar(20)
AS
INSERT INTO Wishlist(username,name)
VALUES(@customername,@name)


GO
CREATE PROC AddtoWishlist
@customername varchar(20), 
@wishlistname varchar(20), 
@serial int
AS
INSERT INTO Wishlist_Product(username,wish_name,serial_no)
VALUES(@customername,@wishlistname,@serial)



GO
CREATE PROC removefromWishlist
@customername varchar(20),
@wishlistname varchar(20),
@serial int
AS
DELETE 
FROM Wishlist_Product
WHERE username=@customername AND wish_name=@wishlistname AND serial_no=@serial



GO
CREATE PROC showWishlistProduct
@customername varchar(20), 
@name varchar(20)
AS
SELECT  P.product_name,P.product_description, P.price,P.final_price, P.color
FROM Wishlist_Product W,Product P 
WHERE W.username=@customername AND wish_name=@name AND W.serial_no = P.serial_no


GO
CREATE PROC viewMyCart
@customer varchar(20)
AS
SELECT P.serial_no,P.product_name,P.product_description, P.price,P.final_price, P.color
FROM CustomerAddstoCartProduct C,Product P 
WHERE customer_name=@customer AND C.serial_no= P.serial_no


GO
CREATE PROC calculatepriceOrder
@customername varchar(20),
@sum decimal(10,2) OUTPUT
AS
SELECT @sum= SUM(P.final_price)
FROM CustomerAddstoCartProduct C,Product P 
WHERE customer_name=@customername AND C.serial_no= P.serial_no


GO

CREATE PROC productsinorder
@customername varchar(20),
@orderID int
AS 
UPDATE PRODUCT
SET customer_order_id =@orderID ,customer_username =@customername, available=0
WHERE serial_no IN(SELECT serial_no 
					FROM CustomerAddstoCartProduct
					WHERE customer_name =@customername)
DELETE
FROM CustomerAddstoCartProduct
WHERE customer_name <> @customername AND serial_no IN(SELECT serial_no 
										 FROM CustomerAddstoCartProduct
										 WHERE customer_name =@customername)
EXEC viewMyCart @customername


GO
CREATE PROC emptyCart
@customername varchar(20)
AS
DELETE
FROM CustomerAddstoCartProduct
WHERE customer_name = @customername

-----------------------------------------------------------------------
GO
CREATE PROC makeOrder
@customername varchar(20)
AS
DECLARE @cost DECIMAL(10,2)
EXEC calculatepriceOrder @customername , @cost OUTPUT
INSERT INTO Orders(order_date,total_amount,customer_name,order_status)
VALUES(CURRENT_TIMESTAMP,@cost,@customername,'not processed')
DECLARE @orderid INT
SELECT @orderid=MAX(order_no)
FROM Orders
EXEC productsinorder @customername , @orderid
EXEC emptyCart @customername

--------------------------------------------------------------------------


GO --MAYCHANGED
CREATE PROC  cancelOrder
@orderid int
AS
IF(EXISTS(SELECT * FROM ORDERS WHERE (order_no=@orderid AND order_status IN('not processed', 'in process'))))
UPDATE PRODUCT
SET customer_order_id =NULL ,customer_username =NULL, available=1
WHERE customer_order_id =@orderid
DECLARE @N VARCHAR(20)
SELECT @N=customer_name
FROM Orders
WHERE order_no =@orderid

DECLARE @P INT 
SELECT @P = CONVERT(INT,total_amount -cash_amount-credit_amount)
FROM Orders
WHERE order_no=@orderid
UPDATE Admin_Customer_Giftcard
SET  remaining_points= remaining_points+@P
WHERE customer_name=@N 

UPDATE Customer
SET points = points+@P
WHERE EXISTS(SELECT * FROM Admin_Customer_Giftcard WHERE customer_name=@N )

DELETE 
FROM Orders
WHERE order_no=@orderid AND order_status IN('not processed', 'in process')

-----------------------------------------------------------------

GO
CREATE PROC returnProduct
@serialno int,
@orderid int
AS
DECLARE @C VARCHAR(10)
SELECT @C=Gift_Card_code_used
FROM Orders,Gift_card
WHERE @orderid =order_no and Gift_Card_code_used=code and expiry_date>CURRENT_TIMESTAMP

EXEC removeExpiredGiftCard @C

DECLARE @CC DECIMAL
SELECT @CC=final_price
FROM PRODUCT
WHERE serial_no=@serialno

DECLARE @P INT
SELECT @P=CONVERT(INT,total_amount-cash_amount-credit_amount)
from Orders
where order_no=@orderid
if @p>@c
set @p=convert(int,@cC)
if @p<0
set @p =0
UPDATE Customer
SET points =@P+POINTS
WHERE username IN(SELECT customer_name FROM Orders WHERE order_no = @orderid)
UPDATE Admin_Customer_Giftcard
SET remaining_points=remaining_points+@P
WHERE customer_name IN(SELECT customer_name FROM Orders WHERE order_no = @orderid)
UPDATE 
Product
SET available =1 ,customer_order_id = NULL ,customer_username =NULL
WHERE serial_no = @serialno




-----------------------------------------------------------------







GO
CREATE PROC ShowproductsIbought
@customername varchar(20)
AS
SELECT P.product_name,P.product_description,P.price,P.final_price,P.color
FROM Product P, Orders O
WHERE P.customer_username=@customername AND P.customer_order_id=O.order_no


GO
CREATE PROC rate
@serialno int, 
@rate int , 
@customername varchar(20)
AS
UPDATE Product
SET rate=@rate
WHERE serial_no=@serialno AND customer_username=@customername


GO
CREATE PROC SpecifyAmount
@customername varchar(20),
@orderID int,
@cash decimal(10,2),
@credit decimal(10,2)
AS
DECLARE @diff DECIMAL(10,2)
SELECT @diff =total_amount
FROM Orders
WHERE order_no=@orderID

UPDATE Orders
SET cash_amount=@cash ,credit_amount=@credit
WHERE order_no=@orderID

UPDATE Customer
SET points = points-(@diff-@cash-@credit)
WHERE username =@customername


GO
CREATE PROC AddCreditCard
@creditcardnumber varchar(20), 
@expirydate date , 
@cvv varchar(4), 
@customername varchar(20)
AS
INSERT INTO Credit_Card(number,expiry_date, cvv_code)
VALUES (@creditcardnumber,@expirydate,@cvv)
INSERT INTO Customer_CreditCard(customer_name, cc_number)
VALUES(@customername,@creditcardnumber)


GO
CREATE PROC ChooseCreditCard
@creditcard varchar(20), 
@orderid int
AS
UPDATE Orders
SET creditCard_number =@creditcard
WHERE order_no =@orderid


GO
CREATE PROC vewDeliveryTypes
AS
SELECT type
FROM Delivery


GO
CREATE PROC specifydeliverytype
@orderID int, 
@deliveryID int
AS
DECLARE @T VARCHAR(20)
DECLARE @D VARCHAR(20)

SELECT @T=type, @D = time_duration
FROM Delivery
WHERE id=@deliveryID

UPDATE Orders
SET remaining_days=@D , delivery_id=@deliveryID
WHERE order_no=@orderID

GO
CREATE PROC trackRemainingDays
@orderid int, 
@customername varchar(20),
@days int OUTPUT
AS
DECLARE @T INT
DECLARE @D DATETIME
SELECT @T=S1.time_duration,@D=S2.order_date
FROM Delivery S1,Orders S2
WHERE S2.order_no=@orderid AND S1.id=S2.delivery_id
SET @days = @T-convert(int,(CURRENT_TIMESTAMP - @D))


GO
CREATE PROC recommmend
@customername varchar(20)
AS
SELECT P.product_name,P.price,P.final_price
FROM Product P 
WHERE P.serial_no IN(
SELECT TOP 3 p.serial_no
FROM Wishlist_Product W,Product P
WHERE P.serial_no=W.serial_no AND P.category IN (SELECT TOP 3 P.category
FROM Product P , CustomerAddstoCartProduct C
WHERE C.customer_name=@customername AND P.serial_no=C.serial_no
GROUP BY P.category
ORDER BY P.category DESC)
GROUP BY P.serial_no
ORDER BY COUNT(P.serial_no) DESC)
UNION
SELECT P1.product_name,P1.price,P1.final_price
FROM Product P1 
WHERE P1.serial_no in(
SELECT TOP 3 P.serial_no
FROM Product P , Wishlist_Product W
WHERE P.serial_no=W.serial_no AND W.username IN(
SELECT customer_name
FROM CustomerAddstoCartProduct
WHERE customer_name<>@customername AND serial_no IN(
SELECT serial_no
FROM CustomerAddstoCartProduct
WHERE username=@customername))
GROUP BY P.serial_no
ORDER BY COUNT(P.serial_no) DESC)

------------
go
create proc postProduct 
@vendorUsername varchar(20), 
@product_name varchar(20) ,
@category varchar(20),
@product_description text , 
@price decimal(10,2),
@color varchar(20) 
As
INSERT INTO product(product_name, vendor_Username, category, product_description, price, color)
Values (@product_name, @vendorUsername ,@category, @product_description , @price, @color )

----------------------------------------------


go
CREATE PROC vendorviewProducts
@vendorname varchar(20)
AS
SELECT * 
FROM product
WHERE (product.vendor_username=@vendorname)


---------------------


go
CREATE PROC EditProduct 
@vendorname varchar(20),
@serialnumber int,
@product_name varchar(20),
@category varchar (20),
@product_description text ,
@price decimal(10,2),
@color varchar(20) 
As
Update product
SET product_name=@product_name,category = @category,product_description =@product_description,price =@price,color =@color
WHERE (Vendor_username=@vendorname AND serial_no = @serialnumber)

----------------------------
go
CREATE PROC  deleteProduct 
@vendorname varchar(20),
@serialnumber int
As
Delete From product Where (Vendor_username=@vendorname AND serial_no = @serialnumber);


-------


go 
CREATE PROC viewQuestions 
@vendorname varchar(20)
As
SELECT q1.question
From Customer_Question_Product q1
INNER JOIN product p on  p.serial_no=q1.serial_no
WHERE (Vendor_username=@vendorname);


-----------


go
CREATE PROC answerQuestions
@vendorname varchar(20), 
@serialno int, 
@customername varchar(20), 
@answer text
AS
IF EXISTS(SELECT * FROM Product WHERE serial_no =@serialno AND vendor_username = @vendorname)
UPDATE Customer_Question_Product
SET answer = @answer
WHERE serial_no =@serialno AND customer_name =@customername
--Update Customer_Question_Product --aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

----------------add offer ------------------------
go 

create proc addOffer 
@offeramount int,@expiry_date datetime
As
INSERT INTO offer(offer_amount,expiry_date) Values (@offeramount,@expiry_date) 
---------------check offer on product ---------------------------
go
CREATE PROC checkOfferonProduct 
@serial int,
@activeoffer bit Output
AS
IF(EXISTS(SELECT * FROM offersOnProduct O WHERE O.serial_NO=@serial))
SET @activeoffer=1
ELSE
SET @activeoffer=0

---------------------appplyyy offfer------------
GO
CREATE PROC applyOffer
@VENDOR_USERNAME varchar(20),@offerid int, @serial int
aS
DECLARE @X INT ;
SELECT @X=offer_amount FROM offer O WHERE( O.offer_id=@offerid )

UPDATE PRODUCT
SET FINAL_PRICE=PRICE-(@X*price/100)
WHERE (VENDOR_USERNAME=@VENDOR_USERNAME AND product.serial_no= @serial )



-------------delete expire date---------------------------------

GO
CREATE PROC checkandremoveExpiredoffer
@offer_id int
aS

UPDATE PRODUCT 
SET FINAL_PRICE=PRICE
WHERE product.serial_no IN (SELECT p.serial_no FROM offersOnProduct P WHERE P.offer_id=@offer_id)
delete from offer  WHERE (offer_id=@offer_id)
delete from offersOnProduct  WHERE (offer_id=@offer_id)
----------mahmoud 5ls--------
----admin--------Part*


----admin activate vendor -----

go
CREATE PROC activateVendors  
@admin_username varchar(20),
@vendor_username varchar(20)
As
UPDATE vendor 
SET activated = 1, admin_username = @admin_username
WHERE vendor.username=@vendor_username;

-----------invite delivry person-------

go
CREATE PROC inviteDeliveryPerson  
@delivery_username varchar(20),
@delivery_email varchar(50)
As
INSERT INTO Delivery_Person VALUES (@delivery_username, 0) 
INSERT INTO USERS(username,EMAIL) VALUES (@delivery_username, @delivery_email) 

----review all orders-----
go
CREATE PROC reviewOrders
As
select * from orders

------update status of order
go
CREATE PROC updateOrderStatusInProcess  
@order_no int
As
UPDATE orders 
SET order_status='in process'
WHERE orders.order_no=@order_no;

-------add delivry type-----------
go	
CREATE PROC addDelivery
@delivery_type varchar(20),
@time_duration int,
@fees decimal(5,3),
@admin_username varchar(20)
AS
INSERT INTO Delivery (username,fees,time_duration,type)VALUES (@admin_username, @fees,@time_duration,@delivery_type) 

---assighn order to delivary man------
go	
CREATE PROC assignOrdertoDelivery
@delivery_username varchar(20),
@order_no int,
@admin_username varchar(20)
AS
INSERT INTO Admin_Delivery_Order (admin_username,order_no,delivery_username)VALUES (@admin_username,@order_no,@delivery_username) 

-----create todays deal---------
go
CREATE PROC createTodaysDeal
@deal_amount int,
@admin_username varchar(20),
@expiry_date datetime
AS
INSERT INTO Todays_Deals (deal_amount,admin_username,expiry_date)VALUES (@deal_amount,@admin_username,@expiry_date) 


go
CREATE PROC checkTodaysDealOnProduct
@serial_no INT,
@activeDeal BIT OUTPUT
As
if( exists(select * from Todays_Deals_Product p where p.serial_no=@serial_no))
set @activeDeal=1
else
set @activeDeal=0

go
create proc addTodaysDealOnProduct
@deal_id int,
@serial_no int
AS
INSERT INTO Todays_Deals_Product(deal_id ,serial_no )VALUES(@deal_id ,@serial_no )
declare @x int;
select @x=deal_amount from Todays_Deals t where t.deal_id=@deal_id
update products 
set final_price=price+@x
where serial_no=@serial_no

------------

go
create proc removeExpiredDeal
@deal_iD int
AS

update products 
set final_price=price
where serial_no in(select serial_no from Todays_Deals_Product t where t.deal_iD=@deal_iD)

DELETE FROM Todays_Deals_Product WHERE deal_iD=@deal_iD;
DELETE FROM Todays_Deals WHERE deal_iD=@deal_iD;
-----------
go
create proc createGiftCard 
@code varchar(10),
@expiry_date datetime,
@amount int,
@admin_username varchar(20)
As
INSERT INTO Gift_card(code ,expiry_date,amount,username )VALUES(@code ,@expiry_date,@amount,@admin_username )

go
create proc removeExpiredGiftCard 
@code varchar(10)
As
UPDATE Customer
SET points=0
WHERE username in (select Customer_name from Admin_Customer_Giftcard where code=@CODE)
DELETE
FROM Admin_Customer_Giftcard
WHERE code =@CODE
DELETE FROM Gift_card
WHERE CODE =@code

------------------
go
CREATE PROC giveGiftCardtoCustomer
@code varchar(10),@customer_name varchar(20),@admin_username varchar(20)
as
DECLARE @X INT ;  
SELECT @X=amount FROM Gift_card O WHERE( O.code=@code )
INSERT INTO Admin_Customer_Giftcard (CODE,customer_name,ADMIN_USERNAME)VALUES(@CODE,@customer_name,@ADMIN_USERNAME)
update Customer 
set points =points+@X
where Customer.username=@customer_name


go
create proc checkGiftCardOnCustomer 
@code varchar(10),
@activeGiftCard BIT OUTPUT
As
if (exists(select * from Admin_Customer_Giftcard a where a.code=@code ))
set @activeGiftCard=1;
else
set @activeGiftCard=0;

GO
CREATE PROC acceptAdminInvitation 
@delivery_username varchar(20)
As
update Delivery_person
SET is_activated='1'
where(username =@delivery_username)


GO
CREATE PROC deliveryPersonUpdateInfo
@username varchar(20),@first_name varchar(20),@last_name varchar(20),@password varchar(20),
@email varchar(50)
AS
UPDATE USERS
SET first_name =@first_name ,last_name=@last_name,password =@password ,email=@email
WHERE username=@username

go
CREATE PROC  viewmyorders 
@deliveryperson varchar(20)
As
SELECT *
from orders o
INNER JOIN Admin_Delivery_Order a on a.order_no = o.order_no
where (a.delivery_username =@deliveryperson)

GO
CREATE PROC specifyDeliveryWindow
@delivery_username varchar(20),
@order_no int,
@delivery_window varchar(50)
AS
UPDATE Admin_Delivery_Order
SET delivery_window=@delivery_window
WHERE delivery_username=@delivery_username AND @order_no=order_no




GO 
CREATE PROC updateOrderStatusOutforDelivery
@order_no int
AS
UPDATE Orders
SET order_status='out for delivery'
WHERE order_no=@order_no


GO
CREATE PROC updateOrderStatusDelivered
@order_no INT
AS
UPDATE Orders
SET order_status='delivered'
WHERE order_no=@order_no


go
Create proc getorderNo
@username varchar(20),
@order_no int output
As
select @order_no=o.order_no from Orders o where @username =o.customer_name

CREATE PROC makeOrder
@customername varchar(20)
AS
DECLARE @cost DECIMAL(10,2)
EXEC calculatepriceOrder @customername , @cost OUTPUT
INSERT INTO Orders(order_date,total_amount,customer_name,order_status)
VALUES(CURRENT_TIMESTAMP,@cost,@customername,'not processed')
DECLARE @orderid INT
SELECT @orderid=MAX(order_no)
FROM Orders
EXEC productsinorder @customername , @orderid
EXEC emptyCart 
















-- USERS INSERTION
INSERT INTO Users
VALUES('hana.aly' ,'pass1' ,'hana' ,'aly' ,'hana.aly@guc.edu.eg')

INSERT INTO Users
VALUES('ammar.yasser' ,'pass4' ,'ammar' ,'yasser' ,'ammar.yasser@guc.edu.eg')

INSERT INTO Users
VALUES('nada.sharaf' ,'pass7' ,'nada' ,'sharaf' ,'nada.sharaf@guc.edu.eg')

INSERT INTO Users
VALUES('hadeel.adel' ,'pass13' ,'hadeel' ,'adel' ,'hadeel.adel@guc.edu.eg')

INSERT INTO Users
VALUES('mohamed.tamer' ,'pass16' ,'mohamed' ,'tamer' ,'mohamed.tamer@guc.edu.eg')
-- ADMINS
INSERT INTO Admins
VALUES('hana.aly')

INSERT INTO Admins
VALUES('nada.sharaf')

-- CUSTOMERS 
INSERT INTO Customer(username, points)
VALUES('ammar.yasser',15)


-- customeraddstocartproduct
INSERT INTO customeraddstocartproduct
VALUES(1,'ammar.yasser')

-- VENDOR
INSERT INTO Vendor
VALUES('hadeel.adel' , 1, 'Dello' , '47449349234' , 'hana.aly')

-- DELIVERY
INSERT INTO Delivery_Person
VALUES('mohamed.tamer' , 1)

-- USER_ADDRESSES
INSERT INTO User_Addresses
VALUES('New Cairo' , 'hana.aly')

INSERT INTO User_Addresses
VALUES('Heliopolis' , 'hana.aly')

-- USER_MOBILE
INSERT INTO User_mobile_numbers
VALUES('01111111111','hana.aly')

INSERT INTO User_mobile_numbers
VALUES('1211555411','hana.aly')

-- CREDIT_CARD
INSERT INTO Credit_Card
VALUES('4444-5555-6666-8888' , '2028-10-19' , '232')

-- DELIVERY
INSERT INTO Delivery(type , time_duration , fees)
VALUES('pick-up' , 7 ,10 )

INSERT INTO Delivery(type , time_duration , fees)
VALUES('regular' ,14 ,30)

INSERT INTO Delivery(type , time_duration , fees)
VALUES('speedy' ,1 , 50)

-- PRODUCT
SET IDENTITY_INSERT Product ON;

INSERT INTO Product(serial_no , product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES(1,'Bag' ,'Fashion' ,'backbag' , 100 , 100 , 'yellow' , 1,0 , 'hadeel.adel')

INSERT INTO Product(serial_no , product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES(3,'Blue pen' ,'stationary' ,'useful pen' , 10 , 10 , 'Blue' , 1,0 , 'hadeel.adel')

INSERT INTO Product(serial_no , product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES(4,'Blue pen' ,'stationary' ,'useful pen' , 10 , 10 , 'Blue' , 0,0 , 'hadeel.adel')
SET IDENTITY_INSERT Product off;


-- DEALS
SET IDENTITY_INSERT Todays_Deals ON;

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(1, 30 , '2019-11-30' , 'hana.aly')

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(2, 40 , '2019-11-18' , 'hana.aly')

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(3, 50 , '2019-12-12' , 'hana.aly')

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(4, 10 ,'2019-11-12', 'hana.aly')

SET IDENTITY_INSERT Todays_Deals OFF;

-- OFFERS
SET IDENTITY_INSERT offer ON;
INSERT INTO offer (offer_id , offer_amount , expiry_date)
VALUES(1 , 50 ,'2019-11-30')
SET IDENTITY_INSERT offer OFF;


-- WISHLIST
INSERT INTO Wishlist(username , name)
VALUES('ammar.yasser' , 'fashion')


-- WHISHLIST
-- no serial_no with value 2 
INSERT INTO Wishlist_Product
VALUES('ammar.yasser' , 'fashion' , 2)


-- GIFT_CARD
INSERT INTO Gift_card(code , expiry_date , amount)
VALUES('G101' ,'2019-11-18', 100)

INSERT INTO Customer_CreditCard
VALUES('ammar.yasser' , '4444-5555-6666-8888')



CREATE PROC SpecifyAmount
@customername varchar(20),
@orderID int,
@cash decimal(10,2),
@credit decimal(10,2)
AS
DECLARE @diff DECIMAL(10,2)
SELECT @diff =total_amount
FROM Orders
WHERE order_no=@orderID

UPDATE Orders
SET cash_amount=@cash ,credit_amount=@credit
WHERE order_no=@orderID

UPDATE Customer
SET points = points-(@diff-@cash-@credit)
WHERE username =@customername

go
Create proc getorderNo
@username varchar(20),
@order_no int output
As
select @order_no=o.order_no from Orders o where @username =o.customer_name

CREATE PROC makeOrder
@customername varchar(20)
AS
DECLARE @cost DECIMAL(10,2)
EXEC calculatepriceOrder @customername , @cost OUTPUT
INSERT INTO Orders(order_date,total_amount,customer_name,order_status)
VALUES(CURRENT_TIMESTAMP,@cost,@customername,'not processed')
DECLARE @orderid INT
SELECT @orderid=MAX(order_no)
FROM Orders
EXEC productsinorder @customername , @orderid
EXEC emptyCart 



