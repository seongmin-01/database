#실습 2-1 데이터베이스 생성 및 제거
use StudyDB;

CREATE TABLE `User1` (
`uid` VARCHAR(10),
`name` VARCHAR(10),
`hp` CHAR(13),
`age` INT
);

DROP TABLE `User1`;

#실습 2-2 데이터 입력
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 2-3 데이터 조회
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;

#실습 2-4 테이블에 데이터 수정
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 2-5 테이블에 데이터 삭제
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=23;
DELETE FROM `User1` WHERE `age` >= 30;

#실습 2-6 테이블 수정
alter table `User1` add `gender` tinyint;
alter table `User1` add `birth` char(10) after `name`;
alter table `User1` modify `gender` char(1); 
alter table `User1` modify `age` tinyint; 
alter table `User1` drop `gender`; 

#실습 2-7 테이블 복사alter
create table `User1Copy` like `User1`; 
INSERT INTO `User1Copy` SELECT*FROM `User1`; 




#실습 2-8
CREATE TABLE `TblUser` (
`user_id` VARCHAR(10),
`user_name` VARCHAR(10),
`user_hp` CHAR(13),
`user_age` tinyint,
`user_addr` varchar(100)
);