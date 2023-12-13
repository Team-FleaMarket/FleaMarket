CREATE DATABASE fleamarket;
USE fleamarket;

CREATE TABLE students (
	id INTEGER AUTO_INCREMENT,
	student_no VARCHAR(30),
	password VARCHAR(30),
	email VARCHAR(30),
	phone VARCHAR(30),
	name VARCHAR(30),
	wechat VARCHAR(30),
	PRIMARY KEY(id)
) CHARACTER SET utf8mb4;

CREATE TABLE goods
(
    id           INTEGER AUTO_INCREMENT,
    student_no   VARCHAR(100),
    goods_name   VARCHAR(100),
    description  VARCHAR(100),
    price        DOUBLE,
    status       INTEGER,
    cate         VARCHAR(100),
    image_path   VARCHAR(100),
    goods_status INTEGER,
    degree       INTEGER,
    distributed  INTEGER DEFAULT 0,
    buyer_no     VARCHAR(100),
    PRIMARY KEY (id)
) CHARACTER SET utf8mb4;

create table admin
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100)
);
