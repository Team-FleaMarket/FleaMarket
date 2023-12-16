CREATE DATABASE fleamarket;
USE fleamarket;

CREATE TABLE students
(
    id         INTEGER AUTO_INCREMENT,
    student_no VARCHAR(30),
    password   VARCHAR(30),
    email      VARCHAR(30),
    phone      VARCHAR(30),
    name       VARCHAR(30),
    wechat     VARCHAR(30),
    img        INTEGER DEFAULT 0, -- 是否有头像
    PRIMARY KEY (id)
) CHARACTER SET utf8mb4;

CREATE TABLE goods
(
    id           INTEGER AUTO_INCREMENT,
    is_delete    INTEGER DEFAULT 0,
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
    added_time   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sale_time    TIMESTAMP,
    PRIMARY KEY (id)
) CHARACTER SET utf8mb4;

create table admin
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

create table cart
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    student_no VARCHAR(100),
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
