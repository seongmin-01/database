use `bookstore`;

create table `Customer`(
`custId` int primary key auto_increment,
`name` varchar(10) not null,
`address` varchar(20),
`phone` varchar(13)
);
select * from `Customer`;

insert into `Customer`(`name`,`address`,`phone`)
value('박지성','영국 맨체스타','000-5000-0001'),
	 ('김연아','대한민국 서울','000-6000-0001'),
     ('장미란','대한민국 강원도','000-7000-0001'),
	 ('추신수','미국 클리블랜드','000-8000-0001');
insert into `Customer`(`name`,`address`) value('박세리','대한민국 대전');     


create table `Book`(
`bookId` int primary key,
`bookName` varchar(20) not null,
`publisher` varchar(20) not null,
`price` int
);
insert into `Book`  
value(1,'축구의 역사','굿스포츠',7000),
(2,'축구아는 여자','나무수',13000),
(3,'축구의 이해','대한미디어',22000),
(4,'골프 바이블','대한미디어',35000),
(5,'피겨 교본','굿스포츠',8000),
(6,'역도 단계별기술','굿스포츠',6000),
(7,'야구의 추억','이상미디어',20000),
(8,'야구를 부탁해','이상미디어',13000),
(9,'올림픽 이야기','삼성당',7500),
(10,'Olympic','Pearson',13000);

update `Book` set `price` = 13000 where `publisher` = 'Pearson'; 
select * from `Book`;

create table `Order`(
`OrderId` int primary key auto_increment,
`custId` int not null,
`bookId` int not null,
`salePrice` int not null,
`orderDate` date not null
);
select * from `Order`;

insert into `Order` (`custId`,`bookId`,`salePrice`,`orderDate`) 
value(1,1,6000,'2014-07-01'),
(1,3,21000,'2014-07-03'),
(2,5,8000,'2014-07-03'),
(3,6,6000,'2014-07-04'),
(4,7,20000,'2014-07-05'),
(1,2,12000,'2014-07-07'),
(4,8,13000,'2014-07-07'),
(3,10,12000,'2014-07-08'),
(2,10,7000,'2014-07-09'),
(3,8,13000,'2014-07-10');


#실습 5-4
select * from `Customer`;

#실습 5-5
select `bookname`,`price` from `Book`;

#실습 5-6
select `price`,`bookname` from `Book`;

#실습 5-7
select * from `Book`;

#실습 5-8
select `publisher` from `Book`;

#실습 5-9
select  DISTINCT `publisher` from `Book`;

#실습 5-10
select * from `Book` where `price` >= 20000;

#실습 5-11
select * from `Book` where `price` < 20000;

#실습 5-12
select * from `Book` where `price` between 10000 and 20000;

#실습 5-13
select `bookId`,`bookName`,`price` from `Book` where `price` between 15000 and 30000;

#실습 5-14
select * from `Book` where `bookId` in (2,3,5);

#실습 5-15 mod() -> 나머지를 구하는 함수
select * from `Book` where `bookId` % 2 = 0;

#실습 5-16
select * from `Customer` where `name` like '박%';

#실습 5-17
select * from `Customer` where `address` like '대한민국%';

#실습 5-18
select * from `Customer` where `phone` is not null;

#실습 5-19
select * from `Book` where `publisher` in ('굿스포츠','대한미디어');

#실습 5-20
select * from `Book` where `bookName` = '축구의 역사';

#실습 5-21
select `publisher` from `Book` where `bookName` like '축구%';

#실습 5-22
select * from `Book` where `bookName` like '_구%';

#실습 5-23
select * from `Book` where `bookName` like '축구%' and `price` >=20000;

#실습 5-24
select * from `Book` order by `bookname` asc ;

#실습 5-25
select * from `Book` order by `price` , `bookname`; 

#실습 5-26
select * from `Book` ORDER BY `price` DESC, `publisher` ASC;

#실습 5-27
select * from `Book` order by `price` desc limit 3;

#실습 5-28
select * from `Book` order by `price` asc limit 3;

#실습 5-29
select sum(`salePrice`) as `총판매액` from `Order`;

#실습 5-30
select 
sum(`salePrice`) as `총판매액`,
avg(`salePrice`) as `평균값`,
min(`salePrice`) as `최저가`,
max(`salePrice`) as `최고가`
 from `Order`;
 
 #실습 5-31
 select count(*) as `판매건수` from `Order`;
 
 #실습 5-32 REPLACE 믄지열을 다른 문자열로 바꿀 때 사용
#update `Book` SET `bookName` = REPLACE(`bookName`,'야구','농구')
#WHERE `bookName` LIKE '야구%';
#select `bookId`, repeat(`bookName`,'야구','농구') as `bookName`,
#`publicshaer`,
#`price`
#from `Book` ;

select * from `Customer`;
select * from `Order`;

#실습 5-33
select * from `Order`;
select c.custId, COUNT(DISTINCT o.OrderId)  as `수량` from `Order` as o
join `Customer` as c on o.custId = c.custId
where o.salePrice >= 8000
group by c.custId
having `수량` >=2;

#select *
#`custId` count(*) as `수량` from `Order`
#where `salePrice` >= 8000
#group bt `custId`
#having `수량` >= 2;

#실습 5-34
select * from `Customer` as c
join `Order` as o on c.custId = o.custId
order by c.custId asc;

#using을 사용한 간단하게 하는법
#select * from `Customer`
#join `Order` using(`custId`);

#실습 5-35
select * from `Customer` as c
join `Order` as o on c.custId = o.custId 
order by c.custId asc;

#실습 5-36
select c.`name`, o.`salePrice`from `Customer` as c
join `Order` as o on c.custId = o.custId;

#실습 5-37
select c.`name`,sum(o.salePrice) from `Customer`as c
join `Order` as o on c.custId = o.custId
group by c.name 
order by c.name asc;

select * from `Book`,`Customer`;

#실습 5-38
select c.name, b.bookName from `Customer` as c
join`Order` as o on c.custId = o.custId 
join `Book` as b on o.bookId = b.bookId;

#실습 5-39
select c.name, b.bookName  from `Customer` as c
join`Order` as o on c.custId = o.custId 
join `Book` as b on o.bookId = b.bookId
where `salePrice`= 20000;

select * from `Customer`;

#실습 5-40
select c.name, o.salePrice from `Customer` as c
left join`Order` as o on c.custId = o.custId;

#실습 5-41
select sum(o.salePrice) as '총매출' from `Customer` as c
join`Order` as o on c.custId = o.custId 
where c.name = '김연아';

#실습 5-42
select bookname from book where price order by price desc limit 1;

#실습 5-43
select `name` from `Customer` as c
left join `Order`as o on c.custId = o.custId
where `orderId` is null;

#실습 5-44
insert into `Book` (`bookId`,`bookName`,`publisher`) value(11,'스포츠의학','한솔의학서적');
select * from `Book`;

#실습 5-45
select * from `Customer`;
update `Customer` set `address`= '대한민국 부산' where `address` like '대한민국%';

#실습 5-46
delete from `Customer` where `custId` = 5;
select * from `Customer`;

