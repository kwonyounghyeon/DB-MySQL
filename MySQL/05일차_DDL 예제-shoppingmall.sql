drop database if exists shoppingmall_kyh;
create database if not exists shoppingmall_kyh;
use shoppingmall_kyh;

drop table if exists member;
create table if not exists member(
	me_id varchar(15) primary key,
	me_pw varchar(15) not null,
    me_name varchar(30) not null,
    me_birth date not null,
    me_authority varchar(10) not null default 'MEMBER'
);
drop table if exists main_product_category;
create table if not exists main_product_category(
	main_pc_num int auto_increment primary key,
    main_pc_name varchar(20) not null
);
drop table if exists middle_product_category;
create table if not exists middle_product_category(
	middle_pc_num int auto_increment primary key,
    middle_pc_name varchar(20) not null,
    middle_main_pc_num int not null,
    constraint fk_middle_main_pc_num
		foreign key(middle_main_pc_num)
    references main_product_category(main_pc_num)
);
drop table if exists product;
create table if not exists product(
	pr_num int auto_increment primary key,
	pr_name varchar(20) not null,
    pr_contents longtext not null,
    pr_amount int not null,
    pr_price int not null
);
drop table if exists product_option;
create table if not exists product_option(
	po_num int auto_increment primary key,
    po_name varchar(20) not null,
    po_amount int not null,
    po_pr_num int not null,
    constraint fk_po_pr_num
		foreign key (po_pr_num)
		references product(pr_num)
);

drop table if exists inquiry;
create table if not exists inquiry(
	in_num int auto_increment primary key,
    in_reply longtext not null,
    in_state varchar(10) not null,
    in_pw char(4) not null,
    in_contents longtext not null,
    in_me_id varchar(15) not null,
    in_pr_num int not null,
    constraint fk_in_me_id
		foreign key (in_me_id)
		references member(me_id),
    constraint fk_in_pr_num
		foreign key(in_pr_num)
			references product(pr_num)
);

