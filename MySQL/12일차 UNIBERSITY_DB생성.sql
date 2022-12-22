drop database if exists university;

create database if not exists university;

use university;
DROP TABLE IF EXISTS `Student`;

CREATE TABLE `Student` (
	`st_num`	char(10)	NOT NULL,
	`st_name`	varchar(20)	not NULL,
	`st_semester`	int not null default 1,
	`st_state`	varchar(10) not null default '재학',
	`st_pr_num`	char(10) NULL
);

DROP TABLE IF EXISTS `Professor`;

CREATE TABLE `Professor` (
	`pr_num`	char(10)	NOT NULL,
	`pr_name`	varchar(20)	NULL,
	`pr_state`	varchar(10)	NULL,
	`pr_de_num`	char(3)	NOT NULL,
	`pr_tel`	varchar(13)	NULL
);

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
	`de_num`	char(3)	NOT NULL,
	`de_name`	varchar(20)	not NULL,
	`de_address`	varchar(50)	not NULL,
	`de_tel`	varchar(13)	not NULL,
	`de_pr_num`	char(10) NULL
);

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
	`ma_num`	int	auto_increment primary key,
	`ma_st_num`	varchar(10)	NOT NULL,
	`ma_de_num`	char(3)	NOT NULL,
	`ma_state`	varchar(10)	not NULL default '전공'
);

DROP TABLE IF EXISTS `lecture`;

CREATE TABLE `lecture` (
	`le_num`	int	auto_increment primary key,
	`le_name`	varchar(20) not	NULL,
	`le_schedule`	varchar(50) not	NULL default '',
	`le_point`	int	not NULL default 0,
	`le_class`	int	not NULL default 1,
	`le_year`	int	not NULL,
	`le_term`	varchar(10) not null,
	`le_pr_num`	char(10)	NOT NULL
);

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
	`co_num`	int	auto_increment primary key,
	`co_st_num`	char(10)	NOT NULL,
	`co_le_num`	int	NOT NULL,
	`co_type`	varchar(5)	NULL default '학점',
	`co_grade`	varchar(5)	NULL default ''
);

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
	`sc_num`	int	auto_increment primary key,
	`sc_mid`	int not null default 0,
	`sc_final`	int not null default 0,
	`sc_project`	int not null default 0,
	`sc_attendance`	int not null default 0,
	`sc_total`	int not null default 0,
	`sc_co_num`	int	NOT NULL
);

ALTER TABLE `Student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
	`st_num`
);

ALTER TABLE `Professor` ADD CONSTRAINT `PK_PROFESSOR` PRIMARY KEY (
	`pr_num`
);

ALTER TABLE `department` ADD CONSTRAINT `PK_DEPARTMENT` PRIMARY KEY (
	`de_num`
);

ALTER TABLE `Student` ADD CONSTRAINT `FK_Professor_TO_Student_1` FOREIGN KEY (
	`st_pr_num`
)
REFERENCES `Professor` (
	`pr_num`
);

ALTER TABLE `Professor` ADD CONSTRAINT `FK_department_TO_Professor_1` FOREIGN KEY (
	`pr_de_num`
)
REFERENCES `department` (
	`de_num`
);

ALTER TABLE `department` ADD CONSTRAINT `FK_Professor_TO_department_1` FOREIGN KEY (
	`de_pr_num`
)
REFERENCES `Professor` (
	`pr_num`
);

ALTER TABLE `major` ADD CONSTRAINT `FK_Student_TO_major_1` FOREIGN KEY (
	`ma_st_num`
)
REFERENCES `Student` (
	`st_num`
);

ALTER TABLE `major` ADD CONSTRAINT `FK_department_TO_major_1` FOREIGN KEY (
	`ma_de_num`
)
REFERENCES `department` (
	`de_num`
);

ALTER TABLE `lecture` ADD CONSTRAINT `FK_Professor_TO_lecture_1` FOREIGN KEY (
	`le_pr_num`
)
REFERENCES `Professor` (
	`pr_num`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_Student_TO_course_1` FOREIGN KEY (
	`co_st_num`
)
REFERENCES `Student` (
	`st_num`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_lecture_TO_course_1` FOREIGN KEY (
	`co_le_num`
)
REFERENCES `lecture` (
	`le_num`
);

ALTER TABLE `score` ADD CONSTRAINT `FK_course_TO_score_1` FOREIGN KEY (
	`sc_co_num`
)
REFERENCES `course` (
	`co_num`
);

