# WHERE : 가져올 데이터의 조건을 지정해주는 키워드
# WHERE [조건식] 형식
# 비교 연산자 : = , > , < 
# 논리 연산자 : NOT, AND, OR 
# 기타 주요 연산자 : BETWEEN, IN	

# 데이터 베이스 재생성
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;

USE pokemon;
CREATE TABLE mypokemon (
	number int,
    name varchar(20),
    type varchar(20),
    speed float
    );

INSERT INTO mypokemon (number, name, type, speed)
VALUES (10, 'caterpie', 'bug', 45),
		(25, 'pikachu', 'electric', 90),
        (26, 'raichu', 'electric', 110),
        (133, 'eevee', 'normal', 55),
        (152, 'chikorita', 'grass', 45);

# 비교연산자 예제
SELECT *
FROM mypokemon
WHERE name = 'pikachu';

SELECT name 
FROM mypokemon
WHERE speed > 50;

SELECT name 
FROM mypokemon
WHERE type != 'electric';

# 논리연산자 예제
SELECT name
FROM mypokemon
WHERE speed <= 100 AND type = 'electric';

SELECT name
FROM mypokemon
WHERE type = 'normal' OR type = 'bug';

SELECT name
FROM mypokemon
WHERE speed <= 100 AND NOT (type = 'bug');  -- type != 'bug'와 동일

# BETWEEN : 특정 범위 내의 데이터를 선택할 때 사용하는 연산자
SELECT name
FROM mypokemon
WHERE speed BETWEEN 50 AND 100; -- speed >= 50 AND speed <= 100와 동일

# IN : 목록 내 포함되는 데이터를 선택할 때 사용하는 연산자
SELECT name
FROM mypokemon
WHERE type IN ('bug', 'normal'); -- type = 'bug' OR type = 'normal'와 동일

# LIKE : 특정 문자열이 포함된 데이터를 선택하는 연산자
# [컬럼 이름] LIKE [검색할 문자열]
# 와일드카드 -> % : 0개 이상의문자(알 수 없음), _ : 1개의 문자(딱 1개), __ : 딱 2개
SELECT name
FROM mypokemon
WHERE name LIKE '%chu'; -- 이름이 'chu'로 끝나는 포켓몬의 이름을 찾기

SELECT name
FROM mypokemon
WHERE name LIKE '%a%'; -- 이름에 'a'가 포함되는 포켓몬의 이름을 찾기

# NULL 데이터 다루기
INSERT INTO mypokemon (name, type) 
VALUES ('kkobugi', "");

SELECT *
FROM mypokemon;

# IS NULL : 데이터가 NULL인지 아닌지를 확인하는 연산자
# IS NULL, IS NOT NULL 표현만 사용 가능 = NULL, != NULL 사용 불가
SELECT name
FROM mypokemon
WHERE number IS NULL; 

SELECT name
FROM mypokemon
WHERE type IS NOT NULL; -- 꼬부기도 공백이라 IS NOT NULL에 포함됨 (공백을 넣어준것과 NULL은 확연히 다름!)


# 실습 DATABASE 생성
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon(
		number int,
        name varchar(20),
        type varchar(20),
		height float,
        weight float,
        attack float,
        defense float,
        speed float
        );
INSERT INTO mypokemon (number, name, type, height, weight, attack, defense, speed)
VALUES (10, 'catepie', 'bug', 0.3, 2.9, 30, 35, 45),
	(25, 'pikachu', 'electric', 0.4, 6, 55, 40 ,90),
    (26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
    (133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
    (152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);

SELECT *
FROM mypokemon;

# 실습 1 : 이브이의 타입을 가져오기
SELECT type
FROM mypokemon
WHERE name = 'eevee';

# 실습 2 : 캐터피의 공격력과 방어력을 가져오기
SELECT attack, defense
FROM mypokemon
WHERE name = 'catepie';

# 실습 3 : 몸무게가 6kg보다 큰 포켓몬들의 모든 데이터를 가져오기
SELECT *
FROM mypokemon
WHERE weight > 6;

# 실습 4 : 키가 0.5m보다 크고, 몸무게가 6kg보다 크거나 같은 포켓몬들의 이름을 가져오기
SELECT name
FROM mypokemon
WHERE height > 0.5 AND weight >= 6;

# 실습 5 : 포켓몬 테이블에서 공격력이 50미만이거나, 방어력이 50미만인 포켓몬들의 이름을 'weak_pokemon'이라는 별명으로 가져오기
SELECT name AS weak_pokemon
FROM mypokemon
WHERE attack < 50 OR defense < 50;

# 실습 6 : 노말 타입이 아닌 포켓몬들의 데이터를 전부 가져오기
SELECT *
FROM mypokemon
WHERE type != 'normal';

# 강사님 정답2
SELECT *
FROM mypokemon
WHERE NOT (type = 'normal');

# 실습 7 : 타입이 (normal, fire, water, grass) 중에 하나인 포켓몬들의 이름과 타입을 가져오기
SELECT name, type
FROM mypokemon
WHERE type IN ('normal', 'fire', 'water', 'grass');

# 실습 8 : 공격력이 40과 60사이인 이름과 공격력을 가져오기
SELECT name, attack
FROM mypokemon
WHERE attack BETWEEN 40 AND 60;

# 강사님 정답2
SELECT name, attack
FROM mypokemon
WHERE attack >= 40 AND attack <= 60;

# 실습 9 : 이름에 'e'가 포함되는 포켓몬들의 이름을 가져오기
SELECT name
FROM mypokemon
WHERE name LIKE '%e%';

# 실습 10 : 이름에 'i'가 포함되고, 속도가 50 이하인 포켓몬 데이터를 전부 가져오기
SELECT *
FROM mypokemon
WHERE name LIKE '%i%' AND speed <= 50;

# 실습 11 : 이름이 'chu'로 끝나는 포켓몬들의 이름, 키, 몸무게를 가져오기
SELECT name, height, weight
FROM mypokemon
WHERE name LIKE '%chu';

# 실습 12 : 이름이 'e'로 끝나고, 방어력이 50 미만인 포켓몬들의 이름, 방어력을 가져오기
SELECT name, defense
FROM mypokemon
WHERE name LIKE '%e' AND defense < 50;

# 실습 13 : 공격력과 방어력의 차이가 10 이상인 포켓몬들의 이름, 공격력, 방어력을 가져오기
SELECT name, attack, defense
FROM mypokemon
WHERE (attack - defense) >= 10 OR (attack - defense) <= -10; 

# 강사님 정답
SELECT name, attack, defense
FROM mypokemon
WHERE (attack - defense) >= 10 OR (defense - attack ) >= 10; 

/* 실습 14 : 능력치의 합이 150 이상인 포켓몬의 이름과 능력치의 합을 가져오기.
이 때, 능력치의 합은 'total'이라는 별명으로 가져오기
조건1. 능력치의 합은 공격력, 방어력, 속도의 합을 의미
*/
SELECT name, (attack + defense + speed) AS total
FROM mypokemon
WHERE (attack + defense + speed) >= 150;