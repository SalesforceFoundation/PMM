BEGIN TRANSACTION;
CREATE TABLE caseman__action_item_templates (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__action_item_templates" VALUES(1,'Pass an age appropriate reading proficiency exam');
INSERT INTO "caseman__action_item_templates" VALUES(2,'Pass basic financial literacy course');
INSERT INTO "caseman__action_item_templates" VALUES(3,'Complete online job applications to at least 3 appropriate job openings');
INSERT INTO "caseman__action_item_templates" VALUES(4,'Month 3: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(5,'Month 4: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(6,'Month 5: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(7,'Get a job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES(8,'Complete resume workshop');
INSERT INTO "caseman__action_item_templates" VALUES(9,'Complete interview workshop');
INSERT INTO "caseman__action_item_templates" VALUES(10,'Pass mock interview');
INSERT INTO "caseman__action_item_templates" VALUES(11,'Update resume');
INSERT INTO "caseman__action_item_templates" VALUES(12,'Maintain 2 years active engagement in workforce');
INSERT INTO "caseman__action_item_templates" VALUES(13,'Meet job requirement standards');
INSERT INTO "caseman__action_item_templates" VALUES(14,'Complete Stability Assessment');
INSERT INTO "caseman__action_item_templates" VALUES(15,'Month 6: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(16,'Month 2: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(17,'Month 1: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(18,'Get an job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES(19,'Open a bank account');
INSERT INTO "caseman__action_item_templates" VALUES(20,'Meet with legal assistance advisor');
INSERT INTO "caseman__action_item_templates" VALUES(21,'Read and interpret a banking account statement');
INSERT INTO "caseman__action_item_templates" VALUES(22,'Month 2: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(23,'Month 1: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES(24,'Month 3: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(25,'Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__action_item_templates" VALUES(26,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES(27,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES(28,'Pass English proficiency exam with a score of 65 or above');
INSERT INTO "caseman__action_item_templates" VALUES(29,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES(30,'Month 4: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(31,'Month 4: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(32,'Month 1: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(33,'Month 5: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(34,'Month 5: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(35,'Month 3: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(36,'Month 6: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(37,'Month 6: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(38,'Month 2: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(39,'Open a Savings Account');
INSERT INTO "caseman__action_item_templates" VALUES(40,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES(41,'Complete Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(42,'Meet with Financial Advisor');
INSERT INTO "caseman__action_item_templates" VALUES(43,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES(44,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES(45,'Get a passing grade in Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(46,'Register for Financial Literacy Course');
CREATE TABLE caseman__action_items (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"DueDate__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__action_items" VALUES(1,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','0030x00000b3I98AAE',2,19,1);
INSERT INTO "caseman__action_items" VALUES(2,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','0030x00000b3I9DAAU',3,20,16);
INSERT INTO "caseman__action_items" VALUES(3,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','0030x00000b3I9DAAU',3,20,17);
INSERT INTO "caseman__action_items" VALUES(4,'Open a bank account','Completed','2019-09-06','0030x00000b3I9DAAU',3,20,19);
INSERT INTO "caseman__action_items" VALUES(5,'Read and interpret a banking account statement','Not Started','2019-09-30','0030x00000b3I9DAAU',3,20,21);
INSERT INTO "caseman__action_items" VALUES(6,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','0030x00000b3I9DAAU',3,20,24);
INSERT INTO "caseman__action_items" VALUES(7,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','0030x00000b3I9DAAU',3,20,30);
INSERT INTO "caseman__action_items" VALUES(8,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','0030x00000b3I9DAAU',3,20,31);
INSERT INTO "caseman__action_items" VALUES(9,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','0030x00000b3I9DAAU',3,20,32);
INSERT INTO "caseman__action_items" VALUES(10,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','0030x00000b3I9DAAU',3,20,33);
INSERT INTO "caseman__action_items" VALUES(11,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','0030x00000b3I9DAAU',3,20,35);
INSERT INTO "caseman__action_items" VALUES(12,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','0030x00000b3I9DAAU',3,20,36);
INSERT INTO "caseman__action_items" VALUES(13,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','0030x00000b3I9DAAU',3,20,37);
INSERT INTO "caseman__action_items" VALUES(14,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','0030x00000b3I9DAAU',3,20,38);
INSERT INTO "caseman__action_items" VALUES(15,'Pass basic financial literacy course','In Progress','2019-09-30','0030x00000b3I9DAAU',3,20,2);
INSERT INTO "caseman__action_items" VALUES(16,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','0030x00000b3I9DAAU',3,21,15);
INSERT INTO "caseman__action_items" VALUES(17,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','0030x00000b3I9DAAU',3,21,22);
INSERT INTO "caseman__action_items" VALUES(18,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','0030x00000b3I9DAAU',3,21,23);
INSERT INTO "caseman__action_items" VALUES(19,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','0030x00000b3I9DAAU',3,21,4);
INSERT INTO "caseman__action_items" VALUES(20,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','0030x00000b3I9DAAU',3,21,5);
INSERT INTO "caseman__action_items" VALUES(21,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','0030x00000b3I9DAAU',3,21,6);
INSERT INTO "caseman__action_items" VALUES(22,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','0030x00000b3I9DAAU',3,1,3);
INSERT INTO "caseman__action_items" VALUES(23,'Get a job readiness coach','Completed','2019-09-05','0030x00000b3I9DAAU',3,1,7);
INSERT INTO "caseman__action_items" VALUES(24,'Complete resume workshop','Not Started','2019-10-11','0030x00000b3I9DAAU',3,1,8);
INSERT INTO "caseman__action_items" VALUES(25,'Complete interview workshop','Not Started','2019-11-04','0030x00000b3I9DAAU',3,1,9);
INSERT INTO "caseman__action_items" VALUES(26,'Pass mock interview','Not Started','2019-11-06','0030x00000b3I9DAAU',3,1,10);
INSERT INTO "caseman__action_items" VALUES(27,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','0030x00000b3I9DAAU',3,20,34);
INSERT INTO "caseman__action_items" VALUES(28,'Update resume','Not Started','2019-10-25','0030x00000b3I9DAAU',3,1,11);
INSERT INTO "caseman__action_items" VALUES(29,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','0030x00000b3I9DAAU',3,6,12);
INSERT INTO "caseman__action_items" VALUES(30,'Meet job requirement standards','Not Started','2020-04-15','0030x00000b3I9DAAU',3,6,13);
INSERT INTO "caseman__action_items" VALUES(31,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','0030x00000b3I9EAAU',4,7,16);
INSERT INTO "caseman__action_items" VALUES(32,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','0030x00000b3I9EAAU',4,7,17);
INSERT INTO "caseman__action_items" VALUES(33,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','0030x00000b3I9EAAU',4,7,24);
INSERT INTO "caseman__action_items" VALUES(34,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','0030x00000b3I9EAAU',4,7,32);
INSERT INTO "caseman__action_items" VALUES(35,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','0030x00000b3I9EAAU',4,7,35);
INSERT INTO "caseman__action_items" VALUES(36,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','0030x00000b3I9EAAU',4,7,38);
INSERT INTO "caseman__action_items" VALUES(37,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','0030x00000b3I9EAAU',4,8,15);
INSERT INTO "caseman__action_items" VALUES(38,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','0030x00000b3I9EAAU',4,8,22);
INSERT INTO "caseman__action_items" VALUES(39,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','0030x00000b3I9EAAU',4,8,23);
INSERT INTO "caseman__action_items" VALUES(40,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','0030x00000b3I9EAAU',4,8,4);
INSERT INTO "caseman__action_items" VALUES(41,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','0030x00000b3I9EAAU',4,8,5);
INSERT INTO "caseman__action_items" VALUES(42,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','0030x00000b3I9EAAU',4,8,6);
INSERT INTO "caseman__action_items" VALUES(43,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','0030x00000b3I9EAAU',4,9,3);
INSERT INTO "caseman__action_items" VALUES(44,'Get a job readiness coach','Completed','2019-09-05','0030x00000b3I9EAAU',4,9,7);
INSERT INTO "caseman__action_items" VALUES(45,'Complete resume workshop','Not Started','2019-09-27','0030x00000b3I9EAAU',4,9,8);
INSERT INTO "caseman__action_items" VALUES(46,'Complete interview workshop','Not Started','2019-10-20','0030x00000b3I9EAAU',4,9,9);
INSERT INTO "caseman__action_items" VALUES(47,'Pass mock interview','Not Started','2019-10-31','0030x00000b3I9EAAU',4,9,10);
INSERT INTO "caseman__action_items" VALUES(48,'Update resume','Not Started','2019-10-09','0030x00000b3I9EAAU',4,9,11);
INSERT INTO "caseman__action_items" VALUES(49,'Participate in a 12-step program','In Progress','2019-12-31','0030x00000b3I9EAAU',5,13,25);
INSERT INTO "caseman__action_items" VALUES(50,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','0030x00000b3I9IAAU',6,14,26);
INSERT INTO "caseman__action_items" VALUES(51,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','0030x00000b3I9IAAU',6,14,27);
INSERT INTO "caseman__action_items" VALUES(52,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','0030x00000b3I9IAAU',6,14,29);
INSERT INTO "caseman__action_items" VALUES(53,'Open a Savings Account','Completed','2019-09-09','0030x00000b3I9IAAU',6,14,39);
INSERT INTO "caseman__action_items" VALUES(54,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','0030x00000b3I9IAAU',6,14,2);
INSERT INTO "caseman__action_items" VALUES(55,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','0030x00000b3I9RAAU',7,16,28);
CREATE TABLE caseman__appointment_attendees (
	sf_id VARCHAR(255) NOT NULL, 
	reason__c VARCHAR(255), 
	role__c VARCHAR(255), 
	status__c VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__appointment_attendees" VALUES(1,'Client','Attendee','Attending',2,'0030x00000b3I9AAAU');
INSERT INTO "caseman__appointment_attendees" VALUES(2,'Check in on Jason''s progress with Workplace Readiness.','Attendee','New',3,'0030x00000b3I9IAAU');
INSERT INTO "caseman__appointment_attendees" VALUES(3,'','Attendee','New',4,'0030x00000b3I9RAAU');
CREATE TABLE caseman__appointments (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	type__c VARCHAR(255), 
	location__c VARCHAR(255), 
	startdatetime__c VARCHAR(255), 
	enddatetime__c VARCHAR(255), 
	description__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__appointments" VALUES(1,'Math Appointment','Scheduled','Corner Office','2022-01-26T16:00:00.000Z','2022-01-26T17:00:00.000Z','We should talk about your grades');
INSERT INTO "caseman__appointments" VALUES(2,'Program Evaluation','Scheduled','AC-1223','2022-01-26T16:00:00.000Z','2022-01-26T17:00:00.000Z','Initial program evaluation');
INSERT INTO "caseman__appointments" VALUES(3,'Check-in with Jason Barnes','Scheduled','127th STreet Community Center, Meeting Room 2-B','2021-09-22T20:00:00.000Z','2021-09-22T21:00:00.000Z','Check-in on Jason''s progress with Workplace Readiness');
INSERT INTO "caseman__appointments" VALUES(4,'Barbara Johnson English Tutor','Scheduled','127th Street Community Center Meeting Room A','2021-08-13T01:00:00.000Z','2021-08-13T02:00:00.000Z','Discuss getting Barbara a tutor to improve her conversational confidence');
CREATE TABLE caseman__assessments (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	assessmentcompleteddate__c VARCHAR(255), 
	comments__c VARCHAR(255), 
	totalscore__c VARCHAR(255), 
	financialstabilityscore__c VARCHAR(255), 
	jobreadinessscore__c VARCHAR(255), 
	client__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__assessments" VALUES(1,'Arlene Baker-9/19','2019-09-16','Arlene has been out of the active workforce for more than one year','75.0','75.0','70.0','0030x00000b3I9DAAU');
INSERT INTO "caseman__assessments" VALUES(2,'Arlene Baker-11/19','2019-11-15','Arlene''s financial stability score declined due to a rent increase. She is revising her budget.','80.0','73.0','85.0','0030x00000b3I9DAAU');
INSERT INTO "caseman__assessments" VALUES(3,'Robin Banks 12/19','2019-12-01','Robin has shown diligence in the resume and interview workshops.','85.0','80.0','83.0','0030x00000b3I9EAAU');
INSERT INTO "caseman__assessments" VALUES(4,'Arlene Baker-1/20','2020-01-15','Arlene has shown resilience and ability to adapt to adverse circumstances.','90.0','80.0','88.0','0030x00000b3I9DAAU');
INSERT INTO "caseman__assessments" VALUES(5,'Robin Banks-10/19','2019-10-01','','75.0','70.0','75.0','0030x00000b3I9EAAU');
INSERT INTO "caseman__assessments" VALUES(6,'Robin Banks-11/19','2019-11-01','Robin is settling into her case plan more easily than I expected.','80.0','75.0','80.0','0030x00000b3I9EAAU');
INSERT INTO "caseman__assessments" VALUES(7,'Robin Banks 1/20','2020-01-03','Note that some of Robin''s financial stability score reflects her partner''s job','85.0','80.0','85.0','0030x00000b3I9EAAU');
INSERT INTO "caseman__assessments" VALUES(8,'Arlene Baker-10/19','2019-10-15','Arlene is very diligent with her case plan','76.0','76.0','75.0','0030x00000b3I9DAAU');
INSERT INTO "caseman__assessments" VALUES(9,'ESL - July 2019','2019-07-01','ESL July 2019 Assessment','63.24','','','0030x00000b3I9RAAU');
INSERT INTO "caseman__assessments" VALUES(10,'ESL - August 2019','2019-08-01','ESL August Assessment Score','68.5','','','0030x00000b3I9RAAU');
INSERT INTO "caseman__assessments" VALUES(11,'ESL - September 2019','2019-09-01','ESL September Assessment Score','70.25','','','0030x00000b3I9RAAU');
INSERT INTO "caseman__assessments" VALUES(12,'ESL - June 2019','2019-06-01','Entry level score in ESL program','51.5','','','0030x00000b3I9RAAU');
INSERT INTO "caseman__assessments" VALUES(13,'ESL - October 2019','2019-10-01','ESL October Assessment Score','74.55','','','0030x00000b3I9RAAU');
INSERT INTO "caseman__assessments" VALUES(14,'ESL - November 2019','2019-11-01','ESL November Assessment Score','77.43','','','0030x00000b3I9RAAU');
CREATE TABLE caseman__branch_accounts (
	sf_id VARCHAR(255) NOT NULL, 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__branch_accounts" VALUES('0010x00000mnm46AAA','127th Street Community Center','','','','','','','555-398-2090','','','','','','','1500.0','Branch');
CREATE TABLE caseman__branch_contacts (
	sf_id VARCHAR(255) NOT NULL, 
	"Roles" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	account_id VARCHAR(255), 
	contact_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd0AAA','','true','0010x00000mnm5mAAA','0030x00000b3I98AAE');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd1AAA','','true','0010x00000mnm5mAAA','0030x00000b3I99AAE');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd2AAA','','true','0010x00000mnm5nAAA','0030x00000b3I9AAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd3AAA','','true','0010x00000mnm5nAAA','0030x00000b3I9BAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd4AAA','','true','0010x00000mnm5oAAA','0030x00000b3I9CAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd5AAA','','true','0010x00000mnm5oAAA','0030x00000b3I9DAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd6AAA','','true','0010x00000mnm5pAAA','0030x00000b3I9EAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd7AAA','','true','0010x00000mnm5pAAA','0030x00000b3I9FAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd8AAA','','true','0010x00000mnm5qAAA','0030x00000b3I9GAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpd9AAA','','true','0010x00000mnm5qAAA','0030x00000b3I9HAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdAAAQ','','true','0010x00000mnm5qAAA','0030x00000b3I9IAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdBAAQ','','true','0010x00000mnm5rAAA','0030x00000b3I9JAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdCAAQ','','true','0010x00000mnm5sAAA','0030x00000b3I9KAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdDAAQ','','true','0010x00000mnm5uAAA','0030x00000b3I9LAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdEAAQ','','true','0010x00000mnm5vAAA','0030x00000b3I9MAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdFAAQ','','true','0010x00000mnm5wAAA','0030x00000b3I9NAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdGAAQ','','true','0010x00000mnm5xAAA','0030x00000b3I9OAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdHAAQ','','true','0010x00000mnm5yAAA','0030x00000b3I9PAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdIAAQ','','true','0010x00000mnm5yAAA','0030x00000b3I9QAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdJAAQ','','true','0010x00000mnm5yAAA','0030x00000b3I9RAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdWAAQ','Other','true','0010x00000mnm46AAA','0030x00000b3I9AAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdXAAQ','','true','0010x00000mnm46AAA','0030x00000b3I9BAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdYAAQ','Client','true','0010x00000mnm46AAA','0030x00000b3I9DAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdZAAQ','Client','true','0010x00000mnm46AAA','0030x00000b3I9EAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdaAAA','Client','true','0010x00000mnm46AAA','0030x00000b3I9IAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdbAAA','','true','0010x00000mnm46AAA','0030x00000b3I9JAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdcAAA','','true','0010x00000mnm46AAA','0030x00000b3I9KAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpddAAA','Client','true','0010x00000mnm46AAA','0030x00000b3I9LAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdeAAA','','true','0010x00000mnm46AAA','0030x00000b3I9MAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdfAAA','','true','0010x00000mnm46AAA','0030x00000b3I9NAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdgAAA','Client','true','0010x00000mnm46AAA','0030x00000b3I9OAAU');
INSERT INTO "caseman__branch_contacts" VALUES('07k0x00000ajpdhAAA','Client','true','0010x00000mnm46AAA','0030x00000b3I9RAAU');
CREATE TABLE caseman__case_plans (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	status__c VARCHAR(255), 
	abandoneddate__c VARCHAR(255), 
	completeddate__c VARCHAR(255), 
	inprogressdate__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__case_plans" VALUES(1,'Socialization Case Plan - Tom Higgins','','','','','0030x00000b3I98AAE');
INSERT INTO "caseman__case_plans" VALUES(2,'Reading Case Plan - Tom Higgins','','','','2019-10-01','0030x00000b3I98AAE');
INSERT INTO "caseman__case_plans" VALUES(3,'Arlene Baker''s Workforce Re-entry Case Plan','','','','2019-11-01','0030x00000b3I9DAAU');
INSERT INTO "caseman__case_plans" VALUES(4,'Robin Banks'' Job Readiness Case Plan','','','','2019-11-05','0030x00000b3I9EAAU');
INSERT INTO "caseman__case_plans" VALUES(5,'Robin Banks'' Sobriety Case Plan','','','','','0030x00000b3I9EAAU');
INSERT INTO "caseman__case_plans" VALUES(6,'Financial Literacy Case Plan - Jason Barnes','','','','2019-11-04','0030x00000b3I9IAAU');
INSERT INTO "caseman__case_plans" VALUES(7,'English proficiency case plan - Barbara Johnson','','','','','0030x00000b3I9RAAU');
CREATE TABLE caseman__client_alerts (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_alerts" VALUES(1,'Tom has anger issues','true','','0030x00000b3I98AAE');
INSERT INTO "caseman__client_alerts" VALUES(2,'Tom''s sister passed away recently (very emotional)','true','','0030x00000b3I98AAE');
INSERT INTO "caseman__client_alerts" VALUES(3,'Robin was recently released from rehab','true','','0030x00000b3I9EAAU');
CREATE TABLE caseman__client_cases (
	sf_id VARCHAR(255) NOT NULL, 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_cases" VALUES(1,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','0030x00000b3I98AAE','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(2,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','0030x00000b3I98AAE','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(3,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','0030x00000b3I98AAE','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(4,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','0030x00000b3I98AAE','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(5,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','0030x00000b3I9DAAU','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(6,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','0030x00000b3I9EAAU','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(7,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','0030x00000b3I9IAAU','ClientCase');
INSERT INTO "caseman__client_cases" VALUES(8,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','0030x00000b3I9RAAU','ClientCase');
CREATE TABLE caseman__client_note_relationships (
	sf_id VARCHAR(255) NOT NULL, 
	"RelatedId__c" VARCHAR(255), 
	"RelatedName__c" VARCHAR(255), 
	"RelatedObject__c" VARCHAR(255), 
	case__c VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_note_relationships" VALUES(1,'500540000032nuJAAQ','00001008','Case',6,3,'');
INSERT INTO "caseman__client_note_relationships" VALUES(2,'500540000032nuKAAQ','00001009','Case',7,4,'');
INSERT INTO "caseman__client_note_relationships" VALUES(3,'500540000032nuLAAQ','00001010','Case',8,5,'');
CREATE TABLE caseman__client_notes (
	sf_id VARCHAR(255) NOT NULL, 
	content__c VARCHAR(255), 
	subject__c VARCHAR(255), 
	status__c VARCHAR(255), 
	interactiondate__c VARCHAR(255), 
	draft__c VARCHAR(255), 
	minutes_spent_with_client__c VARCHAR(255), 
	client__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_notes" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','0030x00000b3I98AAE');
INSERT INTO "caseman__client_notes" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','0030x00000b3I98AAE');
INSERT INTO "caseman__client_notes" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','0030x00000b3I9EAAU');
INSERT INTO "caseman__client_notes" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','0030x00000b3I9IAAU');
INSERT INTO "caseman__client_notes" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','0030x00000b3I9RAAU');

CREATE TABLE contacts (
	sf_id VARCHAR(255) NOT NULL, 
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
	"Gender__c" VARCHAR(255), 
	"PhotoFileID__c" VARCHAR(255), 
	"PreferredCommunicationMethod__c" VARCHAR(255), 
	"LegalName__c" VARCHAR(255), 
	"PreferredPhoneField__c" VARCHAR(255), 
	"PreferredPhoneNumber__c" VARCHAR(255), 
	"Pronouns__c" VARCHAR(255), 
	"Roles__c" VARCHAR(255), 
	"WatchList__c" VARCHAR(255), 
	"WatchListDate__c" VARCHAR(255), 
	"npe01__SystemAccountProcessor__c" VARCHAR(255), 
	"npe01__AlternateEmail__c" VARCHAR(255), 
	"npe01__HomeEmail__c" VARCHAR(255), 
	"npe01__Preferred_Email__c" VARCHAR(255), 
	"npe01__PreferredPhone__c" VARCHAR(255), 
	"npe01__Primary_Address_Type__c" VARCHAR(255), 
	"npe01__Private__c" VARCHAR(255), 
	"npe01__Secondary_Address_Type__c" VARCHAR(255), 
	"npe01__WorkEmail__c" VARCHAR(255), 
	"npe01__WorkPhone__c" VARCHAR(255), 
	"npo02__AverageAmount__c" VARCHAR(255), 
	"npo02__Best_Gift_Year__c" VARCHAR(255), 
	"npo02__Best_Gift_Year_Total__c" VARCHAR(255), 
	"npo02__FirstCloseDate__c" VARCHAR(255), 
	"npo02__Household__c" VARCHAR(255), 
	"npo02__Household_Naming_Order__c" VARCHAR(255), 
	"npo02__LargestAmount__c" VARCHAR(255), 
	"npo02__LastCloseDate__c" VARCHAR(255), 
	"npo02__LastMembershipAmount__c" VARCHAR(255), 
	"npo02__LastMembershipDate__c" VARCHAR(255), 
	"npo02__LastMembershipLevel__c" VARCHAR(255), 
	"npo02__LastMembershipOrigin__c" VARCHAR(255), 
	"npo02__LastOppAmount__c" VARCHAR(255), 
	"npo02__MembershipEndDate__c" VARCHAR(255), 
	"npo02__MembershipJoinDate__c" VARCHAR(255), 
	"npo02__Naming_Exclusions__c" VARCHAR(255), 
	"npo02__NumberOfClosedOpps__c" VARCHAR(255), 
	"npo02__NumberOfMembershipOpps__c" VARCHAR(255), 
	"npo02__OppAmount2YearsAgo__c" VARCHAR(255), 
	"npo02__OppAmountLastNDays__c" VARCHAR(255), 
	"npo02__OppAmountLastYear__c" VARCHAR(255), 
	"npo02__OppAmountThisYear__c" VARCHAR(255), 
	"npo02__OppsClosed2YearsAgo__c" VARCHAR(255), 
	"npo02__OppsClosedLastNDays__c" VARCHAR(255), 
	"npo02__OppsClosedLastYear__c" VARCHAR(255), 
	"npo02__OppsClosedThisYear__c" VARCHAR(255), 
	"npo02__SmallestAmount__c" VARCHAR(255), 
	"npo02__Soft_Credit_Last_Year__c" VARCHAR(255), 
	"npo02__Soft_Credit_This_Year__c" VARCHAR(255), 
	"npo02__Soft_Credit_Total__c" VARCHAR(255), 
	"npo02__Soft_Credit_Two_Years_Ago__c" VARCHAR(255), 
	"npo02__SystemHouseholdProcessor__c" VARCHAR(255), 
	"npo02__TotalMembershipOppAmount__c" VARCHAR(255), 
	"npo02__TotalOppAmount__c" VARCHAR(255), 
	"npsp__Deceased__c" VARCHAR(255), 
	"npsp__Do_Not_Contact__c" VARCHAR(255), 
	"npsp__Exclude_from_Household_Formal_Greeting__c" VARCHAR(255), 
	"npsp__Exclude_from_Household_Informal_Greeting__c" VARCHAR(255), 
	"npsp__Exclude_from_Household_Name__c" VARCHAR(255), 
	"npsp__First_Soft_Credit_Amount__c" VARCHAR(255), 
	"npsp__First_Soft_Credit_Date__c" VARCHAR(255), 
	"npsp__is_Address_Override__c" VARCHAR(255), 
	"npsp__Largest_Soft_Credit_Amount__c" VARCHAR(255), 
	"npsp__Largest_Soft_Credit_Date__c" VARCHAR(255), 
	"npsp__Last_Soft_Credit_Amount__c" VARCHAR(255), 
	"npsp__Last_Soft_Credit_Date__c" VARCHAR(255), 
	"npsp__Number_of_Soft_Credits__c" VARCHAR(255), 
	"npsp__Number_of_Soft_Credits_Last_N_Days__c" VARCHAR(255), 
	"npsp__Number_of_Soft_Credits_Last_Year__c" VARCHAR(255), 
	"npsp__Number_of_Soft_Credits_This_Year__c" VARCHAR(255), 
	"npsp__Number_of_Soft_Credits_Two_Years_Ago__c" VARCHAR(255), 
	"npsp__Soft_Credit_Last_N_Days__c" VARCHAR(255), 
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "contacts" VALUES('0030x00000b3I98AAE','','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','Child','','Mother','Male','0680x0000029NflAAE','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-12-16','','','thiggins@example.com','Personal','Home','Home','false','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','true','true','false','','','false','','','','','','','','','','0.0','0010x00000mnm5mAAA','0030x00000b3I99AAE');
INSERT INTO "contacts" VALUES('0030x00000b3I99AAE','','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','','','','','','','','','','','','false','','','','lhiggins@example.com','Personal','Home','Home','false','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5mAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9AAAU','Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','','she/her/hers','Client;Donor;Volunteer','false','','','','angelaadams@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5nAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9BAAU','Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','Call','','Phone','555-648-7204','he/him/his','Client','false','','','','jeremyadams@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5nAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9CAAU','','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','','','','','','','','','','','','false','','','','','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5oAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9DAAU','','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','Adult','','Friend','','0680x0000029NfuAAE','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','','','alanbaker@example.com','Personal','Home','Home','false','','','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','','500.0','500.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5oAAA','0030x00000b3I9AAAU');
INSERT INTO "contacts" VALUES('0030x00000b3I9EAAU','','Robin','Banks','robinbanks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','Adult','','Partner','','0680x0000029Ng9AAE','','','','','she/her/hers','Client','true','2019-12-16','','','robinbanks@example.com','Personal','Home','Home','false','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5pAAA','0030x00000b3I9FAAU');
INSERT INTO "contacts" VALUES('0030x00000b3I9FAAU','','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','','','','','','','','','','','','false','','','','darrylgraham@example.com','Personal','Home','Home','false','','','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','0.0','400.0','0.0','1.0','0.0','1.0','400.0','','','','','','400.0','400.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5pAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9GAAU','','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','','false','','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','','500.0','500.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5qAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9HAAU','','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','','false','','','','davidbarnes@example.com','Personal','Home','Home','false','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','','0.0','0.0','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','0010x00000mnm5qAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9IAAU','','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','Youth','88841515','Mother','Male','0680x0000029NfzAAE','','','','','he/him/his','Client','false','','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','','0.0','0.0','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','0010x00000mnm5qAAA','0030x00000b3I9GAAU');
INSERT INTO "contacts" VALUES('0030x00000b3I9JAAU','Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','Adult','','Friend','Female','','','','','','she/her/hers','Client','false','','','','anneboyd@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5rAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9KAAU','','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','Senior','','Friend','Non-binary','','','','','','they/them/theirs','Client','false','','','','normaburke@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5sAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9LAAU','','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','Adult','','Friend','Male','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-12-16','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5uAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9MAAU','','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','Adult','','Friend','','','','','','','they/them/theirs','Client','false','','','','anthonyhill@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5vAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9NAAU','Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','Adult','','Friend','','','','','','','she/her/hers','Client;Donor','false','','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5wAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9OAAU','','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','','he/him/his','Donor','false','','','','josejenkins@example.com','Personal','Home','Home','false','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5xAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9PAAU','','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','','false','','','','craigjohnso@example.com','Personal','Home','Home','false','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5yAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9QAAU','','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','','false','','','','','Personal','Home','Home','false','','','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','true','true','true','','','false','','','','','','','','','','0.0','0010x00000mnm5yAAA','');
INSERT INTO "contacts" VALUES('0030x00000b3I9RAAU','','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','','Adult','','Husband','','0680x0000029Ng4AAE','','','','','she/her/hers','Client','false','','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','0010x00000mnm5yAAA','0030x00000b3I9PAAU');
INSERT INTO "contacts" VALUES('0030x00000ayF4dAAE','','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-11-22','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','','false','','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','0.0','','0.0','','','','0.0','','0.0','','','','','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','0.0','0.0','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0010x00000mrs3tAAA','');














CREATE TABLE caseman__goal_action_item_templates (
	sf_id VARCHAR(255) NOT NULL, 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goal_action_item_templates" VALUES(1,1,1);
INSERT INTO "caseman__goal_action_item_templates" VALUES(2,2,28);
INSERT INTO "caseman__goal_action_item_templates" VALUES(3,3,16);
INSERT INTO "caseman__goal_action_item_templates" VALUES(4,3,17);
INSERT INTO "caseman__goal_action_item_templates" VALUES(5,3,19);
INSERT INTO "caseman__goal_action_item_templates" VALUES(6,3,21);
INSERT INTO "caseman__goal_action_item_templates" VALUES(7,3,24);
INSERT INTO "caseman__goal_action_item_templates" VALUES(8,3,30);
INSERT INTO "caseman__goal_action_item_templates" VALUES(9,3,31);
INSERT INTO "caseman__goal_action_item_templates" VALUES(10,3,32);
INSERT INTO "caseman__goal_action_item_templates" VALUES(11,3,33);
INSERT INTO "caseman__goal_action_item_templates" VALUES(12,3,34);
INSERT INTO "caseman__goal_action_item_templates" VALUES(13,3,35);
INSERT INTO "caseman__goal_action_item_templates" VALUES(14,3,36);
INSERT INTO "caseman__goal_action_item_templates" VALUES(15,3,37);
INSERT INTO "caseman__goal_action_item_templates" VALUES(16,3,38);
INSERT INTO "caseman__goal_action_item_templates" VALUES(17,3,2);
INSERT INTO "caseman__goal_action_item_templates" VALUES(18,4,22);
INSERT INTO "caseman__goal_action_item_templates" VALUES(19,4,23);
INSERT INTO "caseman__goal_action_item_templates" VALUES(20,4,4);
INSERT INTO "caseman__goal_action_item_templates" VALUES(21,4,5);
INSERT INTO "caseman__goal_action_item_templates" VALUES(22,4,6);
INSERT INTO "caseman__goal_action_item_templates" VALUES(23,6,25);
INSERT INTO "caseman__goal_action_item_templates" VALUES(24,9,3);
INSERT INTO "caseman__goal_action_item_templates" VALUES(25,9,7);
INSERT INTO "caseman__goal_action_item_templates" VALUES(26,9,8);
INSERT INTO "caseman__goal_action_item_templates" VALUES(27,9,9);
INSERT INTO "caseman__goal_action_item_templates" VALUES(28,9,10);
INSERT INTO "caseman__goal_action_item_templates" VALUES(29,9,11);
INSERT INTO "caseman__goal_action_item_templates" VALUES(30,12,45);
INSERT INTO "caseman__goal_action_item_templates" VALUES(31,12,46);
INSERT INTO "caseman__goal_action_item_templates" VALUES(32,14,39);
INSERT INTO "caseman__goal_action_item_templates" VALUES(33,14,40);
INSERT INTO "caseman__goal_action_item_templates" VALUES(34,14,43);
INSERT INTO "caseman__goal_action_item_templates" VALUES(35,14,44);
INSERT INTO "caseman__goal_action_item_templates" VALUES(36,28,28);
CREATE TABLE caseman__goal_templates (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (sf_id)
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
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goals" VALUES(1,'Develop Soft Skills','0030x00000b3I9DAAU',3,9);
INSERT INTO "caseman__goals" VALUES(2,'Stabilize housing','0030x00000b3I9DAAU',3,10);
INSERT INTO "caseman__goals" VALUES(3,'Identify industry/career path','0030x00000b3I9DAAU',3,16);
INSERT INTO "caseman__goals" VALUES(4,'Meet job requirement standards','0030x00000b3I9DAAU',3,18);
INSERT INTO "caseman__goals" VALUES(5,'Complete Succeed Program','0030x00000b3I9DAAU',3,19);
INSERT INTO "caseman__goals" VALUES(6,'Stabilize Employment','0030x00000b3I9DAAU',3,21);
INSERT INTO "caseman__goals" VALUES(7,'Develop basic financial literacy skills','0030x00000b3I9EAAU',4,3);
INSERT INTO "caseman__goals" VALUES(8,'Get and keep job for 6 - 12 months','0030x00000b3I9EAAU',4,4);
INSERT INTO "caseman__goals" VALUES(9,'Develop Soft Skills','0030x00000b3I9EAAU',4,9);
INSERT INTO "caseman__goals" VALUES(10,'Meet job requirement standards','0030x00000b3I9EAAU',4,18);
INSERT INTO "caseman__goals" VALUES(11,'Complete Succeed Program','0030x00000b3I9EAAU',4,19);
INSERT INTO "caseman__goals" VALUES(12,'Stabilize Employment','0030x00000b3I9EAAU',4,21);
INSERT INTO "caseman__goals" VALUES(13,'Adopt healthy skills to address dependency issues','0030x00000b3I9EAAU',5,6);
INSERT INTO "caseman__goals" VALUES(14,'Complete Financial Literacy Course','0030x00000b3I9IAAU',6,12);
INSERT INTO "caseman__goals" VALUES(15,'Deposit 10% of income in Savings Account for 3 months','0030x00000b3I9IAAU',6,14);
INSERT INTO "caseman__goals" VALUES(16,'Reach proficiency level in reading, writing, speaking & listening per state std','0030x00000b3I9RAAU',7,8);
INSERT INTO "caseman__goals" VALUES(17,'Build respectful peer relationships','0030x00000b3I98AAE',1,13);
INSERT INTO "caseman__goals" VALUES(18,'Build respectful inter-generational relationships','0030x00000b3I98AAE',1,15);
INSERT INTO "caseman__goals" VALUES(19,'Reach an age appropriate level of proficiency in reading','0030x00000b3I98AAE',2,1);
INSERT INTO "caseman__goals" VALUES(20,'Develop basic financial literacy skills','0030x00000b3I9DAAU',3,3);
INSERT INTO "caseman__goals" VALUES(21,'Get and keep job for 6 - 12 months','0030x00000b3I9DAAU',3,4);

CREATE TABLE household_accounts (
	sf_id VARCHAR(255) NOT NULL, 
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
	"npe01__SYSTEM_AccountType__c" VARCHAR(255), 
	"npo02__SYSTEM_CUSTOM_NAMING__c" VARCHAR(255), 
	"npe01__SYSTEMIsIndividual__c" VARCHAR(255), 
	"npo02__FirstCloseDate__c" VARCHAR(255), 
	"npo02__LastCloseDate__c" VARCHAR(255), 
	"npo02__AverageAmount__c" VARCHAR(255), 
	"npo02__LastOppAmount__c" VARCHAR(255), 
	"npo02__LargestAmount__c" VARCHAR(255), 
	"npo02__SmallestAmount__c" VARCHAR(255), 
	"npo02__Best_Gift_Year__c" VARCHAR(255), 
	"npo02__Best_Gift_Year_Total__c" VARCHAR(255), 
	"npo02__TotalOppAmount__c" VARCHAR(255), 
	"npo02__OppAmountLastNDays__c" VARCHAR(255), 
	"npo02__OppAmountThisYear__c" VARCHAR(255), 
	"npo02__OppAmountLastYear__c" VARCHAR(255), 
	"npo02__OppAmount2YearsAgo__c" VARCHAR(255), 
	"npo02__NumberOfClosedOpps__c" VARCHAR(255), 
	"npo02__OppsClosedLastNDays__c" VARCHAR(255), 
	"npo02__OppsClosedThisYear__c" VARCHAR(255), 
	"npo02__OppsClosedLastYear__c" VARCHAR(255), 
	"npo02__OppsClosed2YearsAgo__c" VARCHAR(255), 
	"npo02__TotalMembershipOppAmount__c" VARCHAR(255), 
	"npo02__MembershipEndDate__c" VARCHAR(255), 
	"npo02__LastMembershipLevel__c" VARCHAR(255), 
	"npo02__MembershipJoinDate__c" VARCHAR(255), 
	"npo02__LastMembershipDate__c" VARCHAR(255), 
	"npo02__LastMembershipAmount__c" VARCHAR(255), 
	"npo02__LastMembershipOrigin__c" VARCHAR(255), 
	"npo02__NumberOfMembershipOpps__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "household_accounts" VALUES('0010x00000mnm5mAAA','Higgins Household','','','','','','','555-248-3956','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5nAAA','Adams Household','','','','','','','555-648-7204','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5oAAA','Baker Household','','','','','','','555-524-0749','','','','','','Household','','Household Account','','true','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5pAAA','Banks and Graham Household','','','','','','','555-648-7204','','','','','','Household','','Household Account','','true','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','400.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5qAAA','Barnes Household','','','','','','','555-893-4763','','','','','','Household','','Household Account','','true','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5rAAA','Boyd Household','','','','','','','555-380-8532','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5sAAA','Burke Household','','','','','','','555-830-5295','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5tAAA','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5uAAA','Henderson Household','','','','','','','555-830-5295','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5vAAA','Hill Household','','','','','','','555-395-9737','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5wAAA','Holmes Household','','','','','','','555-930-8759','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5xAAA','Jenkins Household','','','','','','','555-469-9873','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mnm5yAAA','Johnson Household','','','','','','','555-248-3956','','','','','','Household','','Household Account','','true','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0010x00000mrs3tAAA','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','','true','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');

CREATE TABLE caseman__incident_cases (
	sf_id VARCHAR(255) NOT NULL, 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__incident_cases" VALUES(1,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','0010x00000mnm46AAA','0030x00000b3I98AAE','Incident');
INSERT INTO "caseman__incident_cases" VALUES(2,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','0010x00000mnm46AAA','0030x00000b3I98AAE','Incident');
INSERT INTO "caseman__incident_cases" VALUES(3,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','0010x00000mnm46AAA','0030x00000b3I98AAE','Incident');
INSERT INTO "caseman__incident_cases" VALUES(4,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','0030x00000b3I98AAE','Incident');
INSERT INTO "caseman__incident_cases" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','0010x00000mnm46AAA','0030x00000b3I98AAE','Incident');

CREATE TABLE organization_accounts (
	sf_id VARCHAR(255) NOT NULL, 
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
	"npe01__SYSTEM_AccountType__c" VARCHAR(255), 
	"npo02__SYSTEM_CUSTOM_NAMING__c" VARCHAR(255), 
	"npe01__SYSTEMIsIndividual__c" VARCHAR(255), 
	"npo02__FirstCloseDate__c" VARCHAR(255), 
	"npo02__LastCloseDate__c" VARCHAR(255), 
	"npo02__AverageAmount__c" VARCHAR(255), 
	"npo02__LastOppAmount__c" VARCHAR(255), 
	"npo02__LargestAmount__c" VARCHAR(255), 
	"npo02__SmallestAmount__c" VARCHAR(255), 
	"npo02__Best_Gift_Year__c" VARCHAR(255), 
	"npo02__Best_Gift_Year_Total__c" VARCHAR(255), 
	"npo02__TotalOppAmount__c" VARCHAR(255), 
	"npo02__OppAmountLastNDays__c" VARCHAR(255), 
	"npo02__OppAmountThisYear__c" VARCHAR(255), 
	"npo02__OppAmountLastYear__c" VARCHAR(255), 
	"npo02__OppAmount2YearsAgo__c" VARCHAR(255), 
	"npo02__NumberOfClosedOpps__c" VARCHAR(255), 
	"npo02__OppsClosedLastNDays__c" VARCHAR(255), 
	"npo02__OppsClosedThisYear__c" VARCHAR(255), 
	"npo02__OppsClosedLastYear__c" VARCHAR(255), 
	"npo02__OppsClosed2YearsAgo__c" VARCHAR(255), 
	"npo02__TotalMembershipOppAmount__c" VARCHAR(255), 
	"npo02__MembershipEndDate__c" VARCHAR(255), 
	"npo02__LastMembershipLevel__c" VARCHAR(255), 
	"npo02__MembershipJoinDate__c" VARCHAR(255), 
	"npo02__LastMembershipDate__c" VARCHAR(255), 
	"npo02__LastMembershipAmount__c" VARCHAR(255), 
	"npo02__LastMembershipOrigin__c" VARCHAR(255), 
	"npo02__NumberOfMembershipOpps__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "organization_accounts" VALUES('0010x00000mrs3uAAA','Sample Organization','','','','','','','','','','','','','','','','','false','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0010x00000mnm7XAAQ','Marble Foundation','','','','','','','555-389-74399','','','','','','Foundation','','','','false','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0010x00000mnm7YAAQ','Future Potential Fund','','','','','','','555-278-7643','','','','','','Foundation','','','','false','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0010x00000mnm7ZAAQ','City Department of Human Services','','','','','','','','','','','','','Government','','','','false','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
COMMIT;
