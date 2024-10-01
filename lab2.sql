--1
create database lab2;
--2
create table countries(
	country_id serial primary key,
	country_name text,
	region_id integer,
	population integer
);

select * from countries;

--3
insert into countries(country_name, region_id, population)
values ('Japan', 81, 122631432);

--4
insert into countries(country_id, country_name)
values (25, 'Germany');

--5
insert into countries(region_id)
values (64);
 
--6
insert into countries(country_name, region_id, population)
values 
	('A', 1, 123),
	('B', 2, 456),
	('C', 3, 789);

--7
alter table countries
alter column country_name set default 'Kazakhstan';

--8
insert into countries(country_name)
values (default);

--9
insert into countries default values;

--10
create table countries_new (like countries including all);

--11
insert into countries_new select * from countries;

--12
update countries
set region_id = 1
where region_id is null;

--13
select country_name, 
       population * 1.10 as "New Population"
from countries;

--14
delete from countries
where population < 100000;

--15
delete from countries_new
using countries
where countries_new.country_id = countries.country_id
returning *;

--16
delete from countries
returning *;

select * from countries;
select * from countries_new;