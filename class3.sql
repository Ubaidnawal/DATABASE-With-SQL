

create Table student(

student_id INT Auto_INCREMENT PRIMARY KEY,
name varchar(100)  NOT NULL,
age INT check (>=5),
email varchar(50) UNIQUE,
group varchar(16) 
);

INSERT INTO STUDENT(name,age,email,`group`)
("ubaid",30, "ali@gmail.com","A"),
("affan",10, "ali@gmail.com","A"),
("bazil",80, "ali@gmail.com","A"),
("imran",42, "ali@gmail.com","A"),
("hamza",17, "ali@gmail.com","A")

