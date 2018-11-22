delete from user_role;
delete from usr;

insert into usr (id, active, password, username) values (1, true, '$2a$08$kQHLrNQpvwIDTWfqdp5gNeJylJ3VEkd.pBHHw4KrUdo8oQ13ubUJS', 'dima'),
 (2, true, '$2a$08$kQHLrNQpvwIDTWfqdp5gNeJylJ3VEkd.pBHHw4KrUdo8oQ13ubUJS', 'vika');

insert into user_role (user_id, roles) values (1, 'USER'),(1, 'ADMIN'), (2, 'USER');