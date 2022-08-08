# ORDER BY : 데이터 정렬하기
# ORDER BY [컬럼 이름] ASD, DESC

USE pokemon;

SELECT *
FROM mypokemon
ORDER BY number DESC;

SELECT number, name, attack, defense
FROM mypokemon
ORDER BY attack DESC, defense; -- 같은 값이 있을 때 먼저 쓴 컬럼 기준으로 정렬 후, 다음 컬럼 기준 정렬

# 컬럼 번호로도 정렬 가능 (위와 동일한 결과)
SELECT number, name, attack, defense
FROM mypokemon
ORDER BY 3 DESC, 4;

# RANK : 데이터 순위를 정해 가져오기 
# RANK() OVER(ORDER BY[컬럼 이름] ASC, DESC)
SELECT name, attack,
		RANK() OVER(ORDER BY attack DESC) AS attack_rank
FROM mypokemon;

# RANK / DENSE_RANK / ROW_NUMBER
SELECT name, attack,
	RANK() OVER(ORDER BY attack DESC) AS rank_rank, -- RANK : 공동 순위가 있으면 다음 순서로 건너 뜀
    DENSE_RANK() OVER(ORDER BY attack DESC) AS rank_dense_rank, -- DENSE_RANK : 공동 순위가 있어도 다음 순위를 뛰어 넘지 않음
    ROW_NUMBER() OVER(ORDER BY attack DESC) AS rank_row_number -- ROW_NUMBER : 공동 순위를 무시함
FROM mypokemon;

## 실습 예제
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
	 number INT,
       name	VARCHAR(20),
       type	VARCHAR(10),
       attack INT,
       defense INT,
       capture_date DATE
);
INSERT INTO mypokemon (number, name, type, attack, defense, capture_date)
VALUES (10, 'caterpie', 'bug', 30, 35, '2019-10-14'),
	   (25, 'pikachu', 'electric', 55, 40, '2018-11-04'),
	   (26, 'raichu', 'electric', 90, 55, '2019-05-28'),
      	  (125, 'electabuzz', 'electric', 83, 57, '2020-12-29'),
	   (133, 'eevee', 'normal', 55, 50, '2021-10-03'),
     	   (137, 'porygon', 'normal', 60, 70, '2021-01-16'),
	   (152, 'chikoirita', 'grass', 49, 65, '2020-03-05'),
     	  (153, 'bayleef', 'grass', 62, 80, '2022-01-01');

# 실습 1 : 포켓몬 테이블에서 포켓몬의 이름과 이름의 글자 수를 이름의 글자 수로 정렬해서 가져오기 
#(정렬 순서는 글자 수가 적은 것부터 많은 것 순으로 하기)
USE pokemon;
SELECT name, LENGTH(name)
FROM mypokemon
ORDER BY LENGTH(name);

/* 실습 2 : 포켓몬 테이블에서 방어력 순위를 보여주는 컬럼을 새로 만들어서 'defense_rank'라는 별명으로 가져오기
이 때, 포켓몬 이름 데이터도 함께 가져오기
조건 1 : 방어력 순위란 방어력이 큰 순서대로 나열한 순위를 의미
조건 2 : 공동 순위가 있으면 다음 순서로 건너 뛰기
*/
SELECT name, RANK() OVER(ORDER BY defense DESC) AS defense_rank
FROM mypokemon;

# 실습 3 : 포켓몬 테이블에서 포켓몬을 포획한 지 기준 날짜까지 며칠이 지났는 지를 'days'라는 별명으로 가져오기
# 이 때, 포켓몬의 이름도 함께 가져오기
# 조건 : 기준 날짜는 2022년 2월 14일
SELECT name, DATEDIFF('2022-02-14', capture_date) AS days
FROM mypokemon;