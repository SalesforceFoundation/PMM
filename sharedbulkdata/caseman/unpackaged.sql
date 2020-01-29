BEGIN TRANSACTION;
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"Email" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Gender__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'thiggins@example.com','Tom','Higgins','Male');
INSERT INTO "Contact" VALUES(2,'lhiggins@example.com','Lisa','Higgins','');
INSERT INTO "Contact" VALUES(3,'angelaadams@example.com','Angela','Adams','');
INSERT INTO "Contact" VALUES(4,'jeremyadams@example.com','Jeremy','Adams','');
INSERT INTO "Contact" VALUES(5,'','Arthur','Baker','');
INSERT INTO "Contact" VALUES(6,'alanbaker@example.com','Arlene','Baker','');
INSERT INTO "Contact" VALUES(7,'robinbanks@example.com','Robin','Banks','');
INSERT INTO "Contact" VALUES(8,'darrylgraham@example.com','Darryl','Graham','');
INSERT INTO "Contact" VALUES(9,'lynnbarnes@example.com','Lynn','Barnes','');
INSERT INTO "Contact" VALUES(10,'davidbarnes@example.com','David','Barnes','');
INSERT INTO "Contact" VALUES(11,'jasonbarnes@example.com','Jason','Barnes','Male');
INSERT INTO "Contact" VALUES(12,'anneboyd@example.com','Anne','Boyd','Female');
INSERT INTO "Contact" VALUES(13,'normaburke@example.com','Norma','Burke','Non-binary');
INSERT INTO "Contact" VALUES(14,'bobbyhenderson@example.com','Bobby','Henderson','Male');
INSERT INTO "Contact" VALUES(15,'anthonyhill@example.com','Anthony','Hill','');
INSERT INTO "Contact" VALUES(16,'virginiaholmes@example.com','Virginia','Holmes','');
INSERT INTO "Contact" VALUES(17,'josejenkins@example.com','Jose','Jenkins','');
INSERT INTO "Contact" VALUES(18,'craigjohnso@example.com','Craig','Johnson','');
INSERT INTO "Contact" VALUES(19,'','Maya','Johnson','');
INSERT INTO "Contact" VALUES(20,'barbarajohnson@example.com','Barbara','Johnson','');
COMMIT;
