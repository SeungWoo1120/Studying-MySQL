## 문자형 데이터 다루기 (문자열 함수) 
DROP DATABASE IF EXISTS bts_music;
CREATE DATABASE bts_music;
CREATE TABLE butter(
		part int,
        lyric varchar(50)
        );

INSERT INTO butter (part, lyric)
VALUES (1, 'Smooth like butter'),
		(2, 'Like a criminal undercover'),
		(3, "Gon' pop like trouble"),
        (4, "Breakin' into your heart like that"),
        (5, "Cool shade stunner");

USE bts_music;
SELECT *
FROM butter;

# LOCATE("A", "ABC")  : "ABC"에서 "A"는 몇 번째에 위치해 있는지 검색해 위치 반환
# 문자가 여러 개라면 가장 먼저 찾은 문자의 위치를 가져옴 (만약 찾는 문자가 없다면 0 반환)
SELECT part, LOCATE('i', lyric)
FROM butter;

# SUBSTRING("ABC", 2) : "ABC"에서 2번째 문자부터 반환
SELECT part, SUBSTRING(lyric, 3)
FROM butter;

SELECT part, SUBSTRING(lyric, 100)
FROM butter; -- 만약 입력한 숫자가 문자열의 길이보다 크다면 아무것도 가져오지 않음

# RIGHT("ABC", 1) : "ABC"에서 오른쪽에서 1번째 문자까지 반환
# LEFT("ABC", 1) : "ABC"에서 왼쪽에서 1번째 문자까지 반환
SELECT part, RIGHT(lyric, 3), LEFT(lyric, 3)
FROM butter;

# UPPER("abc") : "abc"를 대문자로 바꿔 반환
# LOWER("ABC") : "ABC"를 소문자로 바꿔 반환
SELECT part, UPPER(lyric), LOWER(lyric)
FROM butter;

# LENGTH("ABC") : "ABC"의 글자 수를 반환
SELECT part, LENGTH(lyric)
FROM butter;

# CONCAT("ABC", "DEF") : "ABC"문자열과 "CDF"문자열을 합쳐 반환
SELECT part,
	CONCAT(LEFT(lyric,1), RIGHT(lyric,1)) AS first_last
FROM butter;

# REPLACE("ABC","A","Z") : "ABC"의 "A"를 "Z"로 바꿔 전환
SELECT part, REPLACE(lyric,' ','_')
FROM butter;

## 숫자형 데이터 다루기 (숫자형 함수)
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;

USE pokemon;
CREATE TABLE mypokemon(
		number int,
        name varchar(20),
        height float,
        weight float,
        friendship float
        );

INSERT INTO mypokemon (number, name, height, weight, friendship)
VALUES (10, 'caterpie', 0.3, 2.9, -1.455),
		(25, 'pikachu', 0.4, 6, 124.78),
        (26, 'raichu', 0.8, 30, 30.289),
        (125, 'electabuzz', 1.1, 30, -10.67),
        (133, 'eevee', 0.3, 6.5, 15.988),
        (137, 'porygon', 0.8, 36.5, -0.245),
        (152, 'chikorita', 0.9, 6.4, 67.164),
        (153, 'bayleef', 1.2, 15.8, 9.756),
        (172, 'pichu', 0.3, 2, 872.1),
        (470, 'leafeon', 1, 25.5, 3.42);

# ABS(숫자) : 숫자의 절댓값 반환
SELECT name, friendship, ABS(friendship)
FROM mypokemon;

# CEILING(숫자) : 숫자를 정수로 올림해서 반환
# FLOOR(숫자) : 숫자를 정수로 내림해서 반환
SELECT name, friendship, CEILING(friendship), FLOOR(friendship)
FROM mypokemon;

# ROUND(숫자, 자릿수) : 숫자를 소수점 자릿수까지 반올림해서 반환
# TRUNCATE(숫자, 자릿수) : 숫자를 소수점 자릿수까지 버림해서 반환
SELECT name, friendship, ROUND(friendship, 1), TRUNCATE(friendship, 1) -- 0 입력 시, 정수만 반환
FROM mypokemon;

# POWER(숫자A, 숫자B) : 숫자A의 숫자B 제곱 반환
SELECT name, number, POWER(number, 2)
FROM mypokemon;

# MOD(숫자A, 숫자B) : 숫자A를 숫자B로 나눈 나머지 반환
SELECT name, number, MOD(number, 2) -- 2를 기입하면 짝수, 홀수 분간 가능
FROM mypokemon;

## 날짜형 데이터 다루기 (날짜형 함수)
# NOW() : 현재 날짜와 시간 반환
# CURRENT_DATE() : 현재 날짜 반환
# CURRENT_TIME() : 현재 시간 반환
SELECT NOW(), CURRENT_DATE(), CURRENT_TIME();

# YEAR(날짜) : 날짜의 연도 반환
# MONTH(날짜) : 날짜의 월 반환
# MONTHNAME(날짜) : 날짜의 월을 영어로 반환
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), MONTHNAME(NOW());

# DAYNAME(날짜) : 날짜의 요일을 영어로 반환
# DAYOFMONTH(날짜) : 날짜의 일 반환
# DAYOFWEEK(날짜) : 날짜의 요일을 숫자로 반환
# WEEK(날짜) : 날짜가 해당 연도에 몇 번째 주인지 반환
SELECT NOW(), DAYNAME(NOW()), DAYOFMONTH(NOW()), DAYOFWEEK(NOW()), WEEK(NOW());

# HOUR(시간) : 시간의 시 반환
# MINUTE(시간) : 시간의 분 반환
# SECOND(시간) : 시간의 초 반환
SELECT NOW(), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

# DATE_FORMAT(날짜/시간, 형식) : 날짜/시간의 형식을 형식으로 바꿔 반환
SELECT DATE_FORMAT('1996-11-06 17:34:58', '%Y년 %m월 %d일 %H시 %i분 %s초') AS formatted_date;

# DATEDIFF(날짜1, 날짜2) : 날짜1과 날짜2의 차이 반환(날짜1 - 날짜2)
# TIMEDIFF(시간1, 시간2) : 시간1과 시간2의 차이 반환(시간1 - 시간2)
SELECT DATEDIFF('2022-01-01 00:00:00', '2021-12-25 12:00:00') AS DATE_DIFF,
		TIMEDIFF('2022-01-01 00:00:00', '2021-12-25 12:00:00') AS TIME_DIFF;
        

## 실습 예제
USE pokemon;
SELECT *
FROM mypokemon;

# 실습 1 : 포켓몬의 이름을 마지막 3개 문자만, ‘last_char’이라는 별명으로 가져오기
SELECT name, RIGHT(name, 3) AS last_char
FROM mypokemon;

# 실습 2 : 포켓몬 이름을 왼쪽에서 2개 문자를 ‘left2’라는 별명으로 가져오기
SELECT name, LEFT(name, 2) AS left2
FROM mypokemon;

# 실습 3 : 포켓몬 이름에서 이름에 o가 포함된 포켓몬만 모든 소문자 o를 대문자 O로 바꿔서 ’bigO’라는 별명으로 가져오기
# Ex) 이름이 ‘pokemon’일 경우, ’bigO’ 값은 ’pOkemOn’
SELECT name, REPLACE(name, "o", "O") AS bigO
FROM mypokemon
WHERE name LIKE '%o%';

# 실습 4 : 포켓몬 타입을 가장 첫번째 글자 1자, 가장 마지막 글자 1자를 합친후, 대문자로 변환해서 ‘type_code’라는 별명으로 가져오기
# 이 때, 이름도 함께 가져와 주세요.
# Ex) 타입이 ‘water’일 경우, ‘type_code’ 값은 ‘w’와 ‘r’를 대문자로 바꾼 ‘WR’
SELECT name, UPPER(CONCAT(LEFT(type, 1), RIGHT(type, 1))) AS type_code
FROM mypokemon;
# 추가로 코드별로 보고 싶을 떄
SELECT DISTINCT UPPER(CONCAT(LEFT(type, 1), RIGHT(type, 1))) AS type_code
FROM mypokemon;

# 실습 5 : 포켓몬 이름의 글자 수가 8보다 큰 포켓몬의 데이터를 전부 가져오기
SELECT *
FROM mypokemon
WHERE LENGTH(name) > 8;

# 실습 6 : 모든 포켓몬의 공격력 평균을 정수로 반올림해서 ‘avg_of_attack’이라는 별명으로 가져오기
SELECT CEILING(AVG(attack)) AS avg_of_attack 
FROM mypokemon;
# 강사님 정답
SELECT ROUND(AVG(attack)) AS avg_of_attack
FROM mypokemon;

# 실습 7 : 모든 포켓몬의 방어력 평균을 정수로 내림해서 ‘avg_of_defense’이라는 별명으로 가져오기
SELECT FLOOR(AVG(defense)) AS avg_of_defense
FROM mypokemon;

# 실습 8 : 이름의 길이가 8미만인 포켓몬의 공격력의 2 제곱을 ‘attack2’라는 별명으로 가져오기 
# 이 때, 이름도 함께 가져오기
SELECT name, POWER(attack, 2) AS attack2
FROM mypokemon
WHERE LENGTH(name) < 8;

# 실습 9 : 모든 포켓몬의 공격력을 2로 나눈 나머지를 ‘div2’라는 별명으로 가져오기
# 이 때, 이름도 함께 가져오기
SELECT name, MOD(attack, 2) AS div2
FROM mypokemon;

# 실습 10 : 공격력이 50 이하인 포켓몬의 공격력을 방어력으로 뺀 값의 절댓값을 ‘diff’라는 별명으로 가져오기
# 이 때, 이름도 함께 가져오기
SELECT name, ABS(attack - defense) AS diff
FROM mypokemon
WHERE attack <= 50;

# 실습 11 : 현재 날짜와 시간을 가져오기
# 각각 now_date, now_time이라는 별명으로 가져오기
SELECT DATE(NOW()) AS now_date, TIME(NOW()) AS now_time;
# 강사님 정답
SELECT CURRENT_DATE() AS now_date, CURRENT_TIME() AS now_time;


# 실습 12 : 포켓몬을 포획한 달(월, MONTH)을 숫자와 영어로 가져오기
# 숫자는 month_num, 영어는 month_eng이라는 별명으로 가져오기
SELECT MONTH(capture_date) AS month_num, MONTHNAME(capture_date) AS month_eng
FROM mypokemon;

# 실습 13 : 포켓몬을 포획한 날의 요일을 숫자와 영어로 가져오기
# 숫자는 day_num, 영어는 day_eng이라는 별명으로 가져오기
SELECT DAYOFWEEK(capture_date) AS day_num, DAYNAME(capture_date) AS day_eng
FROM mypokemon;

# 실습 14 : 포켓몬을 포획한 날의 연도, 월, 일을 각각 숫자로 가져오기
# 연도는 year, 월은 month, 일은 day라는 별명으로 가져오기
SELECT DATE_FORMAT(capture_date, '%Y년 %m월 %d일') AS 날짜, YEAR(capture_date) AS year, 
		MONTH(capture_date) AS month, DAY(capture_date) AS day
FROM mypokemon;