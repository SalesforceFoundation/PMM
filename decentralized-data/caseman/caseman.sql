BEGIN TRANSACTION;
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
INSERT INTO "caseman__action_items" VALUES(1,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','83','2','3','30');
INSERT INTO "caseman__action_items" VALUES(2,'Meet job requirement standards','Not Started','2020-04-15','88','3','8','1');
INSERT INTO "caseman__action_items" VALUES(3,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','88','3','8','31');
INSERT INTO "caseman__action_items" VALUES(4,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','88','3','9','12');
INSERT INTO "caseman__action_items" VALUES(5,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','88','3','9','18');
INSERT INTO "caseman__action_items" VALUES(6,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','88','3','9','19');
INSERT INTO "caseman__action_items" VALUES(7,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','88','3','9','20');
INSERT INTO "caseman__action_items" VALUES(8,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','88','3','9','21');
INSERT INTO "caseman__action_items" VALUES(9,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','88','3','9','22');
INSERT INTO "caseman__action_items" VALUES(10,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','88','3','9','23');
INSERT INTO "caseman__action_items" VALUES(11,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','88','3','9','24');
INSERT INTO "caseman__action_items" VALUES(12,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','88','3','9','25');
INSERT INTO "caseman__action_items" VALUES(13,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','88','3','9','26');
INSERT INTO "caseman__action_items" VALUES(14,'Pass basic financial literacy course','In Progress','2019-09-30','88','3','9','37');
INSERT INTO "caseman__action_items" VALUES(15,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','88','3','9','4');
INSERT INTO "caseman__action_items" VALUES(16,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','88','3','9','5');
INSERT INTO "caseman__action_items" VALUES(17,'Open a bank account','Completed','2019-09-06','88','3','9','7');
INSERT INTO "caseman__action_items" VALUES(18,'Read and interpret a banking account statement','Not Started','2019-09-30','88','3','9','9');
INSERT INTO "caseman__action_items" VALUES(19,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','88','3','10','10');
INSERT INTO "caseman__action_items" VALUES(20,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','88','3','10','11');
INSERT INTO "caseman__action_items" VALUES(21,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','88','3','10','3');
INSERT INTO "caseman__action_items" VALUES(22,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','88','3','10','39');
INSERT INTO "caseman__action_items" VALUES(23,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','88','3','10','40');
INSERT INTO "caseman__action_items" VALUES(24,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','88','3','10','41');
INSERT INTO "caseman__action_items" VALUES(25,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','88','3','11','38');
INSERT INTO "caseman__action_items" VALUES(26,'Get a job readiness coach','Completed','2019-09-05','88','3','11','42');
INSERT INTO "caseman__action_items" VALUES(27,'Complete resume workshop','Not Started','2019-10-11','88','3','11','43');
INSERT INTO "caseman__action_items" VALUES(28,'Complete interview workshop','Not Started','2019-11-04','88','3','11','44');
INSERT INTO "caseman__action_items" VALUES(29,'Pass mock interview','Not Started','2019-11-06','88','3','11','45');
INSERT INTO "caseman__action_items" VALUES(30,'Update resume','Not Started','2019-10-25','88','3','11','46');
INSERT INTO "caseman__action_items" VALUES(31,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','89','4','15','12');
INSERT INTO "caseman__action_items" VALUES(32,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','89','4','15','20');
INSERT INTO "caseman__action_items" VALUES(33,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','89','4','15','23');
INSERT INTO "caseman__action_items" VALUES(34,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','89','4','15','26');
INSERT INTO "caseman__action_items" VALUES(35,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','89','4','15','4');
INSERT INTO "caseman__action_items" VALUES(36,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','89','4','15','5');
INSERT INTO "caseman__action_items" VALUES(37,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','89','4','16','10');
INSERT INTO "caseman__action_items" VALUES(38,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','89','4','16','11');
INSERT INTO "caseman__action_items" VALUES(39,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','89','4','16','3');
INSERT INTO "caseman__action_items" VALUES(40,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','89','4','16','39');
INSERT INTO "caseman__action_items" VALUES(41,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','89','4','16','40');
INSERT INTO "caseman__action_items" VALUES(42,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','89','4','16','41');
INSERT INTO "caseman__action_items" VALUES(43,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','89','4','17','38');
INSERT INTO "caseman__action_items" VALUES(44,'Get a job readiness coach','Completed','2019-09-05','89','4','17','42');
INSERT INTO "caseman__action_items" VALUES(45,'Complete resume workshop','Not Started','2019-09-27','89','4','17','43');
INSERT INTO "caseman__action_items" VALUES(46,'Complete interview workshop','Not Started','2019-10-20','89','4','17','44');
INSERT INTO "caseman__action_items" VALUES(47,'Pass mock interview','Not Started','2019-10-31','89','4','17','45');
INSERT INTO "caseman__action_items" VALUES(48,'Update resume','Not Started','2019-10-09','89','4','17','46');
INSERT INTO "caseman__action_items" VALUES(49,'Participate in a 12-step program','In Progress','2019-12-31','89','5','18','13');
INSERT INTO "caseman__action_items" VALUES(50,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','93','6','19','14');
INSERT INTO "caseman__action_items" VALUES(51,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','93','6','19','15');
INSERT INTO "caseman__action_items" VALUES(52,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','93','6','19','17');
INSERT INTO "caseman__action_items" VALUES(53,'Open a Savings Account','Completed','2019-09-09','93','6','19','27');
INSERT INTO "caseman__action_items" VALUES(54,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','93','6','19','37');
INSERT INTO "caseman__action_items" VALUES(55,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','103','7','21','16');
CREATE TABLE caseman__appointment_attendees (
	id INTEGER NOT NULL, 
	"caseman__Reason__c" VARCHAR(255), 
	"caseman__Role__c" VARCHAR(255), 
	"caseman__Status__c" VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__appointment_attendees" VALUES(1,'Client','Attendee','Attending','2','86');
INSERT INTO "caseman__appointment_attendees" VALUES(2,'Check in on Jason''s progress with Workplace Readiness.','Attendee','New','3','93');
INSERT INTO "caseman__appointment_attendees" VALUES(3,'','Attendee','New','4','103');
CREATE TABLE caseman__appointments (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Type__c" VARCHAR(255), 
	"caseman__Location__c" VARCHAR(255), 
	"caseman__StartDateTime__c" VARCHAR(255), 
	"caseman__EndDateTime__c" VARCHAR(255), 
	"caseman__Description__c" VARCHAR(255), 
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
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
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
INSERT INTO "caseman__branch_contacts" VALUES(1,'','true','0015400000QonMIAAZ','1');
INSERT INTO "caseman__branch_contacts" VALUES(2,'','true','0015400000QonMWAAZ','2');
INSERT INTO "caseman__branch_contacts" VALUES(3,'','true','0015400000QonNyAAJ','3');
INSERT INTO "caseman__branch_contacts" VALUES(4,'','true','0015400000QonNzAAJ','4');
INSERT INTO "caseman__branch_contacts" VALUES(5,'','true','0015400000QonO0AAJ','5');
INSERT INTO "caseman__branch_contacts" VALUES(6,'','true','0015400000QonO1AAJ','6');
INSERT INTO "caseman__branch_contacts" VALUES(7,'','true','0015400000QonO2AAJ','7');
INSERT INTO "caseman__branch_contacts" VALUES(8,'','true','0015400000QonO3AAJ','8');
INSERT INTO "caseman__branch_contacts" VALUES(9,'','true','0015400000QonO4AAJ','9');
INSERT INTO "caseman__branch_contacts" VALUES(10,'','true','0015400000QonO5AAJ','10');
INSERT INTO "caseman__branch_contacts" VALUES(11,'','true','0015400000QonO6AAJ','11');
INSERT INTO "caseman__branch_contacts" VALUES(12,'','true','0015400000QonO7AAJ','12');
INSERT INTO "caseman__branch_contacts" VALUES(13,'','true','0015400000QonMXAAZ','13');
INSERT INTO "caseman__branch_contacts" VALUES(14,'','true','0015400000QonO8AAJ','14');
INSERT INTO "caseman__branch_contacts" VALUES(15,'','true','0015400000QonO9AAJ','15');
INSERT INTO "caseman__branch_contacts" VALUES(16,'','true','0015400000QonOAAAZ','16');
INSERT INTO "caseman__branch_contacts" VALUES(17,'','true','0015400000QonOBAAZ','17');
INSERT INTO "caseman__branch_contacts" VALUES(18,'','true','0015400000QonOCAAZ','18');
INSERT INTO "caseman__branch_contacts" VALUES(19,'','true','0015400000QonODAAZ','19');
INSERT INTO "caseman__branch_contacts" VALUES(20,'','true','0015400000QonOEAAZ','20');
INSERT INTO "caseman__branch_contacts" VALUES(21,'','true','0015400000QonOFAAZ','21');
INSERT INTO "caseman__branch_contacts" VALUES(22,'','true','0015400000QonOGAAZ','22');
INSERT INTO "caseman__branch_contacts" VALUES(23,'','true','0015400000QonOHAAZ','23');
INSERT INTO "caseman__branch_contacts" VALUES(24,'','true','0015400000QonMYAAZ','24');
INSERT INTO "caseman__branch_contacts" VALUES(25,'','true','0015400000QonOIAAZ','25');
INSERT INTO "caseman__branch_contacts" VALUES(26,'','true','0015400000QonOJAAZ','26');
INSERT INTO "caseman__branch_contacts" VALUES(27,'','true','0015400000QonOKAAZ','27');
INSERT INTO "caseman__branch_contacts" VALUES(28,'','true','0015400000QonOLAAZ','28');
INSERT INTO "caseman__branch_contacts" VALUES(29,'','true','0015400000QonOMAAZ','29');
INSERT INTO "caseman__branch_contacts" VALUES(30,'','true','0015400000QonONAAZ','30');
INSERT INTO "caseman__branch_contacts" VALUES(31,'','true','0015400000QonOOAAZ','31');
INSERT INTO "caseman__branch_contacts" VALUES(32,'','true','0015400000QonOPAAZ','32');
INSERT INTO "caseman__branch_contacts" VALUES(33,'','true','0015400000QonOQAAZ','33');
INSERT INTO "caseman__branch_contacts" VALUES(34,'','true','0015400000QonORAAZ','34');
INSERT INTO "caseman__branch_contacts" VALUES(35,'','true','0015400000QonMZAAZ','35');
INSERT INTO "caseman__branch_contacts" VALUES(36,'','true','0015400000QonOSAAZ','36');
INSERT INTO "caseman__branch_contacts" VALUES(37,'','true','0015400000QonOTAAZ','37');
INSERT INTO "caseman__branch_contacts" VALUES(38,'','true','0015400000QonOUAAZ','38');
INSERT INTO "caseman__branch_contacts" VALUES(39,'','true','0015400000QonOVAAZ','39');
INSERT INTO "caseman__branch_contacts" VALUES(40,'','true','0015400000QonOWAAZ','40');
INSERT INTO "caseman__branch_contacts" VALUES(41,'','true','0015400000QonOXAAZ','41');
INSERT INTO "caseman__branch_contacts" VALUES(42,'','true','0015400000QonOYAAZ','42');
INSERT INTO "caseman__branch_contacts" VALUES(43,'','true','0015400000QonOZAAZ','43');
INSERT INTO "caseman__branch_contacts" VALUES(44,'','true','0015400000QonOaAAJ','44');
INSERT INTO "caseman__branch_contacts" VALUES(45,'','true','0015400000QonObAAJ','45');
INSERT INTO "caseman__branch_contacts" VALUES(46,'','true','0015400000QonMaAAJ','46');
INSERT INTO "caseman__branch_contacts" VALUES(47,'','true','0015400000QonOcAAJ','47');
INSERT INTO "caseman__branch_contacts" VALUES(48,'','true','0015400000QonOdAAJ','48');
INSERT INTO "caseman__branch_contacts" VALUES(49,'','true','0015400000QonOeAAJ','49');
INSERT INTO "caseman__branch_contacts" VALUES(50,'','true','0015400000QonOfAAJ','50');
INSERT INTO "caseman__branch_contacts" VALUES(51,'','true','0015400000QonOgAAJ','51');
INSERT INTO "caseman__branch_contacts" VALUES(52,'','true','0015400000QonOhAAJ','52');
INSERT INTO "caseman__branch_contacts" VALUES(53,'','true','0015400000QonOiAAJ','53');
INSERT INTO "caseman__branch_contacts" VALUES(54,'','true','0015400000QonOjAAJ','54');
INSERT INTO "caseman__branch_contacts" VALUES(55,'','true','0015400000QonOkAAJ','55');
INSERT INTO "caseman__branch_contacts" VALUES(56,'','true','0015400000QonOlAAJ','56');
INSERT INTO "caseman__branch_contacts" VALUES(57,'','true','0015400000QonMbAAJ','57');
INSERT INTO "caseman__branch_contacts" VALUES(58,'','true','0015400000QonOmAAJ','58');
INSERT INTO "caseman__branch_contacts" VALUES(59,'','true','0015400000QonOnAAJ','59');
INSERT INTO "caseman__branch_contacts" VALUES(60,'','true','0015400000QonOoAAJ','60');
INSERT INTO "caseman__branch_contacts" VALUES(61,'','true','0015400000QonOpAAJ','61');
INSERT INTO "caseman__branch_contacts" VALUES(62,'','true','0015400000QonOqAAJ','62');
INSERT INTO "caseman__branch_contacts" VALUES(63,'','true','0015400000QonOrAAJ','63');
INSERT INTO "caseman__branch_contacts" VALUES(64,'','true','0015400000QonOsAAJ','64');
INSERT INTO "caseman__branch_contacts" VALUES(65,'','true','0015400000QonOtAAJ','65');
INSERT INTO "caseman__branch_contacts" VALUES(66,'','true','0015400000QonOuAAJ','66');
INSERT INTO "caseman__branch_contacts" VALUES(67,'','true','0015400000QonOvAAJ','67');
INSERT INTO "caseman__branch_contacts" VALUES(68,'','true','0015400000QonMcAAJ','68');
INSERT INTO "caseman__branch_contacts" VALUES(69,'','true','0015400000QonOwAAJ','69');
INSERT INTO "caseman__branch_contacts" VALUES(70,'','true','0015400000QonOxAAJ','70');
INSERT INTO "caseman__branch_contacts" VALUES(71,'','true','0015400000QonOyAAJ','71');
INSERT INTO "caseman__branch_contacts" VALUES(72,'','true','0015400000QonOzAAJ','72');
INSERT INTO "caseman__branch_contacts" VALUES(73,'','true','0015400000QonP0AAJ','73');
INSERT INTO "caseman__branch_contacts" VALUES(74,'','true','0015400000QonP1AAJ','74');
INSERT INTO "caseman__branch_contacts" VALUES(75,'','true','0015400000QonMdAAJ','75');
INSERT INTO "caseman__branch_contacts" VALUES(76,'','true','0015400000QonMeAAJ','76');
INSERT INTO "caseman__branch_contacts" VALUES(77,'','true','0015400000QonMfAAJ','77');
INSERT INTO "caseman__branch_contacts" VALUES(78,'','true','0015400000QonMJAAZ','78');
INSERT INTO "caseman__branch_contacts" VALUES(79,'','true','0015400000QonMgAAJ','79');
INSERT INTO "caseman__branch_contacts" VALUES(80,'','true','0015400000QonMhAAJ','80');
INSERT INTO "caseman__branch_contacts" VALUES(81,'','true','0015400000QonMiAAJ','81');
INSERT INTO "caseman__branch_contacts" VALUES(82,'','true','0015400000QonMjAAJ','82');
INSERT INTO "caseman__branch_contacts" VALUES(83,'','true','0015400000QonMkAAJ','83');
INSERT INTO "caseman__branch_contacts" VALUES(84,'','true','0015400000QonMkAAJ','84');
INSERT INTO "caseman__branch_contacts" VALUES(85,'','true','0015400000QonMlAAJ','85');
INSERT INTO "caseman__branch_contacts" VALUES(86,'','true','0015400000QonMlAAJ','86');
INSERT INTO "caseman__branch_contacts" VALUES(87,'','true','0015400000QonMmAAJ','87');
INSERT INTO "caseman__branch_contacts" VALUES(88,'','true','0015400000QonMmAAJ','88');
INSERT INTO "caseman__branch_contacts" VALUES(89,'','true','0015400000QonMnAAJ','89');
INSERT INTO "caseman__branch_contacts" VALUES(90,'','true','0015400000QonMnAAJ','90');
INSERT INTO "caseman__branch_contacts" VALUES(91,'','true','0015400000QonMoAAJ','91');
INSERT INTO "caseman__branch_contacts" VALUES(92,'','true','0015400000QonMoAAJ','92');
INSERT INTO "caseman__branch_contacts" VALUES(93,'','true','0015400000QonMoAAJ','93');
INSERT INTO "caseman__branch_contacts" VALUES(94,'','true','0015400000QonMpAAJ','94');
INSERT INTO "caseman__branch_contacts" VALUES(95,'','true','0015400000QonMKAAZ','95');
INSERT INTO "caseman__branch_contacts" VALUES(96,'','true','0015400000QonMqAAJ','96');
INSERT INTO "caseman__branch_contacts" VALUES(97,'','true','0015400000QonMrAAJ','97');
INSERT INTO "caseman__branch_contacts" VALUES(98,'','true','0015400000QonMsAAJ','98');
INSERT INTO "caseman__branch_contacts" VALUES(99,'','true','0015400000QonMtAAJ','99');
INSERT INTO "caseman__branch_contacts" VALUES(100,'','true','0015400000QonMuAAJ','100');
INSERT INTO "caseman__branch_contacts" VALUES(101,'','true','0015400000QonMvAAJ','101');
INSERT INTO "caseman__branch_contacts" VALUES(102,'','true','0015400000QonMvAAJ','102');
INSERT INTO "caseman__branch_contacts" VALUES(103,'','true','0015400000QonMvAAJ','103');
INSERT INTO "caseman__branch_contacts" VALUES(104,'','true','0015400000QonMwAAJ','104');
INSERT INTO "caseman__branch_contacts" VALUES(105,'','true','0015400000QonMxAAJ','105');
INSERT INTO "caseman__branch_contacts" VALUES(106,'','true','0015400000QonMyAAJ','106');
INSERT INTO "caseman__branch_contacts" VALUES(107,'','true','0015400000QonMzAAJ','107');
INSERT INTO "caseman__branch_contacts" VALUES(108,'','true','0015400000QonMLAAZ','108');
INSERT INTO "caseman__branch_contacts" VALUES(109,'','true','0015400000QonN0AAJ','109');
INSERT INTO "caseman__branch_contacts" VALUES(110,'','true','0015400000QonN1AAJ','110');
INSERT INTO "caseman__branch_contacts" VALUES(111,'','true','0015400000QonN2AAJ','111');
INSERT INTO "caseman__branch_contacts" VALUES(112,'','true','0015400000QonN3AAJ','112');
INSERT INTO "caseman__branch_contacts" VALUES(113,'','true','0015400000QonN4AAJ','113');
INSERT INTO "caseman__branch_contacts" VALUES(114,'','true','0015400000QonN5AAJ','114');
INSERT INTO "caseman__branch_contacts" VALUES(115,'','true','0015400000QonN6AAJ','115');
INSERT INTO "caseman__branch_contacts" VALUES(116,'','true','0015400000QonN7AAJ','116');
INSERT INTO "caseman__branch_contacts" VALUES(117,'','true','0015400000QonN8AAJ','117');
INSERT INTO "caseman__branch_contacts" VALUES(118,'','true','0015400000QonN9AAJ','118');
INSERT INTO "caseman__branch_contacts" VALUES(119,'','true','0015400000QonMRAAZ','119');
INSERT INTO "caseman__branch_contacts" VALUES(120,'','true','0015400000QonNAAAZ','120');
INSERT INTO "caseman__branch_contacts" VALUES(121,'','true','0015400000QonNBAAZ','121');
INSERT INTO "caseman__branch_contacts" VALUES(122,'','true','0015400000QonNCAAZ','122');
INSERT INTO "caseman__branch_contacts" VALUES(123,'','true','0015400000QonNDAAZ','123');
INSERT INTO "caseman__branch_contacts" VALUES(124,'','true','0015400000QonNEAAZ','124');
INSERT INTO "caseman__branch_contacts" VALUES(125,'','true','0015400000QonNFAAZ','125');
INSERT INTO "caseman__branch_contacts" VALUES(126,'','true','0015400000QonNGAAZ','126');
INSERT INTO "caseman__branch_contacts" VALUES(127,'','true','0015400000QonNHAAZ','127');
INSERT INTO "caseman__branch_contacts" VALUES(128,'','true','0015400000QonNIAAZ','128');
INSERT INTO "caseman__branch_contacts" VALUES(129,'','true','0015400000QonNJAAZ','129');
INSERT INTO "caseman__branch_contacts" VALUES(130,'','true','0015400000QonMSAAZ','130');
INSERT INTO "caseman__branch_contacts" VALUES(131,'','true','0015400000QonNKAAZ','131');
INSERT INTO "caseman__branch_contacts" VALUES(132,'','true','0015400000QonNLAAZ','132');
INSERT INTO "caseman__branch_contacts" VALUES(133,'','true','0015400000QonNMAAZ','133');
INSERT INTO "caseman__branch_contacts" VALUES(134,'','true','0015400000QonNNAAZ','134');
INSERT INTO "caseman__branch_contacts" VALUES(135,'','true','0015400000QonNOAAZ','135');
INSERT INTO "caseman__branch_contacts" VALUES(136,'','true','0015400000QonNPAAZ','136');
INSERT INTO "caseman__branch_contacts" VALUES(137,'','true','0015400000QonNQAAZ','137');
INSERT INTO "caseman__branch_contacts" VALUES(138,'','true','0015400000QonNRAAZ','138');
INSERT INTO "caseman__branch_contacts" VALUES(139,'','true','0015400000QonNSAAZ','139');
INSERT INTO "caseman__branch_contacts" VALUES(140,'','true','0015400000QonNTAAZ','140');
INSERT INTO "caseman__branch_contacts" VALUES(141,'','true','0015400000QonMTAAZ','141');
INSERT INTO "caseman__branch_contacts" VALUES(142,'','true','0015400000QonNUAAZ','142');
INSERT INTO "caseman__branch_contacts" VALUES(143,'','true','0015400000QonNVAAZ','143');
INSERT INTO "caseman__branch_contacts" VALUES(144,'','true','0015400000QonNWAAZ','144');
INSERT INTO "caseman__branch_contacts" VALUES(145,'','true','0015400000QonNXAAZ','145');
INSERT INTO "caseman__branch_contacts" VALUES(146,'','true','0015400000QonNYAAZ','146');
INSERT INTO "caseman__branch_contacts" VALUES(147,'','true','0015400000QonNZAAZ','147');
INSERT INTO "caseman__branch_contacts" VALUES(148,'','true','0015400000QonNaAAJ','148');
INSERT INTO "caseman__branch_contacts" VALUES(149,'','true','0015400000QonNbAAJ','149');
INSERT INTO "caseman__branch_contacts" VALUES(150,'','true','0015400000QonNcAAJ','150');
INSERT INTO "caseman__branch_contacts" VALUES(151,'','true','0015400000QonNdAAJ','151');
INSERT INTO "caseman__branch_contacts" VALUES(152,'','true','0015400000QonMUAAZ','152');
INSERT INTO "caseman__branch_contacts" VALUES(153,'','true','0015400000QonNeAAJ','153');
INSERT INTO "caseman__branch_contacts" VALUES(154,'','true','0015400000QonNfAAJ','154');
INSERT INTO "caseman__branch_contacts" VALUES(155,'','true','0015400000QonNgAAJ','155');
INSERT INTO "caseman__branch_contacts" VALUES(156,'','true','0015400000QonNhAAJ','156');
INSERT INTO "caseman__branch_contacts" VALUES(157,'','true','0015400000QonNiAAJ','157');
INSERT INTO "caseman__branch_contacts" VALUES(158,'','true','0015400000QonNjAAJ','158');
INSERT INTO "caseman__branch_contacts" VALUES(159,'','true','0015400000QonNkAAJ','159');
INSERT INTO "caseman__branch_contacts" VALUES(160,'','true','0015400000QonNlAAJ','160');
INSERT INTO "caseman__branch_contacts" VALUES(161,'','true','0015400000QonNmAAJ','161');
INSERT INTO "caseman__branch_contacts" VALUES(162,'','true','0015400000QonNnAAJ','162');
INSERT INTO "caseman__branch_contacts" VALUES(163,'','true','0015400000QonMVAAZ','163');
INSERT INTO "caseman__branch_contacts" VALUES(164,'','true','0015400000QonNoAAJ','164');
INSERT INTO "caseman__branch_contacts" VALUES(165,'','true','0015400000QonNpAAJ','165');
INSERT INTO "caseman__branch_contacts" VALUES(166,'','true','0015400000QonNqAAJ','166');
INSERT INTO "caseman__branch_contacts" VALUES(167,'','true','0015400000QonNrAAJ','167');
INSERT INTO "caseman__branch_contacts" VALUES(168,'','true','0015400000QonNsAAJ','168');
INSERT INTO "caseman__branch_contacts" VALUES(169,'','true','0015400000QonNtAAJ','169');
INSERT INTO "caseman__branch_contacts" VALUES(170,'','true','0015400000QonNuAAJ','170');
INSERT INTO "caseman__branch_contacts" VALUES(171,'','true','0015400000QonNvAAJ','171');
INSERT INTO "caseman__branch_contacts" VALUES(172,'','true','0015400000QonNwAAJ','172');
INSERT INTO "caseman__branch_contacts" VALUES(173,'','true','0015400000QonNxAAJ','173');
INSERT INTO "caseman__branch_contacts" VALUES(174,'','true','1','85');
INSERT INTO "caseman__branch_contacts" VALUES(175,'Other','true','1','86');
INSERT INTO "caseman__branch_contacts" VALUES(176,'Client','true','1','88');
INSERT INTO "caseman__branch_contacts" VALUES(177,'Client','true','1','89');
INSERT INTO "caseman__branch_contacts" VALUES(178,'Client','true','1','93');
INSERT INTO "caseman__branch_contacts" VALUES(179,'','true','1','94');
INSERT INTO "caseman__branch_contacts" VALUES(180,'Client','true','1','97');
INSERT INTO "caseman__branch_contacts" VALUES(181,'','true','1','98');
INSERT INTO "caseman__branch_contacts" VALUES(182,'','true','1','99');
INSERT INTO "caseman__branch_contacts" VALUES(183,'Client','true','1','100');
INSERT INTO "caseman__branch_contacts" VALUES(184,'Client','true','1','103');
INSERT INTO "caseman__branch_contacts" VALUES(185,'','true','1','96');
CREATE TABLE caseman__case_plans (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__case_plans" VALUES(1,'Socialization Case Plan - Tom Higgins','83');
INSERT INTO "caseman__case_plans" VALUES(2,'Reading Case Plan - Tom Higgins','83');
INSERT INTO "caseman__case_plans" VALUES(3,'Arlene Baker''s Workforce Re-entry Case Plan','88');
INSERT INTO "caseman__case_plans" VALUES(4,'Robin Banks'' Job Readiness Case Plan','89');
INSERT INTO "caseman__case_plans" VALUES(5,'Robin Banks'' Sobriety Case Plan','89');
INSERT INTO "caseman__case_plans" VALUES(6,'Financial Literacy Case Plan - Jason Barnes','93');
INSERT INTO "caseman__case_plans" VALUES(7,'English proficiency case plan - Barbara Johnson','103');
CREATE TABLE caseman__client_alerts (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Active__c" VARCHAR(255), 
	"caseman__Description__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_alerts" VALUES(1,'Tom has anger issues','true','','83');
INSERT INTO "caseman__client_alerts" VALUES(2,'Tom''s sister passed away recently (very emotional)','true','','83');
INSERT INTO "caseman__client_alerts" VALUES(3,'Robin was recently released from rehab','true','','89');
CREATE TABLE caseman__client_cases (
	id INTEGER NOT NULL, 
	"Subject" VARCHAR(255), 
	"Priority" VARCHAR(255), 
	"Status" VARCHAR(255), 
	"Origin" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"SuppliedCompany" VARCHAR(255), 
	"SuppliedEmail" VARCHAR(255), 
	"SuppliedName" VARCHAR(255), 
	"SuppliedPhone" VARCHAR(255), 
	"caseman__IncidentDateTime__c" VARCHAR(255), 
	"caseman__IncidentType__c" VARCHAR(255), 
	"caseman__LocationNotes__c" VARCHAR(255), 
	"caseman__Severity__c" VARCHAR(255), 
	branch__c VARCHAR(255), 
	contact_id VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_cases" VALUES(1,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','83','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(2,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','83','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(3,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','83','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(4,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','83','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(5,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','88','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(6,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','89','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(7,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','93','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(8,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','103','ClientCase');
CREATE TABLE caseman__client_note_relationships (
	id INTEGER NOT NULL, 
	case__c VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_note_relationships" VALUES(1,'','1','');
INSERT INTO "caseman__client_note_relationships" VALUES(2,'','2','');
INSERT INTO "caseman__client_note_relationships" VALUES(3,'6','3','');
INSERT INTO "caseman__client_note_relationships" VALUES(4,'7','4','');
INSERT INTO "caseman__client_note_relationships" VALUES(5,'8','5','');
CREATE TABLE caseman__client_notes (
	id INTEGER NOT NULL, 
	"caseman__Content__c" VARCHAR(255), 
	"caseman__Subject__c" VARCHAR(255), 
	"caseman__Status__c" VARCHAR(255), 
	"caseman__InteractionDate__c" VARCHAR(255), 
	"caseman__Draft__c" VARCHAR(255), 
	"caseman__MinutesSpentWithClient__c" VARCHAR(255), 
	client__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_notes" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','83');
INSERT INTO "caseman__client_notes" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','83');
INSERT INTO "caseman__client_notes" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','89');
INSERT INTO "caseman__client_notes" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','93');
INSERT INTO "caseman__client_notes" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','103');
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
INSERT INTO "caseman__goals" VALUES(1,'Build respectful peer relationships','83','1','13');
INSERT INTO "caseman__goals" VALUES(2,'Build respectful inter-generational relationships','83','1','15');
INSERT INTO "caseman__goals" VALUES(3,'Reach an age appropriate level of proficiency in reading','83','2','1');
INSERT INTO "caseman__goals" VALUES(4,'Stabilize housing','88','3','10');
INSERT INTO "caseman__goals" VALUES(5,'Identify industry/career path','88','3','16');
INSERT INTO "caseman__goals" VALUES(6,'Meet job requirement standards','88','3','18');
INSERT INTO "caseman__goals" VALUES(7,'Complete Succeed Program','88','3','19');
INSERT INTO "caseman__goals" VALUES(8,'Stabilize Employment','88','3','21');
INSERT INTO "caseman__goals" VALUES(9,'Develop basic financial literacy skills','88','3','3');
INSERT INTO "caseman__goals" VALUES(10,'Get and keep job for 6 - 12 months','88','3','4');
INSERT INTO "caseman__goals" VALUES(11,'Develop Soft Skills','88','3','9');
INSERT INTO "caseman__goals" VALUES(12,'Meet job requirement standards','89','4','18');
INSERT INTO "caseman__goals" VALUES(13,'Complete Succeed Program','89','4','19');
INSERT INTO "caseman__goals" VALUES(14,'Stabilize Employment','89','4','21');
INSERT INTO "caseman__goals" VALUES(15,'Develop basic financial literacy skills','89','4','3');
INSERT INTO "caseman__goals" VALUES(16,'Get and keep job for 6 - 12 months','89','4','4');
INSERT INTO "caseman__goals" VALUES(17,'Develop Soft Skills','89','4','9');
INSERT INTO "caseman__goals" VALUES(18,'Adopt healthy skills to address dependency issues','89','5','6');
INSERT INTO "caseman__goals" VALUES(19,'Complete Financial Literacy Course','93','6','12');
INSERT INTO "caseman__goals" VALUES(20,'Deposit 10% of income in Savings Account for 3 months','93','6','14');
INSERT INTO "caseman__goals" VALUES(21,'Reach proficiency level in reading, writing, speaking & listening per state std','103','7','8');
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
	"caseman__IncidentDateTime__c" VARCHAR(255), 
	"caseman__IncidentType__c" VARCHAR(255), 
	"caseman__LocationNotes__c" VARCHAR(255), 
	"caseman__Severity__c" VARCHAR(255), 
	branch__c VARCHAR(255), 
	contact_id VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__incident_cases" VALUES(1,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','83','Incident');
INSERT INTO "caseman__incident_cases" VALUES(2,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','1','83','Incident');
INSERT INTO "caseman__incident_cases" VALUES(3,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','1','83','Incident');
INSERT INTO "caseman__incident_cases" VALUES(4,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','83','Incident');
INSERT INTO "caseman__incident_cases" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','83','Incident');
CREATE TABLE contacts (
	id INTEGER NOT NULL, 
	"caseman__AgeCategory__c" VARCHAR(255), 
	"caseman__ClientID__c" VARCHAR(255), 
	"caseman__EmergencyContactRole__c" VARCHAR(255), 
	"caseman__PhotoFileID__c" VARCHAR(255), 
	"caseman__PreferredCommunicationMethod__c" VARCHAR(255), 
	"caseman__LegalName__c" VARCHAR(255), 
	"caseman__PreferredPhoneField__c" VARCHAR(255), 
	"caseman__PreferredPhoneNumber__c" VARCHAR(255), 
	"caseman__Pronouns__c" VARCHAR(255), 
	"caseman__Roles__c" VARCHAR(255), 
	"caseman__WatchList__c" VARCHAR(255), 
	"caseman__WatchListDate__c" VARCHAR(255), 
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "contacts" VALUES(1,'','','','','','','','','','','false','','1','');
INSERT INTO "contacts" VALUES(2,'','','','','','','','','','','false','','10','');
INSERT INTO "contacts" VALUES(3,'','','','','','','','','','','false','','100','');
INSERT INTO "contacts" VALUES(4,'','','','','','','','','','','false','','101','');
INSERT INTO "contacts" VALUES(5,'','','','','','','','','','','false','','102','');
INSERT INTO "contacts" VALUES(6,'','','','','','','','','','','false','','103','');
INSERT INTO "contacts" VALUES(7,'','','','','','','','','','','false','','104','');
INSERT INTO "contacts" VALUES(8,'','','','','','','','','','','false','','105','');
INSERT INTO "contacts" VALUES(9,'','','','','','','','','','','false','','106','');
INSERT INTO "contacts" VALUES(10,'','','','','','','','','','','false','','107','');
INSERT INTO "contacts" VALUES(11,'','','','','','','','','','','false','','108','');
INSERT INTO "contacts" VALUES(12,'','','','','','','','','','','false','','109','');
INSERT INTO "contacts" VALUES(13,'','','','','','','','','','','false','','11','');
INSERT INTO "contacts" VALUES(14,'','','','','','','','','','','false','','110','');
INSERT INTO "contacts" VALUES(15,'','','','','','','','','','','false','','111','');
INSERT INTO "contacts" VALUES(16,'','','','','','','','','','','false','','112','');
INSERT INTO "contacts" VALUES(17,'','','','','','','','','','','false','','113','');
INSERT INTO "contacts" VALUES(18,'','','','','','','','','','','false','','114','');
INSERT INTO "contacts" VALUES(19,'','','','','','','','','','','false','','115','');
INSERT INTO "contacts" VALUES(20,'','','','','','','','','','','false','','116','');
INSERT INTO "contacts" VALUES(21,'','','','','','','','','','','false','','117','');
INSERT INTO "contacts" VALUES(22,'','','','','','','','','','','false','','118','');
INSERT INTO "contacts" VALUES(23,'','','','','','','','','','','false','','119','');
INSERT INTO "contacts" VALUES(24,'','','','','','','','','','','false','','12','');
INSERT INTO "contacts" VALUES(25,'','','','','','','','','','','false','','120','');
INSERT INTO "contacts" VALUES(26,'','','','','','','','','','','false','','121','');
INSERT INTO "contacts" VALUES(27,'','','','','','','','','','','false','','122','');
INSERT INTO "contacts" VALUES(28,'','','','','','','','','','','false','','123','');
INSERT INTO "contacts" VALUES(29,'','','','','','','','','','','false','','124','');
INSERT INTO "contacts" VALUES(30,'','','','','','','','','','','false','','125','');
INSERT INTO "contacts" VALUES(31,'','','','','','','','','','','false','','126','');
INSERT INTO "contacts" VALUES(32,'','','','','','','','','','','false','','127','');
INSERT INTO "contacts" VALUES(33,'','','','','','','','','','','false','','128','');
INSERT INTO "contacts" VALUES(34,'','','','','','','','','','','false','','129','');
INSERT INTO "contacts" VALUES(35,'','','','','','','','','','','false','','13','');
INSERT INTO "contacts" VALUES(36,'','','','','','','','','','','false','','130','');
INSERT INTO "contacts" VALUES(37,'','','','','','','','','','','false','','131','');
INSERT INTO "contacts" VALUES(38,'','','','','','','','','','','false','','132','');
INSERT INTO "contacts" VALUES(39,'','','','','','','','','','','false','','133','');
INSERT INTO "contacts" VALUES(40,'','','','','','','','','','','false','','134','');
INSERT INTO "contacts" VALUES(41,'','','','','','','','','','','false','','135','');
INSERT INTO "contacts" VALUES(42,'','','','','','','','','','','false','','136','');
INSERT INTO "contacts" VALUES(43,'','','','','','','','','','','false','','137','');
INSERT INTO "contacts" VALUES(44,'','','','','','','','','','','false','','138','');
INSERT INTO "contacts" VALUES(45,'','','','','','','','','','','false','','139','');
INSERT INTO "contacts" VALUES(46,'','','','','','','','','','','false','','14','');
INSERT INTO "contacts" VALUES(47,'','','','','','','','','','','false','','140','');
INSERT INTO "contacts" VALUES(48,'','','','','','','','','','','false','','141','');
INSERT INTO "contacts" VALUES(49,'','','','','','','','','','','false','','142','');
INSERT INTO "contacts" VALUES(50,'','','','','','','','','','','false','','143','');
INSERT INTO "contacts" VALUES(51,'','','','','','','','','','','false','','144','');
INSERT INTO "contacts" VALUES(52,'','','','','','','','','','','false','','145','');
INSERT INTO "contacts" VALUES(53,'','','','','','','','','','','false','','146','');
INSERT INTO "contacts" VALUES(54,'','','','','','','','','','','false','','147','');
INSERT INTO "contacts" VALUES(55,'','','','','','','','','','','false','','148','');
INSERT INTO "contacts" VALUES(56,'','','','','','','','','','','false','','149','');
INSERT INTO "contacts" VALUES(57,'','','','','','','','','','','false','','15','');
INSERT INTO "contacts" VALUES(58,'','','','','','','','','','','false','','150','');
INSERT INTO "contacts" VALUES(59,'','','','','','','','','','','false','','151','');
INSERT INTO "contacts" VALUES(60,'','','','','','','','','','','false','','152','');
INSERT INTO "contacts" VALUES(61,'','','','','','','','','','','false','','153','');
INSERT INTO "contacts" VALUES(62,'','','','','','','','','','','false','','154','');
INSERT INTO "contacts" VALUES(63,'','','','','','','','','','','false','','155','');
INSERT INTO "contacts" VALUES(64,'','','','','','','','','','','false','','156','');
INSERT INTO "contacts" VALUES(65,'','','','','','','','','','','false','','157','');
INSERT INTO "contacts" VALUES(66,'','','','','','','','','','','false','','158','');
INSERT INTO "contacts" VALUES(67,'','','','','','','','','','','false','','159','');
INSERT INTO "contacts" VALUES(68,'','','','','','','','','','','false','','16','');
INSERT INTO "contacts" VALUES(69,'','','','','','','','','','','false','','160','');
INSERT INTO "contacts" VALUES(70,'','','','','','','','','','','false','','161','');
INSERT INTO "contacts" VALUES(71,'','','','','','','','','','','false','','162','');
INSERT INTO "contacts" VALUES(72,'','','','','','','','','','','false','','163','');
INSERT INTO "contacts" VALUES(73,'','','','','','','','','','','false','','164','');
INSERT INTO "contacts" VALUES(74,'','','','','','','','','','','false','','165','');
INSERT INTO "contacts" VALUES(75,'','','','','','','','','','','false','','17','');
INSERT INTO "contacts" VALUES(76,'','','','','','','','','','','false','','18','');
INSERT INTO "contacts" VALUES(77,'','','','','','','','','','','false','','19','');
INSERT INTO "contacts" VALUES(78,'','','','','','','','','','','false','','2','');
INSERT INTO "contacts" VALUES(79,'','','','','','','','','','','false','','20','');
INSERT INTO "contacts" VALUES(80,'','','','','','','','','','','false','','21','');
INSERT INTO "contacts" VALUES(81,'','','','','','','','','','','false','','22','');
INSERT INTO "contacts" VALUES(82,'','','','','','','','','','','false','','23','');
INSERT INTO "contacts" VALUES(83,'Child','','Mother','06854000000esPZAAY','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-12-11','24','84');
INSERT INTO "contacts" VALUES(84,'','','','','','','','','','','false','','24','');
INSERT INTO "contacts" VALUES(85,'Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','Client','false','','25','');
INSERT INTO "contacts" VALUES(86,'Adult','','Friend','','','','','','she/her/hers','Client;Donor;Volunteer','false','','25','');
INSERT INTO "contacts" VALUES(87,'','','','','','','','','','','false','','26','');
INSERT INTO "contacts" VALUES(88,'Adult','','Friend','06854000000esPUAAY','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','26','86');
INSERT INTO "contacts" VALUES(89,'Adult','','Partner','06854000000esPeAAI','','','','','she/her/hers','Client','true','2019-12-11','27','90');
INSERT INTO "contacts" VALUES(90,'','','','','','','','','','','false','','27','');
INSERT INTO "contacts" VALUES(91,'','','','','','','','','','','false','','28','');
INSERT INTO "contacts" VALUES(92,'','','','','','','','','','','false','','28','');
INSERT INTO "contacts" VALUES(93,'Youth','88841515','Mother','06854000000esPjAAI','','','','','he/him/his','Client','false','','28','91');
INSERT INTO "contacts" VALUES(94,'Adult','','Friend','','','','','','she/her/hers','Client','false','','29','');
INSERT INTO "contacts" VALUES(95,'','','','','','','','','','','false','','3','');
INSERT INTO "contacts" VALUES(96,'Senior','','Friend','','','','','','they/them/theirs','Client','false','','30','');
INSERT INTO "contacts" VALUES(97,'Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-12-11','31','');
INSERT INTO "contacts" VALUES(98,'Adult','','Friend','','','','','','they/them/theirs','Client','false','','32','');
INSERT INTO "contacts" VALUES(99,'Adult','','Friend','','','','','','she/her/hers','Client;Donor','false','','33','');
INSERT INTO "contacts" VALUES(100,'Adult','','Friend','','','','','','he/him/his','Donor','false','','34','');
INSERT INTO "contacts" VALUES(101,'','','','','','','','','','','false','','35','');
INSERT INTO "contacts" VALUES(102,'','','','','','','','','','','false','','35','');
INSERT INTO "contacts" VALUES(103,'Adult','','Husband','06854000000esPPAAY','','','','','she/her/hers','Client','false','','35','101');
INSERT INTO "contacts" VALUES(104,'','','','','','','','','','','false','','36','');
INSERT INTO "contacts" VALUES(105,'','','','','','','','','','','false','','37','');
INSERT INTO "contacts" VALUES(106,'','','','','','','','','','','false','','38','');
INSERT INTO "contacts" VALUES(107,'','','','','','','','','','','false','','39','');
INSERT INTO "contacts" VALUES(108,'','','','','','','','','','','false','','4','');
INSERT INTO "contacts" VALUES(109,'','','','','','','','','','','false','','40','');
INSERT INTO "contacts" VALUES(110,'','','','','','','','','','','false','','41','');
INSERT INTO "contacts" VALUES(111,'','','','','','','','','','','false','','42','');
INSERT INTO "contacts" VALUES(112,'','','','','','','','','','','false','','43','');
INSERT INTO "contacts" VALUES(113,'','','','','','','','','','','false','','44','');
INSERT INTO "contacts" VALUES(114,'','','','','','','','','','','false','','45','');
INSERT INTO "contacts" VALUES(115,'','','','','','','','','','','false','','46','');
INSERT INTO "contacts" VALUES(116,'','','','','','','','','','','false','','47','');
INSERT INTO "contacts" VALUES(117,'','','','','','','','','','','false','','48','');
INSERT INTO "contacts" VALUES(118,'','','','','','','','','','','false','','49','');
INSERT INTO "contacts" VALUES(119,'','','','','','','','','','','false','','5','');
INSERT INTO "contacts" VALUES(120,'','','','','','','','','','','false','','50','');
INSERT INTO "contacts" VALUES(121,'','','','','','','','','','','false','','51','');
INSERT INTO "contacts" VALUES(122,'','','','','','','','','','','false','','52','');
INSERT INTO "contacts" VALUES(123,'','','','','','','','','','','false','','53','');
INSERT INTO "contacts" VALUES(124,'','','','','','','','','','','false','','54','');
INSERT INTO "contacts" VALUES(125,'','','','','','','','','','','false','','55','');
INSERT INTO "contacts" VALUES(126,'','','','','','','','','','','false','','56','');
INSERT INTO "contacts" VALUES(127,'','','','','','','','','','','false','','57','');
INSERT INTO "contacts" VALUES(128,'','','','','','','','','','','false','','58','');
INSERT INTO "contacts" VALUES(129,'','','','','','','','','','','false','','59','');
INSERT INTO "contacts" VALUES(130,'','','','','','','','','','','false','','6','');
INSERT INTO "contacts" VALUES(131,'','','','','','','','','','','false','','60','');
INSERT INTO "contacts" VALUES(132,'','','','','','','','','','','false','','61','');
INSERT INTO "contacts" VALUES(133,'','','','','','','','','','','false','','62','');
INSERT INTO "contacts" VALUES(134,'','','','','','','','','','','false','','63','');
INSERT INTO "contacts" VALUES(135,'','','','','','','','','','','false','','64','');
INSERT INTO "contacts" VALUES(136,'','','','','','','','','','','false','','65','');
INSERT INTO "contacts" VALUES(137,'','','','','','','','','','','false','','66','');
INSERT INTO "contacts" VALUES(138,'','','','','','','','','','','false','','67','');
INSERT INTO "contacts" VALUES(139,'','','','','','','','','','','false','','68','');
INSERT INTO "contacts" VALUES(140,'','','','','','','','','','','false','','69','');
INSERT INTO "contacts" VALUES(141,'','','','','','','','','','','false','','7','');
INSERT INTO "contacts" VALUES(142,'','','','','','','','','','','false','','70','');
INSERT INTO "contacts" VALUES(143,'','','','','','','','','','','false','','71','');
INSERT INTO "contacts" VALUES(144,'','','','','','','','','','','false','','72','');
INSERT INTO "contacts" VALUES(145,'','','','','','','','','','','false','','73','');
INSERT INTO "contacts" VALUES(146,'','','','','','','','','','','false','','74','');
INSERT INTO "contacts" VALUES(147,'','','','','','','','','','','false','','75','');
INSERT INTO "contacts" VALUES(148,'','','','','','','','','','','false','','76','');
INSERT INTO "contacts" VALUES(149,'','','','','','','','','','','false','','77','');
INSERT INTO "contacts" VALUES(150,'','','','','','','','','','','false','','78','');
INSERT INTO "contacts" VALUES(151,'','','','','','','','','','','false','','79','');
INSERT INTO "contacts" VALUES(152,'','','','','','','','','','','false','','8','');
INSERT INTO "contacts" VALUES(153,'','','','','','','','','','','false','','80','');
INSERT INTO "contacts" VALUES(154,'','','','','','','','','','','false','','81','');
INSERT INTO "contacts" VALUES(155,'','','','','','','','','','','false','','82','');
INSERT INTO "contacts" VALUES(156,'','','','','','','','','','','false','','83','');
INSERT INTO "contacts" VALUES(157,'','','','','','','','','','','false','','84','');
INSERT INTO "contacts" VALUES(158,'','','','','','','','','','','false','','85','');
INSERT INTO "contacts" VALUES(159,'','','','','','','','','','','false','','86','');
INSERT INTO "contacts" VALUES(160,'','','','','','','','','','','false','','87','');
INSERT INTO "contacts" VALUES(161,'','','','','','','','','','','false','','88','');
INSERT INTO "contacts" VALUES(162,'','','','','','','','','','','false','','89','');
INSERT INTO "contacts" VALUES(163,'','','','','','','','','','','false','','9','');
INSERT INTO "contacts" VALUES(164,'','','','','','','','','','','false','','90','');
INSERT INTO "contacts" VALUES(165,'','','','','','','','','','','false','','91','');
INSERT INTO "contacts" VALUES(166,'','','','','','','','','','','false','','92','');
INSERT INTO "contacts" VALUES(167,'','','','','','','','','','','false','','93','');
INSERT INTO "contacts" VALUES(168,'','','','','','','','','','','false','','94','');
INSERT INTO "contacts" VALUES(169,'','','','','','','','','','','false','','95','');
INSERT INTO "contacts" VALUES(170,'','','','','','','','','','','false','','96','');
INSERT INTO "contacts" VALUES(171,'','','','','','','','','','','false','','97','');
INSERT INTO "contacts" VALUES(172,'','','','','','','','','','','false','','98','');
INSERT INTO "contacts" VALUES(173,'','','','','','','','','','','false','','99','');
CREATE TABLE household_accounts (
	id INTEGER NOT NULL, 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "household_accounts" VALUES(1,'','HH_Account');
INSERT INTO "household_accounts" VALUES(2,'','HH_Account');
INSERT INTO "household_accounts" VALUES(3,'','HH_Account');
INSERT INTO "household_accounts" VALUES(4,'','HH_Account');
INSERT INTO "household_accounts" VALUES(5,'','HH_Account');
INSERT INTO "household_accounts" VALUES(6,'','HH_Account');
INSERT INTO "household_accounts" VALUES(7,'','HH_Account');
INSERT INTO "household_accounts" VALUES(8,'','HH_Account');
INSERT INTO "household_accounts" VALUES(9,'','HH_Account');
INSERT INTO "household_accounts" VALUES(10,'','HH_Account');
INSERT INTO "household_accounts" VALUES(11,'','HH_Account');
INSERT INTO "household_accounts" VALUES(12,'','HH_Account');
INSERT INTO "household_accounts" VALUES(13,'','HH_Account');
INSERT INTO "household_accounts" VALUES(14,'','HH_Account');
INSERT INTO "household_accounts" VALUES(15,'','HH_Account');
INSERT INTO "household_accounts" VALUES(16,'','HH_Account');
INSERT INTO "household_accounts" VALUES(17,'','HH_Account');
INSERT INTO "household_accounts" VALUES(18,'','HH_Account');
INSERT INTO "household_accounts" VALUES(19,'','HH_Account');
INSERT INTO "household_accounts" VALUES(20,'','HH_Account');
INSERT INTO "household_accounts" VALUES(21,'','HH_Account');
INSERT INTO "household_accounts" VALUES(22,'','HH_Account');
INSERT INTO "household_accounts" VALUES(23,'','HH_Account');
INSERT INTO "household_accounts" VALUES(24,'','HH_Account');
INSERT INTO "household_accounts" VALUES(25,'','HH_Account');
INSERT INTO "household_accounts" VALUES(26,'','HH_Account');
INSERT INTO "household_accounts" VALUES(27,'','HH_Account');
INSERT INTO "household_accounts" VALUES(28,'','HH_Account');
INSERT INTO "household_accounts" VALUES(29,'','HH_Account');
INSERT INTO "household_accounts" VALUES(30,'','HH_Account');
INSERT INTO "household_accounts" VALUES(31,'','HH_Account');
INSERT INTO "household_accounts" VALUES(32,'','HH_Account');
INSERT INTO "household_accounts" VALUES(33,'','HH_Account');
INSERT INTO "household_accounts" VALUES(34,'','HH_Account');
INSERT INTO "household_accounts" VALUES(35,'','HH_Account');
INSERT INTO "household_accounts" VALUES(36,'','HH_Account');
INSERT INTO "household_accounts" VALUES(37,'','HH_Account');
INSERT INTO "household_accounts" VALUES(38,'','HH_Account');
INSERT INTO "household_accounts" VALUES(39,'','HH_Account');
INSERT INTO "household_accounts" VALUES(40,'','HH_Account');
INSERT INTO "household_accounts" VALUES(41,'','HH_Account');
INSERT INTO "household_accounts" VALUES(42,'','HH_Account');
INSERT INTO "household_accounts" VALUES(43,'','HH_Account');
INSERT INTO "household_accounts" VALUES(44,'','HH_Account');
INSERT INTO "household_accounts" VALUES(45,'','HH_Account');
INSERT INTO "household_accounts" VALUES(46,'','HH_Account');
INSERT INTO "household_accounts" VALUES(47,'','HH_Account');
INSERT INTO "household_accounts" VALUES(48,'','HH_Account');
INSERT INTO "household_accounts" VALUES(49,'','HH_Account');
INSERT INTO "household_accounts" VALUES(50,'','HH_Account');
INSERT INTO "household_accounts" VALUES(51,'','HH_Account');
INSERT INTO "household_accounts" VALUES(52,'','HH_Account');
INSERT INTO "household_accounts" VALUES(53,'','HH_Account');
INSERT INTO "household_accounts" VALUES(54,'','HH_Account');
INSERT INTO "household_accounts" VALUES(55,'','HH_Account');
INSERT INTO "household_accounts" VALUES(56,'','HH_Account');
INSERT INTO "household_accounts" VALUES(57,'','HH_Account');
INSERT INTO "household_accounts" VALUES(58,'','HH_Account');
INSERT INTO "household_accounts" VALUES(59,'','HH_Account');
INSERT INTO "household_accounts" VALUES(60,'','HH_Account');
INSERT INTO "household_accounts" VALUES(61,'','HH_Account');
INSERT INTO "household_accounts" VALUES(62,'','HH_Account');
INSERT INTO "household_accounts" VALUES(63,'','HH_Account');
INSERT INTO "household_accounts" VALUES(64,'','HH_Account');
INSERT INTO "household_accounts" VALUES(65,'','HH_Account');
INSERT INTO "household_accounts" VALUES(66,'','HH_Account');
INSERT INTO "household_accounts" VALUES(67,'','HH_Account');
INSERT INTO "household_accounts" VALUES(68,'','HH_Account');
INSERT INTO "household_accounts" VALUES(69,'','HH_Account');
INSERT INTO "household_accounts" VALUES(70,'','HH_Account');
INSERT INTO "household_accounts" VALUES(71,'','HH_Account');
INSERT INTO "household_accounts" VALUES(72,'','HH_Account');
INSERT INTO "household_accounts" VALUES(73,'','HH_Account');
INSERT INTO "household_accounts" VALUES(74,'','HH_Account');
INSERT INTO "household_accounts" VALUES(75,'','HH_Account');
INSERT INTO "household_accounts" VALUES(76,'','HH_Account');
INSERT INTO "household_accounts" VALUES(77,'','HH_Account');
INSERT INTO "household_accounts" VALUES(78,'','HH_Account');
INSERT INTO "household_accounts" VALUES(79,'','HH_Account');
INSERT INTO "household_accounts" VALUES(80,'','HH_Account');
INSERT INTO "household_accounts" VALUES(81,'','HH_Account');
INSERT INTO "household_accounts" VALUES(82,'','HH_Account');
INSERT INTO "household_accounts" VALUES(83,'','HH_Account');
INSERT INTO "household_accounts" VALUES(84,'','HH_Account');
INSERT INTO "household_accounts" VALUES(85,'','HH_Account');
INSERT INTO "household_accounts" VALUES(86,'','HH_Account');
INSERT INTO "household_accounts" VALUES(87,'','HH_Account');
INSERT INTO "household_accounts" VALUES(88,'','HH_Account');
INSERT INTO "household_accounts" VALUES(89,'','HH_Account');
INSERT INTO "household_accounts" VALUES(90,'','HH_Account');
INSERT INTO "household_accounts" VALUES(91,'','HH_Account');
INSERT INTO "household_accounts" VALUES(92,'','HH_Account');
INSERT INTO "household_accounts" VALUES(93,'','HH_Account');
INSERT INTO "household_accounts" VALUES(94,'','HH_Account');
INSERT INTO "household_accounts" VALUES(95,'','HH_Account');
INSERT INTO "household_accounts" VALUES(96,'','HH_Account');
INSERT INTO "household_accounts" VALUES(97,'','HH_Account');
INSERT INTO "household_accounts" VALUES(98,'','HH_Account');
INSERT INTO "household_accounts" VALUES(99,'','HH_Account');
INSERT INTO "household_accounts" VALUES(100,'','HH_Account');
INSERT INTO "household_accounts" VALUES(101,'','HH_Account');
INSERT INTO "household_accounts" VALUES(102,'','HH_Account');
INSERT INTO "household_accounts" VALUES(103,'','HH_Account');
INSERT INTO "household_accounts" VALUES(104,'','HH_Account');
INSERT INTO "household_accounts" VALUES(105,'','HH_Account');
INSERT INTO "household_accounts" VALUES(106,'','HH_Account');
INSERT INTO "household_accounts" VALUES(107,'','HH_Account');
INSERT INTO "household_accounts" VALUES(108,'','HH_Account');
INSERT INTO "household_accounts" VALUES(109,'','HH_Account');
INSERT INTO "household_accounts" VALUES(110,'','HH_Account');
INSERT INTO "household_accounts" VALUES(111,'','HH_Account');
INSERT INTO "household_accounts" VALUES(112,'','HH_Account');
INSERT INTO "household_accounts" VALUES(113,'','HH_Account');
INSERT INTO "household_accounts" VALUES(114,'','HH_Account');
INSERT INTO "household_accounts" VALUES(115,'','HH_Account');
INSERT INTO "household_accounts" VALUES(116,'','HH_Account');
INSERT INTO "household_accounts" VALUES(117,'','HH_Account');
INSERT INTO "household_accounts" VALUES(118,'','HH_Account');
INSERT INTO "household_accounts" VALUES(119,'','HH_Account');
INSERT INTO "household_accounts" VALUES(120,'','HH_Account');
INSERT INTO "household_accounts" VALUES(121,'','HH_Account');
INSERT INTO "household_accounts" VALUES(122,'','HH_Account');
INSERT INTO "household_accounts" VALUES(123,'','HH_Account');
INSERT INTO "household_accounts" VALUES(124,'','HH_Account');
INSERT INTO "household_accounts" VALUES(125,'','HH_Account');
INSERT INTO "household_accounts" VALUES(126,'','HH_Account');
INSERT INTO "household_accounts" VALUES(127,'','HH_Account');
INSERT INTO "household_accounts" VALUES(128,'','HH_Account');
INSERT INTO "household_accounts" VALUES(129,'','HH_Account');
INSERT INTO "household_accounts" VALUES(130,'','HH_Account');
INSERT INTO "household_accounts" VALUES(131,'','HH_Account');
INSERT INTO "household_accounts" VALUES(132,'','HH_Account');
INSERT INTO "household_accounts" VALUES(133,'','HH_Account');
INSERT INTO "household_accounts" VALUES(134,'','HH_Account');
INSERT INTO "household_accounts" VALUES(135,'','HH_Account');
INSERT INTO "household_accounts" VALUES(136,'','HH_Account');
INSERT INTO "household_accounts" VALUES(137,'','HH_Account');
INSERT INTO "household_accounts" VALUES(138,'','HH_Account');
INSERT INTO "household_accounts" VALUES(139,'','HH_Account');
INSERT INTO "household_accounts" VALUES(140,'','HH_Account');
INSERT INTO "household_accounts" VALUES(141,'','HH_Account');
INSERT INTO "household_accounts" VALUES(142,'','HH_Account');
INSERT INTO "household_accounts" VALUES(143,'','HH_Account');
INSERT INTO "household_accounts" VALUES(144,'','HH_Account');
INSERT INTO "household_accounts" VALUES(145,'','HH_Account');
INSERT INTO "household_accounts" VALUES(146,'','HH_Account');
INSERT INTO "household_accounts" VALUES(147,'','HH_Account');
INSERT INTO "household_accounts" VALUES(148,'','HH_Account');
INSERT INTO "household_accounts" VALUES(149,'','HH_Account');
INSERT INTO "household_accounts" VALUES(150,'','HH_Account');
INSERT INTO "household_accounts" VALUES(151,'','HH_Account');
INSERT INTO "household_accounts" VALUES(152,'','HH_Account');
INSERT INTO "household_accounts" VALUES(153,'','HH_Account');
INSERT INTO "household_accounts" VALUES(154,'','HH_Account');
INSERT INTO "household_accounts" VALUES(155,'','HH_Account');
INSERT INTO "household_accounts" VALUES(156,'','HH_Account');
INSERT INTO "household_accounts" VALUES(157,'','HH_Account');
INSERT INTO "household_accounts" VALUES(158,'','HH_Account');
INSERT INTO "household_accounts" VALUES(159,'','HH_Account');
INSERT INTO "household_accounts" VALUES(160,'','HH_Account');
INSERT INTO "household_accounts" VALUES(161,'','HH_Account');
INSERT INTO "household_accounts" VALUES(162,'','HH_Account');
INSERT INTO "household_accounts" VALUES(163,'','HH_Account');
INSERT INTO "household_accounts" VALUES(164,'','HH_Account');
INSERT INTO "household_accounts" VALUES(165,'','HH_Account');
CREATE TABLE organization_accounts (
	id INTEGER NOT NULL, 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "organization_accounts" VALUES(1,'','Organization');
INSERT INTO "organization_accounts" VALUES(2,'','Organization');
INSERT INTO "organization_accounts" VALUES(3,'','Organization');
COMMIT;
