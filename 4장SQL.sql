#날짜:2025.01.08
#이름:김성민
#내용:4장 SQL고급

#실습 4-1
use `StudyDB`;

create table `Member` (
`uid` varchar(10) primary key,
`name` varchar(10) not null,
`hp`   varchar(13) unique not null,
`pos`   varchar(10) default '사원',
`dep`   int,
`rdate`  datetime not null
);
select* from `Member`;

insert into `Member` value('a101','박혁거세','010-1234-1001','부장',101,now());
insert into `Member` value('a102','김유신','010-1234-1002','차장',102,now());
insert into `Member` value('a103','김춘추','010-1234-1003','사원',103,now());
insert into `Member` value('a104','장보고','010-1234-1004','대리',104,now());
insert into `Member` value('a105','강감찬','010-1234-1005','과장',105,now());
insert into `Member` value('a106','이성계','010-1234-1006','차장',106,now());
insert into `Member` value('a107','정철','010-1234-1007','차장',107,now());
insert into `Member` value('a108','이순신','010-1234-1008','부장',108,now());
insert into `Member` value('a109','허균','010-1234-1009','부장',109,now());
insert into `Member` value('a110','정약용','010-1234-1010','사원',110,now());
insert into `Member` value('a111','박지원','010-1234-1011','사원',111,now());
drop table `Member`;

create table `Department` (
`depNo`  int not null  primary key,
`name`   varchar(10) not null,
`tel`    varchar(12) not null
);
select * from `Department`;
insert into `Department` value(101,'영업1부','051-512-1001');
insert into `Department` value(102,'영업2부','051-512-1002');
insert into `Department` value(103,'영업3부','051-512-1003');
insert into `Department` value(104,'영업4부','051-512-1004');
insert into `Department` value(105,'영업5부','051-512-1005');
insert into `Department` value(106,'영업지원부','051-512-1006');
insert into `Department` value(107,'인사부','051-512-1007');


create table `Sales` (
`seq`   int primary key auto_increment,
`uid`   varchar(10) not null,
`year`  year not null,
`month` tinyint not null,
`sale`  int     
);
select*from `Sales`;

insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a101', 2018, 1, 98100);
insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102', 2018, 1, 136000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a103', 2018, 1, 80100);
insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a104', 2018, 1, 78000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a105', 2018, 1, 93000);

insert into `Sales` (`uid`, `year`, `month`, sale) value ('a101', 2018, 2, 23500);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a102', 2018, 2, 126000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a103', 2018, 2, 18500);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a105', 2018, 2, 19000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a106', 2018, 2, 53000);

insert into `Sales` (`uid`, `year`, `month`, sale) value ('a101', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a102', 2019, 1, 109000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a103', 2019, 1, 101000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a104', 2019, 1, 53500);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a107', 2019, 1, 24000);

insert into `Sales` (`uid`, `year`, `month`, sale) value ('a102', 2019, 2, 160000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a103', 2019, 2, 101000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a104', 2019, 2, 43000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a105', 2019, 2, 24000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a106', 2019, 2, 109000);

insert into `Sales` (`uid`, `year`, `month`, sale) value ('a102', 2020, 1, 201000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a104', 2020, 1, 63000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a105', 2020, 1, 74000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a106', 2020, 1, 122000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a107', 2020, 1, 111000);

insert into `Sales` (`uid`, `year`, `month`, sale) value ('a102', 2020, 2, 120000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a103', 2020, 2, 93000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a104', 2020, 2, 84000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a105', 2020, 2, 180000);
insert into `Sales` (`uid`, `year`, `month`, sale) value ('a108', 2020, 2, 76000);

#실습 4-3
select * from  `Member` where `name`='김유신';
select * from `Member` where `pos` ='차장' and `dep`=101;
select * from `Member` where `pos` = '차장' or `dep` = 101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos`= '사원' or `pos` = '대리';
select * from `Member` where `pos` in('사원','대리');
select * from `Member` where `dep` in(101,102,103);
select * from `Member` where `name` like '%신'; #마지막에 신이 붙은 사람만 조회
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Memeber` where `name` like '정_'; #정으로 시작하는 두글자인 사람
select * from `Sales` where `sale` > 50000;
select * from `Sales` where `sale` >= 50000 and `sale` < 100000 and `month`=1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 100000;
select * from `Sales` where `year` in(2020);
select * from `Sales` where `month` in(1,2);

#실습 4-4 오름/내림차순 
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` asc;
select * from `Sales` order by `sale` desc;
select * from `Member` order by `name`;
select * from `Member` order by `name` desc;
select * from `Sales` where `sale` > 50000 order by `sale` desc;
select * from `Sales` where `sale` > 50000 order by `year`,`month`,`sale` desc;

#실습 4-5 limit
select * from `Sales` limit 3;
select * from `Sales` limit 0,3;
select * from `Sales` limit 1,2;
select * from `Sales` limit 5,3;
select * from `Sales` order by `sale` desc limit 3,5;
select * from `Sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `Sales` where `sale` > 50000 order by `year`desc, `month`,`sale` desc limit 5;

#실습 4-6 컬럼명을 별칭으로 사용하기
select sum(`sale`) as `합계`from `Sales`;
select avg(`sale`) as `평균` from `Sales`;
select max(`sale`) as `최대값` from `Sales`;
select min(`sale`) as `최소값` from `Sales`;

#올림값(정수부 기준)
select ceiling(1.2); 
select ceiling(1.8);

#내림값
select floor(1.2);
select floor(1.8);

#반올림
select round(1.2);
select round(1.8);

#랜덤 0~1사이의 실수 랜덤 생성
select rand();
#1~10사이 정수
select ceiling(rand()*10);

#데이터값 개수 
select count(*) as `갯수` from `Sales`;
select count(`sale`) as `갯수` from `Sales`;

#왼쪽 기준으로 5개 문자열 자르기
select left('helloworld',5);
#왼쪽 기준으로 5개 문자열 자르기  
select right('helloworld',5);
#시작위치 자를길이 선정
select substring('helloworld', 6,5);

#문자열 합치기
select concat('hello','world');
select concat(`uid`,`name`,`hp`) from `Member` where `uid`='a108';

#현재 날짜 (실행 기준)
select curdate();
#현재 시간 (실행 기준)
select curtime();
#현재 날짜와 시간 (실행 기준)
select now();

select sum(`sale`) as `2018 1월 매출 합계`from `Sales` where `month`=1 and `year`=2018 ;

select sum(`sale`) as `총합`, avg(`sale`) as `평균` from `Sales`
where `year`=2019 and `month`=2 and `sale` >= 50000 ;

select min(`sale`) as `최저 매출`, max(`sale`) as `최고 매출` from `Sales`
where `year`= 2020;

select * from `Sales`;