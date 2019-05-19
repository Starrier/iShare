CREATE DATABASE iShare;

create table user
(
    id       int auto_increment primary key,
    username varchar(45) not null,
    password varchar(45) not null,
    power    varchar(50) not null
);
create table article
(
    id         int auto_increment primary key,
    title      varchar(225) null,
    content    text         null,
    date       varchar(50)  null,
    categoryId int(4)       null,
    summary    text         null,
    author     VARCHAR(50)
)
;
create table comment
(
    id         int auto_increment primary key,
    comment    text        null,
    article_id int         null,
    date       varchar(50) null
)
;
create table category
(
    id           int auto_increment primary key,
    name         varchar(225) null,
    display_name varchar(225) null
)

