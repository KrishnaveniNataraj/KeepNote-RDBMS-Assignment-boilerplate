use NotesApp;
INSERT INTO `NotesApp`.`User`
(`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`)VALUES
(101,'krishna',sysdate(),'root123',8883906256);

INSERT INTO `NotesApp`.`User`
(`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`)VALUES
(102,'priya',sysdate(),'root123',8667710088);

INSERT INTO `NotesApp`.`User`
(`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`)VALUES
(103,'Selva',sysdate(),'root123',9786090713);

INSERT INTO `NotesApp`.`User`
(`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`)VALUES
(104,'Kumar',sysdate(),'root123',9080198240);

INSERT INTO `NotesApp`.`User`
(`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`)VALUES
(105,'Gayu',sysdate(),'root123',9526741582);

select * from User;


INSERT INTO `NotesApp`.`Note`
(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)
VALUES
(201,'Note1','Note1 contents','active',sysdate());

INSERT INTO `NotesApp`.`Note`
(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)
VALUES
(202,'Note2','Note2 contents','InActive',sysdate());

INSERT INTO `NotesApp`.`Note`
(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)
VALUES
(203,'Note1','Note3 contents','active',sysdate());

INSERT INTO `NotesApp`.`Note`
(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)
VALUES
(204,'Note2','Note4 contents','InActive',sysdate());

INSERT INTO `NotesApp`.`Note`
(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)
VALUES
(205,'Note5','Note5 contents','InActive',sysdate());

select * from Note;

INSERT INTO `NotesApp`.`Category`
(`category_id`,`category_name`,`category_descr`,`category_creation_date`,`category_creator`)
VALUES
(301,'personal','personal description',sysdate(),101);


INSERT INTO `NotesApp`.`Category`
(`category_id`,`category_name`,`category_descr`,`category_creation_date`,`category_creator`)
VALUES
(302,'official','official description',sysdate(),102);


INSERT INTO `NotesApp`.`Category`
(`category_id`,`category_name`,`category_descr`,`category_creation_date`,`category_creator`)
VALUES
(303,'Social','social description',sysdate(),103);


INSERT INTO `NotesApp`.`Category`
(`category_id`,`category_name`,`category_descr`,`category_creation_date`,`category_creator`)
VALUES
(304,'personal','personal description',sysdate(),104);

INSERT INTO `NotesApp`.`Category`
(`category_id`,`category_name`,`category_descr`,`category_creation_date`,`category_creator`)
VALUES
(305,'personal','personal description',sysdate(),105);

select * from Category;

INSERT INTO `NotesApp`.`Reminder`
(`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`)
VALUES
(401,'remind1','remind1 desc','daily',sysdate(),101);

INSERT INTO `NotesApp`.`Reminder`
(`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`)
VALUES
(402,'remind2','remind2 desc','weekly',sysdate(),102);

INSERT INTO `NotesApp`.`Reminder`
(`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`)
VALUES
(403,'remind3','remind3 desc','daily',sysdate(),103);

INSERT INTO `NotesApp`.`Reminder`
(`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`)
VALUES
(404,'remind4','remind4 desc','weekly',sysdate(),104);

select * from Reminder;

INSERT INTO `NotesApp`.`NoteCategory`
(`note_id`,`category_id`)
VALUES
(201,301);

INSERT INTO `NotesApp`.`NoteCategory`
(`note_id`,`category_id`)
VALUES
(202,302);

select * from NoteCategory;


INSERT INTO `NotesApp`.`NoteReminder`
(`note_id`,`reminder_id`)
VALUES
(201,401);

INSERT INTO `NotesApp`.`NoteReminder`
(`note_id`,`reminder_id`)
VALUES
(202,402);

select * from NoteReminder;


INSERT INTO `NotesApp`.`UserNote`
(`user_id`,`note_id`)
VALUES
(101,201);

INSERT INTO `NotesApp`.`UserNote`
(`user_id`,`note_id`)
VALUES
(102,202);

select * from UserNote;

/*basic quries*/

select * from User where user_name='kumar' and user_password='root1236';


select * from Note where note_creation_date='2019-02-05';

select * from Category where category_creation_date > '2019-02-04';

select note_id from UserNote where user_id='102';

UPDATE Note SET `note_title`='Note3 title', `note_content`='Note3 content desc' WHERE `note_id`='203';

/* Realational queries*/

select n.note_id,n.note_title ,n.note_content from Note as n join UserNote as u on u.note_id=n.note_id  where user_id='102';

select n.note_id,n.note_title ,n.note_content from Note as n join NoteCategory as nc on nc.note_id=n.note_id  where category_id='302';

select r.reminder_id,r.reminder_name,r.reminder_descr,r.reminder_creator,reminder_creation_date,r.reminder_type from 
Reminder as r join NoteReminder as nr on nr.reminder_id=r.reminder_id where note_id='202';

select * from Reminder where reminder_id='403';

insert into Note (`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`) values(207,"Note7", "Note7 contents", 'active', "2019-06-06");
insert into UserNote (user_id, note_id) values(105, last_insert_id());

insert into Note(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`) values( 208,"Note8", "note8 content", "active", "2019-06-05");
insert into NoteCategory(note_id, category_id) values(last_insert_id(), 1);

insert into Reminder (`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`)  values(407,"remind7", "remind7 desc", "daily", "2019-01-03", 1);
insert into NoteReminder (`note_id`,`reminder_id`) values(208,last_insert_id());

delete from UserNote where user_id=103 AND note_id=204;
delete from NoteReminder where note_id=204;
delete from NoteCategory where note_id=204;
delete from Note where note_id=204;


delete from NoteCategory where category_id=302 AND note_id=202;
delete from NoteReminder where note_id=202;
delete from UserNote where note_id=202;
delete from Note where note_id=202;

/* Triggers*/
create trigger delete_note before delete on Note for each row Begin delete from UserNote where note_id = old.note_id; 
delete from NoteReminder where note_id=old.note_id;
end;

delete from Note where note_id=206;

create trigger delete_user before delete on User for each row Begin delete from UserNote where note_id=old.user_id; delete from NoteReminder where note_id=old.user_id;  
delete from Category where category_creator=old.user_id; 
delete from NoteCategory where note_id=old.user_id; 
end;

delete from User where user_id=105;















