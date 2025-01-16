use `theater`;

create table `Movies`(
`movie_id` int primary key auto_increment,
`title` varchar(30) not null,
`genre` varchar(10) not null,
`release_date` date not null
);
select * from `Movies`;

insert into `Movies` (`title`,`genre`,`release_date`) value('쇼생크의 탈출','드라마','1994-10-14');
insert into `Movies` (`title`,`genre`,`release_date`) value('타이타닉','로맨스','1997-03-24');
insert into `Movies` (`title`,`genre`,`release_date`) value('탑건','액션','1987-07-16');
insert into `Movies` (`title`,`genre`,`release_date`) value('쥬라기공원','액션','1994-02-11');
insert into `Movies` (`title`,`genre`,`release_date`) value('글래디에이터','액션','2000-05-03');
insert into `Movies` (`title`,`genre`,`release_date`) value('시네마천국','드라마','1995-04-12');
insert into `Movies` (`title`,`genre`,`release_date`) value('미션임파서블','액션','1995-11-11');
insert into `Movies` (`title`,`genre`,`release_date`) value('노트북','로맨스','2003-08-23');
insert into `Movies` (`title`,`genre`,`release_date`) value('인터스텔라','SF','2011-05-26');
insert into `Movies` (`title`,`genre`,`release_date`) value('아바타','SF','2010-02-10');

select * from `Movies`;

create table `Customers`(
`customer_id` int primary key auto_increment,
`name` varchar(20) not null,
`email` varchar(50) not null,
`phone` char(13) not null
);
select * from `Customers`;

insert into `Customers` (`name`,`email`,`phone`) value('김유신','kys@example.com','010-1234-1001');
insert into `Customers` (`name`,`email`,`phone`) value('김춘추','kcc@example.com','010-1234-1002');
insert into `Customers` (`name`,`email`,`phone`) value('장보고','jbg@example.com','010-1234-1003');
insert into `Customers` (`name`,`email`,`phone`) value('강감찬','kgc@example.com','010-1234-1004');
insert into `Customers` (`name`,`email`,`phone`) value('이순신','lss@example.com','010-1234-1005');


create table `Bookings`(
`booking_id` int primary key,
`customer_id` int not null,
`movie_id` int not null,
`num_tickets` int not null,
`booking_date` datetime not null
);
select * from `Bookings`;

update `Bookings` set `num_tickets` = 1 where `booking_id` = 111;

insert into `Bookings` value(101,1,1,2,'2023-01-10 00:00:00'); 
insert into `Bookings` value(102,2,2,3,'2023-01-11 00:00:00');
insert into `Bookings` value(103,3,2,2,'2023-01-13 00:00:00');
insert into `Bookings` value(104,4,3,1,'2023-01-17 00:00:00');
insert into `Bookings` value(105,5,5,2,'2023-01-21 00:00:00');
insert into `Bookings` value(106,3,8,2,'2023-01-21 00:00:00');
insert into `Bookings` value(107,1,10,4,'2023-01-21 00:00:00');
insert into `Bookings` value(108,2,9,1,'2023-01-22 00:00:00');
insert into `Bookings` value(109,5,7,2,'2023-01-23 00:00:00');
insert into `Bookings` value(110,3,4,2,'2023-01-23 00:00:00');
insert into `Bookings` value(111,1,6,2,'2023-01-24 00:00:00');
insert into `Bookings` value(112,3,5,3,'2023-01-25 00:00:00');

#실습 4-4
select `movie_id` as `#`, `title` from `Movies`;

#실습 4-5
select * from `Movies` where `genre` = '로맨스';

#실습 4-6   date 타입은 해당 형식에 맞게 컬럼값의 조건을 물어야함!
select `title`,`release_date` from `Movies` where `release_date`>='2010-01-01';

#실습 4-7
select `booking_id`,`booking_date` from `Bookings` where `num_tickets` >= 3;

#실습 4-8
select * from `bookings` where `booking_date` < '2023-01-20';

#실습 4-9 between <범위>를 지정하여 값을 필터링할 때 사용하는 조건
select * from `Movies` where `release_date` BETWEEN  '1990-01-01' and '1999-12-31';

#실습 4-10
select * from `Bookings` order by `booking_date` desc limit 3;

#실습 4-11
select `title`,`release_date` from `Movies` order by `release_date` asc limit 1;

#실습 4-12 like %조건% -> 해당 키워드가 포함된을 의미! 조건_조건 -> 조건키워드 첫시작과 끝의 키워드가 있는 것을 의미!
select CONCAT(title, ' - ', release_date) AS movie_info 
from `Movies`
where `genre` = '액션' and `title` like '%공원%'
order by `release_date` asc
limit 1;

select * from `Bookings`,`Movies`;

#실습 4-13  join의 다른 방식 별칭을 꼭 설정해주지 않아도 테이블명에서 해당 컬럼을 찾아서 결합한 것
SELECT `booking_date`, `title`
FROM `Bookings`
JOIN `Movies`
ON Bookings.movie_id = Movies.movie_id
WHERE customer_id = 2;

#실습 4-14  using(`컬럼명`) 결합할 컬럼명이 같을 경우 using키워드를 사용하여 한번에 가능!
select 
C.`name`, C.`phone`, B.`booking_date`, M.`title`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;

#실습 4-15
select 
M.genre,
AVG(B.num_tickets) AS avg_tickets
from `Bookings` B 
JOIN `Movies` M
ON B.movie_id = M.movie_id
group by `genre`;

#실습 4-16
SELECT
C.name,
AVG(B.num_tickets) AS avg_tickets
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
group by `name`;

#실습 4-17
SELECT
C.name,
SUM(B.num_tickets) AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
group by C.`name`
ORDER BY `전체 예매 티켓 수` DESC;

#실습 4-18  별칭을 붙일 때 as를 생략해도 되는듯?
SELECT
B.`booking_id`, B.`movie_id`,C.`name`,B.`booking_date`
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
ORDER BY B.booking_date ASC
LIMIT 1;

#실습 4-19 select절 안에 select절이 있으면 이걸 서브쿼리라고 함
SELECT
	genre, title, release_date
FROM Movies
WHERE (genre, release_date) 
IN (
	SELECT genre, MAX(release_date)
	FROM Movies
group by `genre`
);

#실습 4-20
SELECT * FROM Movies
WHERE movie_id 
IN (
  SELECT movie_id FROM Bookings
  WHERE customer_id = (SELECT customer_id FROM Customers  where `name` = '김유신'));

#실습 4-21
SELECT name, email FROM Customers
WHERE customer_id = (
SELECT customer_id
	FROM Bookings
	GROUP BY customer_id
	ORDER BY SUM(num_tickets) DESC
	limit 1
);

#실습 4-22
select * from `Bookings`
WHERE num_tickets > (SELECT avg(`num_tickets`) FROM Bookings);

#실습 4-23
SELECT
	M.title, SUM(B.num_tickets) AS total_tickets
FROM Bookings B
JOIN Movies M ON B.movie_id = M.movie_id
group by M.`title`;

#실습 4-24
SELECT
c.name,
SUM(b.num_tickets) AS total_tickets,
AVG(b.num_tickets) AS avg_tickets
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
group by c.`name`;

#실습 4-25
SELECT
	c.customer_id,
	c.name,
	c.email,
	SUM(b.num_tickets) AS `예매 티켓수`
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
group by c.`customer_id` 
ORDER BY `예매 티켓수` DESC;

#실습 4-26
SELECT
	c.`name`,m.`title`,b.`num_tickets`,b.`booking_date`
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN movies m ON b.movie_id = m.movie_id
ORDER BY num_tickets DESC;

#실습 4-27
SELECT
M.title,
M.genre,
SUM(B.num_tickets) AS `예매 티켓 수`,
AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
group by M.`title`
ORDER BY `평균 티켓 수` DESC;

#실습 4-28 
SELECT
	B.customer_id,
	C.name,
	SUM(`num_tickets`) AS `ticket_total`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
group by C.`customer_id`
ORDER BY ticket_total DESC;

#실습 4-29
SELECT
	B.booking_id,
	B.customer_id,
	B.movie_id,
	MaxTickets.max_tickets
FROM Bookings B
JOIN (
	SELECT movie_id, MAX(num_tickets) AS max_tickets
	FROM Bookings
	group by `movie_id`
) AS MaxTickets
  ON B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

#실습 4-30   having 조건 키워드 뒤에는 백틱(``)으로 정확히 컬럼임을 지정해주어야함! 
SELECT
	B.booking_id,
	B.customer_id,
	C.name,
	M.title,
	M.genre,
	 SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customers C ON B.customer_id = C.customer_id
GROUP BY M.title
having `예매 티켓 수` = (
	SELECT MAX(total_tickets)
	FROM (
		SELECT SUM(B2.num_tickets) AS total_tickets
		FROM Bookings B2
		JOIN Movies M2 ON B2.movie_id = M2.movie_id
		WHERE M2.genre = M.genre
		GROUP BY M2.title
		) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;

SELECT @@sql_mode;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';