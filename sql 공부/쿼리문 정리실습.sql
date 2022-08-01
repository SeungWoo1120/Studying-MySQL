select CountryCode, avg(Population) as 'Average'
from city
group by CountryCode;

select CountryCode, avg(Population)
from city
group by CountryCode;

select CountryCode, name, sum(Population)
from city
group by CountryCode, name with rollup;

select *
from city
join country on city.countryCode = Country.Code
join countrylanguage on city.CountryCode = countrylanguage.CountryCode;

select locate('abc', 'abcsdfafdbabc');
select replace('MTSQL', 'MT', 'My');

select trim('    MY SQL    '),
trim(LEADING '#' From '##MySQL##'),
trim(Trailing '#' From '##MySQL##');

select format(1245135134.123155,4);

select floor(123.55), ceil(10.41), round(14.61);
select sqrt(4), pow(2,3), exp(3), log(10);
select sin(pi()/2), cos(pi()), tan(pi()/4);

select abs(-145), rand(), round(rand()*100, 0);

select now(), curdate(), curtime();
select
now(),
date(now()),
month(now()),
day(now()),
hour(now()),
minute(now()),
second(now());

select 
monthname(now()),
dayname(now());

select
dayofmonth(now()),
dayofweek(now()),
dayofyear(now());

select
date_format(now(), '%d %y %h %m %s');

#sql 고급
create table city2 as select * from city;

select *
from city2;

create database cha;
show databases;
use cha; 

select * from test;

create table test2 (
	id int not null primary key,
    col1 int null,
    col2 float null,
    col3 varchar(45) null
);

select * from test2;

alter table test2
add col4 int null;

desc test2;

alter table test2
modify col4 varchar(20) null;

alter table test2
drop col4;

create index col1idx
on test (col1);

show index from test;

create unique index col2idx
on test (col2);

create view testView as
select Col1
from test;


alter view testView as
select 'Col1', 'Col2', 'Col3'
from test;

select * from testView;

drop view testView;


use world;
desc Country;

create view ChaView as 
select city.Name, country.SurfaceArea, city.Population, CountryLanguage.language
from city
join Country on city.CountryCode = Country.Code
join CountryLanguage on city.CountryCode = CountryLanguage.CountryCode
where city.CountryCode = 'KOR';

select * from ChaView;

use cha;

insert into test
value(1, 123, 1.1, 'test');

select * from test;

insert into test2 select * from test;

select * from test2;

update test
set col1 = 1, co2 = 1.0, col3 = 'test'
where id = 1;

delete from test
where id = 1;

truncate table test; # delete랑 다르게 복구안됨 용량자체를

drop table test;
select * from test; 

drop database cha; #삭제!