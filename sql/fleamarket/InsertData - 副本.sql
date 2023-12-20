CREATE DATABASE fleamarket;
USE fleamarket;

CREATE TABLE students
(
    id         INTEGER AUTO_INCREMENT,
    student_no VARCHAR(30),
    password   VARCHAR(30),
    email      VARCHAR(50),
    phone      VARCHAR(30),
    name       VARCHAR(30),
    wechat     VARCHAR(30),
    img        INTEGER DEFAULT 0, -- 是否有头像
    image_path VARCHAR(200),
    department VARCHAR(30),
    qq VARCHAR(30),
    description VARCHAR(500),
    PRIMARY KEY (id)
) CHARACTER SET utf8mb4;

CREATE TABLE goods
(
    id           INTEGER AUTO_INCREMENT,
    is_delete    INTEGER DEFAULT 0,
    student_no   VARCHAR(30),
    goods_name   VARCHAR(30),
    description  VARCHAR(500),
    price        DOUBLE,
    status       INTEGER,
    cate         VARCHAR(5),
    image_path   VARCHAR(200),
    goods_status INTEGER,
    degree       INTEGER,
    distributed  INTEGER DEFAULT 0,
    buyer_no     VARCHAR(30),
    added_time   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sale_time    TIMESTAMP,
    PRIMARY KEY (id)
) CHARACTER SET utf8mb4;

create table admin
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) UNIQUE,
    password VARCHAR(30)
);

create table cart
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    student_no VARCHAR(30),
    goods_id   INTEGER,
    num        INTEGER
);

create table orders
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    seller_id  INTEGER,
    buyer_id   INTEGER,
    goods_id   INTEGER,
    seller_confirm     INTEGER,
    buyer_confirm      INTEGER,
    is_cancel       INTEGER,
    is_delete          INTEGER,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
