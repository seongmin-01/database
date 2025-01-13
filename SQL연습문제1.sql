#날짜:2025/01/13
#이름:김성민
#내용:SQL 연습문제1

#실습1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.*to'shop'@'%';
flush privileges;

#실습1-2
create table `Customer`(
`custid` varchar(10) primary key not null,
`name` varchar(10) not null,
`hp` varchar(13) unique,
`addr` varchar(100),
`rdate` date
);
select*from `Customer`;

create table `Product`(
`prodNo` int primary key not null,
`prodName` varchar(10) not null,
`stock` int default 0,
`price` int,
`company` varchar(20) not null
);
select*from `Product`;
create table `Order`(
`orderNo` int primary key auto_increment not null,
`orderid` varchar(10) not null,
`orderProduct` int not null,
`orderCount` int default 1,
`orderDate` datetime
);
select*from `Order`;

#실습1-3
insert into `Customer` value('c101','김유신','010-1234-1001','김해시 봉황동',CURDATE());
insert into `Customer` value('c102','김춘추','010-1234-1002','경주시 보문동',CURDATE());
insert into `Customer` value('c103','장보고','010-1234-1003','완도군 청산면',CURDATE());
insert into `Customer` value('c104','강감찬','010-1234-1004','서울시 마포구',CURDATE());
insert into `Customer` (`custid`,`name`,`rdate`) value('c105','이성계',CURDATE());
insert into `Customer` value('c106','정철','010-1234-1006','경기도 용인시',CURDATE());
insert into `Customer` (`custid`,`name`,`rdate`) value('c107','허준',CURDATE());
insert into `Customer` value('c108','이순신','010-1234-1008','서울시 영등포구',CURDATE());
insert into `Customer` value('c109','송상현','010-1234-1009','부산시 동래구',CURDATE());
insert into `Customer` value('c110','정약용','010-1234-1010','경기도 광주시',CURDATE());
select*from `Customer`;

insert into `Product`  value('1','새우깡',5000,1500,'농심');
insert into `Product`  value('2','초코파이',2500,2500,'오리온');
insert into `Product`  value('3','포카칩',3600,1700,'오리온');
insert into `Product`  value('4','양파링',1250,1800,'농심');
insert into `Product` (`prodNo`,`prodName`,`stock`,`company`) value('5','죠리퐁',2200,'크라운');
insert into `Product`  value('6','마가렛트',3500,3500,'롯데');
insert into `Product`  value('7','뿌셔뿌셔',1650,1200,'오뚜기');
select*from `Product`;

insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c102',3,2,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c101',4,1,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c108',1,1,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c109',6,5,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c102',2,1,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c101',7,3,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c110',1,2,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c104',2,4,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c102',1,3,now());
insert into `Order` (`orderid`,`orderProduct`,`orderCount`,`orderDate`) value('c107',6,1,now());
select*from `Order`;

#실습 1-4
select * from `Customer`;

#실습 1-5
select `custid`,`name`,`hp` from `Customer`;

#실습 1-6
select*from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8 (DISTINCT - 중복없이 조회)
select DISTINCT `company`  from `Product`;

#실습 1-9
select `prodName`,`price` from `Product`;

#실습 1-10
select `prodName`,`price` +500 as `조정단가`  from `product`;

#실습 1-11
select `prodName`,`stock`,`price` from `Product` `오리온`;

#실습 1-12
select `orderProduct`,`orderCount`,`orderDate`from `Order` where `orderid` = 'c102';

#실습 1-13
select `orderProduct`,`orderCount`,`orderDate` from `Order` where `orderid` = 'c102' and `orderProduct`>=2;

#실습 1-14
select * from `Product` where `price` >= 1000 and `price` <= 2000;

#실습 1-15
select `custid`,`name`,`hp`,`addr` from `Customer` where `name` like '김__';

#실습 1-16
select `custid`,`name`,`hp`,`addr` from `Customer` where `name` like '__';

#실습 1-17 (is null 빈 값 찾을 때)
select * from `Customer` where `hp` is null;

#실습 1-18
select*from `Customer` where `addr` is not null;

#실습 1-19
select*from `Customer` order by `rdate` desc;

#실습 1-20
select * from `Order` where `orderCount`>=3 order by `orderCount` desc, `orderProduct` asc;

#실습 1-21
select avg(`price`)  from `Product`;

select*from `Product`;
#실습 1-22
select sum(`stock`) as `재고량 합계` from `Product` where `company` = '농심';

select * from `Customer`;
#실습 1-23
select count(*) as `고객수` from `Customer`;

select*From `Product`;
#실습 1-24 (distinct - 중복된 것 찾을 때 사용)
select count(DISTINCT `company`) as `제조업체 수` from `Product`;

select * from `Order`;
#실습 1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량` from `Order` 
group by `orderProduct`order by `주문 상품번호` asc;

#실습 1-26
select `company` as `제조업체`, count(*) as `제품수` , max(`price`) as `최고가` 
from `Product` group by `company`;

select*from `Product`;
select*from `Order`;
#실습 1-27 (having - 조건)
select `company` as `제조업체`,count(*) as `제품수`, max(`price`) as`최고가` from 
`Product` group by `company` having `제품수` >= 2;

#실습 1-28
select `orderProduct`, `orderid`,sum(`orderCount`)as `총 주문수량`
from `Order` group by `orderProduct`,`orderid` order by `orderProduct` asc;

#실습 1-29
select a.orderid, b.prodName from `Order` as a
join `Product` as b
on a.orderProduct = b.prodNo
where `orderid` = 'c102';

#실습 1-30
select `orderid`,`name`,`pordName`,`orderDate` from `Order` as a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
where substr(`orderDate`, 1, 10) = '2022-07-03';
