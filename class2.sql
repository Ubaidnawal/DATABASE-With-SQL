

create table Movies(
id int primary key auto_increment,
name varcher(100) not null,
duration int default 60,
ratings double default 2.0,
createdAt TIMESTAMP default CURRENT_STAMP
);



insert into Movies (name,duration,ratings)
values ("Batman",130,4.5),
 ("money heist",150,4.7),
 ("3idots",160,4.8),
 ("flash",150,4.9),
 ("kgf",160,4.10);
