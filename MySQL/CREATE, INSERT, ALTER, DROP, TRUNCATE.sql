CREATE DATABASE pokemon;
SHOW DATABASES;
USE pokemon; -- use를 사용하지 않을 경우, CREATE TABLE pokemon.mypokemon으로 테이블 생성하기

# 테이블 생성 컬럼명과 컬럼 타입 지정
CREATE TABLE mypokemon (
		number INT,
		name VARCHAR(20),
		type VARCHAR(10)
    );

# 테이블 안의 row에 데이터 삽입
INSERT INTO mypokemon (number, name, type)
VALUES (10, 'caterpie', 'bug'),
	(25, 'pikachu', 'electric'),
	(133, 'eevee', 'normal');

# 데이터가 잘 들어갔는지 확인
SELECT *
FROM mypokemon;

# use를 계속 써줘야되는듯
USE pokemon;
CREATE TABLE mynewpokemon (
		number INT,
        name VARCHAR(20),
        type VARCHAR(10)
        );

INSERT INTO mynewpokemon (number, name, type)
VALUES (77, '포니타', '불꽃'),
		(132, '메타몽', '노말'),
        (151, '뮤', '에스퍼');
        
SELECT *
FROM myoldpokemon;

# 테이블을 변경
USE pokemon;
ALTER TABLE mypokemon RENAME myoldpokemon;
ALTER TABLE myoldpokemon CHANGE COLUMN eng_nm eng_nm1 VARCHAR(20); -- CHANGE COLUMN : 테이블 컬럼 이름 변경
ALTER TABLE mynewpokemon CHANGE COLUMN name kor_nm VARCHAR(20);

SELECT *
FROM myoldpokemon;

#테이블 지우기
USE pokemon;
DROP TABLE mynewpokemon; -- 아예 사라짐
TRUNCATE TABLE myoldpokemon; -- 값만 사라짐

DROP DATABASE pokemon; -- DB 사라짐
