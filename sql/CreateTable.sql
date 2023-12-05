CREATE TABLE users (
	studentNo VARCHAR(100),
	password VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(100),
	username VARCHAR(100),
	weixin VARCHAR(100),
	PRIMARY KEY(studentNo)
) CHARACTER SET utf8mb4;

CREATE TABLE goods (
	studentNo VARCHAR(100),
	goodsName VARCHAR(100),
	description VARCHAR(100),
	price DOUBLE,
	status INTEGER,
	cate VARCHAR(100),
	imagepath VARCHAR(100),
	goodsStatus INTEGER,
	degree INTEGER,
	PRIMARY KEY(studentNo)
) CHARACTER SET utf8mb4;