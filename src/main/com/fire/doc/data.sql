create database java_test;

create table tb_user(
                        userId int PRIMARY KEY AUTO_INCREMENT COMMENT "用户ID",
                        userName varchar(20) NOT NULL COMMENT "用户姓名",
                        userPwd varchar(30) NOT NULL COMMENT "用户密码",
                        userAge int(11) DEFAULT 18 COMMENT "用户年龄"
);

insert into tb_user (userId,userName,userPwd,userAge) values(1,"admin","admin",18);
insert into tb_user (userId,userName,userPwd,userAge) values(2,"zhangsan","123456",18);