drop table 학원생;

create table 학원생(
	id bigserial, --bigserial은 postgreSQL에서만 사용할 수 있는 자동 증가하는 숫자입니다.
	학원생이름 varchar(25), 
	폰번호 varchar(13), 
	나이 int,
	학교이름 varchar(25),
	학년 int, 
	반 int,
	번호 int
);
select * from 학원생;

insert into 학원생(학원생이름, 폰번호, 나이, 학교이름, 학년, 반, 번호)
values('홍길동', '010-1237-6542', 19, '송원고', 3, 1, 10),
      ('김하나', '010-3218-8765', 18, '한빛고', 2, 2, 7),
	  ('홍길동', '010-4587-9834', 19, '송원고', 1, 3, 31),
	  ('박순희', '010-7798-6754', 17, '이슬고', 1, 3, 16);

create table 학교(
	id bigserial -- bigserial은 PostgreSQL에서만 사용할 수 있는 자동 증가하는 숫자입니다. 
	학교명 varchar(25),
	분류 int,
	학생수 numeric, -- int는 약간 작은 정수이어서 numeric
	주소 varchar(100)
);

insert into 학교(학교명, 분류, 학생수, 주소)
values ('송원고', 3, 435, '경기 성남 분당구 황새올로 123'),
       ('한빛고', 2, 377, '경기 성남 분당구 판교역로 67'),
	   ('이슬고', 1, 507, '경기 성남 분당구 미금로 567');

select * from 학교; --기본 SQL 명령
table 학교; --postgreSQL 쉬운 명령

--기본키와 외래키 추가 
alter table 학원생 
add constarint 폰번호_키 primary key (폰번호);

table 학원생;

alter table 학교 
add constarint   폰번명_키 primary key (학교명);

table 학교

alter table 학교
add constraint 학교_학원생_FK foreign key (학원생, 학교이름)
references 학원생 (학교이름)
on delete cascade;
	  

