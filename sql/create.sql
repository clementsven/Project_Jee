drop table if exists users;
drop table if exists activity;
drop table if exists place;
drop table if exists activity_place;
drop table if exists friends;
drop table if exists notif;

create table users (
    first_name varchar(255),
    last_name varchar(255),
    username varchar(255) not null,
    pass_hash varchar(255) not null,
    profil_picture varchar(255),
    birth_date date,
    admin int,
    constraint pk_user_pseudo primary key (username)
);

create table activity (
    id int auto_increment not null,
    creator varchar(255),
    date_begin date,
    date_end date,
    name varchar (255),
    constraint pk_acti_id primary key (id)
);

create table place (
    id int auto_increment not null,
    adress varchar(255),
    name varchar(255),
    gps varchar(255),
    constraint pk_place_id primary key (id)
);

create table activity_place (
    id_place int not null,
    id_activity int not null,
    constraint pk_actiplace_id1 primary key (id_place, id_activity)
);

create table friends (
    user_1 varchar(255) not null,
    user_2 varchar(255) not null,
    status int,
    constraint pk_friend_1 primary key (user_1, user_2)
);

create table notif (
    id int auto_increment not null,
    date date,
    msg varchar(255),
    username varchar(255),
    constraint pk_notif_id primary key (id)
);
