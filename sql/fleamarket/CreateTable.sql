CREATE DATABASE fleamarket;
USE fleamarket;
CREATE TABLE users (
	id INTEGER AUTO_INCREMENT,
	student_no VARCHAR(100),
	password VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(100),
	user_name VARCHAR(100),
	wechat VARCHAR(100),
	PRIMARY KEY(id)
) CHARACTER SET utf8mb4;

CREATE TABLE goods (
	id INTEGER AUTO_INCREMENT,
	student_no VARCHAR(100),
	goods_name VARCHAR(100),
	description VARCHAR(100),
	price DOUBLE,
	status INTEGER,
	cate VARCHAR(100),
	image_path VARCHAR(100),
	goods_status INTEGER,
	degree INTEGER,
	PRIMARY KEY(id)
) CHARACTER SET utf8mb4;

