-- as per assignment 3 solution
create table Video(
videoId char(8) primary key,
title varchar2(100) not null,
classfication varchar2(10) not null,
description varchar2(1000) not null,
constraint CHK_classification check (classfication in ('PG-13', 'TV-Y7-FV', 'TV-PG', 'TV-Y7', 'TV-14')) -- modified 'TV - Y7' to 'TV-Y7' by HCJ
);
create table Tags (
videoId char(8) references Video(videoId) on delete cascade, tag varchar2(20),
primary key (videoId, tag)
);
create table Movie (
videoId char(8) primary key references Video(videoId) on delete cascade, runtime number(5,2) not null,
dateOfRelease date not null,
sequel varchar2(150) --modified by HCJ
);
create table TVShow (
videoId char(8) primary key references Video(videoId) on delete cascade, episodeNo int not null,
seasonNo int not null,
runtime number(6,2) not null,
dateOfRelease date not null
);
create table CastMember ( castId char(8) primary key, castName varchar2(20) not null );
create table Acts (
role char(8) not null,
castId char(8) references CastMember (castId) on delete cascade, videoId char(8) references video(videoId) on delete cascade, primary key (role, castId, videoId)
);
create table Account (
username varchar2(20) primary key, name varchar2(40) not null,
email varchar2(50) not null unique, birthdate date not null, registrationDate date not null
);
create table Watches (
username varchar2(20) references Account(username) on delete cascade, videoId char(8) references Video(videoId) on delete cascade, timestamps number(6,2) not null,
primary key (username,videoId)
);
create table Free (
-- since the A3 solution didn't specify on delete cascade for either Free or Premium accounts, need to manually add it
username varchar2(20) primary key references Account(username) on delete cascade );
create table Premium (
username varchar2(20) primary key references Account(username) on delete cascade );
create table Friends (
username1 varchar2(20) references Premium(username), username2 varchar2(20) references Premium(username), primary key (username1, username2)
);
create table PlayList (
username varchar2(20) references Premium(username) on delete cascade, playListName varchar2(40) not null,
videoId char(8) references Video(videoId) on delete cascade,
primary key (username, playListName, videoId));

