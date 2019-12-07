BEGIN TRANSACTION;
CREATE TABLE caseman__account_program_offerings (
	id INTEGER NOT NULL, 
	accountrole__c VARCHAR(255), 
	account__c VARCHAR(255), 
	program_offering__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__account_program_offerings" VALUES(1,'Funder','1','8');
INSERT INTO "caseman__account_program_offerings" VALUES(2,'Funder','2','2');
INSERT INTO "caseman__account_program_offerings" VALUES(3,'Funder','2','8');
INSERT INTO "caseman__account_program_offerings" VALUES(4,'Location','3','2');
INSERT INTO "caseman__account_program_offerings" VALUES(5,'Service Provider','3','2');
INSERT INTO "caseman__account_program_offerings" VALUES(6,'Service Provider','3','4');
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
INSERT INTO "caseman__action_items" VALUES(1,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','146','1','4','12');
INSERT INTO "caseman__action_items" VALUES(2,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','146','1','4','20');
INSERT INTO "caseman__action_items" VALUES(3,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','146','1','4','23');
INSERT INTO "caseman__action_items" VALUES(4,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','146','1','4','26');
INSERT INTO "caseman__action_items" VALUES(5,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','146','1','4','4');
INSERT INTO "caseman__action_items" VALUES(6,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','146','1','4','5');
INSERT INTO "caseman__action_items" VALUES(7,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','146','1','5','10');
INSERT INTO "caseman__action_items" VALUES(8,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','146','1','5','11');
INSERT INTO "caseman__action_items" VALUES(9,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','146','1','5','3');
INSERT INTO "caseman__action_items" VALUES(10,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','146','1','5','39');
INSERT INTO "caseman__action_items" VALUES(11,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','146','1','5','40');
INSERT INTO "caseman__action_items" VALUES(12,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','146','1','5','41');
INSERT INTO "caseman__action_items" VALUES(13,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','146','1','6','38');
INSERT INTO "caseman__action_items" VALUES(14,'Get a job readiness coach','Completed','2019-09-05','146','1','6','42');
INSERT INTO "caseman__action_items" VALUES(15,'Complete resume workshop','Not Started','2019-09-27','146','1','6','43');
INSERT INTO "caseman__action_items" VALUES(16,'Complete interview workshop','Not Started','2019-10-20','146','1','6','44');
INSERT INTO "caseman__action_items" VALUES(17,'Pass mock interview','Not Started','2019-10-31','146','1','6','45');
INSERT INTO "caseman__action_items" VALUES(18,'Update resume','Not Started','2019-10-09','146','1','6','46');
INSERT INTO "caseman__action_items" VALUES(19,'Participate in a 12-step program','In Progress','2019-12-31','146','2','7','13');
INSERT INTO "caseman__action_items" VALUES(20,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','160','3','8','14');
INSERT INTO "caseman__action_items" VALUES(21,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','160','3','8','15');
INSERT INTO "caseman__action_items" VALUES(22,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','160','3','8','17');
INSERT INTO "caseman__action_items" VALUES(23,'Open a Savings Account','Completed','2019-09-09','160','3','8','27');
INSERT INTO "caseman__action_items" VALUES(24,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','160','3','8','37');
INSERT INTO "caseman__action_items" VALUES(25,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','66','4','10','16');
INSERT INTO "caseman__action_items" VALUES(26,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','110','6','13','30');
INSERT INTO "caseman__action_items" VALUES(27,'Meet job requirement standards','Not Started','2020-04-15','135','7','18','1');
INSERT INTO "caseman__action_items" VALUES(28,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','135','7','18','31');
INSERT INTO "caseman__action_items" VALUES(29,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','135','7','19','12');
INSERT INTO "caseman__action_items" VALUES(30,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','135','7','19','18');
INSERT INTO "caseman__action_items" VALUES(31,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','135','7','19','19');
INSERT INTO "caseman__action_items" VALUES(32,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','135','7','19','20');
INSERT INTO "caseman__action_items" VALUES(33,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','135','7','19','21');
INSERT INTO "caseman__action_items" VALUES(34,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','135','7','19','22');
INSERT INTO "caseman__action_items" VALUES(35,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','135','7','19','23');
INSERT INTO "caseman__action_items" VALUES(36,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','135','7','19','24');
INSERT INTO "caseman__action_items" VALUES(37,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','135','7','19','25');
INSERT INTO "caseman__action_items" VALUES(38,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','135','7','19','26');
INSERT INTO "caseman__action_items" VALUES(39,'Pass basic financial literacy course','In Progress','2019-09-30','135','7','19','37');
INSERT INTO "caseman__action_items" VALUES(40,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','135','7','19','4');
INSERT INTO "caseman__action_items" VALUES(41,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','135','7','19','5');
INSERT INTO "caseman__action_items" VALUES(42,'Open a bank account','Completed','2019-09-06','135','7','19','7');
INSERT INTO "caseman__action_items" VALUES(43,'Read and interpret a banking account statement','Not Started','2019-09-30','135','7','19','9');
INSERT INTO "caseman__action_items" VALUES(44,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','135','7','20','10');
INSERT INTO "caseman__action_items" VALUES(45,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','135','7','20','11');
INSERT INTO "caseman__action_items" VALUES(46,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','135','7','20','3');
INSERT INTO "caseman__action_items" VALUES(47,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','135','7','20','39');
INSERT INTO "caseman__action_items" VALUES(48,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','135','7','20','40');
INSERT INTO "caseman__action_items" VALUES(49,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','135','7','20','41');
INSERT INTO "caseman__action_items" VALUES(50,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','135','7','21','38');
INSERT INTO "caseman__action_items" VALUES(51,'Get a job readiness coach','Completed','2019-09-05','135','7','21','42');
INSERT INTO "caseman__action_items" VALUES(52,'Complete resume workshop','Not Started','2019-10-11','135','7','21','43');
INSERT INTO "caseman__action_items" VALUES(53,'Complete interview workshop','Not Started','2019-11-04','135','7','21','44');
INSERT INTO "caseman__action_items" VALUES(54,'Pass mock interview','Not Started','2019-11-06','135','7','21','45');
INSERT INTO "caseman__action_items" VALUES(55,'Update resume','Not Started','2019-10-25','135','7','21','46');
CREATE TABLE caseman__appointment_attendees (
	id INTEGER NOT NULL, 
	reason__c VARCHAR(255), 
	role__c VARCHAR(255), 
	status__c VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__appointment_attendees" VALUES(1,'Client','Attendee','Attending','2','123');
INSERT INTO "caseman__appointment_attendees" VALUES(2,'Check in on Jason''s progress with Workplace Readiness.','Attendee','New','3','160');
INSERT INTO "caseman__appointment_attendees" VALUES(3,'','Attendee','New','4','66');
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
INSERT INTO "caseman__branch_contacts" VALUES(1,'','true','0011g00000iP4GZAA0','9');
INSERT INTO "caseman__branch_contacts" VALUES(2,'','true','0011g00000iP4I1AAK','10');
INSERT INTO "caseman__branch_contacts" VALUES(3,'','true','0011g00000iP4I2AAK','11');
INSERT INTO "caseman__branch_contacts" VALUES(4,'','true','0011g00000iP4I3AAK','12');
INSERT INTO "caseman__branch_contacts" VALUES(5,'','true','0011g00000iP4I4AAK','13');
INSERT INTO "caseman__branch_contacts" VALUES(6,'','true','0011g00000iP4I5AAK','14');
INSERT INTO "caseman__branch_contacts" VALUES(7,'','true','0011g00000iP4I6AAK','15');
INSERT INTO "caseman__branch_contacts" VALUES(8,'','true','0011g00000iP4I7AAK','16');
INSERT INTO "caseman__branch_contacts" VALUES(9,'','true','0011g00000iP4I8AAK','17');
INSERT INTO "caseman__branch_contacts" VALUES(10,'','true','0011g00000iP4I9AAK','18');
INSERT INTO "caseman__branch_contacts" VALUES(11,'','true','0011g00000iP4IAAA0','19');
INSERT INTO "caseman__branch_contacts" VALUES(12,'','true','0011g00000iP4GaAAK','20');
INSERT INTO "caseman__branch_contacts" VALUES(13,'','true','0011g00000iP4IBAA0','21');
INSERT INTO "caseman__branch_contacts" VALUES(14,'','true','0011g00000iP4ICAA0','22');
INSERT INTO "caseman__branch_contacts" VALUES(15,'','true','0011g00000iP4IDAA0','23');
INSERT INTO "caseman__branch_contacts" VALUES(16,'','true','0011g00000iP4IEAA0','24');
INSERT INTO "caseman__branch_contacts" VALUES(17,'','true','0011g00000iP4IFAA0','25');
INSERT INTO "caseman__branch_contacts" VALUES(18,'','true','0011g00000iP4IGAA0','26');
INSERT INTO "caseman__branch_contacts" VALUES(19,'','true','0011g00000iP4IHAA0','27');
INSERT INTO "caseman__branch_contacts" VALUES(20,'','true','0011g00000iP4IIAA0','28');
INSERT INTO "caseman__branch_contacts" VALUES(21,'','true','0011g00000iP4IJAA0','29');
INSERT INTO "caseman__branch_contacts" VALUES(22,'','true','0011g00000iP4IKAA0','30');
INSERT INTO "caseman__branch_contacts" VALUES(23,'','true','0011g00000iP4GbAAK','31');
INSERT INTO "caseman__branch_contacts" VALUES(24,'','true','0011g00000iP4ILAA0','32');
INSERT INTO "caseman__branch_contacts" VALUES(25,'','true','0011g00000iP4IMAA0','33');
INSERT INTO "caseman__branch_contacts" VALUES(26,'','true','0011g00000iP4INAA0','34');
INSERT INTO "caseman__branch_contacts" VALUES(27,'','true','0011g00000iP4IOAA0','35');
INSERT INTO "caseman__branch_contacts" VALUES(28,'','true','0011g00000iP4IPAA0','36');
INSERT INTO "caseman__branch_contacts" VALUES(29,'','true','0011g00000iP4IQAA0','37');
INSERT INTO "caseman__branch_contacts" VALUES(30,'','true','0011g00000iP4IRAA0','38');
INSERT INTO "caseman__branch_contacts" VALUES(31,'','true','0011g00000iP4ISAA0','39');
INSERT INTO "caseman__branch_contacts" VALUES(32,'','true','0011g00000iP4ITAA0','40');
INSERT INTO "caseman__branch_contacts" VALUES(33,'','true','0011g00000iP4IUAA0','41');
INSERT INTO "caseman__branch_contacts" VALUES(34,'','true','0011g00000iP4GcAAK','42');
INSERT INTO "caseman__branch_contacts" VALUES(35,'','true','0011g00000iP4IVAA0','43');
INSERT INTO "caseman__branch_contacts" VALUES(36,'','true','0011g00000iP4IWAA0','44');
INSERT INTO "caseman__branch_contacts" VALUES(37,'','true','0011g00000iP4IXAA0','45');
INSERT INTO "caseman__branch_contacts" VALUES(38,'','true','0011g00000iP4IYAA0','46');
INSERT INTO "caseman__branch_contacts" VALUES(39,'','true','0011g00000iP4IZAA0','47');
INSERT INTO "caseman__branch_contacts" VALUES(40,'','true','0011g00000iP4IaAAK','48');
INSERT INTO "caseman__branch_contacts" VALUES(41,'','true','0011g00000iP4IbAAK','49');
INSERT INTO "caseman__branch_contacts" VALUES(42,'','true','0011g00000iP4IcAAK','50');
INSERT INTO "caseman__branch_contacts" VALUES(43,'','true','0011g00000iP4IdAAK','51');
INSERT INTO "caseman__branch_contacts" VALUES(44,'','true','0011g00000iP4IeAAK','52');
INSERT INTO "caseman__branch_contacts" VALUES(45,'','true','0011g00000iP4GdAAK','53');
INSERT INTO "caseman__branch_contacts" VALUES(46,'','true','0011g00000iP4IfAAK','54');
INSERT INTO "caseman__branch_contacts" VALUES(47,'','true','0011g00000iP4IgAAK','55');
INSERT INTO "caseman__branch_contacts" VALUES(48,'','true','0011g00000iP4IhAAK','56');
INSERT INTO "caseman__branch_contacts" VALUES(49,'','true','0011g00000iP4IiAAK','57');
INSERT INTO "caseman__branch_contacts" VALUES(50,'','true','0011g00000iP4IjAAK','58');
INSERT INTO "caseman__branch_contacts" VALUES(51,'','true','0011g00000iP4IkAAK','59');
INSERT INTO "caseman__branch_contacts" VALUES(52,'','true','0011g00000iP4IlAAK','60');
INSERT INTO "caseman__branch_contacts" VALUES(53,'','true','0011g00000iP4ImAAK','61');
INSERT INTO "caseman__branch_contacts" VALUES(54,'','true','0011g00000iP4InAAK','62');
INSERT INTO "caseman__branch_contacts" VALUES(55,'','true','0011g00000iP4IoAAK','63');
INSERT INTO "caseman__branch_contacts" VALUES(56,'','true','0011g00000iP4GeAAK','64');
INSERT INTO "caseman__branch_contacts" VALUES(57,'','true','0011g00000iP4GeAAK','65');
INSERT INTO "caseman__branch_contacts" VALUES(58,'','true','0011g00000iP4GeAAK','66');
INSERT INTO "caseman__branch_contacts" VALUES(59,'','true','0011g00000iP4IpAAK','67');
INSERT INTO "caseman__branch_contacts" VALUES(60,'','true','0011g00000iP4IqAAK','68');
INSERT INTO "caseman__branch_contacts" VALUES(61,'','true','0011g00000iP4IrAAK','69');
INSERT INTO "caseman__branch_contacts" VALUES(62,'','true','0011g00000iP4IsAAK','70');
INSERT INTO "caseman__branch_contacts" VALUES(63,'','true','0011g00000iP4ItAAK','71');
INSERT INTO "caseman__branch_contacts" VALUES(64,'','true','0011g00000iP4IuAAK','72');
INSERT INTO "caseman__branch_contacts" VALUES(65,'','true','0011g00000iP4IvAAK','73');
INSERT INTO "caseman__branch_contacts" VALUES(66,'','true','0011g00000iP4IwAAK','74');
INSERT INTO "caseman__branch_contacts" VALUES(67,'','true','0011g00000iP4IxAAK','75');
INSERT INTO "caseman__branch_contacts" VALUES(68,'','true','0011g00000iP4IyAAK','76');
INSERT INTO "caseman__branch_contacts" VALUES(69,'','true','0011g00000iP4IzAAK','77');
INSERT INTO "caseman__branch_contacts" VALUES(70,'','true','0011g00000iP4J0AAK','78');
INSERT INTO "caseman__branch_contacts" VALUES(71,'','true','0011g00000iP4J1AAK','79');
INSERT INTO "caseman__branch_contacts" VALUES(72,'','true','0011g00000iP4J2AAK','80');
INSERT INTO "caseman__branch_contacts" VALUES(73,'','true','0011g00000iP4J3AAK','81');
INSERT INTO "caseman__branch_contacts" VALUES(74,'','true','0011g00000iP4J4AAK','82');
INSERT INTO "caseman__branch_contacts" VALUES(75,'','true','0011g00000iP4J5AAK','83');
INSERT INTO "caseman__branch_contacts" VALUES(76,'','true','0011g00000iP4J6AAK','84');
INSERT INTO "caseman__branch_contacts" VALUES(77,'','true','0011g00000iP4J7AAK','85');
INSERT INTO "caseman__branch_contacts" VALUES(78,'','true','0011g00000iP4J8AAK','86');
INSERT INTO "caseman__branch_contacts" VALUES(79,'','true','0011g00000iP4GgAAK','87');
INSERT INTO "caseman__branch_contacts" VALUES(80,'','true','0011g00000iP4GhAAK','88');
INSERT INTO "caseman__branch_contacts" VALUES(81,'','true','0011g00000iP4GiAAK','89');
INSERT INTO "caseman__branch_contacts" VALUES(82,'','true','0011g00000iP4GjAAK','90');
INSERT INTO "caseman__branch_contacts" VALUES(83,'','true','0011g00000iP4GkAAK','91');
INSERT INTO "caseman__branch_contacts" VALUES(84,'','true','0011g00000iP4GlAAK','92');
INSERT INTO "caseman__branch_contacts" VALUES(85,'','true','0011g00000iP4GmAAK','93');
INSERT INTO "caseman__branch_contacts" VALUES(86,'','true','0011g00000iP4GnAAK','94');
INSERT INTO "caseman__branch_contacts" VALUES(87,'','true','0011g00000iP4GoAAK','95');
INSERT INTO "caseman__branch_contacts" VALUES(88,'','true','0011g00000iP4GpAAK','96');
INSERT INTO "caseman__branch_contacts" VALUES(89,'','true','0011g00000iP4GqAAK','97');
INSERT INTO "caseman__branch_contacts" VALUES(90,'','true','0011g00000iP4GrAAK','98');
INSERT INTO "caseman__branch_contacts" VALUES(91,'','true','0011g00000iP4GsAAK','99');
INSERT INTO "caseman__branch_contacts" VALUES(92,'','true','0011g00000iP4GtAAK','100');
INSERT INTO "caseman__branch_contacts" VALUES(93,'','true','0011g00000iP4GuAAK','101');
INSERT INTO "caseman__branch_contacts" VALUES(94,'','true','0011g00000iP4GvAAK','102');
INSERT INTO "caseman__branch_contacts" VALUES(95,'','true','0011g00000iP4GwAAK','103');
INSERT INTO "caseman__branch_contacts" VALUES(96,'','true','0011g00000iP4GxAAK','104');
INSERT INTO "caseman__branch_contacts" VALUES(97,'','true','0011g00000iP4GyAAK','105');
INSERT INTO "caseman__branch_contacts" VALUES(98,'','true','0011g00000iP4GzAAK','106');
INSERT INTO "caseman__branch_contacts" VALUES(99,'','true','0011g00000iP4H0AAK','107');
INSERT INTO "caseman__branch_contacts" VALUES(100,'','true','0011g00000iP4H1AAK','108');
INSERT INTO "caseman__branch_contacts" VALUES(101,'','true','0011g00000iP4H2AAK','109');
INSERT INTO "caseman__branch_contacts" VALUES(102,'','true','0011g00000iP4GTAA0','110');
INSERT INTO "caseman__branch_contacts" VALUES(103,'','true','0011g00000iP4GTAA0','111');
INSERT INTO "caseman__branch_contacts" VALUES(104,'','true','0011g00000iP4H3AAK','112');
INSERT INTO "caseman__branch_contacts" VALUES(105,'','true','0011g00000iP4H4AAK','113');
INSERT INTO "caseman__branch_contacts" VALUES(106,'','true','0011g00000iP4H5AAK','114');
INSERT INTO "caseman__branch_contacts" VALUES(107,'','true','0011g00000iP4H6AAK','115');
INSERT INTO "caseman__branch_contacts" VALUES(108,'','true','0011g00000iP4H7AAK','116');
INSERT INTO "caseman__branch_contacts" VALUES(109,'','true','0011g00000iP4H8AAK','117');
INSERT INTO "caseman__branch_contacts" VALUES(110,'','true','0011g00000iP4H9AAK','118');
INSERT INTO "caseman__branch_contacts" VALUES(111,'','true','0011g00000iP4HAAA0','119');
INSERT INTO "caseman__branch_contacts" VALUES(112,'','true','0011g00000iP4HBAA0','120');
INSERT INTO "caseman__branch_contacts" VALUES(113,'','true','0011g00000iP4HCAA0','121');
INSERT INTO "caseman__branch_contacts" VALUES(114,'','true','0011g00000iP4GUAA0','122');
INSERT INTO "caseman__branch_contacts" VALUES(115,'','true','0011g00000iP4GUAA0','123');
INSERT INTO "caseman__branch_contacts" VALUES(116,'','true','0011g00000iP4HDAA0','124');
INSERT INTO "caseman__branch_contacts" VALUES(117,'','true','0011g00000iP4HEAA0','125');
INSERT INTO "caseman__branch_contacts" VALUES(118,'','true','0011g00000iP4HFAA0','126');
INSERT INTO "caseman__branch_contacts" VALUES(119,'','true','0011g00000iP4HGAA0','127');
INSERT INTO "caseman__branch_contacts" VALUES(120,'','true','0011g00000iP4HHAA0','128');
INSERT INTO "caseman__branch_contacts" VALUES(121,'','true','0011g00000iP4HIAA0','129');
INSERT INTO "caseman__branch_contacts" VALUES(122,'','true','0011g00000iP4HJAA0','130');
INSERT INTO "caseman__branch_contacts" VALUES(123,'','true','0011g00000iP4HKAA0','131');
INSERT INTO "caseman__branch_contacts" VALUES(124,'','true','0011g00000iP4HLAA0','132');
INSERT INTO "caseman__branch_contacts" VALUES(125,'','true','0011g00000iP4HMAA0','133');
INSERT INTO "caseman__branch_contacts" VALUES(126,'','true','0011g00000iP4GVAA0','134');
INSERT INTO "caseman__branch_contacts" VALUES(127,'','true','0011g00000iP4GVAA0','135');
INSERT INTO "caseman__branch_contacts" VALUES(128,'','true','0011g00000iP4HNAA0','136');
INSERT INTO "caseman__branch_contacts" VALUES(129,'','true','0011g00000iP4HOAA0','137');
INSERT INTO "caseman__branch_contacts" VALUES(130,'','true','0011g00000iP4HPAA0','138');
INSERT INTO "caseman__branch_contacts" VALUES(131,'','true','0011g00000iP4HQAA0','139');
INSERT INTO "caseman__branch_contacts" VALUES(132,'','true','0011g00000iP4HRAA0','140');
INSERT INTO "caseman__branch_contacts" VALUES(133,'','true','0011g00000iP4HSAA0','141');
INSERT INTO "caseman__branch_contacts" VALUES(134,'','true','0011g00000iP4HTAA0','142');
INSERT INTO "caseman__branch_contacts" VALUES(135,'','true','0011g00000iP4HUAA0','143');
INSERT INTO "caseman__branch_contacts" VALUES(136,'','true','0011g00000iP4HVAA0','144');
INSERT INTO "caseman__branch_contacts" VALUES(137,'','true','0011g00000iP4HWAA0','145');
INSERT INTO "caseman__branch_contacts" VALUES(138,'','true','0011g00000iP4GWAA0','146');
INSERT INTO "caseman__branch_contacts" VALUES(139,'','true','0011g00000iP4GWAA0','147');
INSERT INTO "caseman__branch_contacts" VALUES(140,'','true','0011g00000iP4HXAA0','148');
INSERT INTO "caseman__branch_contacts" VALUES(141,'','true','0011g00000iP4HYAA0','149');
INSERT INTO "caseman__branch_contacts" VALUES(142,'','true','0011g00000iP4HZAA0','150');
INSERT INTO "caseman__branch_contacts" VALUES(143,'','true','0011g00000iP4HaAAK','151');
INSERT INTO "caseman__branch_contacts" VALUES(144,'','true','0011g00000iP4HbAAK','152');
INSERT INTO "caseman__branch_contacts" VALUES(145,'','true','0011g00000iP4HcAAK','153');
INSERT INTO "caseman__branch_contacts" VALUES(146,'','true','0011g00000iP4HdAAK','154');
INSERT INTO "caseman__branch_contacts" VALUES(147,'','true','0011g00000iP4HeAAK','155');
INSERT INTO "caseman__branch_contacts" VALUES(148,'','true','0011g00000iP4HfAAK','156');
INSERT INTO "caseman__branch_contacts" VALUES(149,'','true','0011g00000iP4HgAAK','157');
INSERT INTO "caseman__branch_contacts" VALUES(150,'','true','0011g00000iP4GXAA0','158');
INSERT INTO "caseman__branch_contacts" VALUES(151,'','true','0011g00000iP4GXAA0','159');
INSERT INTO "caseman__branch_contacts" VALUES(152,'','true','0011g00000iP4GXAA0','160');
INSERT INTO "caseman__branch_contacts" VALUES(153,'','true','0011g00000iP4HhAAK','161');
INSERT INTO "caseman__branch_contacts" VALUES(154,'','true','0011g00000iP4HiAAK','162');
INSERT INTO "caseman__branch_contacts" VALUES(155,'','true','0011g00000iP4HjAAK','163');
INSERT INTO "caseman__branch_contacts" VALUES(156,'','true','0011g00000iP4HkAAK','164');
INSERT INTO "caseman__branch_contacts" VALUES(157,'','true','0011g00000iP4HlAAK','165');
INSERT INTO "caseman__branch_contacts" VALUES(158,'','true','0011g00000iP4HmAAK','166');
INSERT INTO "caseman__branch_contacts" VALUES(159,'','true','0011g00000iP4HnAAK','167');
INSERT INTO "caseman__branch_contacts" VALUES(160,'','true','0011g00000iP4HoAAK','168');
INSERT INTO "caseman__branch_contacts" VALUES(161,'','true','0011g00000iP4HpAAK','169');
INSERT INTO "caseman__branch_contacts" VALUES(162,'','true','0011g00000iP4HqAAK','170');
INSERT INTO "caseman__branch_contacts" VALUES(163,'','true','0011g00000iP4GYAA0','171');
INSERT INTO "caseman__branch_contacts" VALUES(164,'','true','0011g00000iP4HrAAK','172');
INSERT INTO "caseman__branch_contacts" VALUES(165,'','true','0011g00000iP4HsAAK','173');
INSERT INTO "caseman__branch_contacts" VALUES(166,'','true','0011g00000iP4HtAAK','1');
INSERT INTO "caseman__branch_contacts" VALUES(167,'','true','0011g00000iP4HuAAK','2');
INSERT INTO "caseman__branch_contacts" VALUES(168,'','true','0011g00000iP4HvAAK','3');
INSERT INTO "caseman__branch_contacts" VALUES(169,'','true','0011g00000iP4HwAAK','4');
INSERT INTO "caseman__branch_contacts" VALUES(170,'','true','0011g00000iP4HxAAK','5');
INSERT INTO "caseman__branch_contacts" VALUES(171,'','true','0011g00000iP4HyAAK','6');
INSERT INTO "caseman__branch_contacts" VALUES(172,'','true','0011g00000iP4HzAAK','7');
INSERT INTO "caseman__branch_contacts" VALUES(173,'','true','0011g00000iP4I0AAK','8');
INSERT INTO "caseman__branch_contacts" VALUES(174,'Client','true','1','146');
INSERT INTO "caseman__branch_contacts" VALUES(175,'Client','true','1','160');
INSERT INTO "caseman__branch_contacts" VALUES(176,'','true','1','171');
INSERT INTO "caseman__branch_contacts" VALUES(177,'','true','1','9');
INSERT INTO "caseman__branch_contacts" VALUES(178,'Client','true','1','20');
INSERT INTO "caseman__branch_contacts" VALUES(179,'','true','1','31');
INSERT INTO "caseman__branch_contacts" VALUES(180,'','true','1','42');
INSERT INTO "caseman__branch_contacts" VALUES(181,'Client','true','1','53');
INSERT INTO "caseman__branch_contacts" VALUES(182,'Client','true','1','66');
INSERT INTO "caseman__branch_contacts" VALUES(183,'','true','1','122');
INSERT INTO "caseman__branch_contacts" VALUES(184,'Other','true','1','123');
INSERT INTO "caseman__branch_contacts" VALUES(185,'Client','true','1','135');
CREATE TABLE caseman__case_plans (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__case_plans" VALUES(1,'Robin Banks'' Job Readiness Case Plan','146');
INSERT INTO "caseman__case_plans" VALUES(2,'Robin Banks'' Sobriety Case Plan','146');
INSERT INTO "caseman__case_plans" VALUES(3,'Financial Literacy Case Plan - Jason Barnes','160');
INSERT INTO "caseman__case_plans" VALUES(4,'English proficiency case plan - Barbara Johnson','66');
INSERT INTO "caseman__case_plans" VALUES(5,'Socialization Case Plan - Tom Higgins','110');
INSERT INTO "caseman__case_plans" VALUES(6,'Reading Case Plan - Tom Higgins','110');
INSERT INTO "caseman__case_plans" VALUES(7,'Arlene Baker''s Workforce Re-entry Case Plan','135');
CREATE TABLE caseman__client_alerts (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_alerts" VALUES(1,'Robin was recently released from rehab','true','','146');
INSERT INTO "caseman__client_alerts" VALUES(2,'Tom has anger issues','true','','110');
INSERT INTO "caseman__client_alerts" VALUES(3,'Tom''s sister passed away recently (very emotional)','true','','110');
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
INSERT INTO "caseman__client_cases" VALUES(1,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','146','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(2,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','160','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(3,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','66','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(4,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','110','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(5,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','110','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(6,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','110','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(7,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','110','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(8,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','135','ClientCase');
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
INSERT INTO "caseman__client_note_relationships" VALUES(1,'a1554000000FXRBAA4','PE-00000007','ProgramEngagement__c','','4','','2');
INSERT INTO "caseman__client_note_relationships" VALUES(2,'a16S0000002pKVPIA2','PE-00000003','caseman__ProgramEngagement__c','','5','','7');
INSERT INTO "caseman__client_note_relationships" VALUES(3,'500540000032nuJAAQ','00001008','Case','1','1','','');
INSERT INTO "caseman__client_note_relationships" VALUES(4,'500540000032nuKAAQ','00001009','Case','2','2','','');
INSERT INTO "caseman__client_note_relationships" VALUES(5,'500540000032nuLAAQ','00001010','Case','3','3','','');
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
INSERT INTO "caseman__client_notes" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','146','');
INSERT INTO "caseman__client_notes" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','160','');
INSERT INTO "caseman__client_notes" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','66','');
INSERT INTO "caseman__client_notes" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','110','');
INSERT INTO "caseman__client_notes" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','110','');
CREATE TABLE caseman__goal_action_item_templates (
	id INTEGER NOT NULL, 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__goal_action_item_templates" VALUES(1,'1','30');
INSERT INTO "caseman__goal_action_item_templates" VALUES(2,'12','35');
INSERT INTO "caseman__goal_action_item_templates" VALUES(3,'12','36');
INSERT INTO "caseman__goal_action_item_templates" VALUES(4,'14','27');
INSERT INTO "caseman__goal_action_item_templates" VALUES(5,'14','28');
INSERT INTO "caseman__goal_action_item_templates" VALUES(6,'14','33');
INSERT INTO "caseman__goal_action_item_templates" VALUES(7,'14','34');
INSERT INTO "caseman__goal_action_item_templates" VALUES(8,'2','16');
INSERT INTO "caseman__goal_action_item_templates" VALUES(9,'28','16');
INSERT INTO "caseman__goal_action_item_templates" VALUES(10,'3','12');
INSERT INTO "caseman__goal_action_item_templates" VALUES(11,'3','18');
INSERT INTO "caseman__goal_action_item_templates" VALUES(12,'3','19');
INSERT INTO "caseman__goal_action_item_templates" VALUES(13,'3','20');
INSERT INTO "caseman__goal_action_item_templates" VALUES(14,'3','21');
INSERT INTO "caseman__goal_action_item_templates" VALUES(15,'3','22');
INSERT INTO "caseman__goal_action_item_templates" VALUES(16,'3','23');
INSERT INTO "caseman__goal_action_item_templates" VALUES(17,'3','24');
INSERT INTO "caseman__goal_action_item_templates" VALUES(18,'3','25');
INSERT INTO "caseman__goal_action_item_templates" VALUES(19,'3','26');
INSERT INTO "caseman__goal_action_item_templates" VALUES(20,'3','37');
INSERT INTO "caseman__goal_action_item_templates" VALUES(21,'3','4');
INSERT INTO "caseman__goal_action_item_templates" VALUES(22,'3','5');
INSERT INTO "caseman__goal_action_item_templates" VALUES(23,'3','7');
INSERT INTO "caseman__goal_action_item_templates" VALUES(24,'3','9');
INSERT INTO "caseman__goal_action_item_templates" VALUES(25,'4','10');
INSERT INTO "caseman__goal_action_item_templates" VALUES(26,'4','11');
INSERT INTO "caseman__goal_action_item_templates" VALUES(27,'4','39');
INSERT INTO "caseman__goal_action_item_templates" VALUES(28,'4','40');
INSERT INTO "caseman__goal_action_item_templates" VALUES(29,'4','41');
INSERT INTO "caseman__goal_action_item_templates" VALUES(30,'6','13');
INSERT INTO "caseman__goal_action_item_templates" VALUES(31,'9','38');
INSERT INTO "caseman__goal_action_item_templates" VALUES(32,'9','42');
INSERT INTO "caseman__goal_action_item_templates" VALUES(33,'9','43');
INSERT INTO "caseman__goal_action_item_templates" VALUES(34,'9','44');
INSERT INTO "caseman__goal_action_item_templates" VALUES(35,'9','45');
INSERT INTO "caseman__goal_action_item_templates" VALUES(36,'9','46');
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
INSERT INTO "caseman__goals" VALUES(1,'Meet job requirement standards','146','1','18');
INSERT INTO "caseman__goals" VALUES(2,'Complete Succeed Program','146','1','19');
INSERT INTO "caseman__goals" VALUES(3,'Stabilize Employment','146','1','21');
INSERT INTO "caseman__goals" VALUES(4,'Develop basic financial literacy skills','146','1','3');
INSERT INTO "caseman__goals" VALUES(5,'Get and keep job for 6 - 12 months','146','1','4');
INSERT INTO "caseman__goals" VALUES(6,'Develop Soft Skills','146','1','9');
INSERT INTO "caseman__goals" VALUES(7,'Adopt healthy skills to address dependency issues','146','2','6');
INSERT INTO "caseman__goals" VALUES(8,'Complete Financial Literacy Course','160','3','12');
INSERT INTO "caseman__goals" VALUES(9,'Deposit 10% of income in Savings Account for 3 months','160','3','14');
INSERT INTO "caseman__goals" VALUES(10,'Reach proficiency level in reading, writing, speaking & listening per state std','66','4','8');
INSERT INTO "caseman__goals" VALUES(11,'Build respectful peer relationships','110','5','13');
INSERT INTO "caseman__goals" VALUES(12,'Build respectful inter-generational relationships','110','5','15');
INSERT INTO "caseman__goals" VALUES(13,'Reach an age appropriate level of proficiency in reading','110','6','1');
INSERT INTO "caseman__goals" VALUES(14,'Stabilize housing','135','7','10');
INSERT INTO "caseman__goals" VALUES(15,'Identify industry/career path','135','7','16');
INSERT INTO "caseman__goals" VALUES(16,'Meet job requirement standards','135','7','18');
INSERT INTO "caseman__goals" VALUES(17,'Complete Succeed Program','135','7','19');
INSERT INTO "caseman__goals" VALUES(18,'Stabilize Employment','135','7','21');
INSERT INTO "caseman__goals" VALUES(19,'Develop basic financial literacy skills','135','7','3');
INSERT INTO "caseman__goals" VALUES(20,'Get and keep job for 6 - 12 months','135','7','4');
INSERT INTO "caseman__goals" VALUES(21,'Develop Soft Skills','135','7','9');
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
INSERT INTO "caseman__incident_cases" VALUES(1,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','1','110','Incident');
INSERT INTO "caseman__incident_cases" VALUES(2,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','1','110','Incident');
INSERT INTO "caseman__incident_cases" VALUES(3,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','110','Incident');
INSERT INTO "caseman__incident_cases" VALUES(4,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','110','Incident');
INSERT INTO "caseman__incident_cases" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','110','Incident');
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
INSERT INTO "caseman__program_engagements" VALUES(1,'In Progress','2019-06-03','2019-12-31','1','146','');
INSERT INTO "caseman__program_engagements" VALUES(2,'Applied','2019-09-03','','10','110','');
INSERT INTO "caseman__program_engagements" VALUES(3,'Enrolled','2019-06-01','','2','110','');
INSERT INTO "caseman__program_engagements" VALUES(4,'Enrolled','2019-09-04','2020-05-15','3','66','3');
INSERT INTO "caseman__program_engagements" VALUES(5,'In Progress','2019-09-04','2019-12-13','5','160','');
INSERT INTO "caseman__program_engagements" VALUES(6,'Enrolled','2019-09-03','','4','110','');
INSERT INTO "caseman__program_engagements" VALUES(7,'In Progress','2019-06-03','2020-05-15','6','110','');
INSERT INTO "caseman__program_engagements" VALUES(8,'In Progress','2019-09-04','2020-04-15','8','146','');
INSERT INTO "caseman__program_engagements" VALUES(9,'Applied','2019-06-03','','8','146','1');
INSERT INTO "caseman__program_engagements" VALUES(10,'Enrolled','2019-09-04','2020-04-15','8','135','');
INSERT INTO "caseman__program_engagements" VALUES(11,'Applied','2019-08-14','','8','135','');
CREATE TABLE caseman__program_goal_templates (
	id INTEGER NOT NULL, 
	"IsRequired__c" VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__program_goal_templates" VALUES(1,'true','1','6');
INSERT INTO "caseman__program_goal_templates" VALUES(2,'false','10','7');
INSERT INTO "caseman__program_goal_templates" VALUES(3,'false','11','7');
INSERT INTO "caseman__program_goal_templates" VALUES(4,'true','12','5');
INSERT INTO "caseman__program_goal_templates" VALUES(5,'false','13','8');
INSERT INTO "caseman__program_goal_templates" VALUES(6,'false','14','5');
INSERT INTO "caseman__program_goal_templates" VALUES(7,'false','15','8');
INSERT INTO "caseman__program_goal_templates" VALUES(8,'false','16','7');
INSERT INTO "caseman__program_goal_templates" VALUES(9,'false','18','7');
INSERT INTO "caseman__program_goal_templates" VALUES(10,'false','19','7');
INSERT INTO "caseman__program_goal_templates" VALUES(11,'false','2','3');
INSERT INTO "caseman__program_goal_templates" VALUES(12,'false','21','7');
INSERT INTO "caseman__program_goal_templates" VALUES(13,'false','24','7');
INSERT INTO "caseman__program_goal_templates" VALUES(14,'true','25','7');
INSERT INTO "caseman__program_goal_templates" VALUES(15,'false','26','7');
INSERT INTO "caseman__program_goal_templates" VALUES(16,'false','27','7');
INSERT INTO "caseman__program_goal_templates" VALUES(17,'true','3','7');
INSERT INTO "caseman__program_goal_templates" VALUES(18,'true','4','7');
INSERT INTO "caseman__program_goal_templates" VALUES(19,'false','5','7');
INSERT INTO "caseman__program_goal_templates" VALUES(20,'true','6','1');
INSERT INTO "caseman__program_goal_templates" VALUES(21,'true','9','7');
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
INSERT INTO "caseman__program_offerings" VALUES(4,'School Lunch Program Summer 2019','Serving families with children under the age of 18.','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','','Months','2019-09-03','2020-05-30','Active','4');
INSERT INTO "caseman__program_offerings" VALUES(5,'Financial Literacy Program, Fall 2019','Teaches students the basics of money management.','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','','Months','2019-09-04','2019-12-13','Active','5');
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
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "contacts" VALUES(1,'','Joe','Salinas','joesalinas@example.com','','','','','','','','','','','','','','joesalinas@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','21','');
INSERT INTO "contacts" VALUES(2,'','Maleah','Bullock','maleahbullock@example.com','','','','','','','','','','','','','','maleahbullock@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','22','');
INSERT INTO "contacts" VALUES(3,'','Anika','Solomon','anikasolomon@example.com','','','','','','','','','','','','','','anikasolomon@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','23','');
INSERT INTO "contacts" VALUES(4,'','Christina','Webster','christinawebster@example.com','','','','','','','','','','','','','','christinawebster@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','91','');
INSERT INTO "contacts" VALUES(5,'','Emilie','Costa','emiliecosta@example.com','','','','','','','','','','','','','','emiliecosta@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','92','');
INSERT INTO "contacts" VALUES(6,'','Ayana','Humphrey','ayanahumphrey@example.com','','','','','','','','','','','','','','ayanahumphrey@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','93','');
INSERT INTO "contacts" VALUES(7,'','Lucia','Cain','luciacain@example.com','','','','','','','','','','','','','','luciacain@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','94','');
INSERT INTO "contacts" VALUES(8,'','Amaya','Dunlap','amayadunlap@example.com','','','','','','','','','','','','','','amayadunlap@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','95','');
INSERT INTO "contacts" VALUES(9,'','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','','','normaburke@example.com','Personal','Home','Home','false','','','','Senior','','Friend','','','','','','they/them/theirs','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','30','');
INSERT INTO "contacts" VALUES(10,'','Derrick','Blackwell','derrickblackwell@example.com','','','','','','','','','','','','','','derrickblackwell@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','96','');
INSERT INTO "contacts" VALUES(11,'','Alice','Irwin','aliceirwin@example.com','','','','','','','','','','','','','','aliceirwin@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','97','');
INSERT INTO "contacts" VALUES(12,'','Fabian','Hughes','fabianhughes@example.com','','','','','','','','','','','','','','fabianhughes@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','98','');
INSERT INTO "contacts" VALUES(13,'','Raelynn','Wells','raelynnwells@example.com','','','','','','','','','','','','','','raelynnwells@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','99','');
INSERT INTO "contacts" VALUES(14,'','Simon','Davila','simondavila@example.com','','','','','','','','','','','','','','simondavila@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','100','');
INSERT INTO "contacts" VALUES(15,'','Jamarcus','Barnett','jamarcusbarnett@example.com','','','','','','','','','','','','','','jamarcusbarnett@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','101','');
INSERT INTO "contacts" VALUES(16,'','Adrianna','Norman','adriannanorman@example.com','','','','','','','','','','','','','','adriannanorman@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','102','');
INSERT INTO "contacts" VALUES(17,'','Donna','Snow','donnasnow@example.com','','','','','','','','','','','','','','donnasnow@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','103','');
INSERT INTO "contacts" VALUES(18,'','Gary','Wood','garywood@example.com','','','','','','','','','','','','','','garywood@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','104','');
INSERT INTO "contacts" VALUES(19,'','Reagan','Norton','reagannorton@example.com','','','','','','','','','','','','','','reagannorton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','105','');
INSERT INTO "contacts" VALUES(20,'','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-12-04','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','31','');
INSERT INTO "contacts" VALUES(21,'','Jaylin','Morgan','jaylinmorgan@example.com','','','','','','','','','','','','','','jaylinmorgan@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','106','');
INSERT INTO "contacts" VALUES(22,'','Mira','Decker','miradecker@example.com','','','','','','','','','','','','','','miradecker@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','107','');
INSERT INTO "contacts" VALUES(23,'','Maya','Lambert','mayalambert@example.com','','','','','','','','','','','','','','mayalambert@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','108','');
INSERT INTO "contacts" VALUES(24,'','Finley','Barry','finleybarry@example.com','','','','','','','','','','','','','','finleybarry@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','109','');
INSERT INTO "contacts" VALUES(25,'','Ben','Oneill','benoneill@example.com','','','','','','','','','','','','','','benoneill@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','110','');
INSERT INTO "contacts" VALUES(26,'','Maia','Cooley','maiacooley@example.com','','','','','','','','','','','','','','maiacooley@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','111','');
INSERT INTO "contacts" VALUES(27,'','Olive','Leach','oliveleach@example.com','','','','','','','','','','','','','','oliveleach@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','112','');
INSERT INTO "contacts" VALUES(28,'','Oswaldo','Pacheco','oswaldopacheco@example.com','','','','','','','','','','','','','','oswaldopacheco@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','113','');
INSERT INTO "contacts" VALUES(29,'','Nico','Rivers','nicorivers@example.com','','','','','','','','','','','','','','nicorivers@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','114','');
INSERT INTO "contacts" VALUES(30,'','Tiara','Griffith','tiaragriffith@example.com','','','','','','','','','','','','','','tiaragriffith@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','115','');
INSERT INTO "contacts" VALUES(31,'','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','','','anthonyhill@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','they/them/theirs','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','32','');
INSERT INTO "contacts" VALUES(32,'','Declan','Glenn','declanglenn@example.com','','','','','','','','','','','','','','declanglenn@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','116','');
INSERT INTO "contacts" VALUES(33,'','Madalyn','Francis','madalynfrancis@example.com','','','','','','','','','','','','','','madalynfrancis@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','117','');
INSERT INTO "contacts" VALUES(34,'','Mathew','Rhodes','mathewrhodes@example.com','','','','','','','','','','','','','','mathewrhodes@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','118','');
INSERT INTO "contacts" VALUES(35,'','Jessica','Woods','jessicawoods@example.com','','','','','','','','','','','','','','jessicawoods@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','119','');
INSERT INTO "contacts" VALUES(36,'','Eli','White','eliwhite@example.com','','','','','','','','','','','','','','eliwhite@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','120','');
INSERT INTO "contacts" VALUES(37,'','Tatiana','Lang','tatianalang@example.com','','','','','','','','','','','','','','tatianalang@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','121','');
INSERT INTO "contacts" VALUES(38,'','Gia','Ramirez','giaramirez@example.com','','','','','','','','','','','','','','giaramirez@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','122','');
INSERT INTO "contacts" VALUES(39,'','Alejandro','Serrano','alejandroserrano@example.com','','','','','','','','','','','','','','alejandroserrano@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','123','');
INSERT INTO "contacts" VALUES(40,'','Mya','Galloway','myagalloway@example.com','','','','','','','','','','','','','','myagalloway@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','124','');
INSERT INTO "contacts" VALUES(41,'','Adam','Clark','adamclark@example.com','','','','','','','','','','','','','','adamclark@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','125','');
INSERT INTO "contacts" VALUES(42,'Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','she/her/hers','Client;Donor','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','33','');
INSERT INTO "contacts" VALUES(43,'','Marisol','Gonzales','marisolgonzales@example.com','','','','','','','','','','','','','','marisolgonzales@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','126','');
INSERT INTO "contacts" VALUES(44,'','Mya','Cobb','myacobb@example.com','','','','','','','','','','','','','','myacobb@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','127','');
INSERT INTO "contacts" VALUES(45,'','Jay','Shah','jayshah@example.com','','','','','','','','','','','','','','jayshah@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','128','');
INSERT INTO "contacts" VALUES(46,'','Nancy','Arroyo','nancyarroyo@example.com','','','','','','','','','','','','','','nancyarroyo@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','129','');
INSERT INTO "contacts" VALUES(47,'','Aubrie','Booker','aubriebooker@example.com','','','','','','','','','','','','','','aubriebooker@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','130','');
INSERT INTO "contacts" VALUES(48,'','Emelia','Mercer','emeliamercer@example.com','','','','','','','','','','','','','','emeliamercer@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','131','');
INSERT INTO "contacts" VALUES(49,'','Yadiel','Horton','yadielhorton@example.com','','','','','','','','','','','','','','yadielhorton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','132','');
INSERT INTO "contacts" VALUES(50,'','Taniyah','Rios','taniyahrios@example.com','','','','','','','','','','','','','','taniyahrios@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','133','');
INSERT INTO "contacts" VALUES(51,'','Peyton','Craig','peytoncraig@example.com','','','','','','','','','','','','','','peytoncraig@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','134','');
INSERT INTO "contacts" VALUES(52,'','Francesca','Oliver','francescaoliver@example.com','','','','','','','','','','','','','','francescaoliver@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','135','');
INSERT INTO "contacts" VALUES(53,'','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','','','josejenkins@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','he/him/his','Donor','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','34','');
INSERT INTO "contacts" VALUES(54,'','Albert','Montgomery','albertmontgomery@example.com','','','','','','','','','','','','','','albertmontgomery@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','136','');
INSERT INTO "contacts" VALUES(55,'','Meredith','Cooke','meredithcooke@example.com','','','','','','','','','','','','','','meredithcooke@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','137','');
INSERT INTO "contacts" VALUES(56,'','Mckayla','Morrison','mckaylamorrison@example.com','','','','','','','','','','','','','','mckaylamorrison@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','138','');
INSERT INTO "contacts" VALUES(57,'','Hayley','Bright','hayleybright@example.com','','','','','','','','','','','','','','hayleybright@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','139','');
INSERT INTO "contacts" VALUES(58,'','Dayana','Atkins','dayanaatkins@example.com','','','','','','','','','','','','','','dayanaatkins@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','140','');
INSERT INTO "contacts" VALUES(59,'','Khloe','Stanley','khloestanley@example.com','','','','','','','','','','','','','','khloestanley@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','141','');
INSERT INTO "contacts" VALUES(60,'','Ray','Fischer','rayfischer@example.com','','','','','','','','','','','','','','rayfischer@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','142','');
INSERT INTO "contacts" VALUES(61,'','Casey','Kline','caseykline@example.com','','','','','','','','','','','','','','caseykline@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','143','');
INSERT INTO "contacts" VALUES(62,'','Aron','Joyce','aronjoyce@example.com','','','','','','','','','','','','','','aronjoyce@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','144','');
INSERT INTO "contacts" VALUES(63,'','Diego','Case','diegocase@example.com','','','','','','','','','','','','','','diegocase@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','145','');
INSERT INTO "contacts" VALUES(64,'','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','craigjohnso@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','35','');
INSERT INTO "contacts" VALUES(65,'','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','true','true','true','','','false','','','','','','','','','','0.0','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','35','');
INSERT INTO "contacts" VALUES(66,'','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','Adult','','Husband','0681g000000kSouAAE','','','','','she/her/hers','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','35','64');
INSERT INTO "contacts" VALUES(67,'','Chelsea','Graves','chelseagraves@example.com','','','','','','','','','','','','','','chelseagraves@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','146','');
INSERT INTO "contacts" VALUES(68,'','Ruth','Wu','ruthwu@example.com','','','','','','','','','','','','','','ruthwu@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','147','');
INSERT INTO "contacts" VALUES(69,'','Isaac','Grant','isaacgrant@example.com','','','','','','','','','','','','','','isaacgrant@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','148','');
INSERT INTO "contacts" VALUES(70,'','Audrina','Rojas','audrinarojas@example.com','','','','','','','','','','','','','','audrinarojas@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','149','');
INSERT INTO "contacts" VALUES(71,'','Koen','Chase','koenchase@example.com','','','','','','','','','','','','','','koenchase@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','150','');
INSERT INTO "contacts" VALUES(72,'','Hailie','Holder','hailieholder@example.com','','','','','','','','','','','','','','hailieholder@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','151','');
INSERT INTO "contacts" VALUES(73,'','Caylee','Pollard','cayleepollard@example.com','','','','','','','','','','','','','','cayleepollard@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','152','');
INSERT INTO "contacts" VALUES(74,'','Guillermo','Quinn','guillermoquinn@example.com','','','','','','','','','','','','','','guillermoquinn@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','153','');
INSERT INTO "contacts" VALUES(75,'','Dominik','Wilkinson','dominikwilkinson@example.com','','','','','','','','','','','','','','dominikwilkinson@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','154','');
INSERT INTO "contacts" VALUES(76,'','Simone','Keller','simonekeller@example.com','','','','','','','','','','','','','','simonekeller@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','155','');
INSERT INTO "contacts" VALUES(77,'','Violet','Ellis','violetellis@example.com','','','','','','','','','','','','','','violetellis@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','156','');
INSERT INTO "contacts" VALUES(78,'','Samir','Neal','samirneal@example.com','','','','','','','','','','','','','','samirneal@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','157','');
INSERT INTO "contacts" VALUES(79,'','Mira','Mcconnell','miramcconnell@example.com','','','','','','','','','','','','','','miramcconnell@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','158','');
INSERT INTO "contacts" VALUES(80,'','Aniya','Arellano','aniyaarellano@example.com','','','','','','','','','','','','','','aniyaarellano@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','159','');
INSERT INTO "contacts" VALUES(81,'','Jakayla','Glover','jakaylaglover@example.com','','','','','','','','','','','','','','jakaylaglover@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','160','');
INSERT INTO "contacts" VALUES(82,'','Angelo','Lutz','angelolutz@example.com','','','','','','','','','','','','','','angelolutz@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','161','');
INSERT INTO "contacts" VALUES(83,'','Audrina','Graves','audrinagraves@example.com','','','','','','','','','','','','','','audrinagraves@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','162','');
INSERT INTO "contacts" VALUES(84,'','Turner','Carson','turnercarson@example.com','','','','','','','','','','','','','','turnercarson@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','163','');
INSERT INTO "contacts" VALUES(85,'','Emelia','Fletcher','emeliafletcher@example.com','','','','','','','','','','','','','','emeliafletcher@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','164','');
INSERT INTO "contacts" VALUES(86,'','Mackenzie','Hernandez','mackenziehernandez@example.com','','','','','','','','','','','','','','mackenziehernandez@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','165','');
INSERT INTO "contacts" VALUES(87,'','Jose','Burgess','joseburgess@example.com','','','','','','','','','','','','','','joseburgess@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','36','');
INSERT INTO "contacts" VALUES(88,'','Brenda','Bass','brendabass@example.com','','','','','','','','','','','','','','brendabass@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','37','');
INSERT INTO "contacts" VALUES(89,'','Nikhil','Bishop','nikhilbishop@example.com','','','','','','','','','','','','','','nikhilbishop@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','38','');
INSERT INTO "contacts" VALUES(90,'','Juliette','Cisneros','juliettecisneros@example.com','','','','','','','','','','','','','','juliettecisneros@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','39','');
INSERT INTO "contacts" VALUES(91,'','Alana','Owen','alanaowen@example.com','','','','','','','','','','','','','','alanaowen@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','40','');
INSERT INTO "contacts" VALUES(92,'','Cruz','Kerr','cruzkerr@example.com','','','','','','','','','','','','','','cruzkerr@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','41','');
INSERT INTO "contacts" VALUES(93,'','Beau','Eaton','beaueaton@example.com','','','','','','','','','','','','','','beaueaton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','42','');
INSERT INTO "contacts" VALUES(94,'','Chance','Rasmussen','chancerasmussen@example.com','','','','','','','','','','','','','','chancerasmussen@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','43','');
INSERT INTO "contacts" VALUES(95,'','James','Richards','jamesrichards@example.com','','','','','','','','','','','','','','jamesrichards@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','44','');
INSERT INTO "contacts" VALUES(96,'','Khloe','Campos','khloecampos@example.com','','','','','','','','','','','','','','khloecampos@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','45','');
INSERT INTO "contacts" VALUES(97,'','Amelie','Bond','ameliebond@example.com','','','','','','','','','','','','','','ameliebond@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','46','');
INSERT INTO "contacts" VALUES(98,'','Julie','Myers','juliemyers@example.com','','','','','','','','','','','','','','juliemyers@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','47','');
INSERT INTO "contacts" VALUES(99,'','Jayda','Stanton','jaydastanton@example.com','','','','','','','','','','','','','','jaydastanton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','48','');
INSERT INTO "contacts" VALUES(100,'','Yesenia','Ritter','yeseniaritter@example.com','','','','','','','','','','','','','','yeseniaritter@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','72','');
INSERT INTO "contacts" VALUES(101,'','Abraham','Sims','abrahamsims@example.com','','','','','','','','','','','','','','abrahamsims@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','73','');
INSERT INTO "contacts" VALUES(102,'','Kyle','Huffman','kylehuffman@example.com','','','','','','','','','','','','','','kylehuffman@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','74','');
INSERT INTO "contacts" VALUES(103,'','Cora','Hall','corahall@example.com','','','','','','','','','','','','','','corahall@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','75','');
INSERT INTO "contacts" VALUES(104,'','Isaac','Barker','isaacbarker@example.com','','','','','','','','','','','','','','isaacbarker@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','76','');
INSERT INTO "contacts" VALUES(105,'','Kailey','Glass','kaileyglass@example.com','','','','','','','','','','','','','','kaileyglass@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','77','');
INSERT INTO "contacts" VALUES(106,'','Delilah','Ibarra','delilahibarra@example.com','','','','','','','','','','','','','','delilahibarra@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','78','');
INSERT INTO "contacts" VALUES(107,'','Zackery','Morgan','zackerymorgan@example.com','','','','','','','','','','','','','','zackerymorgan@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','79','');
INSERT INTO "contacts" VALUES(108,'','Duncan','Bowers','duncanbowers@example.com','','','','','','','','','','','','','','duncanbowers@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','80','');
INSERT INTO "contacts" VALUES(109,'','Lauryn','Odom','laurynodom@example.com','','','','','','','','','','','','','','laurynodom@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','81','');
INSERT INTO "contacts" VALUES(110,'','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','','','thiggins@example.com','Personal','Home','Home','false','','','','Child','','Mother','0681g000000kSozAAE','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-12-04','false','false','true','true','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','24','111');
INSERT INTO "contacts" VALUES(111,'','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','','','lhiggins@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','24','');
INSERT INTO "contacts" VALUES(112,'','Yusef','Flores','yusefflores@example.com','','','','','','','','','','','','','','yusefflores@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','82','');
INSERT INTO "contacts" VALUES(113,'','Semaj','Wall','semajwall@example.com','','','','','','','','','','','','','','semajwall@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','83','');
INSERT INTO "contacts" VALUES(114,'','Frankie','Waller','frankiewaller@example.com','','','','','','','','','','','','','','frankiewaller@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','84','');
INSERT INTO "contacts" VALUES(115,'','Eliezer','Bray','eliezerbray@example.com','','','','','','','','','','','','','','eliezerbray@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','85','');
INSERT INTO "contacts" VALUES(116,'','Jaden','Conner','jadenconner@example.com','','','','','','','','','','','','','','jadenconner@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','86','');
INSERT INTO "contacts" VALUES(117,'','Steven','Harper','stevenharper@example.com','','','','','','','','','','','','','','stevenharper@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','87','');
INSERT INTO "contacts" VALUES(118,'','Karissa','Aguilar','karissaaguilar@example.com','','','','','','','','','','','','','','karissaaguilar@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','88','');
INSERT INTO "contacts" VALUES(119,'','Tiara','Cummings','tiaracummings@example.com','','','','','','','','','','','','','','tiaracummings@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','89','');
INSERT INTO "contacts" VALUES(120,'','Cecilia','Cardenas','ceciliacardenas@example.com','','','','','','','','','','','','','','ceciliacardenas@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','90','');
INSERT INTO "contacts" VALUES(121,'','Heidi','Woods','heidiwoods@example.com','','','','','','','','','','','','','','heidiwoods@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','49','');
INSERT INTO "contacts" VALUES(122,'Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','','','jeremyadams@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','25','');
INSERT INTO "contacts" VALUES(123,'Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','','','angelaadams@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','she/her/hers','Client;Donor;Volunteer','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','25','');
INSERT INTO "contacts" VALUES(124,'','Leia','Spence','leiaspence@example.com','','','','','','','','','','','','','','leiaspence@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','50','');
INSERT INTO "contacts" VALUES(125,'','Leon','Clayton','leonclayton@example.com','','','','','','','','','','','','','','leonclayton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','51','');
INSERT INTO "contacts" VALUES(126,'','Marc','Richard','marcrichard@example.com','','','','','','','','','','','','','','marcrichard@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','52','');
INSERT INTO "contacts" VALUES(127,'','Jordan','Waller','jordanwaller@example.com','','','','','','','','','','','','','','jordanwaller@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','53','');
INSERT INTO "contacts" VALUES(128,'','Jace','Hampton','jacehampton@example.com','','','','','','','','','','','','','','jacehampton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','54','');
INSERT INTO "contacts" VALUES(129,'','Silas','Neal','silasneal@example.com','','','','','','','','','','','','','','silasneal@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','55','');
INSERT INTO "contacts" VALUES(130,'','Sonia','Gentry','soniagentry@example.com','','','','','','','','','','','','','','soniagentry@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','56','');
INSERT INTO "contacts" VALUES(131,'','Alison','Barr','alisonbarr@example.com','','','','','','','','','','','','','','alisonbarr@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','57','');
INSERT INTO "contacts" VALUES(132,'','Vu','Pham','vupham@example.com','','','','','','','','','','','','','','vupham@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','58','');
INSERT INTO "contacts" VALUES(133,'','Kellen','Cooley','kellencooley@example.com','','','','','','','','','','','','','','kellencooley@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','59','');
INSERT INTO "contacts" VALUES(134,'','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','','','','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','26','');
INSERT INTO "contacts" VALUES(135,'','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','','','alanbaker@example.com','Personal','Home','Home','false','','','','Adult','','Friend','0681g000000kSopAAE','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','26','123');
INSERT INTO "contacts" VALUES(136,'','Jay','Zimmerman','jayzimmerman@example.com','','','','','','','','','','','','','','jayzimmerman@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','60','');
INSERT INTO "contacts" VALUES(137,'','Melanie','Wheeler','melaniewheeler@example.com','','','','','','','','','','','','','','melaniewheeler@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','61','');
INSERT INTO "contacts" VALUES(138,'','Fernando','Beltran','fernandobeltran@example.com','','','','','','','','','','','','','','fernandobeltran@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','62','');
INSERT INTO "contacts" VALUES(139,'','Yuliana','Bird','yulianabird@example.com','','','','','','','','','','','','','','yulianabird@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','63','');
INSERT INTO "contacts" VALUES(140,'','Alyson','Duffy','alysonduffy@example.com','','','','','','','','','','','','','','alysonduffy@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','64','');
INSERT INTO "contacts" VALUES(141,'','Nyla','Woods','nylawoods@example.com','','','','','','','','','','','','','','nylawoods@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','65','');
INSERT INTO "contacts" VALUES(142,'','Aaron','Valdez','aaronvaldez@example.com','','','','','','','','','','','','','','aaronvaldez@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','66','');
INSERT INTO "contacts" VALUES(143,'','John','Mills','johnmills@example.com','','','','','','','','','','','','','','johnmills@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','67','');
INSERT INTO "contacts" VALUES(144,'','Shannon','Greene','shannongreene@example.com','','','','','','','','','','','','','','shannongreene@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','68','');
INSERT INTO "contacts" VALUES(145,'','Marco','Escobar','marcoescobar@example.com','','','','','','','','','','','','','','marcoescobar@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','69','');
INSERT INTO "contacts" VALUES(146,'','Robin','Banks','robinbanks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','','','robinbanks@example.com','Personal','Home','Home','false','','','','Adult','','Partner','0681g000000kSp4AAE','','','','','she/her/hers','Client','true','2019-12-04','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','27','147');
INSERT INTO "contacts" VALUES(147,'','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','','','darrylgraham@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','0.0','400.0','0.0','1.0','0.0','1.0','400.0','','','','','400.0','400.0','27','');
INSERT INTO "contacts" VALUES(148,'','Lorelai','Gross','lorelaigross@example.com','','','','','','','','','','','','','','lorelaigross@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','70','');
INSERT INTO "contacts" VALUES(149,'','Elsa','Guerrero','elsaguerrero@example.com','','','','','','','','','','','','','','elsaguerrero@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','71','');
INSERT INTO "contacts" VALUES(150,'','Dalia','Osborn','daliaosborn@example.com','','','','','','','','','','','','','','daliaosborn@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','1','');
INSERT INTO "contacts" VALUES(151,'','Tyrone','Pearson','tyronepearson@example.com','','','','','','','','','','','','','','tyronepearson@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','2','');
INSERT INTO "contacts" VALUES(152,'','Ariella','Branch','ariellabranch@example.com','','','','','','','','','','','','','','ariellabranch@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','3','');
INSERT INTO "contacts" VALUES(153,'','Jaydon','Bates','jaydonbates@example.com','','','','','','','','','','','','','','jaydonbates@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','4','');
INSERT INTO "contacts" VALUES(154,'','Javon','Rodgers','javonrodgers@example.com','','','','','','','','','','','','','','javonrodgers@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','5','');
INSERT INTO "contacts" VALUES(155,'','Josie','Mcclure','josiemcclure@example.com','','','','','','','','','','','','','','josiemcclure@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','6','');
INSERT INTO "contacts" VALUES(156,'','Marcus','Huynh','marcushuynh@example.com','','','','','','','','','','','','','','marcushuynh@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','7','');
INSERT INTO "contacts" VALUES(157,'','Ayanna','Gonzalez','ayannagonzalez@example.com','','','','','','','','','','','','','','ayannagonzalez@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','8','');
INSERT INTO "contacts" VALUES(158,'','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','28','');
INSERT INTO "contacts" VALUES(159,'','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','davidbarnes@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','false','','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','28','');
INSERT INTO "contacts" VALUES(160,'','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','Youth','88841515','Mother','0681g000000kSokAAE','','','','','he/him/his','Client','false','','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','28','158');
INSERT INTO "contacts" VALUES(161,'','Taniya','Singleton','taniyasingleton@example.com','','','','','','','','','','','','','','taniyasingleton@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','9','');
INSERT INTO "contacts" VALUES(162,'','Laura','Woodard','laurawoodard@example.com','','','','','','','','','','','','','','laurawoodard@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','10','');
INSERT INTO "contacts" VALUES(163,'','Shane','Gibson','shanegibson@example.com','','','','','','','','','','','','','','shanegibson@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','11','');
INSERT INTO "contacts" VALUES(164,'','Alia','Duarte','aliaduarte@example.com','','','','','','','','','','','','','','aliaduarte@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','12','');
INSERT INTO "contacts" VALUES(165,'','Neil','Huerta','neilhuerta@example.com','','','','','','','','','','','','','','neilhuerta@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','13','');
INSERT INTO "contacts" VALUES(166,'','Laura','Hernandez','laurahernandez@example.com','','','','','','','','','','','','','','laurahernandez@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','14','');
INSERT INTO "contacts" VALUES(167,'','Makhi','Villegas','makhivillegas@example.com','','','','','','','','','','','','','','makhivillegas@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','15','');
INSERT INTO "contacts" VALUES(168,'','Rafael','Velasquez','rafaelvelasquez@example.com','','','','','','','','','','','','','','rafaelvelasquez@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','16','');
INSERT INTO "contacts" VALUES(169,'','Ryan','Hardin','ryanhardin@example.com','','','','','','','','','','','','','','ryanhardin@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','17','');
INSERT INTO "contacts" VALUES(170,'','Mira','Olson','miraolson@example.com','','','','','','','','','','','','','','miraolson@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','18','');
INSERT INTO "contacts" VALUES(171,'Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','','','anneboyd@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','she/her/hers','Client','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','29','');
INSERT INTO "contacts" VALUES(172,'','Anna','Orr','annaorr@example.com','','','','','','','','','','','','','','annaorr@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','19','');
INSERT INTO "contacts" VALUES(173,'','Naima','Crawford','naimacrawford@example.com','','','','','','','','','','','','','','naimacrawford@example.com','Personal','Home','','false','','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','20','');
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
	"SYSTEM_AccountType__c" VARCHAR(255), 
	"SYSTEMIsIndividual__c" VARCHAR(255), 
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
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "household_accounts" VALUES(1,'Osborn Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(2,'Pearson Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(3,'Branch Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(4,'Bates Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(5,'Rodgers Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(6,'Mcclure Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(7,'Huynh Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(8,'Gonzalez Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(9,'Singleton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(10,'Woodard Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(11,'Gibson Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(12,'Duarte Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(13,'Huerta Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(14,'Hernandez Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(15,'Villegas Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(16,'Velasquez Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(17,'Hardin Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(18,'Olson Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(19,'Orr Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(20,'Crawford Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(21,'Salinas Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(22,'Bullock Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(23,'Solomon Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(24,'Higgins Household','','','','','','','555-248-3956','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(25,'Adams Household','','','','','','','555-648-7204','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(26,'Baker Household','','','','','','','555-524-0749','','','','','','Household','Household Account','true','','','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES(27,'Banks and Graham Household','','','','','','','555-648-7204','','','','','','Household','Household Account','true','','','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','400.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES(28,'Barnes Household','','','','','','','555-893-4763','','','','','','Household','Household Account','true','','','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES(29,'Boyd Household','','','','','','','555-380-8532','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(30,'Burke Household','','','','','','','555-830-5295','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(31,'Henderson Household','','','','','','','555-830-5295','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(32,'Hill Household','','','','','','','555-395-9737','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(33,'Holmes Household','','','','','','','555-930-8759','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(34,'Jenkins Household','','','','','','','555-469-9873','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(35,'Johnson Household','','','','','','','555-248-3956','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(36,'Burgess Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(37,'Bass Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(38,'Bishop Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(39,'Cisneros Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(40,'Owen Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(41,'Kerr Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(42,'Eaton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(43,'Rasmussen Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(44,'Richards Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(45,'Campos Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(46,'Bond Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(47,'Myers Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(48,'Stanton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(49,'Woods Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(50,'Spence Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(51,'Clayton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(52,'Richard Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(53,'Waller Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(54,'Hampton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(55,'Neal Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(56,'Gentry Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(57,'Barr Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(58,'Pham Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(59,'Cooley Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(60,'Zimmerman Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(61,'Wheeler Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(62,'Beltran Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(63,'Bird Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(64,'Duffy Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(65,'Woods Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(66,'Valdez Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(67,'Mills Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(68,'Greene Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(69,'Escobar Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(70,'Gross Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(71,'Guerrero Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(72,'Ritter Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(73,'Sims Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(74,'Huffman Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(75,'Hall Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(76,'Barker Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(77,'Glass Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(78,'Ibarra Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(79,'Morgan Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(80,'Bowers Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(81,'Odom Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(82,'Flores Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(83,'Wall Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(84,'Waller Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(85,'Bray Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(86,'Conner Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(87,'Harper Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(88,'Aguilar Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(89,'Cummings Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(90,'Cardenas Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(91,'Webster Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(92,'Costa Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(93,'Humphrey Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(94,'Cain Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(95,'Dunlap Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(96,'Blackwell Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(97,'Irwin Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(98,'Hughes Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(99,'Wells Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(100,'Davila Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(101,'Barnett Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(102,'Norman Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(103,'Snow Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(104,'Wood Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(105,'Norton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(106,'Morgan Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(107,'Decker Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(108,'Lambert Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(109,'Barry Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(110,'Oneill Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(111,'Cooley Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(112,'Leach Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(113,'Pacheco Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(114,'Rivers Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(115,'Griffith Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(116,'Glenn Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(117,'Francis Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(118,'Rhodes Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(119,'Woods Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(120,'White Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(121,'Lang Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(122,'Ramirez Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(123,'Serrano Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(124,'Galloway Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(125,'Clark Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(126,'Gonzales Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(127,'Cobb Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(128,'Shah Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(129,'Arroyo Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(130,'Booker Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(131,'Mercer Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(132,'Horton Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(133,'Rios Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(134,'Craig Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(135,'Oliver Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(136,'Montgomery Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(137,'Cooke Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(138,'Morrison Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(139,'Bright Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(140,'Atkins Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(141,'Stanley Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(142,'Fischer Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(143,'Kline Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(144,'Joyce Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(145,'Case Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(146,'Graves Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(147,'Wu Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(148,'Grant Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(149,'Rojas Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(150,'Chase Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(151,'Holder Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(152,'Pollard Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(153,'Quinn Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(154,'Wilkinson Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(155,'Keller Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(156,'Ellis Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(157,'Neal Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(158,'Mcconnell Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(159,'Arellano Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(160,'Glover Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(161,'Lutz Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(162,'Graves Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(163,'Carson Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(164,'Fletcher Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES(165,'Hernandez Household','','','','','','','','','','','','','Household','Household Account','true','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
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
INSERT INTO "npe4__relationships" VALUES(1,'','true','','Current','Son','158','160');
INSERT INTO "npe4__relationships" VALUES(2,'','true','','Current','Son','159','160');
INSERT INTO "npe4__relationships" VALUES(3,'','false','','Current','Mother','160','158');
INSERT INTO "npe4__relationships" VALUES(4,'','false','','Current','Father','160','159');
INSERT INTO "npe4__relationships" VALUES(5,'','true','','Current','Spouse','64','66');
INSERT INTO "npe4__relationships" VALUES(6,'','true','','Current','Parent','65','66');
INSERT INTO "npe4__relationships" VALUES(7,'','false','','Current','Husband','66','64');
INSERT INTO "npe4__relationships" VALUES(8,'','false','','Current','Daughter','66','65');
INSERT INTO "npe4__relationships" VALUES(9,'','false','','Current','Mother','110','111');
INSERT INTO "npe4__relationships" VALUES(10,'','true','','Current','Son','111','110');
INSERT INTO "npe4__relationships" VALUES(11,'','true','Arthur is Arlene''s recently deceased father.','Current','Child','134','135');
INSERT INTO "npe4__relationships" VALUES(12,'Tribute','false','Arthur is Arlene''s recently deceased father.','Current','Father','135','134');
CREATE TABLE "npsp__OpportunityContactRole" (
	id INTEGER NOT NULL, 
	"Role" VARCHAR(255), 
	"IsPrimary" VARCHAR(255), 
	contact_id VARCHAR(255), 
	opportunity_id VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__OpportunityContactRole" VALUES(1,'Household Member','false','146','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(2,'Household Member','false','146','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(3,'Household Member','false','146','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(4,'Household Member','false','146','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(5,'Household Member','false','146','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(6,'Donor','true','147','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(7,'Donor','true','147','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(8,'Donor','true','147','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(9,'Donor','true','147','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(10,'Donor','true','147','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(11,'Donor','true','158','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(12,'Donor','true','158','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(13,'Donor','true','158','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(14,'Donor','true','158','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(15,'Donor','true','158','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(16,'Household Member','false','159','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(17,'Household Member','false','159','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(18,'Household Member','false','159','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(19,'Household Member','false','159','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(20,'Household Member','false','159','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(21,'Household Member','false','160','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(22,'Household Member','false','160','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(23,'Household Member','false','160','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(24,'Household Member','false','160','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(25,'Household Member','false','160','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(26,'Tribute','false','134','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(27,'Tribute','false','134','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(28,'Tribute','false','134','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(29,'Tribute','false','134','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(30,'Tribute','false','134','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(31,'Donor','true','135','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(32,'Donor','true','135','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(33,'Donor','true','135','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(34,'Donor','true','135','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(35,'Donor','true','135','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(36,'Donor','true','135','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(37,'Donor','true','147','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(38,'Donor','true','158','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(39,'Household Member','false','134','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(40,'Household Member','false','146','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(41,'Household Member','false','159','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(42,'Household Member','false','160','3');
CREATE TABLE npsp__donations (
	id INTEGER NOT NULL, 
	"Contact_Id_for_Role__c" VARCHAR(255), 
	"Membership_Origin__c" VARCHAR(255), 
	"Member_Level__c" VARCHAR(255), 
	"Membership_Start_Date__c" VARCHAR(255), 
	"Membership_End_Date__c" VARCHAR(255), 
	"Do_Not_Automatically_Create_Payment__c" VARCHAR(255), 
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
	account_id VARCHAR(255), 
	primary_contact__c VARCHAR(255), 
	honoree_contact__c VARCHAR(255), 
	notification_recipient_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__donations" VALUES(1,'0035400000Hsa3XAAR','','','','','false','Arthur Baker Donation in Memoriam','','','Closed Won','','Closed','100.0','','','2019-09-02','500.0','false','','','Arlene Baker','Arthur Baker','','','','','','Memorial','Phone','','','To Be Acknowledged','','','','','','','','2019-09-06','','','','','false','false','false','All Opportunities','26','135','134','135');
INSERT INTO "npsp__donations" VALUES(2,'0035400000HtExuAAF','','','','','false','Darryl Graham 2019 In-Kind Donation','','','In-Kind Received','','Omitted','100.0','','','2019-08-05','400.0','false','','','','','','','','','<p>PSA Production for fundraising drive</p>','','','','Services','Acknowledged','','','','','','','','2019-08-09','','','800.0','','false','true','false','All Opportunities','27','147','','');
INSERT INTO "npsp__donations" VALUES(3,'0035400000HtEyZAAV','','','','','false','Lynn Barnes 1019 Donation','','','Closed Won','','Closed','100.0','','','2019-07-01','500.0','false','','','','','','','','','','','','','','Acknowledged','','','','','','','','2019-07-05','','','','','false','false','false','All Opportunities','28','158','','');
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
	"SYSTEM_AccountType__c" VARCHAR(255), 
	"SYSTEMIsIndividual__c" VARCHAR(255), 
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
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "organization_accounts" VALUES(1,'Marble Foundation','','','','','','','555-389-74399','','','','','','Foundation','','false','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES(2,'Future Potential Fund','','','','','','','555-278-7643','','','','','','Foundation','','false','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES(3,'City Department of Human Services','','','','','','','','','','','','','Government','','false','','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
CREATE TABLE "pmdm__ProgramCohort__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Summary__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ProgramCohort__c" VALUES(1,'Eastgate','Eastgate neighborhood service area','','2019-02-01','Active','Eastgate neighborhood service area','1');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(2,'Genellen','Genellen neighborhood service area','','2019-02-01','Active','Genellen neighborhood service area','1');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(3,'Riverside','Riverside neighborhood service area','','2019-02-01','Active','Riverside neighborhood service area','1');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(4,'Job Readiness 2019-2021','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','2019-04-15','Active','Assisting adults who have experienced a prolonged absence from the workforce or are seeking to progressively stabilize their experience in the workforce.','8');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(5,'Fall 2019 STEM','','2019-12-20','2019-09-09','Active','Semester participation in STEM programFall 2019 semester STEM participation','10');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(6,'Highpoint','Highpoint neighborhood service area','','2019-02-01','Active','Highpoint neighborhood service area','1');
CREATE TABLE "pmdm__ProgramEngagement__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"ApplicationDate__c" VARCHAR(255), 
	"AutoName_Override__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"Role__c" VARCHAR(255), 
	"Stage__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	account__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	program__c VARCHAR(255), 
	program_cohort__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(1,'Yesenia  Ritter - Prenatal and Early Childhood Health Program','2019-08-05','false','','Client','In Progress','2019-11-22','','100','1','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(2,'Abraham  Sims - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','','101','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(3,'Karissa  Aguilar - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-20','','118','1','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(4,'Maya  Johnson - After School Program, Ages 11-13','','false','','Client','Enrolled','2019-11-20','','65','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(5,'Barbara  Johnson - ESL Program','2019-07-03','false','','Client','Enrolled','2019-09-04','','66','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(6,'Barbara  Johnson - School Lunch Program','2019-11-20','false','','Client','Applied','','','66','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(7,'Tom  Higgins - Housing Assistance Program','2019-05-25','false','','Client','Enrolled','2019-06-01','','110','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(8,'Tom  Higgins - School Lunch Program','2019-06-08','false','','Client','Enrolled','2019-09-03','','110','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(9,'Tom  Higgins - Remedial Reading Program','2019-04-12','false','','Client','In Progress','2019-06-03','','110','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(10,'Tom  Higgins - After School Program, Ages 11-13','2019-08-29','false','','Client','Applied','2019-09-03','','110','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(11,'Yuliana  Bird - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','139','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(12,'Ayanna  Gonzalez - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','157','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(13,'Naima  Crawford - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','173','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(14,'Arlene  Baker - Job Readiness Program','2019-06-19','false','','Client','Enrolled','2019-09-04','','135','8','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(15,'Olive  Leach - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-08','','27','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(16,'Marisol  Gonzales - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-18','','43','1','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(17,'Nancy  Arroyo - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-10-15','','46','1','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(18,'Dayana  Atkins - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-11-22','','58','1','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(19,'Audrina  Rojas - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-11-06','','70','1','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(20,'Caylee  Pollard - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-11-20','','73','1','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(21,'Simone  Keller - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-12','','76','1','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(22,'Violet  Ellis - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-03','','77','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(23,'Mira  Mcconnell - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-04-24','','79','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(24,'Emelia  Fletcher - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-04-08','','85','1','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(25,'Juliette  Cisneros - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-11-21','','90','1','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(26,'Amelie  Bond - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-30','','97','1','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(27,'Cora  Hall - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-08-12','','103','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(28,'Delilah  Ibarra - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-05-08','','106','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(29,'Robin  Banks - Drug and Alcohol Recovery Management','2019-04-24','false','','Client','In Progress','2019-06-03','','146','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(30,'Robin  Banks - Job Readiness Program','2019-09-02','false','','Client','In Progress','2019-09-04','','146','8','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(31,'Jessica  Woods - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','35','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(32,'Taniyah  Rios - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','50','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(33,'Casey  Kline - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','61','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(34,'Diego  Case - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','63','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(35,'Jason  Barnes - Financial Literacy Program','2019-08-23','false','','Client','In Progress','2019-09-04','','160','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(36,'Alana  Owen - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','','91','10','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(37,'Lauryn  Odom - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-21','','109','1','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(38,'Alia  Duarte - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','12','164','10','5');
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
	"AutonameOverride__c" VARCHAR(255), 
	"DeliveryDate__c" VARCHAR(255), 
	"Quantity__c" VARCHAR(255), 
	service__c VARCHAR(255), 
	account__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	program_engagement__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(1,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(2,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(3,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(4,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(5,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(6,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(7,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(8,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(9,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(10,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(11,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(12,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(13,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(14,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(15,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(16,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(17,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(18,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(19,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(20,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(21,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(22,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(23,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(24,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(25,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(26,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(27,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(28,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(29,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(30,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(31,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(32,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(33,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(34,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(35,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(36,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(37,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(38,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(39,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(40,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(41,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(42,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(43,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(44,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(45,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(46,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(47,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(48,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(49,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(50,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(51,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(52,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(53,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(54,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(55,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(56,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(57,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(58,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(59,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(60,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(61,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(62,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(63,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(64,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(65,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(66,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(67,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(68,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(69,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(70,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(71,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(72,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(73,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(74,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(75,'Marisol Gonzales - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-14','1.0','2','','43','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(76,'Nancy Arroyo - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-16','1.0','2','','46','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(77,'Dayana Atkins - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','1.0','2','','58','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(78,'Caylee Pollard - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-22','1.0','2','','73','20');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(79,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-14','1.0','2','','77','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(80,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-02','1.0','2','','77','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(81,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-13','1.0','2','','77','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(82,'Emelia Fletcher - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','','2','','85','24');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(83,'Juliette Cisneros - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-20','1.0','2','','90','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(84,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-30','1.0','2','','27','15');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(85,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-18','1.0','2','','27','15');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(86,'Alana Owen - Girls STEM outreach, 10/3/19','false','2019-11-25','','5','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(87,'Violet Ellis - Administer Early Childcare Vaccines','false','2019-11-13','3.0','3','','77','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(88,'Mira Mcconnell - Administer Early Childcare Vaccines','false','2019-08-19','3.0','3','','79','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(89,'Emelia Fletcher - Administer Early Childcare Vaccines','false','2019-11-06','3.0','3','','85','24');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(90,'Karissa Aguilar - Administer Early Childcare Vaccines','false','2019-11-25','','3','','118','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(91,'Emelia Fletcher - Refer to Caregivers Support Group','false','2019-11-06','1.0','4','','85','24');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(92,'Delilah Ibarra - Refer to Caregivers Support Group','false','2019-11-13','1.0','4','','106','28');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(93,'Karissa Aguilar - Refer to Caregivers Support Group','false','2019-11-25','','4','','118','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(94,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(95,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(96,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(97,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(98,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(99,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(100,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(101,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(102,'Jessica Woods - STEM Field Trips','false','2019-11-25','1.0','8','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(103,'Taniyah Rios - STEM Field Trips','false','2019-11-25','1.0','8','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(104,'Casey Kline - STEM Field Trips','false','2019-11-25','1.0','8','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(105,'Diego Case - STEM Field Trips','false','2019-11-25','1.0','8','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(106,'Alana Owen - STEM Field Trips','false','2019-11-25','1.0','8','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(107,'Alana Owen - STEM Field Trips','false','2019-11-25','','8','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(108,'Abraham Sims - STEM Field Trips','false','2019-11-25','1.0','8','','101','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(109,'Yuliana Bird - STEM Field Trips','false','2019-11-25','1.0','8','','139','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(110,'Ayanna Gonzalez - STEM Field Trips','false','2019-11-25','1.0','8','','157','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(111,'Alia Duarte - STEM Field Trips','false','2019-11-25','1.0','8','','164','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(112,'Naima Crawford - STEM Field Trips','false','2019-11-25','1.0','8','','173','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(113,'Marisol Gonzales - Provide Prenatal Vitamins','false','2019-10-14','','1','','43','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(114,'Nancy Arroyo - Provide Prenatal Vitamins','false','2019-10-16','30.0','1','','46','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(115,'Dayana Atkins - Provide Prenatal Vitamins','false','2019-11-25','30.0','1','','58','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(116,'Juliette Cisneros - Provide Prenatal Vitamins','false','2019-11-20','30.0','1','','90','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(117,'Olive Leach - Provide Prenatal Vitamins','false','2019-09-18','30.0','1','','27','15');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(118,'Olive Leach - Provide Prenatal Vitamins','false','2019-10-30','30.0','1','','27','15');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(119,'Arlene Baker - Job Interviews completed','false','2019-10-11','1.0','15','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(120,'Arlene Baker - Job Interviews completed','false','2019-10-15','2.0','15','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(121,'Robin Banks - Financial Advisor Sessions','false','2019-10-07','0.5','16','','146','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(122,'Robin Banks - Financial Advisor Sessions','false','2019-10-07','0.5','16','','146','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(123,'Robin Banks - Financial Advisor Sessions','false','2019-11-04','0.5','16','','146','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(124,'Robin Banks - Financial Advisor Sessions','false','2019-09-09','0.5','16','','146','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(125,'Arlene Baker - Financial Advisor Sessions','false','2019-10-07','0.5','16','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(126,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(127,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(128,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(129,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(130,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(131,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(132,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(133,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(134,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(135,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(136,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(137,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','35','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(138,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(139,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(140,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(141,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(142,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(143,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(144,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(145,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(146,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(147,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(148,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(149,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(150,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(151,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','50','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(152,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(153,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(154,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(155,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(156,'Arlene Baker - Financial Advisor Sessions','false','2019-11-05','0.5','16','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(157,'Arlene Baker - Financial Advisor Sessions','false','2020-01-06','0.5','16','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(158,'Arlene Baker - Financial Advisor Sessions','false','2019-09-05','0.5','16','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(159,'Arlene Baker - Financial Advisor Sessions','false','2019-12-04','0.5','16','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(160,'Robin Banks - Job Readiness Coaching','false','2019-12-20','0.75','17','','146','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(161,'Robin Banks - Job Readiness Coaching','false','2019-10-28','0.75','17','','146','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(162,'Robin Banks - Job Readiness Coaching','false','2019-09-27','0.75','17','','146','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(163,'Arlene Baker - Job Readiness Coaching','false','2019-11-27','0.5','17','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(164,'Arlene Baker - Job Readiness Coaching','false','2019-11-29','0.75','17','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(165,'Arlene Baker - Job Readiness Coaching','false','2019-09-25','0.75','17','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(166,'Arlene Baker - Job Readiness Coaching','false','2019-10-30','0.75','17','','135','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(167,'Tom Higgins - Subsidized Lunch','false','2019-11-05','1.0','13','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(168,'Tom Higgins - Subsidized Lunch','false','2019-11-06','1.0','13','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(169,'Tom Higgins - Subsidized Lunch','false','2019-11-04','1.0','13','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(170,'Barbara Johnson - Grade 1-8 Reading Tutoring','false','2019-11-20','1.25','14','','66','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(171,'Tom Higgins - Food received from urban food forest','false','2019-10-31','0.25','9','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(172,'Tom Higgins - Food received from urban food forest','false','2019-12-31','0.25','9','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(173,'Tom Higgins - Food received from urban food forest','false','2019-09-30','0.25','9','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(174,'Tom Higgins - Food received from urban food forest','false','2019-11-29','0.25','9','','110','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(175,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(176,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(177,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(178,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(179,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(180,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(181,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(182,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(183,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(184,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','61','33');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(185,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(186,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(187,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(188,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(189,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(190,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(191,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(192,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(193,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(194,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(195,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(196,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(197,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(198,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','63','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(199,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(200,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','91','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(201,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','91','36');
CREATE TABLE "pmdm__Service__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"UnitOfService__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Service__c" VALUES(1,'Provide Prenatal Vitamins','','Active','Dosages','1');
INSERT INTO "pmdm__Service__c" VALUES(2,'Prenatal Care Sessions (appointments and walk-ins)','','Active','Sessions','1');
INSERT INTO "pmdm__Service__c" VALUES(3,'Administer Early Childcare Vaccines','','Active','Vaccines','1');
INSERT INTO "pmdm__Service__c" VALUES(4,'Refer to Caregivers Support Group','','Active','Referrals','1');
INSERT INTO "pmdm__Service__c" VALUES(5,'Girls STEM outreach, 10/3/19','','Active','Attendees','10');
INSERT INTO "pmdm__Service__c" VALUES(6,'Robotics Competition 9/25/19','','Active','Participants','10');
INSERT INTO "pmdm__Service__c" VALUES(7,'Middle School STEM Classroom Hours','','Active','Hours','10');
INSERT INTO "pmdm__Service__c" VALUES(8,'STEM Field Trips','','Active','Field Trips','10');
INSERT INTO "pmdm__Service__c" VALUES(9,'Food received from urban food forest','','Active','Pounds','11');
INSERT INTO "pmdm__Service__c" VALUES(10,'Town Hall Meeting, 8/19/19','','Active','Attendees','12');
INSERT INTO "pmdm__Service__c" VALUES(11,'City Council Lobby Day 2019','','Active','Participants','12');
INSERT INTO "pmdm__Service__c" VALUES(12,'Letter writing campaign to Council Members','','Active','Letters','12');
INSERT INTO "pmdm__Service__c" VALUES(13,'Subsidized Lunch','','Active','Lunches','6');
INSERT INTO "pmdm__Service__c" VALUES(14,'Grade 1-8 Reading Tutoring','','Active','Hours','7');
INSERT INTO "pmdm__Service__c" VALUES(15,'Job Interviews completed','','Active','Completed Interviews','8');
INSERT INTO "pmdm__Service__c" VALUES(16,'Financial Advisor Sessions','','Active','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(17,'Job Readiness Coaching','','Active','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(18,'Resume Review','','Active','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(19,'Job Placements','','Active','Job Placements','8');
COMMIT;
