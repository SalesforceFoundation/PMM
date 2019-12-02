BEGIN TRANSACTION;
CREATE TABLE caseman__account_program_offerings (
	id INTEGER NOT NULL, 
	accountrole__c VARCHAR(255), 
	account__c VARCHAR(255), 
	program_offering__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__account_program_offerings" VALUES(1,'Funder','4','8');
INSERT INTO "caseman__account_program_offerings" VALUES(2,'Funder','5','2');
INSERT INTO "caseman__account_program_offerings" VALUES(3,'Funder','5','8');
INSERT INTO "caseman__account_program_offerings" VALUES(4,'Location','6','2');
INSERT INTO "caseman__account_program_offerings" VALUES(5,'Service Provider','6','2');
INSERT INTO "caseman__account_program_offerings" VALUES(6,'Service Provider','6','5');
CREATE TABLE caseman__action_item_templates (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__action_item_templates" VALUES(1,'Meet job requirement standards');
INSERT INTO "caseman__action_item_templates" VALUES(2,'Complete Stability Assessment');
INSERT INTO "caseman__action_item_templates" VALUES(3,'Month 6: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(4,'Month 2: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(5,'Month 1: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(6,'Get an job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES(7,'Open a bank account');
INSERT INTO "caseman__action_item_templates" VALUES(8,'Meet with legal assistance advisor');
INSERT INTO "caseman__action_item_templates" VALUES(9,'Read and interpret a banking account statement');
INSERT INTO "caseman__action_item_templates" VALUES(10,'Month 2: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(11,'Month 1: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(12,'Month 3: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(13,'Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__action_item_templates" VALUES(14,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES(15,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES(16,'Pass English proficiency exam with a score of 65 or above');
INSERT INTO "caseman__action_item_templates" VALUES(17,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES(18,'Month 4: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(19,'Month 4: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(20,'Month 1: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(21,'Month 5: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(22,'Month 5: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(23,'Month 3: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(24,'Month 6: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(25,'Month 6: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(26,'Month 2: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(27,'Open a Savings Account');
INSERT INTO "caseman__action_item_templates" VALUES(28,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES(29,'Complete Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(30,'Pass an age appropriate reading proficiency exam');
INSERT INTO "caseman__action_item_templates" VALUES(31,'Maintain 2 years active engagement in workforce');
INSERT INTO "caseman__action_item_templates" VALUES(32,'Meet with Financial Advisor');
INSERT INTO "caseman__action_item_templates" VALUES(33,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES(34,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES(35,'Get a passing grade in Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(36,'Register for Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(37,'Pass basic financial literacy course');
INSERT INTO "caseman__action_item_templates" VALUES(38,'Complete online job applications to at least 3 appropriate job openings');
INSERT INTO "caseman__action_item_templates" VALUES(39,'Month 3: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(40,'Month 4: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(41,'Month 5: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(42,'Get a job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES(43,'Complete resume workshop');
INSERT INTO "caseman__action_item_templates" VALUES(44,'Complete interview workshop');
INSERT INTO "caseman__action_item_templates" VALUES(45,'Pass mock interview');
INSERT INTO "caseman__action_item_templates" VALUES(46,'Update resume');
CREATE TABLE caseman__action_items (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"DueDate__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__action_items" VALUES(1,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','9','3','5','3');
INSERT INTO "caseman__action_items" VALUES(2,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','9','3','5','10');
INSERT INTO "caseman__action_items" VALUES(3,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','9','3','5','11');
INSERT INTO "caseman__action_items" VALUES(4,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','9','3','5','39');
INSERT INTO "caseman__action_items" VALUES(5,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','9','3','5','40');
INSERT INTO "caseman__action_items" VALUES(6,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','9','3','5','41');
INSERT INTO "caseman__action_items" VALUES(7,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','9','3','6','38');
INSERT INTO "caseman__action_items" VALUES(8,'Get a job readiness coach','Completed','2019-09-05','9','3','6','42');
INSERT INTO "caseman__action_items" VALUES(9,'Complete resume workshop','Not Started','2019-10-11','9','3','6','43');
INSERT INTO "caseman__action_items" VALUES(10,'Complete interview workshop','Not Started','2019-11-04','9','3','6','44');
INSERT INTO "caseman__action_items" VALUES(11,'Pass mock interview','Not Started','2019-11-06','9','3','6','45');
INSERT INTO "caseman__action_items" VALUES(12,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','4','2','3','30');
INSERT INTO "caseman__action_items" VALUES(13,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','9','3','4','4');
INSERT INTO "caseman__action_items" VALUES(14,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','9','3','4','5');
INSERT INTO "caseman__action_items" VALUES(15,'Open a bank account','Completed','2019-09-06','9','3','4','7');
INSERT INTO "caseman__action_items" VALUES(16,'Read and interpret a banking account statement','Not Started','2019-09-30','9','3','4','9');
INSERT INTO "caseman__action_items" VALUES(17,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','9','3','4','12');
INSERT INTO "caseman__action_items" VALUES(18,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','9','3','4','18');
INSERT INTO "caseman__action_items" VALUES(19,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','9','3','4','19');
INSERT INTO "caseman__action_items" VALUES(20,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','9','3','4','20');
INSERT INTO "caseman__action_items" VALUES(21,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','9','3','4','21');
INSERT INTO "caseman__action_items" VALUES(22,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','9','3','4','22');
INSERT INTO "caseman__action_items" VALUES(23,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','9','3','4','23');
INSERT INTO "caseman__action_items" VALUES(24,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','9','3','4','24');
INSERT INTO "caseman__action_items" VALUES(25,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','9','3','4','25');
INSERT INTO "caseman__action_items" VALUES(26,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','9','3','4','26');
INSERT INTO "caseman__action_items" VALUES(27,'Pass basic financial literacy course','In Progress','2019-09-30','9','3','4','37');
INSERT INTO "caseman__action_items" VALUES(28,'Complete resume workshop','Not Started','2019-09-27','10','4','14','43');
INSERT INTO "caseman__action_items" VALUES(29,'Complete interview workshop','Not Started','2019-10-20','10','4','14','44');
INSERT INTO "caseman__action_items" VALUES(30,'Pass mock interview','Not Started','2019-10-31','10','4','14','45');
INSERT INTO "caseman__action_items" VALUES(31,'Update resume','Not Started','2019-10-09','10','4','14','46');
INSERT INTO "caseman__action_items" VALUES(32,'Participate in a 12-step program','In Progress','2019-12-31','10','5','18','13');
INSERT INTO "caseman__action_items" VALUES(33,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','14','6','19','14');
INSERT INTO "caseman__action_items" VALUES(34,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','14','6','19','15');
INSERT INTO "caseman__action_items" VALUES(35,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','14','6','19','17');
INSERT INTO "caseman__action_items" VALUES(36,'Open a Savings Account','Completed','2019-09-09','14','6','19','27');
INSERT INTO "caseman__action_items" VALUES(37,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','14','6','19','37');
INSERT INTO "caseman__action_items" VALUES(38,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','23','7','21','16');
INSERT INTO "caseman__action_items" VALUES(39,'Update resume','Not Started','2019-10-25','9','3','6','46');
INSERT INTO "caseman__action_items" VALUES(40,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','9','3','11','31');
INSERT INTO "caseman__action_items" VALUES(41,'Meet job requirement standards','Not Started','2020-04-15','9','3','11','1');
INSERT INTO "caseman__action_items" VALUES(42,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','10','4','12','4');
INSERT INTO "caseman__action_items" VALUES(43,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','10','4','12','5');
INSERT INTO "caseman__action_items" VALUES(44,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','10','4','12','12');
INSERT INTO "caseman__action_items" VALUES(45,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','10','4','12','20');
INSERT INTO "caseman__action_items" VALUES(46,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','10','4','12','23');
INSERT INTO "caseman__action_items" VALUES(47,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','10','4','12','26');
INSERT INTO "caseman__action_items" VALUES(48,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','10','4','13','3');
INSERT INTO "caseman__action_items" VALUES(49,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','10','4','13','10');
INSERT INTO "caseman__action_items" VALUES(50,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','10','4','13','11');
INSERT INTO "caseman__action_items" VALUES(51,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','10','4','13','39');
INSERT INTO "caseman__action_items" VALUES(52,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','10','4','13','40');
INSERT INTO "caseman__action_items" VALUES(53,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','10','4','13','41');
INSERT INTO "caseman__action_items" VALUES(54,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','10','4','14','38');
INSERT INTO "caseman__action_items" VALUES(55,'Get a job readiness coach','Completed','2019-09-05','10','4','14','42');
CREATE TABLE caseman__appointment_attendees (
	id INTEGER NOT NULL, 
	reason__c VARCHAR(255), 
	role__c VARCHAR(255), 
	status__c VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__appointment_attendees" VALUES(1,'Client','Attendee','Attending','2','7');
INSERT INTO "caseman__appointment_attendees" VALUES(2,'Check in on Jason''s progress with Workplace Readiness.','Attendee','New','3','14');
INSERT INTO "caseman__appointment_attendees" VALUES(3,'','Attendee','New','4','23');
CREATE TABLE caseman__appointments (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	type__c VARCHAR(255), 
	location__c VARCHAR(255), 
	startdatetime__c VARCHAR(255), 
	enddatetime__c VARCHAR(255), 
	description__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__appointments" VALUES(1,'Math Appointment','Scheduled','Corner Office','2020-12-29T16:00:00.000Z','2020-12-29T17:00:00.000Z','We should talk about your grades');
INSERT INTO "caseman__appointments" VALUES(2,'Program Evaluation','Scheduled','AC-1223','2020-12-29T16:00:00.000Z','2020-12-29T17:00:00.000Z','Initial program evaluation');
INSERT INTO "caseman__appointments" VALUES(3,'Check-in with Jason Barnes','Scheduled','127th STreet Community Center, Meeting Room 2-B','2020-08-25T20:00:00.000Z','2020-08-25T21:00:00.000Z','Check-in on Jason''s progress with Workplace Readiness');
INSERT INTO "caseman__appointments" VALUES(4,'Barbara Johnson English Tutor','Scheduled','127th Street Community Center Meeting Room A','2020-07-16T01:00:00.000Z','2020-07-16T02:00:00.000Z','Discuss getting Barbara a tutor to improve her conversational confidence');
CREATE TABLE caseman__branch_accounts (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"Street" VARCHAR(255), 
	"City" VARCHAR(255), 
	"State" VARCHAR(255), 
	"PostalCode" VARCHAR(255), 
	"Country" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"AccountNumber" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__branch_accounts" VALUES(1,'127th Street Community Center','','','','','','','555-398-2090','','','','','','','1500.0','Branch');
CREATE TABLE caseman__branch_contacts (
	id INTEGER NOT NULL, 
	"Roles" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	account_id VARCHAR(255), 
	contact_id VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__branch_contacts" VALUES(1,'','true','0011g00000i7YmEAAU','1');
INSERT INTO "caseman__branch_contacts" VALUES(2,'','true','0011g00000i7Ym0AAE','2');
INSERT INTO "caseman__branch_contacts" VALUES(3,'','true','0011g00000i7Ym1AAE','3');
INSERT INTO "caseman__branch_contacts" VALUES(4,'','true','0011g00000i7Ym2AAE','4');
INSERT INTO "caseman__branch_contacts" VALUES(5,'','true','0011g00000i7Ym2AAE','5');
INSERT INTO "caseman__branch_contacts" VALUES(6,'','true','0011g00000i7Ym3AAE','6');
INSERT INTO "caseman__branch_contacts" VALUES(7,'','true','0011g00000i7Ym3AAE','7');
INSERT INTO "caseman__branch_contacts" VALUES(8,'','true','0011g00000i7Ym4AAE','8');
INSERT INTO "caseman__branch_contacts" VALUES(9,'','true','0011g00000i7Ym4AAE','9');
INSERT INTO "caseman__branch_contacts" VALUES(10,'','true','0011g00000i7Ym5AAE','10');
INSERT INTO "caseman__branch_contacts" VALUES(11,'','true','0011g00000i7Ym5AAE','11');
INSERT INTO "caseman__branch_contacts" VALUES(12,'','true','0011g00000i7Ym6AAE','12');
INSERT INTO "caseman__branch_contacts" VALUES(13,'','true','0011g00000i7Ym6AAE','13');
INSERT INTO "caseman__branch_contacts" VALUES(14,'','true','0011g00000i7Ym6AAE','14');
INSERT INTO "caseman__branch_contacts" VALUES(15,'','true','0011g00000i7Ym7AAE','15');
INSERT INTO "caseman__branch_contacts" VALUES(16,'','true','0011g00000i7Ym8AAE','16');
INSERT INTO "caseman__branch_contacts" VALUES(17,'','true','0011g00000i7Ym9AAE','17');
INSERT INTO "caseman__branch_contacts" VALUES(18,'','true','0011g00000i7YmAAAU','18');
INSERT INTO "caseman__branch_contacts" VALUES(19,'','true','0011g00000i7YmBAAU','19');
INSERT INTO "caseman__branch_contacts" VALUES(20,'','true','0011g00000i7YmCAAU','20');
INSERT INTO "caseman__branch_contacts" VALUES(21,'','true','0011g00000i7YmDAAU','21');
INSERT INTO "caseman__branch_contacts" VALUES(22,'','true','0011g00000i7YmDAAU','22');
INSERT INTO "caseman__branch_contacts" VALUES(23,'','true','0011g00000i7YmDAAU','23');
INSERT INTO "caseman__branch_contacts" VALUES(24,'Other','true','1','7');
INSERT INTO "caseman__branch_contacts" VALUES(25,'','true','1','6');
INSERT INTO "caseman__branch_contacts" VALUES(26,'Client','true','1','9');
INSERT INTO "caseman__branch_contacts" VALUES(27,'Client','true','1','10');
INSERT INTO "caseman__branch_contacts" VALUES(28,'Client','true','1','14');
INSERT INTO "caseman__branch_contacts" VALUES(29,'','true','1','15');
INSERT INTO "caseman__branch_contacts" VALUES(30,'','true','1','16');
INSERT INTO "caseman__branch_contacts" VALUES(31,'Client','true','1','17');
INSERT INTO "caseman__branch_contacts" VALUES(32,'','true','1','18');
INSERT INTO "caseman__branch_contacts" VALUES(33,'','true','1','19');
INSERT INTO "caseman__branch_contacts" VALUES(34,'Client','true','1','20');
INSERT INTO "caseman__branch_contacts" VALUES(35,'Client','true','1','23');
INSERT INTO "caseman__branch_contacts" VALUES(36,'','true','0011g00000iMGGKAA4','25');
INSERT INTO "caseman__branch_contacts" VALUES(37,'','true','0011g00000iMGGLAA4','26');
INSERT INTO "caseman__branch_contacts" VALUES(38,'','true','0011g00000iMGGMAA4','27');
INSERT INTO "caseman__branch_contacts" VALUES(39,'','true','0011g00000iMGGNAA4','28');
INSERT INTO "caseman__branch_contacts" VALUES(40,'','true','0011g00000iMGGOAA4','29');
INSERT INTO "caseman__branch_contacts" VALUES(41,'','true','0011g00000iMGGPAA4','30');
INSERT INTO "caseman__branch_contacts" VALUES(42,'','true','0011g00000iMGGQAA4','31');
INSERT INTO "caseman__branch_contacts" VALUES(43,'','true','0011g00000iMGGRAA4','32');
INSERT INTO "caseman__branch_contacts" VALUES(44,'','true','0011g00000iMGGSAA4','33');
INSERT INTO "caseman__branch_contacts" VALUES(45,'','true','0011g00000iMGGTAA4','34');
INSERT INTO "caseman__branch_contacts" VALUES(46,'','true','0011g00000iMGGUAA4','35');
INSERT INTO "caseman__branch_contacts" VALUES(47,'','true','0011g00000iMGGVAA4','36');
INSERT INTO "caseman__branch_contacts" VALUES(48,'','true','0011g00000iMGGWAA4','37');
INSERT INTO "caseman__branch_contacts" VALUES(49,'','true','0011g00000iMGGXAA4','38');
INSERT INTO "caseman__branch_contacts" VALUES(50,'','true','0011g00000iMGGYAA4','39');
INSERT INTO "caseman__branch_contacts" VALUES(51,'','true','0011g00000iMGGZAA4','40');
INSERT INTO "caseman__branch_contacts" VALUES(52,'','true','0011g00000iMGGaAAO','41');
INSERT INTO "caseman__branch_contacts" VALUES(53,'','true','0011g00000iMGGbAAO','42');
INSERT INTO "caseman__branch_contacts" VALUES(54,'','true','0011g00000iMGGcAAO','43');
INSERT INTO "caseman__branch_contacts" VALUES(55,'','true','0011g00000iMGGdAAO','44');
INSERT INTO "caseman__branch_contacts" VALUES(56,'','true','0011g00000iMGGeAAO','45');
INSERT INTO "caseman__branch_contacts" VALUES(57,'','true','0011g00000iMGGfAAO','46');
INSERT INTO "caseman__branch_contacts" VALUES(58,'','true','0011g00000iMGGgAAO','47');
INSERT INTO "caseman__branch_contacts" VALUES(59,'','true','0011g00000iMGGhAAO','48');
INSERT INTO "caseman__branch_contacts" VALUES(60,'','true','0011g00000iMGGiAAO','49');
INSERT INTO "caseman__branch_contacts" VALUES(61,'','true','0011g00000iMGGjAAO','50');
INSERT INTO "caseman__branch_contacts" VALUES(62,'','true','0011g00000iMGGkAAO','51');
INSERT INTO "caseman__branch_contacts" VALUES(63,'','true','0011g00000iMGGlAAO','52');
INSERT INTO "caseman__branch_contacts" VALUES(64,'','true','0011g00000iMGGmAAO','53');
INSERT INTO "caseman__branch_contacts" VALUES(65,'','true','0011g00000iMGGnAAO','54');
INSERT INTO "caseman__branch_contacts" VALUES(66,'','true','0011g00000iMGGoAAO','55');
INSERT INTO "caseman__branch_contacts" VALUES(67,'','true','0011g00000iMGGpAAO','56');
INSERT INTO "caseman__branch_contacts" VALUES(68,'','true','0011g00000iMGGqAAO','57');
INSERT INTO "caseman__branch_contacts" VALUES(69,'','true','0011g00000iMGGrAAO','58');
INSERT INTO "caseman__branch_contacts" VALUES(70,'','true','0011g00000iMGGsAAO','59');
INSERT INTO "caseman__branch_contacts" VALUES(71,'','true','0011g00000iMGGtAAO','60');
INSERT INTO "caseman__branch_contacts" VALUES(72,'','true','0011g00000iMGGuAAO','61');
INSERT INTO "caseman__branch_contacts" VALUES(73,'','true','0011g00000iMGGvAAO','62');
INSERT INTO "caseman__branch_contacts" VALUES(74,'','true','0011g00000iMGGwAAO','63');
INSERT INTO "caseman__branch_contacts" VALUES(75,'','true','0011g00000iMGGxAAO','64');
INSERT INTO "caseman__branch_contacts" VALUES(76,'','true','0011g00000iMGGyAAO','65');
INSERT INTO "caseman__branch_contacts" VALUES(77,'','true','0011g00000iMGGzAAO','66');
INSERT INTO "caseman__branch_contacts" VALUES(78,'','true','0011g00000iMGH0AAO','67');
INSERT INTO "caseman__branch_contacts" VALUES(79,'','true','0011g00000iMGH1AAO','68');
INSERT INTO "caseman__branch_contacts" VALUES(80,'','true','0011g00000iMGH2AAO','69');
INSERT INTO "caseman__branch_contacts" VALUES(81,'','true','0011g00000iMGH3AAO','70');
INSERT INTO "caseman__branch_contacts" VALUES(82,'','true','0011g00000iMGH4AAO','71');
INSERT INTO "caseman__branch_contacts" VALUES(83,'','true','0011g00000iMGH5AAO','72');
INSERT INTO "caseman__branch_contacts" VALUES(84,'','true','0011g00000iMGH6AAO','73');
INSERT INTO "caseman__branch_contacts" VALUES(85,'','true','0011g00000iMGH7AAO','74');
INSERT INTO "caseman__branch_contacts" VALUES(86,'','true','0011g00000iMGH8AAO','75');
INSERT INTO "caseman__branch_contacts" VALUES(87,'','true','0011g00000iMGH9AAO','76');
INSERT INTO "caseman__branch_contacts" VALUES(88,'','true','0011g00000iMGHAAA4','77');
INSERT INTO "caseman__branch_contacts" VALUES(89,'','true','0011g00000iMGHBAA4','78');
INSERT INTO "caseman__branch_contacts" VALUES(90,'','true','0011g00000iMGHCAA4','79');
INSERT INTO "caseman__branch_contacts" VALUES(91,'','true','0011g00000iMGHDAA4','80');
INSERT INTO "caseman__branch_contacts" VALUES(92,'','true','0011g00000iMGHEAA4','81');
INSERT INTO "caseman__branch_contacts" VALUES(93,'','true','0011g00000iMGHFAA4','82');
INSERT INTO "caseman__branch_contacts" VALUES(94,'','true','0011g00000iMGHGAA4','83');
INSERT INTO "caseman__branch_contacts" VALUES(95,'','true','0011g00000iMGHHAA4','84');
INSERT INTO "caseman__branch_contacts" VALUES(96,'','true','0011g00000iMGHIAA4','85');
INSERT INTO "caseman__branch_contacts" VALUES(97,'','true','0011g00000iMGHJAA4','86');
INSERT INTO "caseman__branch_contacts" VALUES(98,'','true','0011g00000iMGHKAA4','87');
INSERT INTO "caseman__branch_contacts" VALUES(99,'','true','0011g00000iMGHLAA4','88');
INSERT INTO "caseman__branch_contacts" VALUES(100,'','true','0011g00000iMGHMAA4','89');
INSERT INTO "caseman__branch_contacts" VALUES(101,'','true','0011g00000iMGHNAA4','90');
INSERT INTO "caseman__branch_contacts" VALUES(102,'','true','0011g00000iMGHOAA4','91');
INSERT INTO "caseman__branch_contacts" VALUES(103,'','true','0011g00000iMGHPAA4','92');
INSERT INTO "caseman__branch_contacts" VALUES(104,'','true','0011g00000iMGHQAA4','93');
INSERT INTO "caseman__branch_contacts" VALUES(105,'','true','0011g00000iMGHRAA4','94');
INSERT INTO "caseman__branch_contacts" VALUES(106,'','true','0011g00000iMGHSAA4','95');
INSERT INTO "caseman__branch_contacts" VALUES(107,'','true','0011g00000iMGHTAA4','96');
INSERT INTO "caseman__branch_contacts" VALUES(108,'','true','0011g00000iMGHUAA4','97');
INSERT INTO "caseman__branch_contacts" VALUES(109,'','true','0011g00000iMGHVAA4','98');
INSERT INTO "caseman__branch_contacts" VALUES(110,'','true','0011g00000iMGHWAA4','99');
INSERT INTO "caseman__branch_contacts" VALUES(111,'','true','0011g00000iMGHXAA4','100');
INSERT INTO "caseman__branch_contacts" VALUES(112,'','true','0011g00000iMGHYAA4','101');
INSERT INTO "caseman__branch_contacts" VALUES(113,'','true','0011g00000iMGHZAA4','102');
INSERT INTO "caseman__branch_contacts" VALUES(114,'','true','0011g00000iMGHaAAO','103');
INSERT INTO "caseman__branch_contacts" VALUES(115,'','true','0011g00000iMGHbAAO','104');
INSERT INTO "caseman__branch_contacts" VALUES(116,'','true','0011g00000iMGHcAAO','105');
INSERT INTO "caseman__branch_contacts" VALUES(117,'','true','0011g00000iMGHdAAO','106');
INSERT INTO "caseman__branch_contacts" VALUES(118,'','true','0011g00000iMGHeAAO','107');
INSERT INTO "caseman__branch_contacts" VALUES(119,'','true','0011g00000iMGHfAAO','108');
INSERT INTO "caseman__branch_contacts" VALUES(120,'','true','0011g00000iMGHgAAO','109');
INSERT INTO "caseman__branch_contacts" VALUES(121,'','true','0011g00000iMGHhAAO','110');
INSERT INTO "caseman__branch_contacts" VALUES(122,'','true','0011g00000iMGHiAAO','111');
INSERT INTO "caseman__branch_contacts" VALUES(123,'','true','0011g00000iMGHjAAO','112');
INSERT INTO "caseman__branch_contacts" VALUES(124,'','true','0011g00000iMGHkAAO','113');
INSERT INTO "caseman__branch_contacts" VALUES(125,'','true','0011g00000iMGHlAAO','114');
INSERT INTO "caseman__branch_contacts" VALUES(126,'','true','0011g00000iMGHmAAO','115');
INSERT INTO "caseman__branch_contacts" VALUES(127,'','true','0011g00000iMGHnAAO','116');
INSERT INTO "caseman__branch_contacts" VALUES(128,'','true','0011g00000iMGHoAAO','117');
INSERT INTO "caseman__branch_contacts" VALUES(129,'','true','0011g00000iMGHpAAO','118');
INSERT INTO "caseman__branch_contacts" VALUES(130,'','true','0011g00000iMGHqAAO','119');
INSERT INTO "caseman__branch_contacts" VALUES(131,'','true','0011g00000iMGHrAAO','120');
INSERT INTO "caseman__branch_contacts" VALUES(132,'','true','0011g00000iMGHsAAO','121');
INSERT INTO "caseman__branch_contacts" VALUES(133,'','true','0011g00000iMGHtAAO','122');
INSERT INTO "caseman__branch_contacts" VALUES(134,'','true','0011g00000iMGHuAAO','123');
INSERT INTO "caseman__branch_contacts" VALUES(135,'','true','0011g00000iMGHvAAO','124');
INSERT INTO "caseman__branch_contacts" VALUES(136,'','true','0011g00000iMGHwAAO','125');
INSERT INTO "caseman__branch_contacts" VALUES(137,'','true','0011g00000iMGHxAAO','126');
INSERT INTO "caseman__branch_contacts" VALUES(138,'','true','0011g00000iMGHyAAO','127');
INSERT INTO "caseman__branch_contacts" VALUES(139,'','true','0011g00000iMGHzAAO','128');
INSERT INTO "caseman__branch_contacts" VALUES(140,'','true','0011g00000iMGI0AAO','129');
INSERT INTO "caseman__branch_contacts" VALUES(141,'','true','0011g00000iMGI1AAO','130');
INSERT INTO "caseman__branch_contacts" VALUES(142,'','true','0011g00000iMGI2AAO','131');
INSERT INTO "caseman__branch_contacts" VALUES(143,'','true','0011g00000iMGI3AAO','132');
INSERT INTO "caseman__branch_contacts" VALUES(144,'','true','0011g00000iMGI4AAO','133');
INSERT INTO "caseman__branch_contacts" VALUES(145,'','true','0011g00000iMGI5AAO','134');
INSERT INTO "caseman__branch_contacts" VALUES(146,'','true','0011g00000iMGI6AAO','135');
INSERT INTO "caseman__branch_contacts" VALUES(147,'','true','0011g00000iMGI7AAO','136');
INSERT INTO "caseman__branch_contacts" VALUES(148,'','true','0011g00000iMGI8AAO','137');
INSERT INTO "caseman__branch_contacts" VALUES(149,'','true','0011g00000iMGI9AAO','138');
INSERT INTO "caseman__branch_contacts" VALUES(150,'','true','0011g00000iMGIAAA4','139');
INSERT INTO "caseman__branch_contacts" VALUES(151,'','true','0011g00000iMGIBAA4','140');
INSERT INTO "caseman__branch_contacts" VALUES(152,'','true','0011g00000iMGICAA4','141');
INSERT INTO "caseman__branch_contacts" VALUES(153,'','true','0011g00000iMGIDAA4','142');
INSERT INTO "caseman__branch_contacts" VALUES(154,'','true','0011g00000iMGIEAA4','143');
INSERT INTO "caseman__branch_contacts" VALUES(155,'','true','0011g00000iMGIFAA4','144');
INSERT INTO "caseman__branch_contacts" VALUES(156,'','true','0011g00000iMGIGAA4','145');
INSERT INTO "caseman__branch_contacts" VALUES(157,'','true','0011g00000iMGIHAA4','146');
INSERT INTO "caseman__branch_contacts" VALUES(158,'','true','0011g00000iMGIIAA4','147');
INSERT INTO "caseman__branch_contacts" VALUES(159,'','true','0011g00000iMGIJAA4','148');
INSERT INTO "caseman__branch_contacts" VALUES(160,'','true','0011g00000iMGIKAA4','149');
INSERT INTO "caseman__branch_contacts" VALUES(161,'','true','0011g00000iMGILAA4','150');
INSERT INTO "caseman__branch_contacts" VALUES(162,'','true','0011g00000iMGIMAA4','151');
INSERT INTO "caseman__branch_contacts" VALUES(163,'','true','0011g00000iMGINAA4','152');
INSERT INTO "caseman__branch_contacts" VALUES(164,'','true','0011g00000iMGIOAA4','153');
INSERT INTO "caseman__branch_contacts" VALUES(165,'','true','0011g00000iMGIPAA4','154');
INSERT INTO "caseman__branch_contacts" VALUES(166,'','true','0011g00000iMGIQAA4','155');
INSERT INTO "caseman__branch_contacts" VALUES(167,'','true','0011g00000iMGIRAA4','156');
INSERT INTO "caseman__branch_contacts" VALUES(168,'','true','0011g00000iMGISAA4','157');
INSERT INTO "caseman__branch_contacts" VALUES(169,'','true','0011g00000iMGITAA4','158');
INSERT INTO "caseman__branch_contacts" VALUES(170,'','true','0011g00000iMGIUAA4','159');
INSERT INTO "caseman__branch_contacts" VALUES(171,'','true','0011g00000iMGIVAA4','160');
INSERT INTO "caseman__branch_contacts" VALUES(172,'','true','0011g00000iMGIWAA4','161');
INSERT INTO "caseman__branch_contacts" VALUES(173,'','true','0011g00000iMGIXAA4','162');
INSERT INTO "caseman__branch_contacts" VALUES(174,'','true','0011g00000iMGIYAA4','163');
INSERT INTO "caseman__branch_contacts" VALUES(175,'','true','0011g00000iMGIZAA4','164');
INSERT INTO "caseman__branch_contacts" VALUES(176,'','true','0011g00000iMGIaAAO','165');
INSERT INTO "caseman__branch_contacts" VALUES(177,'','true','0011g00000iMGIbAAO','166');
INSERT INTO "caseman__branch_contacts" VALUES(178,'','true','0011g00000iMGIcAAO','167');
INSERT INTO "caseman__branch_contacts" VALUES(179,'','true','0011g00000iMGIdAAO','168');
INSERT INTO "caseman__branch_contacts" VALUES(180,'','true','0011g00000iMGIeAAO','169');
INSERT INTO "caseman__branch_contacts" VALUES(181,'','true','0011g00000iMGIfAAO','170');
INSERT INTO "caseman__branch_contacts" VALUES(182,'','true','0011g00000iMGIgAAO','171');
INSERT INTO "caseman__branch_contacts" VALUES(183,'','true','0011g00000iMGIhAAO','172');
INSERT INTO "caseman__branch_contacts" VALUES(184,'','true','0011g00000iMGIiAAO','173');
INSERT INTO "caseman__branch_contacts" VALUES(185,'','true','0011g00000iMGIjAAO','174');
INSERT INTO "caseman__branch_contacts" VALUES(186,'','true','0011g00000iMGIkAAO','175');
INSERT INTO "caseman__branch_contacts" VALUES(187,'','true','0011g00000iMGIlAAO','176');
INSERT INTO "caseman__branch_contacts" VALUES(188,'','true','0011g00000iMGImAAO','177');
CREATE TABLE caseman__case_plans (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__case_plans" VALUES(1,'Socialization Case Plan - Tom Higgins','4');
INSERT INTO "caseman__case_plans" VALUES(2,'Reading Case Plan - Tom Higgins','4');
INSERT INTO "caseman__case_plans" VALUES(3,'Arlene Baker''s Workforce Re-entry Case Plan','9');
INSERT INTO "caseman__case_plans" VALUES(4,'Robin Banks'' Job Readiness Case Plan','10');
INSERT INTO "caseman__case_plans" VALUES(5,'Robin Banks'' Sobriety Case Plan','10');
INSERT INTO "caseman__case_plans" VALUES(6,'Financial Literacy Case Plan - Jason Barnes','14');
INSERT INTO "caseman__case_plans" VALUES(7,'English proficiency case plan - Barbara Johnson','23');
CREATE TABLE caseman__client_alerts (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_alerts" VALUES(1,'Tom has anger issues','true','','4');
INSERT INTO "caseman__client_alerts" VALUES(2,'Tom''s sister passed away recently (very emotional)','true','','4');
INSERT INTO "caseman__client_alerts" VALUES(3,'Robin was recently released from rehab','true','','10');
CREATE TABLE caseman__client_cases (
	id INTEGER NOT NULL, 
	subject VARCHAR(255), 
	priority VARCHAR(255), 
	status VARCHAR(255), 
	origin VARCHAR(255), 
	description VARCHAR(255), 
	"SuppliedCompany" VARCHAR(255), 
	"SuppliedEmail" VARCHAR(255), 
	"SuppliedName" VARCHAR(255), 
	"SuppliedPhone" VARCHAR(255), 
	"IncidentDateTime__c" VARCHAR(255), 
	"IncidentType__c" VARCHAR(255), 
	"LocationNotes__c" VARCHAR(255), 
	"Severity__c" VARCHAR(255), 
	branch__c VARCHAR(255), 
	contact_id VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_cases" VALUES(1,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','4','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(2,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','4','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(3,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','4','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(4,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','4','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(5,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','9','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(6,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','10','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(7,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','14','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(8,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','23','ClientCase');
CREATE TABLE caseman__client_note_relationships (
	id INTEGER NOT NULL, 
	"RelatedId__c" VARCHAR(255), 
	"RelatedName__c" VARCHAR(255), 
	"RelatedObject__c" VARCHAR(255), 
	case__c VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	program_engagement__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_note_relationships" VALUES(1,'a1554000000FXRBAA4','PE-00000007','ProgramEngagement__c','','1','','11');
INSERT INTO "caseman__client_note_relationships" VALUES(2,'a16S0000002pKVPIA2','PE-00000003','caseman__ProgramEngagement__c','','2','','6');
INSERT INTO "caseman__client_note_relationships" VALUES(3,'500540000032nuJAAQ','00001008','Case','6','3','','');
INSERT INTO "caseman__client_note_relationships" VALUES(4,'500540000032nuKAAQ','00001009','Case','7','4','','');
INSERT INTO "caseman__client_note_relationships" VALUES(5,'500540000032nuLAAQ','00001010','Case','8','5','','');
CREATE TABLE caseman__client_notes (
	id INTEGER NOT NULL, 
	content__c VARCHAR(255), 
	subject__c VARCHAR(255), 
	status__c VARCHAR(255), 
	interactiondate__c VARCHAR(255), 
	draft__c VARCHAR(255), 
	minutes_spent_with_client__c VARCHAR(255), 
	client__c VARCHAR(255), 
	program_engagement__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_notes" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','4','');
INSERT INTO "caseman__client_notes" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','4','');
INSERT INTO "caseman__client_notes" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','10','');
INSERT INTO "caseman__client_notes" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','14','');
INSERT INTO "caseman__client_notes" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','23','');
CREATE TABLE caseman__goal_action_item_templates (
	id INTEGER NOT NULL, 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__goal_action_item_templates" VALUES(1,'1','30');
INSERT INTO "caseman__goal_action_item_templates" VALUES(2,'2','16');
INSERT INTO "caseman__goal_action_item_templates" VALUES(3,'3','4');
INSERT INTO "caseman__goal_action_item_templates" VALUES(4,'3','5');
INSERT INTO "caseman__goal_action_item_templates" VALUES(5,'3','7');
INSERT INTO "caseman__goal_action_item_templates" VALUES(6,'3','9');
INSERT INTO "caseman__goal_action_item_templates" VALUES(7,'3','12');
INSERT INTO "caseman__goal_action_item_templates" VALUES(8,'3','18');
INSERT INTO "caseman__goal_action_item_templates" VALUES(9,'3','19');
INSERT INTO "caseman__goal_action_item_templates" VALUES(10,'3','20');
INSERT INTO "caseman__goal_action_item_templates" VALUES(11,'3','21');
INSERT INTO "caseman__goal_action_item_templates" VALUES(12,'3','22');
INSERT INTO "caseman__goal_action_item_templates" VALUES(13,'3','23');
INSERT INTO "caseman__goal_action_item_templates" VALUES(14,'3','24');
INSERT INTO "caseman__goal_action_item_templates" VALUES(15,'3','25');
INSERT INTO "caseman__goal_action_item_templates" VALUES(16,'3','26');
INSERT INTO "caseman__goal_action_item_templates" VALUES(17,'3','37');
INSERT INTO "caseman__goal_action_item_templates" VALUES(18,'4','10');
INSERT INTO "caseman__goal_action_item_templates" VALUES(19,'4','11');
INSERT INTO "caseman__goal_action_item_templates" VALUES(20,'4','39');
INSERT INTO "caseman__goal_action_item_templates" VALUES(21,'4','40');
INSERT INTO "caseman__goal_action_item_templates" VALUES(22,'4','41');
INSERT INTO "caseman__goal_action_item_templates" VALUES(23,'6','13');
INSERT INTO "caseman__goal_action_item_templates" VALUES(24,'9','38');
INSERT INTO "caseman__goal_action_item_templates" VALUES(25,'9','42');
INSERT INTO "caseman__goal_action_item_templates" VALUES(26,'9','43');
INSERT INTO "caseman__goal_action_item_templates" VALUES(27,'9','44');
INSERT INTO "caseman__goal_action_item_templates" VALUES(28,'9','45');
INSERT INTO "caseman__goal_action_item_templates" VALUES(29,'9','46');
INSERT INTO "caseman__goal_action_item_templates" VALUES(30,'12','35');
INSERT INTO "caseman__goal_action_item_templates" VALUES(31,'12','36');
INSERT INTO "caseman__goal_action_item_templates" VALUES(32,'14','27');
INSERT INTO "caseman__goal_action_item_templates" VALUES(33,'14','28');
INSERT INTO "caseman__goal_action_item_templates" VALUES(34,'14','33');
INSERT INTO "caseman__goal_action_item_templates" VALUES(35,'14','34');
INSERT INTO "caseman__goal_action_item_templates" VALUES(36,'28','16');
CREATE TABLE caseman__goal_templates (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__goal_templates" VALUES(1,'Reach an age appropriate level of proficiency in reading');
INSERT INTO "caseman__goal_templates" VALUES(2,'Reach proficiency in reading, writing, speaking, and listening');
INSERT INTO "caseman__goal_templates" VALUES(3,'Develop basic financial literacy skills');
INSERT INTO "caseman__goal_templates" VALUES(4,'Get and keep job for 6 - 12 months');
INSERT INTO "caseman__goal_templates" VALUES(5,'Stabilize career path');
INSERT INTO "caseman__goal_templates" VALUES(6,'Acquire and adopt healthy skills to address problems');
INSERT INTO "caseman__goal_templates" VALUES(7,'Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__goal_templates" VALUES(8,'Reach proficiency level in reading, writing, speaking & listening per state std');
INSERT INTO "caseman__goal_templates" VALUES(9,'Develop soft skills');
INSERT INTO "caseman__goal_templates" VALUES(10,'Stabilize housing');
INSERT INTO "caseman__goal_templates" VALUES(11,'Complete Advancement program');
INSERT INTO "caseman__goal_templates" VALUES(12,'Complete Financial Literacy Course');
INSERT INTO "caseman__goal_templates" VALUES(13,'Build respectful peer relationships');
INSERT INTO "caseman__goal_templates" VALUES(14,'Deposit 10% of income in Savings Account for 3 months');
INSERT INTO "caseman__goal_templates" VALUES(15,'Build respectful intergenerational relationships');
INSERT INTO "caseman__goal_templates" VALUES(16,'Identify industry/career path');
INSERT INTO "caseman__goal_templates" VALUES(17,'Complete Advancement program');
INSERT INTO "caseman__goal_templates" VALUES(18,'Meet job requirement standards');
INSERT INTO "caseman__goal_templates" VALUES(19,'Complete Succeed program');
INSERT INTO "caseman__goal_templates" VALUES(20,'Meet with a Financial Advisor');
INSERT INTO "caseman__goal_templates" VALUES(21,'Stabilize employment');
INSERT INTO "caseman__goal_templates" VALUES(22,'Get a Job Readiness Coach');
INSERT INTO "caseman__goal_templates" VALUES(23,'Meet with Legal Assistance Advisor');
INSERT INTO "caseman__goal_templates" VALUES(24,'Visioning career path');
INSERT INTO "caseman__goal_templates" VALUES(25,'Complete Stability Assessment');
INSERT INTO "caseman__goal_templates" VALUES(26,'Complete Jump Start program');
INSERT INTO "caseman__goal_templates" VALUES(27,'Get any required certifications');
INSERT INTO "caseman__goal_templates" VALUES(28,'Get a passing grade in ESL I Class');
CREATE TABLE caseman__goals (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__goals" VALUES(1,'Build respectful peer relationships','4','1','13');
INSERT INTO "caseman__goals" VALUES(2,'Build respectful inter-generational relationships','4','1','15');
INSERT INTO "caseman__goals" VALUES(3,'Reach an age appropriate level of proficiency in reading','4','2','1');
INSERT INTO "caseman__goals" VALUES(4,'Develop basic financial literacy skills','9','3','3');
INSERT INTO "caseman__goals" VALUES(5,'Get and keep job for 6 - 12 months','9','3','4');
INSERT INTO "caseman__goals" VALUES(6,'Develop Soft Skills','9','3','9');
INSERT INTO "caseman__goals" VALUES(7,'Stabilize housing','9','3','10');
INSERT INTO "caseman__goals" VALUES(8,'Identify industry/career path','9','3','16');
INSERT INTO "caseman__goals" VALUES(9,'Meet job requirement standards','9','3','18');
INSERT INTO "caseman__goals" VALUES(10,'Complete Succeed Program','9','3','19');
INSERT INTO "caseman__goals" VALUES(11,'Stabilize Employment','9','3','21');
INSERT INTO "caseman__goals" VALUES(12,'Develop basic financial literacy skills','10','4','3');
INSERT INTO "caseman__goals" VALUES(13,'Get and keep job for 6 - 12 months','10','4','4');
INSERT INTO "caseman__goals" VALUES(14,'Develop Soft Skills','10','4','9');
INSERT INTO "caseman__goals" VALUES(15,'Meet job requirement standards','10','4','18');
INSERT INTO "caseman__goals" VALUES(16,'Complete Succeed Program','10','4','19');
INSERT INTO "caseman__goals" VALUES(17,'Stabilize Employment','10','4','21');
INSERT INTO "caseman__goals" VALUES(18,'Adopt healthy skills to address dependency issues','10','5','6');
INSERT INTO "caseman__goals" VALUES(19,'Complete Financial Literacy Course','14','6','12');
INSERT INTO "caseman__goals" VALUES(20,'Deposit 10% of income in Savings Account for 3 months','14','6','14');
INSERT INTO "caseman__goals" VALUES(21,'Reach proficiency level in reading, writing, speaking & listening per state std','23','7','8');
CREATE TABLE caseman__incident_cases (
	id INTEGER NOT NULL, 
	subject VARCHAR(255), 
	priority VARCHAR(255), 
	status VARCHAR(255), 
	origin VARCHAR(255), 
	description VARCHAR(255), 
	"SuppliedCompany" VARCHAR(255), 
	"SuppliedEmail" VARCHAR(255), 
	"SuppliedName" VARCHAR(255), 
	"SuppliedPhone" VARCHAR(255), 
	"IncidentDateTime__c" VARCHAR(255), 
	"IncidentType__c" VARCHAR(255), 
	"LocationNotes__c" VARCHAR(255), 
	"Severity__c" VARCHAR(255), 
	branch__c VARCHAR(255), 
	contact_id VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__incident_cases" VALUES(1,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','1','4','Incident');
INSERT INTO "caseman__incident_cases" VALUES(2,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','1','4','Incident');
INSERT INTO "caseman__incident_cases" VALUES(3,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','4','Incident');
INSERT INTO "caseman__incident_cases" VALUES(4,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','4','Incident');
INSERT INTO "caseman__incident_cases" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','4','Incident');
CREATE TABLE caseman__program_engagements (
	id INTEGER NOT NULL, 
	"Status__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	program_offering__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	case__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__program_engagements" VALUES(1,'In Progress','2019-06-03','2019-12-31','1','10','');
INSERT INTO "caseman__program_engagements" VALUES(2,'Enrolled','2019-06-01','','2','4','');
INSERT INTO "caseman__program_engagements" VALUES(3,'Enrolled','2019-09-04','2020-05-15','3','23','8');
INSERT INTO "caseman__program_engagements" VALUES(4,'In Progress','2019-09-04','2019-12-13','4','14','');
INSERT INTO "caseman__program_engagements" VALUES(5,'Enrolled','2019-09-03','','5','4','');
INSERT INTO "caseman__program_engagements" VALUES(6,'In Progress','2019-06-03','2020-05-15','6','4','');
INSERT INTO "caseman__program_engagements" VALUES(7,'Enrolled','2019-09-04','2020-04-15','8','9','');
INSERT INTO "caseman__program_engagements" VALUES(8,'Applied','2019-08-14','','8','9','');
INSERT INTO "caseman__program_engagements" VALUES(9,'In Progress','2019-09-04','2020-04-15','8','10','');
INSERT INTO "caseman__program_engagements" VALUES(10,'Applied','2019-06-03','','8','10','6');
INSERT INTO "caseman__program_engagements" VALUES(11,'Applied','2019-09-03','','10','4','');
CREATE TABLE caseman__program_goal_templates (
	id INTEGER NOT NULL, 
	"IsRequired__c" VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__program_goal_templates" VALUES(1,'false','16','7');
INSERT INTO "caseman__program_goal_templates" VALUES(2,'false','18','7');
INSERT INTO "caseman__program_goal_templates" VALUES(3,'false','19','7');
INSERT INTO "caseman__program_goal_templates" VALUES(4,'false','21','7');
INSERT INTO "caseman__program_goal_templates" VALUES(5,'false','24','7');
INSERT INTO "caseman__program_goal_templates" VALUES(6,'true','25','7');
INSERT INTO "caseman__program_goal_templates" VALUES(7,'false','26','7');
INSERT INTO "caseman__program_goal_templates" VALUES(8,'false','27','7');
INSERT INTO "caseman__program_goal_templates" VALUES(9,'true','1','6');
INSERT INTO "caseman__program_goal_templates" VALUES(10,'false','2','3');
INSERT INTO "caseman__program_goal_templates" VALUES(11,'true','3','7');
INSERT INTO "caseman__program_goal_templates" VALUES(12,'true','4','7');
INSERT INTO "caseman__program_goal_templates" VALUES(13,'false','5','7');
INSERT INTO "caseman__program_goal_templates" VALUES(14,'true','6','1');
INSERT INTO "caseman__program_goal_templates" VALUES(15,'true','9','7');
INSERT INTO "caseman__program_goal_templates" VALUES(16,'false','10','7');
INSERT INTO "caseman__program_goal_templates" VALUES(17,'false','11','7');
INSERT INTO "caseman__program_goal_templates" VALUES(18,'true','12','5');
INSERT INTO "caseman__program_goal_templates" VALUES(19,'false','13','8');
INSERT INTO "caseman__program_goal_templates" VALUES(20,'false','14','5');
INSERT INTO "caseman__program_goal_templates" VALUES(21,'false','15','8');
CREATE TABLE caseman__program_offerings (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	description__c VARCHAR(255), 
	summary__c VARCHAR(255), 
	duration__c VARCHAR(255), 
	durationunit__c VARCHAR(255), 
	startdate__c VARCHAR(255), 
	enddate__c VARCHAR(255), 
	status__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__program_offerings" VALUES(1,'2019 Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','','Months','2019-01-01','2019-12-31','Active','1');
INSERT INTO "caseman__program_offerings" VALUES(2,'Clothing Program Summer 2019','Serving families with children under the age of 18.','Part of the Housing Assistance program, the  Clothing program program provides assistance for families with children under the age of 18.','','Months','2019-06-01','2019-08-31','Active','2');
INSERT INTO "caseman__program_offerings" VALUES(3,'ESL I Course 2019-2020','A language instruction educational program for students whose primary language is not English.','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','','Months','2019-09-04','2020-05-30','Active','3');
INSERT INTO "caseman__program_offerings" VALUES(4,'Financial Literacy Program, Fall 2019','Teaches students the basics of money management.','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','','Months','2019-09-04','2019-12-13','Active','5');
INSERT INTO "caseman__program_offerings" VALUES(5,'School Lunch Program Summer 2019','Serving families with children under the age of 18.','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','','Months','2019-09-03','2020-05-30','Active','4');
INSERT INTO "caseman__program_offerings" VALUES(6,'Remedial Reading, 2019','Provides students the support they need to achieve an age appropriate reading level.','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','','Months','2019-06-03','2020-05-15','Active','6');
INSERT INTO "caseman__program_offerings" VALUES(7,'Jump Start, Spring 2019-2020','Assisting adults who have experienced a prolonged absence from the workforce.','Assisting adults under the poverty line, seeking to re-enter the workforce after an absence or seeking to progressively stabilize their experience in the workforce.','','Months','2019-04-15','2020-04-30','Active','7');
INSERT INTO "caseman__program_offerings" VALUES(8,'Succeed, Spring 2019-2020','Assisting adults who have experienced poverty and an absence from the workforce.','This program assists adults under the poverty line re-entering the workforce after an absence of up to two years. The program''s goal is to achieve a 60% completion rate and to successfully re-integrate 50% of its clients completing the program to full time employment within 6 months of completing the program.','','Months','2019-04-15','2020-04-30','Active','7');
INSERT INTO "caseman__program_offerings" VALUES(9,'Advancement, Spring 2019-2020','Assisting adults who have experienced a prolonged absence from the workforce develop an appropriate, stable and rewarding career path.','This program serves adults under the poverty line, seeking to re-enter the workforce after an absence or seeking to progressively stabilize their experience in the workforce.','','Months','2019-04-15','2020-04-30','Active','7');
INSERT INTO "caseman__program_offerings" VALUES(10,'After School Program, Ages 11-13, Summer 2019','An after school program for children enrolled in district 31.','This program''s goal is to provide a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','','Months','2019-09-03','2020-05-30','Active','8');
CREATE TABLE caseman__programs (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	targetpopulation__c VARCHAR(255), 
	programdescription__c VARCHAR(255), 
	summary__c VARCHAR(255), 
	duration__c VARCHAR(255), 
	durationunit__c VARCHAR(255), 
	enddate__c VARCHAR(255), 
	startdate__c VARCHAR(255), 
	status__c VARCHAR(255), 
	frequency_description__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__programs" VALUES(1,'Drug and Alcohol Recovery Management','Adult individuals, families and communities affected by addiction to alcohol and other drugs.','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','1.0','Years','2019-12-31','2019-01-01','Active','Annual program. Rolling enrollment.');
INSERT INTO "caseman__programs" VALUES(2,'Housing Assistance Program','Families with children under the age of 18','Providing assistance for families with children under the age of 18.','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','365.0','Days','','2019-05-01','Active','Annual program with rolling applications.');
INSERT INTO "caseman__programs" VALUES(3,'ESL Program','A practical conversational  English class for those whose primary language is not English.','A language instruction educational program for students whose primary language is not English.','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','1.0','Years','2020-05-30','2019-09-03','Active','Offered each academic year. Enrollment in August prior to the start of the academic year.');
INSERT INTO "caseman__programs" VALUES(4,'School Lunch Program','Children under 18  enrolled in school district 31','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','9.0','Months','2020-05-30','2019-09-03','Active','Program runs for the academic year. Enrollment is the first week of every month.');
INSERT INTO "caseman__programs" VALUES(5,'Financial Literacy Program','Children aged 15-18 enrolled in school district 31','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','Teaches students the basics of money management.','4.0','Months','2019-12-13','2019-09-04','Active','Program offered fall of academic year. Applications accepted August prior to semester.');
INSERT INTO "caseman__programs" VALUES(6,'Remedial Reading Program','Children under 18  enrolled in school district 31','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','Provides students the support they need to achieve an age appropriate reading level.','15.0','Months','2020-05-15','2019-06-03','Active','Program runs for the academic year with application period July-August preceding the academic year.');
INSERT INTO "caseman__programs" VALUES(7,'Job Readiness Program','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2.0','Years','2021-04-15','2019-04-15','Active','2 year program with rolling enrollment.');
INSERT INTO "caseman__programs" VALUES(8,'After School Program, Ages 11-13','Children aged 11-13 enrolled in school district 31','An after school program for children enrolled in district 31.','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','9.0','Months','2020-05-31','2019-09-01','Active','Runs through school year with enrollment the first week of each month.');
CREATE TABLE contacts (
	id INTEGER NOT NULL, 
	salutation VARCHAR(255), 
	firstname VARCHAR(255), 
	lastname VARCHAR(255), 
	email VARCHAR(255), 
	phone VARCHAR(255), 
	mobile VARCHAR(255), 
	"OtherPhone" VARCHAR(255), 
	"HomePhone" VARCHAR(255), 
	title VARCHAR(255), 
	birthdate VARCHAR(255), 
	mailingstreet VARCHAR(255), 
	mailingcity VARCHAR(255), 
	mailingstate VARCHAR(255), 
	mailingpostalcode VARCHAR(255), 
	mailingcountry VARCHAR(255), 
	"AgeCategory__c" VARCHAR(255), 
	"ClientID__c" VARCHAR(255), 
	"EmergencyContactRole__c" VARCHAR(255), 
	"PhotoFileID__c" VARCHAR(255), 
	"PreferredCommunicationMethod__c" VARCHAR(255), 
	"LegalName__c" VARCHAR(255), 
	"PreferredPhoneField__c" VARCHAR(255), 
	"PreferredPhoneNumber__c" VARCHAR(255), 
	"Pronouns__c" VARCHAR(255), 
	"Roles__c" VARCHAR(255), 
	"WatchList__c" VARCHAR(255), 
	"WatchListDate__c" VARCHAR(255), 
	"Deceased__c" VARCHAR(255), 
	"Do_Not_Contact__c" VARCHAR(255), 
	"Exclude_from_Household_Formal_Greeting__c" VARCHAR(255), 
	"Exclude_from_Household_Informal_Greeting__c" VARCHAR(255), 
	"Exclude_from_Household_Name__c" VARCHAR(255), 
	"First_Soft_Credit_Amount__c" VARCHAR(255), 
	"First_Soft_Credit_Date__c" VARCHAR(255), 
	"is_Address_Override__c" VARCHAR(255), 
	"Largest_Soft_Credit_Amount__c" VARCHAR(255), 
	"Largest_Soft_Credit_Date__c" VARCHAR(255), 
	"Last_Soft_Credit_Amount__c" VARCHAR(255), 
	"Last_Soft_Credit_Date__c" VARCHAR(255), 
	"Number_of_Soft_Credits__c" VARCHAR(255), 
	"Number_of_Soft_Credits_Last_N_Days__c" VARCHAR(255), 
	"Number_of_Soft_Credits_Last_Year__c" VARCHAR(255), 
	"Number_of_Soft_Credits_This_Year__c" VARCHAR(255), 
	"Number_of_Soft_Credits_Two_Years_Ago__c" VARCHAR(255), 
	"Soft_Credit_Last_N_Days__c" VARCHAR(255), 
	"SystemHouseholdProcessor__c" VARCHAR(255), 
	"AverageAmount__c" VARCHAR(255), 
	"Best_Gift_Year__c" VARCHAR(255), 
	"Best_Gift_Year_Total__c" VARCHAR(255), 
	"FirstCloseDate__c" VARCHAR(255), 
	"Household__c" VARCHAR(255), 
	"Household_Naming_Order__c" VARCHAR(255), 
	"LargestAmount__c" VARCHAR(255), 
	"LastCloseDate__c" VARCHAR(255), 
	"LastMembershipAmount__c" VARCHAR(255), 
	"LastMembershipDate__c" VARCHAR(255), 
	"LastMembershipLevel__c" VARCHAR(255), 
	"LastMembershipOrigin__c" VARCHAR(255), 
	"LastOppAmount__c" VARCHAR(255), 
	"MembershipEndDate__c" VARCHAR(255), 
	"MembershipJoinDate__c" VARCHAR(255), 
	"Naming_Exclusions__c" VARCHAR(255), 
	"NumberOfClosedOpps__c" VARCHAR(255), 
	"NumberOfMembershipOpps__c" VARCHAR(255), 
	"OppAmount2YearsAgo__c" VARCHAR(255), 
	"OppAmountLastNDays__c" VARCHAR(255), 
	"OppAmountLastYear__c" VARCHAR(255), 
	"OppAmountThisYear__c" VARCHAR(255), 
	"OppsClosed2YearsAgo__c" VARCHAR(255), 
	"OppsClosedLastNDays__c" VARCHAR(255), 
	"OppsClosedLastYear__c" VARCHAR(255), 
	"OppsClosedThisYear__c" VARCHAR(255), 
	"SmallestAmount__c" VARCHAR(255), 
	"Soft_Credit_Last_Year__c" VARCHAR(255), 
	"Soft_Credit_This_Year__c" VARCHAR(255), 
	"Soft_Credit_Total__c" VARCHAR(255), 
	"Soft_Credit_Two_Years_Ago__c" VARCHAR(255), 
	"TotalMembershipOppAmount__c" VARCHAR(255), 
	"TotalOppAmount__c" VARCHAR(255), 
	"SystemAccountProcessor__c" VARCHAR(255), 
	"AlternateEmail__c" VARCHAR(255), 
	"HomeEmail__c" VARCHAR(255), 
	"Preferred_Email__c" VARCHAR(255), 
	"PreferredPhone__c" VARCHAR(255), 
	"Primary_Address_Type__c" VARCHAR(255), 
	"Private__c" VARCHAR(255), 
	"Secondary_Address_Type__c" VARCHAR(255), 
	"WorkEmail__c" VARCHAR(255), 
	"WorkPhone__c" VARCHAR(255), 
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "contacts" VALUES(1,'','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-10-19','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','false','','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','0.0','','0.0','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','16','');
INSERT INTO "contacts" VALUES(2,'','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-09-23','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','false','','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','0.0','','0.0','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','2','');
INSERT INTO "contacts" VALUES(3,'','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-09-01','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','false','','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','0.0','','0.0','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','3','');
INSERT INTO "contacts" VALUES(4,'','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','Child','','Mother','0681g000000KyIEAA0','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-11-14','false','false','true','true','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','thiggins@example.com','Personal','Home','Home','false','','','','4','5');
INSERT INTO "contacts" VALUES(5,'','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','lhiggins@example.com','Personal','Home','Home','false','','','','4','');
INSERT INTO "contacts" VALUES(6,'Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jeremyadams@example.com','Personal','Home','Home','false','','','','5','');
INSERT INTO "contacts" VALUES(7,'Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','she/her/hers','Client;Donor;Volunteer','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','angelaadams@example.com','Personal','Home','Home','false','','','','5','');
INSERT INTO "contacts" VALUES(8,'','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','Home','false','','','','6','');
INSERT INTO "contacts" VALUES(9,'','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','Adult','','Friend','0681g000000KyI4AAK','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','','','alanbaker@example.com','Personal','Home','Home','false','','','','6','7');
INSERT INTO "contacts" VALUES(10,'','Robin','Banks','robinbanks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','Adult','','Partner','0681g000000KyI9AAK','','','','','she/her/hers','Client','true','2019-11-14','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','robinbanks@example.com','Personal','Home','Home','false','','','','7','11');
INSERT INTO "contacts" VALUES(11,'','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','0.0','400.0','0.0','1.0','0.0','1.0','400.0','','','','','400.0','400.0','','','darrylgraham@example.com','Personal','Home','Home','false','','','','7','');
INSERT INTO "contacts" VALUES(12,'','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','8','');
INSERT INTO "contacts" VALUES(13,'','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','false','','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','','','davidbarnes@example.com','Personal','Home','Home','false','','','','8','');
INSERT INTO "contacts" VALUES(14,'','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','Youth','88841515','Mother','0681g000000KyHzAAK','','','','','he/him/his','Client','false','','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','8','12');
INSERT INTO "contacts" VALUES(15,'Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','Adult','','Friend','','','','','','she/her/hers','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anneboyd@example.com','Personal','Home','Home','false','','','','9','');
INSERT INTO "contacts" VALUES(16,'','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','Senior','','Friend','','','','','','they/them/theirs','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','normaburke@example.com','Personal','Home','Home','false','','','','10','');
INSERT INTO "contacts" VALUES(17,'','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-11-14','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','11','');
INSERT INTO "contacts" VALUES(18,'','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','Adult','','Friend','','','','','','they/them/theirs','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anthonyhill@example.com','Personal','Home','Home','false','','','','12','');
INSERT INTO "contacts" VALUES(19,'Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','Adult','','Friend','','','','','','she/her/hers','Client;Donor','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','13','');
INSERT INTO "contacts" VALUES(20,'','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','he/him/his','Donor','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','josejenkins@example.com','Personal','Home','Home','false','','','','14','');
INSERT INTO "contacts" VALUES(21,'','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','craigjohnso@example.com','Personal','Home','Home','false','','','','15','');
INSERT INTO "contacts" VALUES(22,'','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','false','','false','false','true','true','true','','','false','','','','','','','','','','0.0','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','Home','false','','','','15','');
INSERT INTO "contacts" VALUES(23,'','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','','Adult','','Husband','0681g000000KyHuAAK','','','','','she/her/hers','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','15','21');
INSERT INTO "contacts" VALUES(24,'','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-10-21','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','false','','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','0.0','','0.0','','','','0.0','','0.0','','','','','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','1','');
INSERT INTO "contacts" VALUES(25,'','Tiara','Cummings','tiaracummings@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','47','');
INSERT INTO "contacts" VALUES(26,'','Cecilia','Cardenas','ceciliacardenas@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','48','');
INSERT INTO "contacts" VALUES(27,'','Heidi','Woods','heidiwoods@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','49','');
INSERT INTO "contacts" VALUES(28,'','Leia','Spence','leiaspence@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','50','');
INSERT INTO "contacts" VALUES(29,'','Leon','Clayton','leonclayton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','51','');
INSERT INTO "contacts" VALUES(30,'','Marc','Richard','marcrichard@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','52','');
INSERT INTO "contacts" VALUES(31,'','Jordan','Waller','jordanwaller@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','53','');
INSERT INTO "contacts" VALUES(32,'','Jace','Hampton','jacehampton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','54','');
INSERT INTO "contacts" VALUES(33,'','Silas','Neal','silasneal@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','55','');
INSERT INTO "contacts" VALUES(34,'','Sonia','Gentry','soniagentry@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','56','');
INSERT INTO "contacts" VALUES(35,'','Alison','Barr','alisonbarr@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','57','');
INSERT INTO "contacts" VALUES(36,'','Vu','Pham','vupham@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','58','');
INSERT INTO "contacts" VALUES(37,'','Kellen','Cooley','kellencooley@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','59','');
INSERT INTO "contacts" VALUES(38,'','Jay','Zimmerman','jayzimmerman@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','60','');
INSERT INTO "contacts" VALUES(39,'','Melanie','Wheeler','melaniewheeler@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','61','');
INSERT INTO "contacts" VALUES(40,'','Fernando','Beltran','fernandobeltran@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','62','');
INSERT INTO "contacts" VALUES(41,'','Yuliana','Bird','yulianabird@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','63','');
INSERT INTO "contacts" VALUES(42,'','Alyson','Duffy','alysonduffy@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','64','');
INSERT INTO "contacts" VALUES(43,'','Nyla','Woods','nylawoods@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','65','');
INSERT INTO "contacts" VALUES(44,'','Aaron','Valdez','aaronvaldez@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','66','');
INSERT INTO "contacts" VALUES(45,'','John','Mills','johnmills@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','67','');
INSERT INTO "contacts" VALUES(46,'','Shannon','Greene','shannongreene@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','68','');
INSERT INTO "contacts" VALUES(47,'','Marco','Escobar','marcoescobar@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','69','');
INSERT INTO "contacts" VALUES(48,'','Lorelai','Gross','lorelaigross@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','70','');
INSERT INTO "contacts" VALUES(49,'','Elsa','Guerrero','elsaguerrero@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','71','');
INSERT INTO "contacts" VALUES(50,'','Dalia','Osborn','daliaosborn@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','72','');
INSERT INTO "contacts" VALUES(51,'','Tyrone','Pearson','tyronepearson@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','73','');
INSERT INTO "contacts" VALUES(52,'','Ariella','Branch','ariellabranch@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','74','');
INSERT INTO "contacts" VALUES(53,'','Jaydon','Bates','jaydonbates@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','75','');
INSERT INTO "contacts" VALUES(54,'','Javon','Rodgers','javonrodgers@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','76','');
INSERT INTO "contacts" VALUES(55,'','Josie','Mcclure','josiemcclure@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','77','');
INSERT INTO "contacts" VALUES(56,'','Marcus','Huynh','marcushuynh@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','78','');
INSERT INTO "contacts" VALUES(57,'','Ayanna','Gonzalez','ayannagonzalez@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','79','');
INSERT INTO "contacts" VALUES(58,'','Taniya','Singleton','taniyasingleton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','80','');
INSERT INTO "contacts" VALUES(59,'','Laura','Woodard','laurawoodard@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','81','');
INSERT INTO "contacts" VALUES(60,'','Shane','Gibson','shanegibson@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','82','');
INSERT INTO "contacts" VALUES(61,'','Alia','Duarte','aliaduarte@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','83','');
INSERT INTO "contacts" VALUES(62,'','Neil','Huerta','neilhuerta@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','84','');
INSERT INTO "contacts" VALUES(63,'','Laura','Hernandez','laurahernandez@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','85','');
INSERT INTO "contacts" VALUES(64,'','Makhi','Villegas','makhivillegas@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','86','');
INSERT INTO "contacts" VALUES(65,'','Rafael','Velasquez','rafaelvelasquez@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','87','');
INSERT INTO "contacts" VALUES(66,'','Ryan','Hardin','ryanhardin@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','88','');
INSERT INTO "contacts" VALUES(67,'','Mira','Olson','miraolson@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','89','');
INSERT INTO "contacts" VALUES(68,'','Anna','Orr','annaorr@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','90','');
INSERT INTO "contacts" VALUES(69,'','Naima','Crawford','naimacrawford@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','91','');
INSERT INTO "contacts" VALUES(70,'','Joe','Salinas','joesalinas@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','92','');
INSERT INTO "contacts" VALUES(71,'','Maleah','Bullock','maleahbullock@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','93','');
INSERT INTO "contacts" VALUES(72,'','Anika','Solomon','anikasolomon@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','94','');
INSERT INTO "contacts" VALUES(73,'','Christina','Webster','christinawebster@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','95','');
INSERT INTO "contacts" VALUES(74,'','Emilie','Costa','emiliecosta@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','96','');
INSERT INTO "contacts" VALUES(75,'','Ayana','Humphrey','ayanahumphrey@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','97','');
INSERT INTO "contacts" VALUES(76,'','Lucia','Cain','luciacain@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','98','');
INSERT INTO "contacts" VALUES(77,'','Amaya','Dunlap','amayadunlap@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','99','');
INSERT INTO "contacts" VALUES(78,'','Derrick','Blackwell','derrickblackwell@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','100','');
INSERT INTO "contacts" VALUES(79,'','Alice','Irwin','aliceirwin@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','101','');
INSERT INTO "contacts" VALUES(80,'','Fabian','Hughes','fabianhughes@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','102','');
INSERT INTO "contacts" VALUES(81,'','Raelynn','Wells','raelynnwells@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','103','');
INSERT INTO "contacts" VALUES(82,'','Simon','Davila','simondavila@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','104','');
INSERT INTO "contacts" VALUES(83,'','Jamarcus','Barnett','jamarcusbarnett@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','105','');
INSERT INTO "contacts" VALUES(84,'','Adrianna','Norman','adriannanorman@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','106','');
INSERT INTO "contacts" VALUES(85,'','Donna','Snow','donnasnow@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','107','');
INSERT INTO "contacts" VALUES(86,'','Gary','Wood','garywood@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','108','');
INSERT INTO "contacts" VALUES(87,'','Reagan','Norton','reagannorton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','109','');
INSERT INTO "contacts" VALUES(88,'','Jaylin','Morgan','jaylinmorgan@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','110','');
INSERT INTO "contacts" VALUES(89,'','Mira','Decker','miradecker@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','111','');
INSERT INTO "contacts" VALUES(90,'','Maya','Lambert','mayalambert@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','112','');
INSERT INTO "contacts" VALUES(91,'','Finley','Barry','finleybarry@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','113','');
INSERT INTO "contacts" VALUES(92,'','Ben','Oneill','benoneill@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','114','');
INSERT INTO "contacts" VALUES(93,'','Maia','Cooley','maiacooley@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','115','');
INSERT INTO "contacts" VALUES(94,'','Olive','Leach','oliveleach@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','116','');
INSERT INTO "contacts" VALUES(95,'','Oswaldo','Pacheco','oswaldopacheco@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','117','');
INSERT INTO "contacts" VALUES(96,'','Nico','Rivers','nicorivers@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','118','');
INSERT INTO "contacts" VALUES(97,'','Tiara','Griffith','tiaragriffith@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','119','');
INSERT INTO "contacts" VALUES(98,'','Declan','Glenn','declanglenn@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','120','');
INSERT INTO "contacts" VALUES(99,'','Madalyn','Francis','madalynfrancis@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','121','');
INSERT INTO "contacts" VALUES(100,'','Mathew','Rhodes','mathewrhodes@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','122','');
INSERT INTO "contacts" VALUES(101,'','Jessica','Woods','jessicawoods@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','123','');
INSERT INTO "contacts" VALUES(102,'','Eli','White','eliwhite@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','124','');
INSERT INTO "contacts" VALUES(103,'','Tatiana','Lang','tatianalang@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','125','');
INSERT INTO "contacts" VALUES(104,'','Gia','Ramirez','giaramirez@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','126','');
INSERT INTO "contacts" VALUES(105,'','Alejandro','Serrano','alejandroserrano@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','127','');
INSERT INTO "contacts" VALUES(106,'','Mya','Galloway','myagalloway@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','128','');
INSERT INTO "contacts" VALUES(107,'','Adam','Clark','adamclark@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','129','');
INSERT INTO "contacts" VALUES(108,'','Marisol','Gonzales','marisolgonzales@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','130','');
INSERT INTO "contacts" VALUES(109,'','Mya','Cobb','myacobb@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','131','');
INSERT INTO "contacts" VALUES(110,'','Jay','Shah','jayshah@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','132','');
INSERT INTO "contacts" VALUES(111,'','Nancy','Arroyo','nancyarroyo@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','133','');
INSERT INTO "contacts" VALUES(112,'','Aubrie','Booker','aubriebooker@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','134','');
INSERT INTO "contacts" VALUES(113,'','Emelia','Mercer','emeliamercer@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','135','');
INSERT INTO "contacts" VALUES(114,'','Yadiel','Horton','yadielhorton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','136','');
INSERT INTO "contacts" VALUES(115,'','Taniyah','Rios','taniyahrios@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','137','');
INSERT INTO "contacts" VALUES(116,'','Peyton','Craig','peytoncraig@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','138','');
INSERT INTO "contacts" VALUES(117,'','Francesca','Oliver','francescaoliver@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','139','');
INSERT INTO "contacts" VALUES(118,'','Albert','Montgomery','albertmontgomery@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','140','');
INSERT INTO "contacts" VALUES(119,'','Meredith','Cooke','meredithcooke@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','141','');
INSERT INTO "contacts" VALUES(120,'','Mckayla','Morrison','mckaylamorrison@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','142','');
INSERT INTO "contacts" VALUES(121,'','Hayley','Bright','hayleybright@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','143','');
INSERT INTO "contacts" VALUES(122,'','Dayana','Atkins','dayanaatkins@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','144','');
INSERT INTO "contacts" VALUES(123,'','Khloe','Stanley','khloestanley@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','145','');
INSERT INTO "contacts" VALUES(124,'','Ray','Fischer','rayfischer@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','146','');
INSERT INTO "contacts" VALUES(125,'','Casey','Kline','caseykline@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','147','');
INSERT INTO "contacts" VALUES(126,'','Aron','Joyce','aronjoyce@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','148','');
INSERT INTO "contacts" VALUES(127,'','Diego','Case','diegocase@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','149','');
INSERT INTO "contacts" VALUES(128,'','Chelsea','Graves','chelseagraves@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','150','');
INSERT INTO "contacts" VALUES(129,'','Ruth','Wu','ruthwu@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','151','');
INSERT INTO "contacts" VALUES(130,'','Isaac','Grant','isaacgrant@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','152','');
INSERT INTO "contacts" VALUES(131,'','Audrina','Rojas','audrinarojas@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','153','');
INSERT INTO "contacts" VALUES(132,'','Koen','Chase','koenchase@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','154','');
INSERT INTO "contacts" VALUES(133,'','Hailie','Holder','hailieholder@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','155','');
INSERT INTO "contacts" VALUES(134,'','Caylee','Pollard','cayleepollard@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','156','');
INSERT INTO "contacts" VALUES(135,'','Guillermo','Quinn','guillermoquinn@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','157','');
INSERT INTO "contacts" VALUES(136,'','Dominik','Wilkinson','dominikwilkinson@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','158','');
INSERT INTO "contacts" VALUES(137,'','Simone','Keller','simonekeller@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','159','');
INSERT INTO "contacts" VALUES(138,'','Violet','Ellis','violetellis@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','160','');
INSERT INTO "contacts" VALUES(139,'','Samir','Neal','samirneal@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','161','');
INSERT INTO "contacts" VALUES(140,'','Mira','Mcconnell','miramcconnell@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','162','');
INSERT INTO "contacts" VALUES(141,'','Aniya','Arellano','aniyaarellano@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','163','');
INSERT INTO "contacts" VALUES(142,'','Jakayla','Glover','jakaylaglover@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','164','');
INSERT INTO "contacts" VALUES(143,'','Angelo','Lutz','angelolutz@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','165','');
INSERT INTO "contacts" VALUES(144,'','Audrina','Graves','audrinagraves@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','166','');
INSERT INTO "contacts" VALUES(145,'','Turner','Carson','turnercarson@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','167','');
INSERT INTO "contacts" VALUES(146,'','Emelia','Fletcher','emeliafletcher@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','168','');
INSERT INTO "contacts" VALUES(147,'','Mackenzie','Hernandez','mackenziehernandez@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','169','');
INSERT INTO "contacts" VALUES(148,'','Jose','Burgess','joseburgess@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','17','');
INSERT INTO "contacts" VALUES(149,'','Brenda','Bass','brendabass@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','18','');
INSERT INTO "contacts" VALUES(150,'','Nikhil','Bishop','nikhilbishop@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','19','');
INSERT INTO "contacts" VALUES(151,'','Juliette','Cisneros','juliettecisneros@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','20','');
INSERT INTO "contacts" VALUES(152,'','Alana','Owen','alanaowen@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','21','');
INSERT INTO "contacts" VALUES(153,'','Cruz','Kerr','cruzkerr@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','22','');
INSERT INTO "contacts" VALUES(154,'','Beau','Eaton','beaueaton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','23','');
INSERT INTO "contacts" VALUES(155,'','Chance','Rasmussen','chancerasmussen@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','24','');
INSERT INTO "contacts" VALUES(156,'','James','Richards','jamesrichards@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','25','');
INSERT INTO "contacts" VALUES(157,'','Khloe','Campos','khloecampos@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','26','');
INSERT INTO "contacts" VALUES(158,'','Amelie','Bond','ameliebond@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','27','');
INSERT INTO "contacts" VALUES(159,'','Julie','Myers','juliemyers@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','28','');
INSERT INTO "contacts" VALUES(160,'','Jayda','Stanton','jaydastanton@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','29','');
INSERT INTO "contacts" VALUES(161,'','Yesenia','Ritter','yeseniaritter@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','30','');
INSERT INTO "contacts" VALUES(162,'','Abraham','Sims','abrahamsims@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','31','');
INSERT INTO "contacts" VALUES(163,'','Kyle','Huffman','kylehuffman@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','32','');
INSERT INTO "contacts" VALUES(164,'','Cora','Hall','corahall@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','33','');
INSERT INTO "contacts" VALUES(165,'','Isaac','Barker','isaacbarker@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','34','');
INSERT INTO "contacts" VALUES(166,'','Kailey','Glass','kaileyglass@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','35','');
INSERT INTO "contacts" VALUES(167,'','Delilah','Ibarra','delilahibarra@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','36','');
INSERT INTO "contacts" VALUES(168,'','Zackery','Morgan','zackerymorgan@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','37','');
INSERT INTO "contacts" VALUES(169,'','Duncan','Bowers','duncanbowers@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','38','');
INSERT INTO "contacts" VALUES(170,'','Lauryn','Odom','laurynodom@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','39','');
INSERT INTO "contacts" VALUES(171,'','Yusef','Flores','yusefflores@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','40','');
INSERT INTO "contacts" VALUES(172,'','Semaj','Wall','semajwall@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','41','');
INSERT INTO "contacts" VALUES(173,'','Frankie','Waller','frankiewaller@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','42','');
INSERT INTO "contacts" VALUES(174,'','Eliezer','Bray','eliezerbray@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','43','');
INSERT INTO "contacts" VALUES(175,'','Jaden','Conner','jadenconner@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','44','');
INSERT INTO "contacts" VALUES(176,'','Steven','Harper','stevenharper@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','45','');
INSERT INTO "contacts" VALUES(177,'','Karissa','Aguilar','karissaaguilar@example.com','','','','','','','','','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','','false','','','','46','');
CREATE TABLE household_accounts (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"Street" VARCHAR(255), 
	"City" VARCHAR(255), 
	"State" VARCHAR(255), 
	"PostalCode" VARCHAR(255), 
	"Country" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"AccountNumber" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"MaximumClientsServed__c" VARCHAR(255), 
	"SYSTEM_CUSTOM_NAMING__c" VARCHAR(255), 
	"FirstCloseDate__c" VARCHAR(255), 
	"LastCloseDate__c" VARCHAR(255), 
	"AverageAmount__c" VARCHAR(255), 
	"LastOppAmount__c" VARCHAR(255), 
	"LargestAmount__c" VARCHAR(255), 
	"SmallestAmount__c" VARCHAR(255), 
	"Best_Gift_Year__c" VARCHAR(255), 
	"Best_Gift_Year_Total__c" VARCHAR(255), 
	"TotalOppAmount__c" VARCHAR(255), 
	"OppAmountLastNDays__c" VARCHAR(255), 
	"OppAmountThisYear__c" VARCHAR(255), 
	"OppAmountLastYear__c" VARCHAR(255), 
	"OppAmount2YearsAgo__c" VARCHAR(255), 
	"NumberOfClosedOpps__c" VARCHAR(255), 
	"OppsClosedLastNDays__c" VARCHAR(255), 
	"OppsClosedThisYear__c" VARCHAR(255), 
	"OppsClosedLastYear__c" VARCHAR(255), 
	"OppsClosed2YearsAgo__c" VARCHAR(255), 
	"TotalMembershipOppAmount__c" VARCHAR(255), 
	"MembershipEndDate__c" VARCHAR(255), 
	"LastMembershipLevel__c" VARCHAR(255), 
	"MembershipJoinDate__c" VARCHAR(255), 
	"LastMembershipDate__c" VARCHAR(255), 
	"LastMembershipAmount__c" VARCHAR(255), 
	"LastMembershipOrigin__c" VARCHAR(255), 
	"NumberOfMembershipOpps__c" VARCHAR(255), 
	"SYSTEM_AccountType__c" VARCHAR(255), 
	"SYSTEMIsIndividual__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "household_accounts" VALUES(1,'Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(2,'Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(3,'Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(4,'Higgins Household','','','','','','','555-248-3956','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(5,'Adams Household','','','','','','','555-648-7204','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(6,'Baker Household','','','','','','','555-524-0749','','','','','','Household','','','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(7,'Banks and Graham Household','','','','','','','555-648-7204','','','','','','Household','','','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','400.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(8,'Barnes Household','','','','','','','555-893-4763','','','','','','Household','','','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(9,'Boyd Household','','','','','','','555-380-8532','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(10,'Burke Household','','','','','','','555-830-5295','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(11,'Henderson Household','','','','','','','555-830-5295','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(12,'Hill Household','','','','','','','555-395-9737','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(13,'Holmes Household','','','','','','','555-930-8759','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(14,'Jenkins Household','','','','','','','555-469-9873','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(15,'Johnson Household','','','','','','','555-248-3956','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(16,'Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(17,'Burgess Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(18,'Bass Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(19,'Bishop Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(20,'Cisneros Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(21,'Owen Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(22,'Kerr Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(23,'Eaton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(24,'Rasmussen Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(25,'Richards Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(26,'Campos Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(27,'Bond Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(28,'Myers Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(29,'Stanton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(30,'Ritter Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(31,'Sims Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(32,'Huffman Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(33,'Hall Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(34,'Barker Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(35,'Glass Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(36,'Ibarra Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(37,'Morgan Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(38,'Bowers Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(39,'Odom Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(40,'Flores Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(41,'Wall Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(42,'Waller Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(43,'Bray Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(44,'Conner Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(45,'Harper Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(46,'Aguilar Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(47,'Cummings Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(48,'Cardenas Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(49,'Woods Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(50,'Spence Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(51,'Clayton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(52,'Richard Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(53,'Waller Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(54,'Hampton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(55,'Neal Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(56,'Gentry Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(57,'Barr Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(58,'Pham Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(59,'Cooley Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(60,'Zimmerman Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(61,'Wheeler Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(62,'Beltran Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(63,'Bird Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(64,'Duffy Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(65,'Woods Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(66,'Valdez Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(67,'Mills Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(68,'Greene Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(69,'Escobar Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(70,'Gross Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(71,'Guerrero Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(72,'Osborn Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(73,'Pearson Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(74,'Branch Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(75,'Bates Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(76,'Rodgers Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(77,'Mcclure Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(78,'Huynh Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(79,'Gonzalez Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(80,'Singleton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(81,'Woodard Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(82,'Gibson Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(83,'Duarte Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(84,'Huerta Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(85,'Hernandez Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(86,'Villegas Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(87,'Velasquez Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(88,'Hardin Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(89,'Olson Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(90,'Orr Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(91,'Crawford Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(92,'Salinas Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(93,'Bullock Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(94,'Solomon Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(95,'Webster Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(96,'Costa Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(97,'Humphrey Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(98,'Cain Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(99,'Dunlap Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(100,'Blackwell Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(101,'Irwin Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(102,'Hughes Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(103,'Wells Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(104,'Davila Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(105,'Barnett Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(106,'Norman Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(107,'Snow Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(108,'Wood Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(109,'Norton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(110,'Morgan Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(111,'Decker Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(112,'Lambert Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(113,'Barry Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(114,'Oneill Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(115,'Cooley Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(116,'Leach Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(117,'Pacheco Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(118,'Rivers Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(119,'Griffith Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(120,'Glenn Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(121,'Francis Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(122,'Rhodes Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(123,'Woods Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(124,'White Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(125,'Lang Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(126,'Ramirez Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(127,'Serrano Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(128,'Galloway Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(129,'Clark Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(130,'Gonzales Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(131,'Cobb Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(132,'Shah Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(133,'Arroyo Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(134,'Booker Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(135,'Mercer Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(136,'Horton Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(137,'Rios Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(138,'Craig Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(139,'Oliver Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(140,'Montgomery Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(141,'Cooke Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(142,'Morrison Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(143,'Bright Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(144,'Atkins Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(145,'Stanley Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(146,'Fischer Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(147,'Kline Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(148,'Joyce Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(149,'Case Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(150,'Graves Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(151,'Wu Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(152,'Grant Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(153,'Rojas Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(154,'Chase Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(155,'Holder Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(156,'Pollard Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(157,'Quinn Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(158,'Wilkinson Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(159,'Keller Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(160,'Ellis Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(161,'Neal Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(162,'Mcconnell Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(163,'Arellano Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(164,'Glover Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(165,'Lutz Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(166,'Graves Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(167,'Carson Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(168,'Fletcher Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
INSERT INTO "household_accounts" VALUES(169,'Hernandez Household','','','','','','','','','','','','','Household','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','HH_Account');
CREATE TABLE npe4__relationships (
	id INTEGER NOT NULL, 
	"Related_Opportunity_Contact_Role__c" VARCHAR(255), 
	"SYSTEM_SystemCreated__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	related_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npe4__relationships" VALUES(1,'','false','','Current','Mother','4','5');
INSERT INTO "npe4__relationships" VALUES(2,'','true','','Current','Son','5','4');
INSERT INTO "npe4__relationships" VALUES(3,'','true','Arthur is Arlene''s recently deceased father.','Current','Child','8','9');
INSERT INTO "npe4__relationships" VALUES(4,'Tribute','false','Arthur is Arlene''s recently deceased father.','Current','Father','9','8');
INSERT INTO "npe4__relationships" VALUES(5,'','true','','Current','Son','12','14');
INSERT INTO "npe4__relationships" VALUES(6,'','true','','Current','Son','13','14');
INSERT INTO "npe4__relationships" VALUES(7,'','false','','Current','Mother','14','12');
INSERT INTO "npe4__relationships" VALUES(8,'','false','','Current','Father','14','13');
INSERT INTO "npe4__relationships" VALUES(9,'','true','','Current','Spouse','21','23');
INSERT INTO "npe4__relationships" VALUES(10,'','true','','Current','Parent','22','23');
INSERT INTO "npe4__relationships" VALUES(11,'','false','','Current','Husband','23','21');
INSERT INTO "npe4__relationships" VALUES(12,'','false','','Current','Daughter','23','22');
CREATE TABLE "npsp__OpportunityContactRole" (
	id INTEGER NOT NULL, 
	"Role" VARCHAR(255), 
	"IsPrimary" VARCHAR(255), 
	contact_id VARCHAR(255), 
	opportunity_id VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__OpportunityContactRole" VALUES(1,'Tribute','false','8','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(2,'Tribute','false','8','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(3,'Tribute','false','8','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(4,'Tribute','false','8','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(5,'Donor','true','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(6,'Donor','true','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(7,'Donor','true','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(8,'Donor','true','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(9,'Household Member','false','10','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(10,'Household Member','false','10','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(11,'Household Member','false','10','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(12,'Household Member','false','10','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(13,'Donor','true','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(14,'Donor','true','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(15,'Donor','true','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(16,'Donor','true','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(17,'Donor','true','12','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(18,'Donor','true','12','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(19,'Donor','true','12','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(20,'Donor','true','12','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(21,'Household Member','false','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(22,'Household Member','false','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(23,'Household Member','false','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(24,'Household Member','false','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(25,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(26,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(27,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(28,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(29,'Donor','true','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(30,'Donor','true','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(31,'Donor','true','12','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(32,'Tribute','false','8','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(33,'Household Member','false','10','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(34,'Household Member','false','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(35,'Household Member','false','14','3');
CREATE TABLE npsp__donations (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"NextStep" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"StageName" VARCHAR(255), 
	"LeadSource" VARCHAR(255), 
	"ForecastCategoryName" VARCHAR(255), 
	"Probability" VARCHAR(255), 
	"TotalOpportunityQuantity" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"CloseDate" VARCHAR(255), 
	"Amount" VARCHAR(255), 
	"IsPrivate" VARCHAR(255), 
	"Grant_Requirements_Website__c" VARCHAR(255), 
	"Primary_Contact_Campaign_Member_Status__c" VARCHAR(255), 
	"Notification_Recipient_Name__c" VARCHAR(255), 
	"Honoree_Name__c" VARCHAR(255), 
	"Matching_Gift_Employer__c" VARCHAR(255), 
	"Grant_Contract_Number__c" VARCHAR(255), 
	"Notification_Recipient_Information__c" VARCHAR(255), 
	"Grant_Program_Area_s__c" VARCHAR(255), 
	"In_Kind_Description__c" VARCHAR(255), 
	"Tribute_Type__c" VARCHAR(255), 
	"Notification_Preference__c" VARCHAR(255), 
	"Matching_Gift_Status__c" VARCHAR(255), 
	"In_Kind_Type__c" VARCHAR(255), 
	"Acknowledgment_Status__c" VARCHAR(255), 
	"Gift_Strategy__c" VARCHAR(255), 
	"Recurring_Donation_Installment_Number__c" VARCHAR(255), 
	"Notification_Message__c" VARCHAR(255), 
	"Closed_Lost_Reason__c" VARCHAR(255), 
	"Grant_Period_Start_Date__c" VARCHAR(255), 
	"Grant_Period_End_Date__c" VARCHAR(255), 
	"Grant_Contract_Date__c" VARCHAR(255), 
	"Acknowledgment_Date__c" VARCHAR(255), 
	"Qualified_Date__c" VARCHAR(255), 
	"Ask_Date__c" VARCHAR(255), 
	"Fair_Market_Value__c" VARCHAR(255), 
	"Requested_Amount__c" VARCHAR(255), 
	"DisableContactRoleAutomation__c" VARCHAR(255), 
	"In_Kind_Donor_Declared_Value__c" VARCHAR(255), 
	"Is_Grant_Renewal__c" VARCHAR(255), 
	"systemHouseholdContactRoleProcessor__c" VARCHAR(255), 
	"Contact_Id_for_Role__c" VARCHAR(255), 
	"Membership_Origin__c" VARCHAR(255), 
	"Member_Level__c" VARCHAR(255), 
	"Membership_Start_Date__c" VARCHAR(255), 
	"Membership_End_Date__c" VARCHAR(255), 
	"Do_Not_Automatically_Create_Payment__c" VARCHAR(255), 
	account_id VARCHAR(255), 
	primary_contact__c VARCHAR(255), 
	honoree_contact__c VARCHAR(255), 
	notification_recipient_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__donations" VALUES(1,'Arthur Baker Donation in Memoriam','','','Closed Won','','Closed','100.0','','','2019-09-02','500.0','false','','','Arlene Baker','Arthur Baker','','','','','','Memorial','Phone','','','To Be Acknowledged','','','','','','','','2019-09-06','','','','','false','false','false','All Opportunities','0035400000Hsa3XAAR','','','','','false','6','9','8','9');
INSERT INTO "npsp__donations" VALUES(2,'Darryl Graham 2019 In-Kind Donation','','','In-Kind Received','','Omitted','100.0','','','2019-08-05','400.0','false','','','','','','','','','<p>PSA Production for fundraising drive</p>','','','','Services','Acknowledged','','','','','','','','2019-08-09','','','800.0','','false','true','false','All Opportunities','0035400000HtExuAAF','','','','','false','7','11','','');
INSERT INTO "npsp__donations" VALUES(3,'Lynn Barnes 1019 Donation','','','Closed Won','','Closed','100.0','','','2019-07-01','500.0','false','','','','','','','','','','','','','','Acknowledged','','','','','','','','2019-07-05','','','','','false','false','false','All Opportunities','0035400000HtEyZAAV','','','','','false','8','12','','');
CREATE TABLE organization_accounts (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"Street" VARCHAR(255), 
	"City" VARCHAR(255), 
	"State" VARCHAR(255), 
	"PostalCode" VARCHAR(255), 
	"Country" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"AccountNumber" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"MaximumClientsServed__c" VARCHAR(255), 
	"SYSTEM_CUSTOM_NAMING__c" VARCHAR(255), 
	"FirstCloseDate__c" VARCHAR(255), 
	"LastCloseDate__c" VARCHAR(255), 
	"AverageAmount__c" VARCHAR(255), 
	"LastOppAmount__c" VARCHAR(255), 
	"LargestAmount__c" VARCHAR(255), 
	"SmallestAmount__c" VARCHAR(255), 
	"Best_Gift_Year__c" VARCHAR(255), 
	"Best_Gift_Year_Total__c" VARCHAR(255), 
	"TotalOppAmount__c" VARCHAR(255), 
	"OppAmountLastNDays__c" VARCHAR(255), 
	"OppAmountThisYear__c" VARCHAR(255), 
	"OppAmountLastYear__c" VARCHAR(255), 
	"OppAmount2YearsAgo__c" VARCHAR(255), 
	"NumberOfClosedOpps__c" VARCHAR(255), 
	"OppsClosedLastNDays__c" VARCHAR(255), 
	"OppsClosedThisYear__c" VARCHAR(255), 
	"OppsClosedLastYear__c" VARCHAR(255), 
	"OppsClosed2YearsAgo__c" VARCHAR(255), 
	"TotalMembershipOppAmount__c" VARCHAR(255), 
	"MembershipEndDate__c" VARCHAR(255), 
	"LastMembershipLevel__c" VARCHAR(255), 
	"MembershipJoinDate__c" VARCHAR(255), 
	"LastMembershipDate__c" VARCHAR(255), 
	"LastMembershipAmount__c" VARCHAR(255), 
	"LastMembershipOrigin__c" VARCHAR(255), 
	"NumberOfMembershipOpps__c" VARCHAR(255), 
	"SYSTEM_AccountType__c" VARCHAR(255), 
	"SYSTEMIsIndividual__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "organization_accounts" VALUES(1,'Sample Organization','','','','','','','','','','','','','','','','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
INSERT INTO "organization_accounts" VALUES(2,'Sample Organization','','','','','','','','','','','','','','','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
INSERT INTO "organization_accounts" VALUES(3,'Sample Organization','','','','','','','','','','','','','','','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
INSERT INTO "organization_accounts" VALUES(4,'Marble Foundation','','','','','','','555-389-74399','','','','','','Foundation','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
INSERT INTO "organization_accounts" VALUES(5,'Future Potential Fund','','','','','','','555-278-7643','','','','','','Foundation','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
INSERT INTO "organization_accounts" VALUES(6,'City Department of Human Services','','','','','','','','','','','','','Government','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
INSERT INTO "organization_accounts" VALUES(7,'Sample Organization','','','','','','','','','','','','','','','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','Organization');
CREATE TABLE "pmdm__ProgramEngagement__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"ApplicationDate__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"Role__c" VARCHAR(255), 
	"Stage__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	account__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(1,'Naima  Crawford - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','69','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(2,'Jessica  Woods - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','101','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(3,'Taniyah  Rios - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','115','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(4,'Casey  Kline - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','125','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(5,'Barbara  Johnson - School Lunch Program','2019-11-20','','Client','Applied','','','23','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(6,'Audrina  Rojas - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-11-06','153','131','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(7,'Marisol  Gonzales - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-07-18','130','108','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(8,'Yesenia  Ritter - Prenatal and Early Childhood Health Program','2019-08-05','','Client','In Progress','2019-11-22','','161','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(9,'Maya  Johnson - After School Program, Ages 11-13','','','Client','Enrolled','2019-11-20','','22','9');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(10,'Alana  Owen - Mobile Middle School STEM Program','','','Client','In Progress','2019-09-09','','152','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(11,'Alia  Duarte - Mobile Middle School STEM Program','','','Client','In Progress','2019-09-09','83','61','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(12,'Karissa  Aguilar - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-08-20','','177','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(13,'Olive  Leach - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-07-08','116','94','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(14,'Mira  Mcconnell - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-04-24','162','140','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(15,'Juliette  Cisneros - Prenatal and Early Childhood Health Program','','','Client','Enrolled','2019-11-21','20','151','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(16,'Diego  Case - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','127','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(17,'Yuliana  Bird - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','41','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(18,'Ayanna  Gonzalez - Mobile Middle School STEM Program','','2019-12-20','Client','In Progress','2019-09-09','','57','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(19,'Abraham  Sims - Mobile Middle School STEM Program','','','Client','In Progress','2019-09-09','','162','10');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(20,'Tom  Higgins - Housing Assistance Program','2019-05-25','','Client','Enrolled','2019-06-01','','4','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(21,'Tom  Higgins - School Lunch Program','2019-06-08','','Client','Enrolled','2019-09-03','','4','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(22,'Tom  Higgins - Remedial Reading Program','2019-04-12','','Client','In Progress','2019-06-03','','4','7');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(23,'Tom  Higgins - After School Program, Ages 11-13','2019-08-29','','Client','Applied','2019-09-03','','4','9');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(24,'Arlene  Baker - Job Readiness Program','2019-06-19','','Client','Enrolled','2019-09-04','','9','8');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(25,'Robin  Banks - Drug and Alcohol Recovery Management','2019-04-24','','Client','In Progress','2019-06-03','','10','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(26,'Robin  Banks - Job Readiness Program','2019-09-02','','Client','In Progress','2019-09-04','','10','8');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(27,'Jason  Barnes - Financial Literacy Program','2019-08-23','','Client','In Progress','2019-09-04','','14','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(28,'Barbara  Johnson - ESL Program','2019-07-03','','Client','Enrolled','2019-09-04','','23','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(29,'Simone  Keller - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-08-12','159','137','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(30,'Violet  Ellis - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-07-03','160','138','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(31,'Caylee  Pollard - Prenatal and Early Childhood Health Program','','','Client','Enrolled','2019-11-20','156','134','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(32,'Lauryn  Odom - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-08-21','39','170','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(33,'Amelie  Bond - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-07-30','27','158','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(34,'Emelia  Fletcher - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-04-08','168','146','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(35,'Cora  Hall - Prenatal and Early Childhood Health Program','','','Client','Enrolled','2019-08-12','33','164','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(36,'Dayana  Atkins - Prenatal and Early Childhood Health Program','','','Client','Enrolled','2019-11-22','144','122','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(37,'Delilah  Ibarra - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-05-08','36','167','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(38,'Nancy  Arroyo - Prenatal and Early Childhood Health Program','','','Client','In Progress','2019-10-15','133','111','1');
CREATE TABLE "pmdm__Program__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"ProgramIssueArea__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Summary__c" VARCHAR(255), 
	"TargetPopulation__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Program__c" VALUES(1,'Prenatal and Early Childhood Health Program','','','Food and Nutrition','','Active','','');
INSERT INTO "pmdm__Program__c" VALUES(2,'Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2019-12-31','','2019-01-01','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "pmdm__Program__c" VALUES(3,'Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2019-05-01','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "pmdm__Program__c" VALUES(4,'ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2020-05-30','','2019-09-03','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "pmdm__Program__c" VALUES(5,'Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','2019-12-13','Education','2019-09-04','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(6,'School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2020-05-30','Food and Nutrition','2019-09-03','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(7,'Remedial Reading Program','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','2020-05-15','Education','2019-06-03','Active','Provides students the support they need to achieve an age appropriate reading level.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(8,'Job Readiness Program','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','Employment','2019-04-15','Active','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce');
INSERT INTO "pmdm__Program__c" VALUES(9,'After School Program, Ages 11-13','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','2020-05-31','Education','2019-09-01','Active','An after school program for children enrolled in district 31.','Children aged 11-13 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(10,'Mobile Middle School STEM Program','The program focuses on bringing hands-on mid-level STEM courses into the classroom at least twice a week, and promotes awareness of the STEM fields and occupations. It provides standards-based structured inquiry-based and real-world problem-based learning, connecting all four of the STEM subjects, science, technology, engineering, and math. The goal is to pique students'' interest in them wanting to pursue the courses, not because they have to.','2020-05-15','Education','2019-09-09','Active','The program brings hands-on mid-level STEM courses into the classroom at least twice a week','Middle School students aged 11-14');
INSERT INTO "pmdm__Program__c" VALUES(11,'Urban Horticulture Food Forest','A green space program to provide healthy and fresh food to our community, teach the connection between the local environment and food production and reclaim sovereignty over food production using environmentally dynamic systems.','','Food and Nutrition','2018-04-03','Active','A green space program to provide healthy and fresh food to our community, teach the connection between the local environment and food production.','Community gardeners, students, and community members including food banks.');
INSERT INTO "pmdm__Program__c" VALUES(12,'No More Food Deserts Advocacy','Advocacy program calling attention to and seeking remediation for the area''s lack of affordable grocery store options. This is an awareness-building campaign intended to garner support and funding for affordable alternatives from grantmakers and to be supported by the city and county councils.','','Advocacy','2019-08-01','Active','Calling attention to and seeking remediation for the area''s lack of affordable grocery store options.','Area residents, city and county government and grantmakers funding in the region.');
CREATE TABLE "pmdm__ServiceDelivery__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"DeliveryDate__c" VARCHAR(255), 
	"Quantity__c" VARCHAR(255), 
	service__c VARCHAR(255), 
	account__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(1,'Jessica Woods - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(2,'Naima Crawford - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(3,'Naima Crawford - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(4,'Naima Crawford - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(5,'Abraham Sims - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(6,'Alia Duarte - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(7,'Casey Kline - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(8,'Casey Kline - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(9,'Taniyah Rios - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(10,'Alana Owen - STEM Field Trips','2019-11-25','1.0','19','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(11,'Arlene Baker - Job Readiness Coaching','2019-11-27','0.5','5','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(12,'Alia Duarte - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(13,'Casey Kline - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(14,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(15,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(16,'Naima Crawford - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(17,'Casey Kline - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(18,'Casey Kline - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(19,'Jessica Woods - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(20,'Taniyah Rios - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(21,'Yuliana Bird - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(22,'Robin Banks - Financial Advisor Sessions','2019-10-07','0.5','4','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(23,'Naima Crawford - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(24,'Diego Case - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(25,'Diego Case - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(26,'Diego Case - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(27,'Diego Case - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(28,'Yuliana Bird - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(29,'Jessica Woods - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(30,'Taniyah Rios - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(31,'Robin Banks - Job Readiness Coaching','2019-12-20','0.75','5','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(32,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(33,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(34,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(35,'Jessica Woods - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(36,'Naima Crawford - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(37,'Alia Duarte - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(38,'Casey Kline - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(39,'Diego Case - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(40,'Diego Case - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(41,'Diego Case - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(42,'Diego Case - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(43,'Diego Case - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(44,'Naima Crawford - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(45,'Alia Duarte - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(46,'Casey Kline - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(47,'Robin Banks - Financial Advisor Sessions','2019-10-07','0.5','4','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(48,'Naima Crawford - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(49,'Naima Crawford - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(50,'Naima Crawford - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(51,'Abraham Sims - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(52,'Alana Owen - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(53,'Alana Owen - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(54,'Alia Duarte - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(55,'Alia Duarte - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(56,'Taniyah Rios - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(57,'Taniyah Rios - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(58,'Alia Duarte - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(59,'Alia Duarte - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(60,'Naima Crawford - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(61,'Alia Duarte - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(62,'Alia Duarte - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(63,'Alia Duarte - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(64,'Alia Duarte - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(65,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(66,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(67,'Jessica Woods - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(68,'Tom Higgins - Subsidized Lunch','2019-11-05','1.0','6','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(69,'Tom Higgins - Subsidized Lunch','2019-11-06','1.0','6','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(70,'Tom Higgins - Subsidized Lunch','2019-11-04','1.0','6','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(71,'Jessica Woods - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(72,'Jessica Woods - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(73,'Yuliana Bird - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(74,'Ayanna Gonzalez - STEM Field Trips','2019-11-25','1.0','19','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(75,'Arlene Baker - Financial Advisor Session Hours','2019-10-07','0.5','4','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(76,'Robin Banks - Financial Advisor Sessions','2019-11-04','0.5','4','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(77,'Jessica Woods - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(78,'Yuliana Bird - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(79,'Naima Crawford - STEM Field Trips','2019-11-25','1.0','19','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(80,'Robin Banks - Financial Advisor Sessions','2019-09-09','0.5','4','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(81,'Taniyah Rios - STEM Field Trips','2019-11-25','1.0','19','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(82,'Marisol Gonzales - Provide Prenatal Vitamins','2019-10-14','','2','','108');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(83,'Abraham Sims - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(84,'Abraham Sims - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(85,'Alana Owen - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(86,'Juliette Cisneros - Prenatal Care Sessions (appointments and walk-ins)','2019-11-20','1.0','10','','151');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(87,'Dayana Atkins - Prenatal Care Sessions (appointments and walk-ins)','2019-11-25','1.0','10','','122');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(88,'Alana Owen - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(89,'Alana Owen - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(90,'Alia Duarte - STEM Field Trips','2019-11-25','1.0','19','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(91,'Violet Ellis - Administer Early Childcare Vaccines','2019-11-13','3.0','12','','138');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(92,'Dayana Atkins - Provide Prenatal Vitamins','2019-11-25','30.0','2','','122');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(93,'Abraham Sims - STEM Field Trips','2019-11-25','1.0','19','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(94,'Alana Owen - Girls STEM outreach, 10/3/19','2019-11-25','','11','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(95,'Alana Owen - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(96,'Alana Owen - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(97,'Abraham Sims - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(98,'Alana Owen - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(99,'Alana Owen - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(100,'Alana Owen - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(101,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','2019-10-30','1.0','10','','94');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(102,'Karissa Aguilar - Refer to Caregivers Support Group','2019-11-25','','13','','177');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(103,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','2019-09-18','1.0','10','','94');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(104,'Caylee Pollard - Prenatal Care Sessions (appointments and walk-ins)','2019-10-22','1.0','10','','134');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(105,'Abraham Sims - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(106,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','2019-08-14','1.0','10','','138');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(107,'Nancy Arroyo - Prenatal Care Sessions (appointments and walk-ins)','2019-10-16','1.0','10','','111');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(108,'Yuliana Bird - STEM Field Trips','2019-11-25','1.0','19','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(109,'Casey Kline - STEM Field Trips','2019-11-25','1.0','19','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(110,'Tom Higgins - Food received from urban food forest','2019-10-31','0.25','9','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(111,'Tom Higgins - Food received from urban food forest','2019-12-31','0.25','9','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(112,'Abraham Sims - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(113,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(114,'Tom Higgins - Food received from urban food forest','2019-09-30','0.25','9','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(115,'Arlene Baker - Financial Advisor Session Hours','2019-11-05','0.5','4','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(116,'Arlene Baker - Financial Advisor Session Hours','2020-01-06','0.5','4','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(117,'Arlene Baker - Job Readiness Coaching','2019-11-29','0.75','5','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(118,'Diego Case - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(119,'Diego Case - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(120,'Casey Kline - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(121,'Casey Kline - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(122,'Casey Kline - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(123,'Diego Case - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(124,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(125,'Alana Owen - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(126,'Alia Duarte - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(127,'Casey Kline - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(128,'Taniyah Rios - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(129,'Diego Case - STEM Field Trips','2019-11-25','1.0','19','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(130,'Diego Case - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(131,'Jessica Woods - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(132,'Jessica Woods - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(133,'Taniyah Rios - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(134,'Yuliana Bird - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(135,'Casey Kline - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(136,'Casey Kline - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(137,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(138,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(139,'Taniyah Rios - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(140,'Arlene Baker - Financial Advisor Session Hours','2019-09-05','0.5','4','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(141,'Arlene Baker - Job Readiness Coaching','2019-09-25','0.75','5','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(142,'Robin Banks - Job Readiness Coaching','2019-10-28','0.75','5','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(143,'Taniyah Rios - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(144,'Arlene Baker - Job Interviews completed','2019-10-11','1.0','3','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(145,'Tom Higgins - Food received from urban food forest','2019-11-29','0.25','9','','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(146,'Yuliana Bird - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(147,'Yuliana Bird - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(148,'Yuliana Bird - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(149,'Taniyah Rios - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(150,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(151,'Alia Duarte - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(152,'Casey Kline - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','125');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(153,'Diego Case - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','127');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(154,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(155,'Naima Crawford - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(156,'Jessica Woods - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(157,'Jessica Woods - Middle School STEM Classroom Hours','2019-10-30','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(158,'Jessica Woods - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(159,'Taniyah Rios - Middle School STEM Classroom Hours','2019-12-11','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(160,'Yuliana Bird - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(161,'Jessica Woods - STEM Field Trips','2019-11-25','1.0','19','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(162,'Arlene Baker - Job Interviews completed','2019-10-15','2.0','3','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(163,'Robin Banks - Job Readiness Coaching','2019-09-27','0.75','5','','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(164,'Yuliana Bird - Middle School STEM Classroom Hours','2019-09-18','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(165,'Yuliana Bird - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(166,'Arlene Baker - Job Readiness Coaching','2019-10-30','0.75','5','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(167,'Naima Crawford - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(168,'Ayanna Gonzalez - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(169,'Taniyah Rios - Middle School STEM Classroom Hours','2019-12-04','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(170,'Yuliana Bird - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(171,'Yuliana Bird - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(172,'Yuliana Bird - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(173,'Arlene Baker - Financial Advisor Session Hours','2019-12-04','0.5','4','','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(174,'Naima Crawford - Middle School STEM Classroom Hours','2019-11-20','2.0','17','','69');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(175,'Jessica Woods - Middle School STEM Classroom Hours','2019-12-18','2.0','17','','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(176,'Taniyah Rios - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(177,'Taniyah Rios - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','115');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(178,'Abraham Sims - Middle School STEM Classroom Hours','2019-11-13','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(179,'Olive Leach - Provide Prenatal Vitamins','2019-09-18','30.0','2','','94');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(180,'Nancy Arroyo - Provide Prenatal Vitamins','2019-10-16','30.0','2','','111');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(181,'Emelia Fletcher - Administer Early Childcare Vaccines','2019-11-06','3.0','12','','146');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(182,'Juliette Cisneros - Provide Prenatal Vitamins','2019-11-20','30.0','2','','151');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(183,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','2019-10-02','1.0','10','','138');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(184,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','2019-11-13','1.0','10','','138');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(185,'Marisol Gonzales - Prenatal Care Sessions (appointments and walk-ins)','2019-10-14','1.0','10','','108');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(186,'Abraham Sims - Middle School STEM Classroom Hours','2019-10-09','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(187,'Abraham Sims - Middle School STEM Classroom Hours','2019-10-02','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(188,'Karissa Aguilar - Administer Early Childcare Vaccines','2019-11-25','','12','','177');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(189,'Barbara Johnson - Grade 1-8 Reading Tutoring','2019-11-20','1.25','7','','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(190,'Abraham Sims - Middle School STEM Classroom Hours','2019-09-25','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(191,'Alana Owen - STEM Field Trips','2019-11-25','','19','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(192,'Alana Owen - Middle School STEM Classroom Hours','2019-11-06','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(193,'Mira Mcconnell - Administer Early Childcare Vaccines','2019-08-19','3.0','12','','140');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(194,'Emelia Fletcher - Prenatal Care Sessions (appointments and walk-ins)','2019-11-25','','10','','146');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(195,'Abraham Sims - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(196,'Abraham Sims - Middle School STEM Classroom Hours','2019-10-23','2.0','17','','162');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(197,'Olive Leach - Provide Prenatal Vitamins','2019-10-30','30.0','2','','94');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(198,'Emelia Fletcher - Refer to Caregivers Support Group','2019-11-06','1.0','13','','146');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(199,'Delilah Ibarra - Refer to Caregivers Support Group','2019-11-13','1.0','13','','167');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(200,'Alana Owen - Middle School STEM Classroom Hours','2019-10-16','2.0','17','','152');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(201,'Abraham Sims - Middle School STEM Classroom Hours','2019-09-11','2.0','17','','162');
CREATE TABLE "pmdm__Service__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"UnitOfService__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Service__c" VALUES(1,'Town Hall Meeting, 8/19/19','Attendees','12');
INSERT INTO "pmdm__Service__c" VALUES(2,'Provide Prenatal Vitamins','Dosages','1');
INSERT INTO "pmdm__Service__c" VALUES(3,'Job Interviews completed','Completed Interviews','8');
INSERT INTO "pmdm__Service__c" VALUES(4,'Financial Advisor Sessions','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(5,'Job Readiness Coaching','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(6,'Subsidized Lunch','Lunch','6');
INSERT INTO "pmdm__Service__c" VALUES(7,'Grade 1-8 Reading Tutoring','Hour','7');
INSERT INTO "pmdm__Service__c" VALUES(8,'Resume Review','Hour','8');
INSERT INTO "pmdm__Service__c" VALUES(9,'Food received from urban food forest','lbs','11');
INSERT INTO "pmdm__Service__c" VALUES(10,'Prenatal Care Sessions (appointments and walk-ins)','Sessions','1');
INSERT INTO "pmdm__Service__c" VALUES(11,'Girls STEM outreach, 10/3/19','Attendees','10');
INSERT INTO "pmdm__Service__c" VALUES(12,'Administer Early Childcare Vaccines','Vaccines','1');
INSERT INTO "pmdm__Service__c" VALUES(13,'Refer to Caregivers Support Group','Referrals','1');
INSERT INTO "pmdm__Service__c" VALUES(14,'City Council Lobby Day 2019','Participants','12');
INSERT INTO "pmdm__Service__c" VALUES(15,'Job Placements','Job Placements','8');
INSERT INTO "pmdm__Service__c" VALUES(16,'Robotics Competition 9/25/19','Participants','10');
INSERT INTO "pmdm__Service__c" VALUES(17,'Middle School STEM Classroom Hours','Hours','10');
INSERT INTO "pmdm__Service__c" VALUES(18,'Letter writing campaign to Council Members','Letters','12');
INSERT INTO "pmdm__Service__c" VALUES(19,'STEM Field Trips','Field Trips','10');
COMMIT;
