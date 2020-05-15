/*Create db*/
create database if not exists cuteJ_shop
default character set utf8mb4
default collate utf8mb4_general_ci;

/*Create user*/
create user if not exists `cuteJ_shop`@`127.0.0.1` identified by 'cuteJ_shop123';
grant alter, alter routine, create, create routine, create temporary tables, create view, delete, drop, grant option, index, insert, lock tables, references, select, show view, trigger, update on `cuteJ_shop`.* to `cuteJ_shop`@`127.0.0.1`;
