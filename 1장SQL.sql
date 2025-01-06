#실습 1-2 일반 관리자 생성 및 권한 부여
CREATE USER 'chhak'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON StudyDB.* TO 'chhak'@'%';
FLUSH PRIVILEGES;