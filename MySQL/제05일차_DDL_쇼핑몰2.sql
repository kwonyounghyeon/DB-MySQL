drop database if exists small_jik;
create database if not exists small_jik;

use small_jik;

drop table if exists member;
create table if not exists member(
	me_id varchar(15) primary key,
    me_pw varchar(15) not null,
    me_name varchar(15),
    me_birth date,
    me_authority varchar(15) not null default 'MEMBER',
    me_point int not null default 0
);
drop table if exists main_category;
create table if not exists main_category(
	mc_num int auto_increment primary key,
    mc_name varchar(15) not null
);
drop table if exists sub_category;
create table if not exists sub_category(
	sc_num int auto_increment primary key,
    sc_name varchar(15) not null,
    sc_mc_num int not null,
    foreign key (sc_mc_num) references main_category(mc_num)
);
drop table if exists product;
create table if not exists product(
	pr_num int auto_increment primary key,
	pr_title varchar(50) not null,
    pr_contents longtext not null,
    pr_reg_date datetime not null default now(),
    pr_amount int not null default 0,
    pr_price int not null default 0,
    pr_sc_num int not null,
    foreign key(pr_sc_num) references sub_category(sc_num)
);
drop table if exists product_option;
create table if not exists product_option(
	po_num int auto_increment primary key,
    po_title varchar(50) not null,
    po_amount int not null default 0,
    po_pr_num int not null,
	foreign key (po_pr_num)	references product(pr_num)
);
drop table if exists address_book;
create table if not exists address_book(
	ab_num int auto_increment primary key,
    ab_name varchar(15) not null,
    ab_address varchar(100) not null,
    ab_post_num char(5) not null,
    ab_me_id varchar(15) not null,
    foreign key (ab_me_id) references member(me_id)
);
drop table if exists basket;
create table if not exists basket(
ba_num int auto_increment primary key,
ba_amount int not null default 0,
ba_me_id varchar(15) not null,
ba_po_num int not null,
foreign key(ba_me_id) references member(me_id),
foreign key(ba_po_num) references product_option(po_num)
);
drop table if exists `order`;
create table if not exists `order`(
or_num int auto_increment primary key,
or_totalmembermember_price int not null,
or_price int not null,
or_use_point int not null,
or_add_point int not null,
or_state varchar(15) not null default '결제 완료',
or_me_id varchar(15) not null,
or_ab_num int not null,
foreign key(or_me_id) references member(me_id),
foreign key(or_ab_num) references address_book(ab_num)
);
drop table if exists order_list;
create table if not exists order_list(
ol_num int auto_increment primary key,
ol_amount int not null,
ol_price int not null,
ol_po_num int not null,
ol_or_num int not null,
foreign key(ol_po_num) references product_option(po_num),
foreign key(ol_or_num) references `order`(or_num)
);