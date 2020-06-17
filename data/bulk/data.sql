BEGIN TRANSACTION;
CREATE TABLE caseman__action_item_templates (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (id)
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
INSERT INTO "caseman__action_item_templates" VALUES(37,'Open a Savings Account');
INSERT INTO "caseman__action_item_templates" VALUES(38,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES(39,'Complete Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(40,'Meet with Financial Advisor');
INSERT INTO "caseman__action_item_templates" VALUES(41,'Month 6: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES(42,'Month 2: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES(43,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES(44,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES(45,'Get a passing grade in Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES(46,'Register for Financial Literacy Course');
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
INSERT INTO "caseman__action_items" VALUES(1,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','30','1','1','2');
INSERT INTO "caseman__action_items" VALUES(2,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','30','1','1','26');
INSERT INTO "caseman__action_items" VALUES(3,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','30','1','1','27');
INSERT INTO "caseman__action_items" VALUES(4,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','30','1','1','29');
INSERT INTO "caseman__action_items" VALUES(5,'Open a Savings Account','Completed','2019-09-09','30','1','1','37');
INSERT INTO "caseman__action_items" VALUES(6,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','90','2','3','28');
INSERT INTO "caseman__action_items" VALUES(7,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','152','4','6','1');
INSERT INTO "caseman__action_items" VALUES(8,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','157','5','11','12');
INSERT INTO "caseman__action_items" VALUES(9,'Meet job requirement standards','Not Started','2020-04-15','157','5','11','13');
INSERT INTO "caseman__action_items" VALUES(10,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','157','5','12','16');
INSERT INTO "caseman__action_items" VALUES(11,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','157','5','12','17');
INSERT INTO "caseman__action_items" VALUES(12,'Open a bank account','Completed','2019-09-06','157','5','12','19');
INSERT INTO "caseman__action_items" VALUES(13,'Pass basic financial literacy course','In Progress','2019-09-30','157','5','12','2');
INSERT INTO "caseman__action_items" VALUES(14,'Read and interpret a banking account statement','Not Started','2019-09-30','157','5','12','21');
INSERT INTO "caseman__action_items" VALUES(15,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','157','5','12','24');
INSERT INTO "caseman__action_items" VALUES(16,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','157','5','12','30');
INSERT INTO "caseman__action_items" VALUES(17,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','157','5','12','31');
INSERT INTO "caseman__action_items" VALUES(18,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','157','5','12','32');
INSERT INTO "caseman__action_items" VALUES(19,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','157','5','12','33');
INSERT INTO "caseman__action_items" VALUES(20,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','157','5','12','34');
INSERT INTO "caseman__action_items" VALUES(21,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','157','5','12','35');
INSERT INTO "caseman__action_items" VALUES(22,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','157','5','12','36');
INSERT INTO "caseman__action_items" VALUES(23,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','157','5','12','41');
INSERT INTO "caseman__action_items" VALUES(24,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','157','5','12','42');
INSERT INTO "caseman__action_items" VALUES(25,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','157','5','13','15');
INSERT INTO "caseman__action_items" VALUES(26,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','157','5','13','22');
INSERT INTO "caseman__action_items" VALUES(27,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','157','5','13','23');
INSERT INTO "caseman__action_items" VALUES(28,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','157','5','13','4');
INSERT INTO "caseman__action_items" VALUES(29,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','157','5','13','5');
INSERT INTO "caseman__action_items" VALUES(30,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','157','5','13','6');
INSERT INTO "caseman__action_items" VALUES(31,'Pass mock interview','Not Started','2019-11-06','157','5','14','10');
INSERT INTO "caseman__action_items" VALUES(32,'Update resume','Not Started','2019-10-25','157','5','14','11');
INSERT INTO "caseman__action_items" VALUES(33,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','157','5','14','3');
INSERT INTO "caseman__action_items" VALUES(34,'Get a job readiness coach','Completed','2019-09-05','157','5','14','7');
INSERT INTO "caseman__action_items" VALUES(35,'Complete resume workshop','Not Started','2019-10-11','157','5','14','8');
INSERT INTO "caseman__action_items" VALUES(36,'Complete interview workshop','Not Started','2019-11-04','157','5','14','9');
INSERT INTO "caseman__action_items" VALUES(37,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','26','6','18','16');
INSERT INTO "caseman__action_items" VALUES(38,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','26','6','18','17');
INSERT INTO "caseman__action_items" VALUES(39,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','26','6','18','24');
INSERT INTO "caseman__action_items" VALUES(40,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','26','6','18','32');
INSERT INTO "caseman__action_items" VALUES(41,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','26','6','18','35');
INSERT INTO "caseman__action_items" VALUES(42,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','26','6','18','42');
INSERT INTO "caseman__action_items" VALUES(43,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','26','6','19','15');
INSERT INTO "caseman__action_items" VALUES(44,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','26','6','19','22');
INSERT INTO "caseman__action_items" VALUES(45,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','26','6','19','23');
INSERT INTO "caseman__action_items" VALUES(46,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','26','6','19','4');
INSERT INTO "caseman__action_items" VALUES(47,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','26','6','19','5');
INSERT INTO "caseman__action_items" VALUES(48,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','26','6','19','6');
INSERT INTO "caseman__action_items" VALUES(49,'Pass mock interview','Not Started','2019-10-31','26','6','20','10');
INSERT INTO "caseman__action_items" VALUES(50,'Update resume','Not Started','2019-10-09','26','6','20','11');
INSERT INTO "caseman__action_items" VALUES(51,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','26','6','20','3');
INSERT INTO "caseman__action_items" VALUES(52,'Get a job readiness coach','Completed','2019-09-05','26','6','20','7');
INSERT INTO "caseman__action_items" VALUES(53,'Complete resume workshop','Not Started','2019-09-27','26','6','20','8');
INSERT INTO "caseman__action_items" VALUES(54,'Complete interview workshop','Not Started','2019-10-20','26','6','20','9');
INSERT INTO "caseman__action_items" VALUES(55,'Participate in a 12-step program','In Progress','2019-12-31','26','7','21','25');
CREATE TABLE caseman__assessments (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	assessmentcompleteddate__c VARCHAR(255), 
	comments__c VARCHAR(255), 
	totalscore__c VARCHAR(255), 
	client__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__assessments" VALUES(1,'ESL - July 2019','2019-07-01','ESL July 2019 Assessment','63.24','90');
INSERT INTO "caseman__assessments" VALUES(2,'ESL - August 2019','2019-08-01','ESL August Assessment Score','68.5','90');
INSERT INTO "caseman__assessments" VALUES(3,'ESL - September 2019','2019-09-01','ESL September Assessment Score','70.25','90');
INSERT INTO "caseman__assessments" VALUES(4,'ESL - June 2019','2019-06-01','Entry level score in ESL program','51.5','90');
INSERT INTO "caseman__assessments" VALUES(5,'ESL - October 2019','2019-10-01','ESL October Assessment Score','74.55','90');
INSERT INTO "caseman__assessments" VALUES(6,'ESL - November 2019','2019-11-01','ESL November Assessment Score','77.43','90');
INSERT INTO "caseman__assessments" VALUES(7,'Arlene Baker-1/20','2020-01-15','Arlene has shown resilience and ability to adapt to adverse circumstances.','90.0','157');
INSERT INTO "caseman__assessments" VALUES(8,'Arlene Baker-10/19','2019-10-15','Arlene is very diligent with her case plan','76.0','157');
INSERT INTO "caseman__assessments" VALUES(9,'Arlene Baker-9/19','2019-09-16','Arlene has been out of the active workforce for more than one year','75.0','157');
INSERT INTO "caseman__assessments" VALUES(10,'Arlene Baker-11/19','2019-11-15','Arlene''s financial stability score declined due to a rent increase. She is revising her budget.','80.0','157');
INSERT INTO "caseman__assessments" VALUES(11,'Robin Brooks 12/19','2019-12-01','Robin has shown diligence in the resume and interview workshops.','85.0','26');
INSERT INTO "caseman__assessments" VALUES(12,'Robin Brooks-10/19','2019-10-01','','75.0','26');
INSERT INTO "caseman__assessments" VALUES(13,'Robin Brooks-11/19','2019-11-01','Robin is settling into her case plan more easily than I expected.','80.0','26');
INSERT INTO "caseman__assessments" VALUES(14,'Robin Brooks 1/20','2020-01-03','Note that some of Robin''s financial stability score reflects her partner''s job','85.0','26');
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
CREATE TABLE caseman__case_plans (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	status__c VARCHAR(255), 
	abandoneddate__c VARCHAR(255), 
	completeddate__c VARCHAR(255), 
	inprogressdate__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__case_plans" VALUES(1,'Financial Literacy Case Plan - Jason Barnes','','','','2019-11-04','30');
INSERT INTO "caseman__case_plans" VALUES(2,'English proficiency case plan - Barbara Johnson','','','','','90');
INSERT INTO "caseman__case_plans" VALUES(3,'Socialization Case Plan - Tom Higgins','','','','','152');
INSERT INTO "caseman__case_plans" VALUES(4,'Reading Case Plan - Tom Higgins','','','','2019-10-01','152');
INSERT INTO "caseman__case_plans" VALUES(5,'Arlene Baker''s Workforce Re-entry Case Plan','','','','2019-11-01','157');
INSERT INTO "caseman__case_plans" VALUES(6,'Robin Brooks'' Job Readiness Case Plan','','','','2019-11-05','26');
INSERT INTO "caseman__case_plans" VALUES(7,'Robin Brooks'' Sobriety Case Plan','','','','','26');
CREATE TABLE caseman__client_alerts (
	id INTEGER NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_alerts" VALUES(1,'Tom has anger issues','true','','152');
INSERT INTO "caseman__client_alerts" VALUES(2,'Tom''s sister passed away recently (very emotional)','true','','152');
INSERT INTO "caseman__client_alerts" VALUES(3,'Robin was recently released from rehab','true','','26');
CREATE TABLE caseman__client_note_relationships (
	id INTEGER NOT NULL, 
	"RelatedId__c" VARCHAR(255), 
	"RelatedName__c" VARCHAR(255), 
	"RelatedObject__c" VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_note_relationships" VALUES(1,'500540000032nuJAAQ','00001008','Case','5','');
INSERT INTO "caseman__client_note_relationships" VALUES(2,'500540000032nuKAAQ','00001009','Case','1','');
INSERT INTO "caseman__client_note_relationships" VALUES(3,'500540000032nuLAAQ','00001010','Case','2','');
CREATE TABLE caseman__client_notes (
	id INTEGER NOT NULL, 
	content__c VARCHAR(255), 
	subject__c VARCHAR(255), 
	status__c VARCHAR(255), 
	interactiondate__c VARCHAR(255), 
	draft__c VARCHAR(255), 
	client__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__client_notes" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','30');
INSERT INTO "caseman__client_notes" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','90');
INSERT INTO "caseman__client_notes" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','152');
INSERT INTO "caseman__client_notes" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','152');
INSERT INTO "caseman__client_notes" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','26');
CREATE TABLE caseman__goal_action_item_templates (
	id INTEGER NOT NULL, 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__goal_action_item_templates" VALUES(1,'1','1');
INSERT INTO "caseman__goal_action_item_templates" VALUES(2,'12','45');
INSERT INTO "caseman__goal_action_item_templates" VALUES(3,'12','46');
INSERT INTO "caseman__goal_action_item_templates" VALUES(4,'14','37');
INSERT INTO "caseman__goal_action_item_templates" VALUES(5,'14','38');
INSERT INTO "caseman__goal_action_item_templates" VALUES(6,'14','43');
INSERT INTO "caseman__goal_action_item_templates" VALUES(7,'14','44');
INSERT INTO "caseman__goal_action_item_templates" VALUES(8,'2','28');
INSERT INTO "caseman__goal_action_item_templates" VALUES(9,'28','28');
INSERT INTO "caseman__goal_action_item_templates" VALUES(10,'3','16');
INSERT INTO "caseman__goal_action_item_templates" VALUES(11,'3','17');
INSERT INTO "caseman__goal_action_item_templates" VALUES(12,'3','19');
INSERT INTO "caseman__goal_action_item_templates" VALUES(13,'3','2');
INSERT INTO "caseman__goal_action_item_templates" VALUES(14,'3','21');
INSERT INTO "caseman__goal_action_item_templates" VALUES(15,'3','24');
INSERT INTO "caseman__goal_action_item_templates" VALUES(16,'3','30');
INSERT INTO "caseman__goal_action_item_templates" VALUES(17,'3','31');
INSERT INTO "caseman__goal_action_item_templates" VALUES(18,'3','32');
INSERT INTO "caseman__goal_action_item_templates" VALUES(19,'3','33');
INSERT INTO "caseman__goal_action_item_templates" VALUES(20,'3','34');
INSERT INTO "caseman__goal_action_item_templates" VALUES(21,'3','35');
INSERT INTO "caseman__goal_action_item_templates" VALUES(22,'3','36');
INSERT INTO "caseman__goal_action_item_templates" VALUES(23,'3','41');
INSERT INTO "caseman__goal_action_item_templates" VALUES(24,'3','42');
INSERT INTO "caseman__goal_action_item_templates" VALUES(25,'4','22');
INSERT INTO "caseman__goal_action_item_templates" VALUES(26,'4','23');
INSERT INTO "caseman__goal_action_item_templates" VALUES(27,'4','4');
INSERT INTO "caseman__goal_action_item_templates" VALUES(28,'4','5');
INSERT INTO "caseman__goal_action_item_templates" VALUES(29,'4','6');
INSERT INTO "caseman__goal_action_item_templates" VALUES(30,'6','25');
INSERT INTO "caseman__goal_action_item_templates" VALUES(31,'9','10');
INSERT INTO "caseman__goal_action_item_templates" VALUES(32,'9','11');
INSERT INTO "caseman__goal_action_item_templates" VALUES(33,'9','3');
INSERT INTO "caseman__goal_action_item_templates" VALUES(34,'9','7');
INSERT INTO "caseman__goal_action_item_templates" VALUES(35,'9','8');
INSERT INTO "caseman__goal_action_item_templates" VALUES(36,'9','9');
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
INSERT INTO "caseman__goals" VALUES(1,'Complete Financial Literacy Course','30','1','12');
INSERT INTO "caseman__goals" VALUES(2,'Deposit 10% of income in Savings Account for 3 months','30','1','14');
INSERT INTO "caseman__goals" VALUES(3,'Reach proficiency level in reading, writing, speaking & listening per state std','90','2','8');
INSERT INTO "caseman__goals" VALUES(4,'Build respectful peer relationships','152','3','13');
INSERT INTO "caseman__goals" VALUES(5,'Build respectful inter-generational relationships','152','3','15');
INSERT INTO "caseman__goals" VALUES(6,'Reach an age appropriate level of proficiency in reading','152','4','1');
INSERT INTO "caseman__goals" VALUES(7,'Stabilize housing','157','5','10');
INSERT INTO "caseman__goals" VALUES(8,'Identify industry/career path','157','5','16');
INSERT INTO "caseman__goals" VALUES(9,'Meet job requirement standards','157','5','18');
INSERT INTO "caseman__goals" VALUES(10,'Complete Succeed Program','157','5','19');
INSERT INTO "caseman__goals" VALUES(11,'Stabilize Employment','157','5','21');
INSERT INTO "caseman__goals" VALUES(12,'Develop basic financial literacy skills','157','5','3');
INSERT INTO "caseman__goals" VALUES(13,'Get and keep job for 6 - 12 months','157','5','4');
INSERT INTO "caseman__goals" VALUES(14,'Develop Soft Skills','157','5','9');
INSERT INTO "caseman__goals" VALUES(15,'Meet job requirement standards','26','6','18');
INSERT INTO "caseman__goals" VALUES(16,'Complete Succeed Program','26','6','19');
INSERT INTO "caseman__goals" VALUES(17,'Stabilize Employment','26','6','21');
INSERT INTO "caseman__goals" VALUES(18,'Develop basic financial literacy skills','26','6','3');
INSERT INTO "caseman__goals" VALUES(19,'Get and keep job for 6 - 12 months','26','6','4');
INSERT INTO "caseman__goals" VALUES(20,'Develop Soft Skills','26','6','9');
INSERT INTO "caseman__goals" VALUES(21,'Adopt healthy skills to address dependency issues','26','7','6');
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
INSERT INTO "caseman__incident_cases" VALUES(1,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','1','152','Incident');
INSERT INTO "caseman__incident_cases" VALUES(2,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','1','152','Incident');
INSERT INTO "caseman__incident_cases" VALUES(3,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','152','Incident');
INSERT INTO "caseman__incident_cases" VALUES(4,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','152','Incident');
INSERT INTO "caseman__incident_cases" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','152','Incident');
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
	"AgeCategory__c" VARCHAR(255), 
	"ClientID__c" VARCHAR(255), 
	"EmergencyContactRole__c" VARCHAR(255), 
	"PhotoFileID__c" VARCHAR(255), 
	"PreferredCommunicationMethod__c" VARCHAR(255), 
	"LegalName__c" VARCHAR(255), 
	"PreferredPhoneField__c" VARCHAR(255), 
	"PreferredPhoneNumber__c" VARCHAR(255), 
	"Pronouns__c" VARCHAR(255), 
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
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "contacts" VALUES(1,'','Laura','Hernandez','laurahernandez@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','laurahernandez@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','77','');
INSERT INTO "contacts" VALUES(2,'','Makhi','Villegas','makhivillegas@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','makhivillegas@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','78','');
INSERT INTO "contacts" VALUES(3,'','Rafael','Velasquez','rafaelvelasquez@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','rafaelvelasquez@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','79','');
INSERT INTO "contacts" VALUES(4,'','Naima','Crawford','naimacrawford@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','naimacrawford@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','8','');
INSERT INTO "contacts" VALUES(5,'','Ryan','Hardin','ryanhardin@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ryanhardin@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','80','');
INSERT INTO "contacts" VALUES(6,'','Hayley','Bright','hayleybright@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','hayleybright@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','81','');
INSERT INTO "contacts" VALUES(7,'','Dayana','Atkins','dayanaatkins@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','dayanaatkins@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','82','');
INSERT INTO "contacts" VALUES(8,'','Jessica','Woods','jessicawoods@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jessicawoods@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','83','');
INSERT INTO "contacts" VALUES(9,'','Khloe','Stanley','khloestanley@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','khloestanley@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','84','');
INSERT INTO "contacts" VALUES(10,'','Ray','Fischer','rayfischer@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','rayfischer@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','85','');
INSERT INTO "contacts" VALUES(11,'','Casey','Kline','caseykline@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','caseykline@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','86','');
INSERT INTO "contacts" VALUES(12,'','Aron','Joyce','aronjoyce@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aronjoyce@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','87','');
INSERT INTO "contacts" VALUES(13,'','Diego','Case','diegocase@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','diegocase@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','88','');
INSERT INTO "contacts" VALUES(14,'','Chelsea','Graves','chelseagraves@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','chelseagraves@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','89','');
INSERT INTO "contacts" VALUES(15,'','Beau','Eaton','beaueaton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','beaueaton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','9','');
INSERT INTO "contacts" VALUES(16,'','Ruth','Wu','ruthwu@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ruthwu@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','90','');
INSERT INTO "contacts" VALUES(17,'','Isaac','Grant','isaacgrant@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','isaacgrant@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','91','');
INSERT INTO "contacts" VALUES(18,'','Audrina','Rojas','audrinarojas@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','audrinarojas@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','92','');
INSERT INTO "contacts" VALUES(19,'','Koen','Chase','koenchase@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','koenchase@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','93','');
INSERT INTO "contacts" VALUES(20,'','Hailie','Holder','hailieholder@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','hailieholder@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','94','');
INSERT INTO "contacts" VALUES(21,'','Caylee','Pollard','cayleepollard@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','cayleepollard@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','95','');
INSERT INTO "contacts" VALUES(22,'','Guillermo','Quinn','guillermoquinn@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','guillermoquinn@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','96','');
INSERT INTO "contacts" VALUES(23,'','Dominik','Wilkinson','dominikwilkinson@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','dominikwilkinson@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','97','');
INSERT INTO "contacts" VALUES(24,'','Simone','Keller','simonekeller@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','simonekeller@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','98','');
INSERT INTO "contacts" VALUES(25,'','Violet','Ellis','violetellis@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','violetellis@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','99','');
INSERT INTO "contacts" VALUES(26,'','Robin','Brooks','robinBrooks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','robinBrooks@example.com','Personal','Home','Home','false','','','','Adult','','Partner','0683F0000005HeCQAU','','','','','she/her/hers','true','2020-02-28','false','false','false','false','false','','','false','','','','','','','','','','0.0','158','27');
INSERT INTO "contacts" VALUES(27,'','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','400.0','0.0','0.0','1.0','1.0','0.0','400.0','','','','','400.0','400.0','','','darrylgraham@example.com','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','158','');
INSERT INTO "contacts" VALUES(28,'','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','500.0','0.0','0.0','1.0','1.0','0.0','500.0','','','','','500.0','500.0','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','159','');
INSERT INTO "contacts" VALUES(29,'','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','','','davidbarnes@example.com','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','159','');
INSERT INTO "contacts" VALUES(30,'','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','Youth','88841515','Mother','0683F0000005HdnQAE','','','','','he/him/his','false','','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','159','28');
INSERT INTO "contacts" VALUES(31,'','Leia','Spence','leiaspence@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','leiaspence@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','16','');
INSERT INTO "contacts" VALUES(32,'Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anneboyd@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','she/her/hers','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','160','');
INSERT INTO "contacts" VALUES(33,'','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','normaburke@example.com','Personal','Home','Home','false','','','','Senior','','Friend','','','','','','they/them/theirs','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','161','');
INSERT INTO "contacts" VALUES(34,'','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','true','2020-02-28','false','false','false','false','false','','','false','','','','','','','','','','0.0','162','');
INSERT INTO "contacts" VALUES(35,'','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anthonyhill@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','they/them/theirs','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','163','');
INSERT INTO "contacts" VALUES(36,'Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','she/her/hers','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','164','');
INSERT INTO "contacts" VALUES(37,'','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','josejenkins@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','he/him/his','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','165','');
INSERT INTO "contacts" VALUES(38,'','Ayana','Humphrey','ayanahumphrey@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ayanahumphrey@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','19','');
INSERT INTO "contacts" VALUES(39,'','Jose','Burgess','joseburgess@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','joseburgess@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','2','');
INSERT INTO "contacts" VALUES(40,'','Lucia','Cain','luciacain@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','luciacain@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','20','');
INSERT INTO "contacts" VALUES(41,'','Amaya','Dunlap','amayadunlap@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','amayadunlap@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','21','');
INSERT INTO "contacts" VALUES(42,'','Christina','Webster','christinawebster@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','christinawebster@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','17','');
INSERT INTO "contacts" VALUES(43,'','Emilie','Costa','emiliecosta@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','emiliecosta@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','18','');
INSERT INTO "contacts" VALUES(44,'','Derrick','Blackwell','derrickblackwell@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','derrickblackwell@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','22','');
INSERT INTO "contacts" VALUES(45,'','Alice','Irwin','aliceirwin@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aliceirwin@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','23','');
INSERT INTO "contacts" VALUES(46,'','Fabian','Hughes','fabianhughes@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','fabianhughes@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','24','');
INSERT INTO "contacts" VALUES(47,'','Raelynn','Wells','raelynnwells@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','raelynnwells@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','25','');
INSERT INTO "contacts" VALUES(48,'','Simon','Davila','simondavila@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','simondavila@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','26','');
INSERT INTO "contacts" VALUES(49,'','Jamarcus','Barnett','jamarcusbarnett@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jamarcusbarnett@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','27','');
INSERT INTO "contacts" VALUES(50,'','Adrianna','Norman','adriannanorman@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','adriannanorman@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','28','');
INSERT INTO "contacts" VALUES(51,'','Donna','Snow','donnasnow@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','donnasnow@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','29','');
INSERT INTO "contacts" VALUES(52,'','Brenda','Bass','brendabass@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','brendabass@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','3','');
INSERT INTO "contacts" VALUES(53,'','Jaylin','Morgan','jaylinmorgan@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jaylinmorgan@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','32','');
INSERT INTO "contacts" VALUES(54,'','Mira','Decker','miradecker@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','miradecker@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','33','');
INSERT INTO "contacts" VALUES(55,'','Maya','Lambert','mayalambert@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mayalambert@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','34','');
INSERT INTO "contacts" VALUES(56,'','Finley','Barry','finleybarry@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','finleybarry@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','35','');
INSERT INTO "contacts" VALUES(57,'','Ben','Oneill','benoneill@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','benoneill@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','36','');
INSERT INTO "contacts" VALUES(58,'','Maia','Cooley','maiacooley@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','maiacooley@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','37','');
INSERT INTO "contacts" VALUES(59,'','Olive','Leach','oliveleach@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','oliveleach@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','38','');
INSERT INTO "contacts" VALUES(60,'','Oswaldo','Pacheco','oswaldopacheco@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','oswaldopacheco@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','39','');
INSERT INTO "contacts" VALUES(61,'','Nikhil','Bishop','nikhilbishop@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nikhilbishop@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','4','');
INSERT INTO "contacts" VALUES(62,'','Gary','Wood','garywood@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','garywood@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','30','');
INSERT INTO "contacts" VALUES(63,'','Nico','Rivers','nicorivers@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nicorivers@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','40','');
INSERT INTO "contacts" VALUES(64,'','Tiara','Griffith','tiaragriffith@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tiaragriffith@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','41','');
INSERT INTO "contacts" VALUES(65,'','Declan','Glenn','declanglenn@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','declanglenn@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','42','');
INSERT INTO "contacts" VALUES(66,'','Madalyn','Francis','madalynfrancis@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','madalynfrancis@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','43','');
INSERT INTO "contacts" VALUES(67,'','Mathew','Rhodes','mathewrhodes@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mathewrhodes@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','44','');
INSERT INTO "contacts" VALUES(68,'','Reagan','Norton','reagannorton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','reagannorton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','31','');
INSERT INTO "contacts" VALUES(69,'','Eli','White','eliwhite@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','eliwhite@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','45','');
INSERT INTO "contacts" VALUES(70,'','Tatiana','Lang','tatianalang@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tatianalang@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','46','');
INSERT INTO "contacts" VALUES(71,'','Gia','Ramirez','giaramirez@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','giaramirez@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','47','');
INSERT INTO "contacts" VALUES(72,'','Alejandro','Serrano','alejandroserrano@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alejandroserrano@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','48','');
INSERT INTO "contacts" VALUES(73,'','Juliette','Cisneros','juliettecisneros@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','juliettecisneros@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','5','');
INSERT INTO "contacts" VALUES(74,'','Adam','Clark','adamclark@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','adamclark@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','50','');
INSERT INTO "contacts" VALUES(75,'','Marisol','Gonzales','marisolgonzales@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marisolgonzales@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','51','');
INSERT INTO "contacts" VALUES(76,'','Mya','Cobb','myacobb@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','myacobb@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','52','');
INSERT INTO "contacts" VALUES(77,'','Jay','Shah','jayshah@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jayshah@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','53','');
INSERT INTO "contacts" VALUES(78,'','Nancy','Arroyo','nancyarroyo@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nancyarroyo@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','54','');
INSERT INTO "contacts" VALUES(79,'','Aubrie','Booker','aubriebooker@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aubriebooker@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','55','');
INSERT INTO "contacts" VALUES(80,'','Emelia','Mercer','emeliamercer@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','emeliamercer@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','56','');
INSERT INTO "contacts" VALUES(81,'','Yadiel','Horton','yadielhorton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yadielhorton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','57','');
INSERT INTO "contacts" VALUES(82,'','Taniyah','Rios','taniyahrios@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','taniyahrios@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','58','');
INSERT INTO "contacts" VALUES(83,'','Mya','Galloway','myagalloway@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','myagalloway@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','49','');
INSERT INTO "contacts" VALUES(84,'','Peyton','Craig','peytoncraig@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','peytoncraig@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','59','');
INSERT INTO "contacts" VALUES(85,'','Alana','Owen','alanaowen@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alanaowen@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','6','');
INSERT INTO "contacts" VALUES(86,'','Francesca','Oliver','francescaoliver@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','francescaoliver@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','60','');
INSERT INTO "contacts" VALUES(87,'','Albert','Montgomery','albertmontgomery@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','albertmontgomery@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','61','');
INSERT INTO "contacts" VALUES(88,'','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','United States','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','craigjohnso@example.com','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','1','');
INSERT INTO "contacts" VALUES(89,'','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','United States','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','true','true','true','','','false','','','','','','','','','','0.0','1','');
INSERT INTO "contacts" VALUES(90,'','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','United States','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','Adult','','Husband','0683F0000005HdxQAE','','','','','she/her/hers','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','1','88');
INSERT INTO "contacts" VALUES(91,'','Chance','Rasmussen','chancerasmussen@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','chancerasmussen@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','10','');
INSERT INTO "contacts" VALUES(92,'','Samir','Neal','samirneal@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','samirneal@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','100','');
INSERT INTO "contacts" VALUES(93,'','Mira','Mcconnell','miramcconnell@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','miramcconnell@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','101','');
INSERT INTO "contacts" VALUES(94,'','Aniya','Arellano','aniyaarellano@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aniyaarellano@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','102','');
INSERT INTO "contacts" VALUES(95,'','Jakayla','Glover','jakaylaglover@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jakaylaglover@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','103','');
INSERT INTO "contacts" VALUES(96,'','Angelo','Lutz','angelolutz@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','angelolutz@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','104','');
INSERT INTO "contacts" VALUES(97,'','Audrina','Graves','audrinagraves@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','audrinagraves@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','105','');
INSERT INTO "contacts" VALUES(98,'','Turner','Carson','turnercarson@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','turnercarson@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','106','');
INSERT INTO "contacts" VALUES(99,'','Emelia','Fletcher','emeliafletcher@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','emeliafletcher@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','107','');
INSERT INTO "contacts" VALUES(100,'','Mackenzie','Hernandez','mackenziehernandez@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mackenziehernandez@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','108','');
INSERT INTO "contacts" VALUES(101,'','Leon','Clayton','leonclayton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','leonclayton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','109','');
INSERT INTO "contacts" VALUES(102,'','Khloe','Campos','khloecampos@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','khloecampos@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','11','');
INSERT INTO "contacts" VALUES(103,'','Marc','Richard','marcrichard@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marcrichard@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','110','');
INSERT INTO "contacts" VALUES(104,'','Jordan','Waller','jordanwaller@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jordanwaller@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','111','');
INSERT INTO "contacts" VALUES(105,'','Sonia','Gentry','soniagentry@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','soniagentry@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','114','');
INSERT INTO "contacts" VALUES(106,'','Alison','Barr','alisonbarr@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alisonbarr@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','115','');
INSERT INTO "contacts" VALUES(107,'','Vu','Pham','vupham@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','vupham@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','116','');
INSERT INTO "contacts" VALUES(108,'','Kellen','Cooley','kellencooley@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','kellencooley@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','117','');
INSERT INTO "contacts" VALUES(109,'','Jay','Zimmerman','jayzimmerman@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jayzimmerman@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','118','');
INSERT INTO "contacts" VALUES(110,'','Melanie','Wheeler','melaniewheeler@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','melaniewheeler@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','119','');
INSERT INTO "contacts" VALUES(111,'','Amelie','Bond','ameliebond@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ameliebond@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','12','');
INSERT INTO "contacts" VALUES(112,'','Fernando','Beltran','fernandobeltran@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','fernandobeltran@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','120','');
INSERT INTO "contacts" VALUES(113,'','Yuliana','Bird','yulianabird@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yulianabird@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','121','');
INSERT INTO "contacts" VALUES(114,'','Alyson','Duffy','alysonduffy@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alysonduffy@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','122','');
INSERT INTO "contacts" VALUES(115,'','Nyla','Woods','nylawoods@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nylawoods@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','123','');
INSERT INTO "contacts" VALUES(116,'','James','Richards','jamesrichards@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jamesrichards@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','124','');
INSERT INTO "contacts" VALUES(117,'','Aaron','Valdez','aaronvaldez@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aaronvaldez@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','125','');
INSERT INTO "contacts" VALUES(118,'','John','Mills','johnmills@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','johnmills@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','126','');
INSERT INTO "contacts" VALUES(119,'','Jace','Hampton','jacehampton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jacehampton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','112','');
INSERT INTO "contacts" VALUES(120,'','Silas','Neal','silasneal@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','silasneal@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','113','');
INSERT INTO "contacts" VALUES(121,'','Shannon','Greene','shannongreene@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','shannongreene@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','127','');
INSERT INTO "contacts" VALUES(122,'','Marco','Escobar','marcoescobar@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marcoescobar@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','128','');
INSERT INTO "contacts" VALUES(123,'','Lorelai','Gross','lorelaigross@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','lorelaigross@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','129','');
INSERT INTO "contacts" VALUES(124,'','Julie','Myers','juliemyers@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','juliemyers@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','13','');
INSERT INTO "contacts" VALUES(125,'','Abraham','Sims','abrahamsims@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','abrahamsims@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','132','');
INSERT INTO "contacts" VALUES(126,'','Kyle','Huffman','kylehuffman@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','kylehuffman@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','133','');
INSERT INTO "contacts" VALUES(127,'','Cora','Hall','corahall@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','corahall@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','134','');
INSERT INTO "contacts" VALUES(128,'','Isaac','Barker','isaacbarker@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','isaacbarker@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','135','');
INSERT INTO "contacts" VALUES(129,'','Kailey','Glass','kaileyglass@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','kaileyglass@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','136','');
INSERT INTO "contacts" VALUES(130,'','Delilah','Ibarra','delilahibarra@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','delilahibarra@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','137','');
INSERT INTO "contacts" VALUES(131,'','Zackery','Morgan','zackerymorgan@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','zackerymorgan@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','138','');
INSERT INTO "contacts" VALUES(132,'','Duncan','Bowers','duncanbowers@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','duncanbowers@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','139','');
INSERT INTO "contacts" VALUES(133,'','Jayda','Stanton','jaydastanton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jaydastanton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','14','');
INSERT INTO "contacts" VALUES(134,'','Lauryn','Odom','laurynodom@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','laurynodom@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','140','');
INSERT INTO "contacts" VALUES(135,'','Yusef','Flores','yusefflores@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yusefflores@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','141','');
INSERT INTO "contacts" VALUES(136,'','Semaj','Wall','semajwall@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','semajwall@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','142','');
INSERT INTO "contacts" VALUES(137,'','Frankie','Waller','frankiewaller@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','frankiewaller@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','143','');
INSERT INTO "contacts" VALUES(138,'','Eliezer','Bray','eliezerbray@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','eliezerbray@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','144','');
INSERT INTO "contacts" VALUES(139,'','Jaden','Conner','jadenconner@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jadenconner@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','145','');
INSERT INTO "contacts" VALUES(140,'','Steven','Harper','stevenharper@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','stevenharper@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','146','');
INSERT INTO "contacts" VALUES(141,'','Karissa','Aguilar','karissaaguilar@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','karissaaguilar@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','147','');
INSERT INTO "contacts" VALUES(142,'','Tiara','Cummings','tiaracummings@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tiaracummings@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','148','');
INSERT INTO "contacts" VALUES(143,'','Elsa','Guerrero','elsaguerrero@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','elsaguerrero@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','130','');
INSERT INTO "contacts" VALUES(144,'','Yesenia','Ritter','yeseniaritter@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yeseniaritter@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','131','');
INSERT INTO "contacts" VALUES(145,'','Cecilia','Cardenas','ceciliacardenas@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ceciliacardenas@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','149','');
INSERT INTO "contacts" VALUES(146,'','Heidi','Woods','heidiwoods@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','heidiwoods@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','15','');
INSERT INTO "contacts" VALUES(147,'','Mira','Olson','miraolson@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','miraolson@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','150','');
INSERT INTO "contacts" VALUES(148,'','Anna','Orr','annaorr@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','annaorr@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','151','');
INSERT INTO "contacts" VALUES(149,'','Joe','Salinas','joesalinas@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','joesalinas@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','152','');
INSERT INTO "contacts" VALUES(150,'','Maleah','Bullock','maleahbullock@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','maleahbullock@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','153','');
INSERT INTO "contacts" VALUES(151,'','Anika','Solomon','anikasolomon@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anikasolomon@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','154','');
INSERT INTO "contacts" VALUES(152,'','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','thiggins@example.com','Personal','Home','Home','false','','','','Child','','Mother','0683F0000005HeHQAU','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','true','2020-02-28','false','false','true','true','false','','','false','','','','','','','','','','0.0','155','153');
INSERT INTO "contacts" VALUES(153,'','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','lhiggins@example.com','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','155','');
INSERT INTO "contacts" VALUES(154,'Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jeremyadams@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','156','');
INSERT INTO "contacts" VALUES(155,'Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','angelaadams@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','she/her/hers','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','156','');
INSERT INTO "contacts" VALUES(156,'','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','Home','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','157','');
INSERT INTO "contacts" VALUES(157,'','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','500.0','0.0','0.0','1.0','1.0','0.0','500.0','','','','','500.0','500.0','','','alanbaker@example.com','Personal','Home','Home','false','','','','Adult','','Friend','0683F0000005He7QAE','','Alan Baker','','','she/her/hers','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','157','155');
INSERT INTO "contacts" VALUES(158,'','Meredith','Cooke','meredithcooke@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','meredithcooke@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','62','');
INSERT INTO "contacts" VALUES(159,'','Mckayla','Morrison','mckaylamorrison@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mckaylamorrison@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','63','');
INSERT INTO "contacts" VALUES(160,'','Dalia','Osborn','daliaosborn@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','daliaosborn@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','64','');
INSERT INTO "contacts" VALUES(161,'','Tyrone','Pearson','tyronepearson@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tyronepearson@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','65','');
INSERT INTO "contacts" VALUES(162,'','Ariella','Branch','ariellabranch@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ariellabranch@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','66','');
INSERT INTO "contacts" VALUES(163,'','Jaydon','Bates','jaydonbates@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jaydonbates@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','67','');
INSERT INTO "contacts" VALUES(164,'','Javon','Rodgers','javonrodgers@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','javonrodgers@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','68','');
INSERT INTO "contacts" VALUES(165,'','Josie','Mcclure','josiemcclure@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','josiemcclure@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','69','');
INSERT INTO "contacts" VALUES(166,'','Cruz','Kerr','cruzkerr@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','cruzkerr@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','7','');
INSERT INTO "contacts" VALUES(167,'','Marcus','Huynh','marcushuynh@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marcushuynh@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','70','');
INSERT INTO "contacts" VALUES(168,'','Ayanna','Gonzalez','ayannagonzalez@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ayannagonzalez@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','71','');
INSERT INTO "contacts" VALUES(169,'','Taniya','Singleton','taniyasingleton@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','taniyasingleton@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','72','');
INSERT INTO "contacts" VALUES(170,'','Laura','Woodard','laurawoodard@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','laurawoodard@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','73','');
INSERT INTO "contacts" VALUES(171,'','Shane','Gibson','shanegibson@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','shanegibson@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','74','');
INSERT INTO "contacts" VALUES(172,'','Alia','Duarte','aliaduarte@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aliaduarte@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','75','');
INSERT INTO "contacts" VALUES(173,'','Neil','Huerta','neilhuerta@example.com','','','','','','','','','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','neilhuerta@example.com','Personal','Home','','false','','','','','','','','','','','','','false','','false','false','false','false','false','','','false','','','','','','','','','','0.0','76','');
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
	"MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "household_accounts" VALUES(1,'Johnson Household','','','','','','','555-248-3956','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(2,'Burgess Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(3,'Bass Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(4,'Bishop Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(5,'Cisneros Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(6,'Owen Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(7,'Kerr Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(8,'Crawford Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(9,'Eaton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(10,'Rasmussen Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(11,'Campos Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(12,'Bond Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(13,'Myers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(14,'Stanton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(15,'Woods Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(16,'Spence Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(17,'Webster Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(18,'Costa Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(19,'Humphrey Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(20,'Cain Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(21,'Dunlap Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(22,'Blackwell Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(23,'Irwin Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(24,'Hughes Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(25,'Wells Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(26,'Davila Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(27,'Barnett Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(28,'Norman Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(29,'Snow Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(30,'Wood Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(31,'Norton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(32,'Morgan Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(33,'Decker Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(34,'Lambert Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(35,'Barry Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(36,'Oneill Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(37,'Cooley Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(38,'Leach Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(39,'Pacheco Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(40,'Rivers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(41,'Griffith Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(42,'Glenn Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(43,'Francis Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(44,'Rhodes Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(45,'White Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(46,'Lang Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(47,'Ramirez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(48,'Serrano Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(49,'Galloway Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(50,'Clark Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(51,'Gonzales Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(52,'Cobb Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(53,'Shah Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(54,'Arroyo Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(55,'Booker Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(56,'Mercer Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(57,'Horton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(58,'Rios Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(59,'Craig Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(60,'Oliver Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(61,'Montgomery Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(62,'Cooke Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(63,'Morrison Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(64,'Osborn Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(65,'Pearson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(66,'Branch Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(67,'Bates Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(68,'Rodgers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(69,'Mcclure Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(70,'Huynh Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(71,'Gonzalez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(72,'Singleton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(73,'Woodard Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(74,'Gibson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(75,'Duarte Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(76,'Huerta Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(77,'Hernandez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(78,'Villegas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(79,'Velasquez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(80,'Hardin Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(81,'Bright Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(82,'Atkins Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(83,'Woods Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(84,'Stanley Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(85,'Fischer Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(86,'Kline Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(87,'Joyce Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(88,'Case Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(89,'Graves Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(90,'Wu Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(91,'Grant Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(92,'Rojas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(93,'Chase Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(94,'Holder Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(95,'Pollard Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(96,'Quinn Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(97,'Wilkinson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(98,'Keller Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(99,'Ellis Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(100,'Neal Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(101,'Mcconnell Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(102,'Arellano Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(103,'Glover Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(104,'Lutz Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(105,'Graves Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(106,'Carson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(107,'Fletcher Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(108,'Hernandez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(109,'Clayton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(110,'Richard Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(111,'Waller Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(112,'Hampton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(113,'Neal Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(114,'Gentry Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(115,'Barr Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(116,'Pham Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(117,'Cooley Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(118,'Zimmerman Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(119,'Wheeler Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(120,'Beltran Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(121,'Bird Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(122,'Duffy Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(123,'Woods Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(124,'Richards Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(125,'Valdez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(126,'Mills Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(127,'Greene Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(128,'Escobar Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(129,'Gross Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(130,'Guerrero Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(131,'Ritter Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(132,'Sims Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(133,'Huffman Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(134,'Hall Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(135,'Barker Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(136,'Glass Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(137,'Ibarra Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(138,'Morgan Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(139,'Bowers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(140,'Odom Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(141,'Flores Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(142,'Wall Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(143,'Waller Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(144,'Bray Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(145,'Conner Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(146,'Harper Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(147,'Aguilar Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(148,'Cummings Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(149,'Cardenas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(150,'Olson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(151,'Orr Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(152,'Salinas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(153,'Bullock Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(154,'Solomon Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(155,'Higgins Household','','','','','','','555-248-3956','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(156,'Adams Household','','','','','','','555-648-7204','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(157,'Baker Household','','','','','','','555-524-0749','','','','','','Household','','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','0.0','500.0','0.0','1.0','1.0','0.0','1.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(158,'Brooks and Graham Household','','','','','','','555-648-7204','','','','','','Household','','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','0.0','400.0','0.0','1.0','1.0','0.0','1.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(159,'Barnes Household','','','','','','','555-893-4763','','','','','','Household','','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','0.0','500.0','0.0','1.0','1.0','0.0','1.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(160,'Boyd Household','','','','','','','555-380-8532','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(161,'Burke Household','','','','','','','555-830-5295','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(162,'Henderson Household','','','','','','','555-830-5295','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(163,'Hill Household','','','','','','','555-395-9737','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(164,'Holmes Household','','','','','','','555-930-8759','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(165,'Jenkins Household','','','','','','','555-469-9873','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
CREATE TABLE npe4__relationships (
	id INTEGER NOT NULL, 
	"SYSTEM_SystemCreated__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	"Related_Opportunity_Contact_Role__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	related_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npe4__relationships" VALUES(1,'true','','Current','Son','','28','30');
INSERT INTO "npe4__relationships" VALUES(2,'true','','Current','Son','','29','30');
INSERT INTO "npe4__relationships" VALUES(3,'false','','Current','Mother','','30','28');
INSERT INTO "npe4__relationships" VALUES(4,'false','','Current','Father','','30','29');
INSERT INTO "npe4__relationships" VALUES(5,'true','','Current','Spouse','','88','90');
INSERT INTO "npe4__relationships" VALUES(6,'true','','Current','Parent','','89','90');
INSERT INTO "npe4__relationships" VALUES(7,'false','','Current','Husband','','90','88');
INSERT INTO "npe4__relationships" VALUES(8,'false','','Current','Daughter','','90','89');
INSERT INTO "npe4__relationships" VALUES(9,'false','','Current','Mother','','152','153');
INSERT INTO "npe4__relationships" VALUES(10,'true','','Current','Son','','153','152');
INSERT INTO "npe4__relationships" VALUES(11,'true','Arthur is Arlene''s recently deceased father.','Current','Child','','156','157');
INSERT INTO "npe4__relationships" VALUES(12,'false','Arthur is Arlene''s recently deceased father.','Current','Father','Tribute','157','156');
CREATE TABLE "npsp__OpportunityContactRole" (
	id INTEGER NOT NULL, 
	"Role" VARCHAR(255), 
	"IsPrimary" VARCHAR(255), 
	contact_id VARCHAR(255), 
	opportunity_id VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__OpportunityContactRole" VALUES(1,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(2,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(3,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(4,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(5,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(6,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(7,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(8,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(9,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(10,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(11,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(12,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(13,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(14,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(15,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(16,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(17,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(18,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(19,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(20,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(21,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(22,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(23,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(24,'Household Member','false','30','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(25,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(26,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(27,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(28,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(29,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(30,'Household Member','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(31,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(32,'Household Member','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(33,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(34,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(35,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(36,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(37,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(38,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(39,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(40,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(41,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(42,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(43,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(44,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(45,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(46,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(47,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(48,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(49,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(50,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(51,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(52,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(53,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(54,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(55,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(56,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(57,'Donor','true','157','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(58,'Donor','true','27','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(59,'Donor','true','28','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(60,'Tribute','false','156','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(61,'Household Member','false','26','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(62,'Household Member','false','29','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(63,'Household Member','false','30','3');
CREATE TABLE npsp__donations (
	id INTEGER NOT NULL, 
	"systemHouseholdContactRoleProcessor__c" VARCHAR(255), 
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
	account_id VARCHAR(255), 
	primary_contact__c VARCHAR(255), 
	honoree_contact__c VARCHAR(255), 
	notification_recipient_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__donations" VALUES(1,'All Opportunities','0035400000Hsa3XAAR','','','','','false','Arthur Baker Donation in Memoriam','','','Closed Won','','Closed','100.0','','','2019-09-02','500.0','false','','','Arlene Baker','Arthur Baker','','','','','','Memorial','Phone','','','To Be Acknowledged','','','','','','','','2019-09-06','','','','','false','false','false','157','157','156','157');
INSERT INTO "npsp__donations" VALUES(2,'All Opportunities','0035400000HtExuAAF','','','','','false','Darryl Graham 2019 In-Kind Donation','','','In-Kind Received','','Omitted','100.0','','','2019-08-05','400.0','false','','','','','','','','','<p>PSA Production for fundraising drive</p>','','','','Services','Acknowledged','','','','','','','','2019-08-09','','','800.0','','false','true','false','158','27','','');
INSERT INTO "npsp__donations" VALUES(3,'All Opportunities','0035400000HtEyZAAV','','','','','false','Lynn Barnes 1019 Donation','','','Closed Won','','Closed','100.0','','','2019-07-01','500.0','false','','','','','','','','','','','','','','Acknowledged','','','','','','','','2019-07-05','','','','','false','false','false','159','28','','');
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
	"MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "organization_accounts" VALUES(1,'Marble Foundation','','','','','','','555-389-74399','','','','','','Foundation','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','','Organization');
INSERT INTO "organization_accounts" VALUES(2,'Future Potential Fund','','','','','','','555-278-7643','','','','','','Foundation','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','','Organization');
INSERT INTO "organization_accounts" VALUES(3,'City Department of Human Services','','','','','','','','','','','','','Government','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','','false','','Organization');
CREATE TABLE "pmdm__ProgramCohort__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ProgramCohort__c" VALUES(1,'Eastgate','Eastgate neighborhood service area','','2019-02-01','Active','6');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(2,'Genellen','Genellen neighborhood service area','','2019-09-09','Active','4');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(3,'Riverside','Riverside neighborhood service area','','2019-02-01','Active','6');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(4,'Highpoint','Highpoint neighborhood service area','','2019-02-01','Active','6');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(5,'Fall 2019 STEM','','2019-12-20','2019-09-09','Active','4');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(6,'Job Readiness 2019-2021','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','2019-04-15','Active','2');

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

INSERT INTO "pmdm__ProgramEngagement__c" VALUES(1,'Mobile Middle School STEM Program - Taniyah Rios','','false','2019-12-20','Client','Active','2019-09-09','','82','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(2,'School Lunch Program - Alana Owen','2019-09-09','false','','Client','Active','2019-12-19','','85','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(3,'Mobile Middle School STEM Program - Alana Owen','','false','','Client','Active','2019-09-09','','85','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(4,'School Lunch Program - Naima Crawford','','false','','Client','Enrolled','2020-02-03','','4','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(5,'Mobile Middle School STEM Program - Naima Crawford','','false','2019-12-20','Client','Active','2019-09-09','','4','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(6,'After School Program, Ages 11-13 - Javon Rodgers','','false','','Client','Active','2019-10-01','','164','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(7,'No More Food Deserts Advocacy - Leon Clayton','','false','','Volunteer','Active','2019-09-10','','101','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(8,'No More Food Deserts Advocacy - Shannon Greene','','false','','Volunteer','Enrolled','2020-01-08','','121','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(9,'Remedial Reading Program - Marco Escobar','','false','','Client','Active','2019-09-09','','122','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(10,'After School Program, Ages 11-13 - Marco Escobar','','false','','Client','Active','2019-09-09','','122','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(11,'No More Food Deserts Advocacy - Marcus Huynh','','false','','Volunteer','Enrolled','2020-01-08','','167','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(12,'No More Food Deserts Advocacy - Zackery Morgan','','false','','Volunteer','Enrolled','2020-01-07','','131','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(13,'Drug and Alcohol Recovery Management - Zackery Morgan','','false','','Client','Active','2019-10-18','','131','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(14,'Mobile Middle School STEM Program - Ayanna Gonzalez','','false','2019-12-20','Client','Active','2019-09-09','','168','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(15,'Financial Literacy Program - Yusef Flores','','false','','Client','Active','2019-09-09','','135','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(16,'ESL Program - Yusef Flores','','false','','Client','Enrolled','2020-01-06','','135','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(17,'Financial Literacy Program - Semaj Wall','','false','','Client','Active','2019-09-09','','136','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(18,'ESL Program - Semaj Wall','','false','','Client','Active','2019-10-01','','136','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(19,'Financial Literacy Program - Frankie Waller','','false','','Client','Active','2019-12-01','','137','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(20,'No More Food Deserts Advocacy - Eliezer Bray','','false','','Volunteer','Enrolled','2020-02-08','','138','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(21,'Financial Literacy Program - Steven Harper','2019-09-10','false','','Client','Enrolled','2019-10-10','','140','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(22,'Financial Literacy Program - Lucia Cain','','false','','Client','Enrolled','2019-11-06','','40','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(23,'Financial Literacy Program - Alice Irwin','','false','','Client','Enrolled','2019-12-02','','45','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(24,'Remedial Reading Program - Fabian Hughes','2019-12-02','false','','Client','Enrolled','2019-12-19','','46','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(25,'School Lunch Program - Fabian Hughes','','false','','Client','Active','2019-09-09','','46','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(26,'After School Program, Ages 11-13 - Fabian Hughes','','false','','Client','Active','2019-09-09','','46','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(27,'No More Food Deserts Advocacy - Taniya Singleton','','false','','Volunteer','Enrolled','2019-12-02','','169','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(28,'Remedial Reading Program - Christina Webster','','false','','Client','Enrolled','2020-02-03','','42','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(29,'Remedial Reading Program - Emilie Costa','','false','','Client','Enrolled','2020-01-06','','43','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(30,'After School Program, Ages 11-13 - Emilie Costa','','false','','Client','Enrolled','2020-02-08','','43','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(31,'School Lunch Program - Abraham Sims','','false','','Client','Enrolled','2020-01-06','','125','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(32,'Mobile Middle School STEM Program - Abraham Sims','','false','','Client','Active','2019-09-09','','125','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(33,'Financial Literacy Program - Isaac Barker','','false','','Client','Active','2019-09-09','','128','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(34,'No More Food Deserts Advocacy - Marc Richard','','false','','Volunteer','Active','2019-08-12','','103','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(35,'Remedial Reading Program - Jordan Waller','','false','','Client','Active','2019-09-09','','104','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(36,'After School Program, Ages 11-13 - Jace Hampton','','false','','Client','Enrolled','2020-01-06','','119','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(37,'Housing Assistance Program - Dalia Osborn','','false','','Client','Enrolled','2020-01-06','','160','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(38,'School Lunch Program - Sonia Gentry','','false','','Client','Enrolled','2019-12-02','','105','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(39,'After School Program, Ages 11-13 - Sonia Gentry','','false','2019-12-20','Client','Active','2019-09-09','','105','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(40,'Drug and Alcohol Recovery Management - Alison Barr','','false','','Client','Enrolled','2019-02-04','','106','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(41,'After School Program, Ages 11-13 - Kellen Cooley','','false','','Client','Active','2019-12-02','','108','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(42,'No More Food Deserts Advocacy - Jay Zimmerman','','false','','Volunteer','Active','2019-11-12','','109','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(43,'Financial Literacy Program - Josie Mcclure','','false','','Client','Enrolled','2019-09-09','','165','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(44,'ESL Program - Fernando Beltran','','false','','Client','Enrolled','2019-12-02','','112','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(45,'Mobile Middle School STEM Program - Yuliana Bird','','false','2019-12-20','Client','Active','2019-09-09','','113','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(46,'Housing Assistance Program - James Richards','','false','','Client','Enrolled','2020-01-06','','116','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(47,'No More Food Deserts Advocacy - Aaron Valdez','','false','','Volunteer','Active','2019-10-02','','117','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(48,'No More Food Deserts Advocacy - John Mills','','false','','Volunteer','Active','2019-09-02','','118','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(49,'Job Readiness Program - Adrianna Norman','','false','','Client','Enrolled','2020-01-06','','50','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(50,'Mobile Middle School STEM Program - Jay Shah','','false','','Client','Enrolled','2019-12-02','','77','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(51,'Mobile Middle School STEM Program - Aubrie Booker','','false','','Client','Enrolled','2020-01-06','','79','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(52,'Mobile Middle School STEM Program - Jessica Woods','','false','2019-12-20','Client','Active','2019-09-09','','8','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(53,'Mobile Middle School STEM Program - Khloe Stanley','','false','','Client','Enrolled','2020-02-03','','9','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(54,'Housing Assistance Program - Nico Rivers','','false','','Client','Active','2019-09-19','','63','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(55,'Mobile Middle School STEM Program - Casey Kline','','false','2019-12-20','Client','Active','2019-09-09','','11','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(56,'Mobile Middle School STEM Program - Diego Case','','false','2019-12-20','Client','Active','2019-09-09','','13','4','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(57,'Mobile Middle School STEM Program - Tatiana Lang','','false','','Client','Enrolled','2020-01-06','','70','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(58,'Job Readiness Program - Gary Wood','','false','','Client','Active','2019-10-02','','62','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(59,'Housing Assistance Program - Jaylin Morgan','','false','','Client','Active','2019-09-24','','53','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(60,'Housing Assistance Program - Isaac Grant','','false','','Client','Active','2019-11-04','','17','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(61,'Housing Assistance Program - Hailie Holder','','false','','Client','Enrolled','2020-02-03','','20','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(62,'Financial Literacy Program - Jason Barnes','2019-08-23','false','','Client','Active','2019-09-09','','30','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(63,'After School Program, Ages 11-13 - Maya Johnson','','false','','Client','Enrolled','2019-12-02','','89','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(64,'ESL Program - Barbara Johnson','2019-07-03','false','','Client','Active','2019-09-09','','90','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(65,'Drug and Alcohol Recovery Management - Neil Huerta','','false','','Client','Enrolled','2019-01-08','','173','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(66,'Remedial Reading Program - Tom Higgins','2019-04-12','false','','Client','Active','2019-09-09','','152','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(67,'School Lunch Program - Tom Higgins','2019-06-08','false','','Client','Enrolled','2019-09-03','','152','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(68,'After School Program, Ages 11-13 - Tom Higgins','2019-08-29','false','','Client','Active','2019-09-03','','152','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(69,'ESL Program - Ariella Branch','','false','','Client','Enrolled','2020-02-03','','162','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(70,'Job Readiness Program - Anthony Hill','','false','','Client','Enrolled','2019-12-19','','35','2','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(71,'Housing Assistance Program - Emelia Mercer','','false','','Client','Active','2019-10-02','','80','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(72,'Job Readiness Program - Arlene Baker','2019-06-19','false','','Client','Active','2019-09-04','','157','2','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(73,'Job Readiness Program - Robin Brooks','2019-09-02','false','','Client','Active','2019-09-04','','26','2','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(74,'Drug and Alcohol Recovery Management - Robin Brooks','2019-08-24','false','','Client','Active','2019-09-03','','26','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(75,'Job Readiness Program - Joe Salinas','','false','','Client','Enrolled','2020-02-06','','149','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(76,'ESL Program - Samir Neal','','false','','Client','Active','2019-09-09','','92','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(77,'Housing Assistance Program - Angelo Lutz','','false','','Client','Enrolled','2019-12-02','','96','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(78,'Drug and Alcohol Recovery Management - Turner Carson','','false','','Client','Enrolled','2019-12-10','','98','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(79,'Housing Assistance Program - Tom Higgins','2019-05-25','false','','Client','Enrolled','2019-06-01','155','152','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(80,'Mobile Middle School STEM Program - Alia Duarte','','false','','Client','Active','2019-09-09','75','172','4','2');

CREATE TABLE "pmdm__Program__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"ProgramIssueArea__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"ShortSummary__c" VARCHAR(255), 
	"TargetPopulation__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Program__c" VALUES(1,'Remedial Reading Program','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','2020-05-15','Education','2019-06-03','Active','Provides students the support they need to achieve an age appropriate reading level.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(2,'Job Readiness Program','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','Employment','2019-04-15','Active','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce');
INSERT INTO "pmdm__Program__c" VALUES(3,'After School Program, Ages 11-13','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','2020-05-31','Education','2019-09-01','Active','An after school program for children enrolled in district 31.','Children aged 11-13 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(4,'Mobile Middle School STEM Program','The program focuses on bringing hands-on mid-level STEM courses into the classroom at least twice a week, and promotes awareness of the STEM fields and occupations. It provides standards-based structured inquiry-based and real-world problem-based learning, connecting all four of the STEM subjects, science, technology, engineering, and math. The goal is to pique students'' interest in them wanting to pursue the courses, not because they have to.','2020-05-15','Education','2019-09-09','Active','The program brings hands-on mid-level STEM courses into the classroom at least twice a week','Middle School students aged 11-14');
INSERT INTO "pmdm__Program__c" VALUES(5,'No More Food Deserts Advocacy','Advocacy program calling attention to and seeking remediation for the area''s lack of affordable grocery store options. This is an awareness-building campaign intended to garner support and funding for affordable alternatives from grantmakers and to be supported by the city and county councils.','','Advocacy','2019-08-01','Active','Calling attention to and seeking remediation for the area''s lack of affordable grocery store options.','Area residents, city and county government and grantmakers funding in the region.');
INSERT INTO "pmdm__Program__c" VALUES(6,'Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2019-12-31','','2019-01-01','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "pmdm__Program__c" VALUES(7,'Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2019-05-01','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "pmdm__Program__c" VALUES(8,'ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2020-05-30','','2019-09-09','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "pmdm__Program__c" VALUES(9,'Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','2019-12-13','Education','2019-09-04','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(10,'School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2020-05-30','Food and Nutrition','2019-09-03','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
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
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(1,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-12-06','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(2,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-15','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(3,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-11','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(4,'Frankie Waller - Financial Literacy Classroom Hours','false','2020-01-10','2.0','2','','137','19');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(5,'Lucia Cain - Financial Literacy Classroom Hours','false','2019-12-13','2.0','2','','40','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(6,'Lucia Cain - Financial Literacy Classroom Hours','false','2019-12-20','2.0','2','','40','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(7,'Lucia Cain - Financial Literacy Classroom Hours','false','2020-01-10','2.0','2','','40','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(8,'Lucia Cain - Financial Literacy Classroom Hours','false','2019-12-06','2.0','2','','40','22');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(9,'Alice Irwin - Financial Literacy Classroom Hours','false','2019-12-20','2.0','2','','45','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(10,'Alice Irwin - Financial Literacy Classroom Hours','false','2019-12-06','2.0','2','','45','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(11,'Alice Irwin - Financial Literacy Classroom Hours','false','2019-12-13','2.0','2','','45','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(12,'Alice Irwin - Financial Literacy Classroom Hours','false','2020-01-10','2.0','2','','45','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(13,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-10-04','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(14,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-09-27','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(15,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-08','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(16,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-15','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(17,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-29','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(18,'Jason Barnes - Financial Literacy Classroom Hours','false','2020-01-10','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(19,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-01','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(20,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-12-20','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(21,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-22','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(22,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-12-06','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(23,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-10-25','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(24,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-09-13','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(25,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-10-11','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(26,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-09-20','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(27,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-12-13','2.0','2','','30','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(28,'Naima Crawford - Subsidized Lunch','false','2019-12-11','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(29,'Naima Crawford - Subsidized Lunch','false','2019-12-05','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(30,'Kellen Cooley - After School Activities','false','2019-12-17','1.0','7','','108','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(31,'Kellen Cooley - After School Activities','false','2020-01-07','1.0','7','','108','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(32,'Maya Johnson - After School Activities','false','2019-12-13','2.0','7','','89','63');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(33,'Maya Johnson - After School Activities','false','2019-12-20','2.0','7','','89','63');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(34,'Maya Johnson - After School Activities','false','2019-12-06','2.0','7','','89','63');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(35,'Maya Johnson - After School Activities','false','2020-01-10','2.0','7','','89','63');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(36,'Tom Higgins - After School Activities','false','2019-09-13','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(37,'Tom Higgins - After School Activities','false','2019-10-18','2.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(38,'Tom Higgins - After School Activities','false','2019-11-08','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(39,'Tom Higgins - After School Activities','false','2019-11-01','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(40,'Tom Higgins - After School Activities','false','2019-09-27','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(41,'Tom Higgins - After School Activities','false','2019-10-25','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(42,'Tom Higgins - After School Activities','false','2019-11-29','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(43,'Tom Higgins - After School Activities','false','2020-01-10','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(44,'Tom Higgins - After School Activities','false','2019-12-13','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(45,'Tom Higgins - After School Activities','false','2019-12-20','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(46,'Tom Higgins - After School Activities','false','2019-09-20','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(47,'Tom Higgins - After School Activities','false','2019-10-04','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(48,'Tom Higgins - After School Activities','false','2019-10-11','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(49,'Tom Higgins - After School Activities','false','2019-11-22','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(50,'Tom Higgins - After School Activities','false','2019-11-15','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(51,'Tom Higgins - After School Activities','false','2019-12-06','4.0','7','','152','68');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(52,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(53,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(54,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(55,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(56,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(57,'Taniyah Rios - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(58,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(59,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-12-06','2.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(60,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-04','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(61,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-11','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(62,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-25','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(63,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-09-20','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(64,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-01','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(65,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-22','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(66,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(67,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-15','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(68,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-29','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(69,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-09-27','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(70,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-12-13','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(71,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-18','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(72,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-08','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(73,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-12-20','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(74,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-09-13','3.0','1','','122','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(75,'Fabian Hughes - Grade 1-8 Reading Tutoring','false','2019-12-20','1.0','1','','46','24');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(76,'Fabian Hughes - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','1','','46','24');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(77,'Emilie Costa - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','1','','43','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(78,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-09-20','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(79,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-10-04','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(80,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-09-27','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(81,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-12-06','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(82,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-10-11','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(83,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-08','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(84,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-22','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(85,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-12-13','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(86,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-01','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(87,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-15','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(88,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-29','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(89,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(90,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-09-13','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(91,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-10-25','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(92,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-12-20','3.0','1','','104','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(93,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-12-13','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(94,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-11','4.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(95,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-04','4.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(96,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-22','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(97,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-09-13','4.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(98,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-15','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(99,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-29','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(100,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(101,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-18','1.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(102,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-25','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(103,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-09-27','4.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(104,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-12-20','2.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(105,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-01','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(106,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-12-06','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(107,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-08','3.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(108,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-09-20','4.0','1','','152','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(109,'Leon Clayton - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','101','7');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(110,'Shannon Greene - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','121','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(111,'Marcus Huynh - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','167','11');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(112,'Zackery Morgan - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','131','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(113,'Eliezer Bray - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','138','20');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(114,'Taniya Singleton - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','169','27');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(115,'Marc Richard - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','103','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(116,'John Mills - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','10','','118','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(117,'Leon Clayton - Letter writing campaign to Council Members','false','2019-09-10','1.0','11','','101','7');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(118,'Shannon Greene - Letter writing campaign to Council Members','false','2020-01-08','1.0','11','','121','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(119,'Zackery Morgan - Letter writing campaign to Council Members','false','2020-01-07','1.0','11','','131','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(120,'Eliezer Bray - Letter writing campaign to Council Members','false','2020-01-08','1.0','11','','138','20');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(121,'Taniya Singleton - Letter writing campaign to Council Members','false','2019-12-02','1.0','11','','169','27');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(122,'Marc Richard - Letter writing campaign to Council Members','false','2019-08-12','1.0','11','','103','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(123,'Jay Zimmerman - Letter writing campaign to Council Members','false','2019-11-12','1.0','11','','109','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(124,'Aaron Valdez - Letter writing campaign to Council Members','false','2019-10-02','1.0','11','','117','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(125,'John Mills - Letter writing campaign to Council Members','false','2019-09-02','1.0','11','','118','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(126,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(127,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(128,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(129,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(130,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(131,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(132,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(133,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(134,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(135,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(136,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(137,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(138,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(139,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(140,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(141,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(142,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(143,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(144,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(145,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(146,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(147,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(148,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(149,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(150,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(151,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(152,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(153,'Naima Crawford - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(154,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(155,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(156,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(157,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-30','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(158,'Zackery Morgan - 12 Step Recovery Program','false','2019-10-29','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(159,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-05','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(160,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-12','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(161,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-03','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(162,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-10','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(163,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-19','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(164,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-26','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(165,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-24','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(166,'Zackery Morgan - 12 Step Recovery Program','false','2020-01-07','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(167,'Zackery Morgan - 12 Step Recovery Program','false','2020-01-07','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(168,'Zackery Morgan - 12 Step Recovery Program','false','2019-10-22','1.0','12','','131','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(169,'Neil Huerta - 12 Step Recovery Program','false','2020-01-13','1.0','12','','173','65');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(170,'Neil Huerta - 12 Step Recovery Program','false','2020-01-16','1.0','12','','173','65');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(171,'Robin Brooks - 12 Step Recovery Program','false','2019-10-08','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(172,'Robin Brooks - 12 Step Recovery Program','false','2019-10-15','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(173,'Robin Brooks - 12 Step Recovery Program','false','2019-12-30','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(174,'Robin Brooks - 12 Step Recovery Program','false','2019-10-22','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(175,'Robin Brooks - 12 Step Recovery Program','false','2019-12-10','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(176,'Robin Brooks - 12 Step Recovery Program','false','2019-11-05','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(177,'Robin Brooks - 12 Step Recovery Program','false','2019-12-03','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(178,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(179,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(180,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(181,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(182,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(183,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(184,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(185,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(186,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(187,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(188,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(189,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(190,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(191,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(192,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(193,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(194,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(195,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(196,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(197,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(198,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(199,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(200,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(201,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(202,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(203,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(204,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(205,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(206,'Robin Brooks - 12 Step Recovery Program','false','2019-12-17','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(207,'Robin Brooks - 12 Step Recovery Program','false','2019-09-03','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(208,'Robin Brooks - 12 Step Recovery Program','false','2019-09-10','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(209,'Robin Brooks - 12 Step Recovery Program','false','2019-09-17','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(210,'Robin Brooks - 12 Step Recovery Program','false','2019-09-24','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(211,'Robin Brooks - 12 Step Recovery Program','false','2020-01-07','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(212,'Robin Brooks - 12 Step Recovery Program','false','2019-10-29','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(213,'Robin Brooks - 12 Step Recovery Program','false','2019-11-19','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(214,'Robin Brooks - 12 Step Recovery Program','false','2019-11-26','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(215,'Robin Brooks - 12 Step Recovery Program','false','2019-12-24','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(216,'Robin Brooks - 12 Step Recovery Program','false','2020-01-14','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(217,'Robin Brooks - 12 Step Recovery Program','false','2019-10-01','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(218,'Robin Brooks - 12 Step Recovery Program','false','2019-11-12','1.0','12','','26','74');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(219,'Turner Carson - 12 Step Recovery Program','false','2019-12-30','1.0','12','','98','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(220,'Turner Carson - 12 Step Recovery Program','false','2020-01-07','1.0','12','','98','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(221,'Turner Carson - 12 Step Recovery Program','false','2019-12-17','1.0','12','','98','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(222,'Turner Carson - 12 Step Recovery Program','false','2019-12-24','1.0','12','','98','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(223,'Turner Carson - 12 Step Recovery Program','false','2019-12-10','1.0','12','','98','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(224,'Angelo Lutz - Monthly Rent Subsidy','false','2020-01-13','250.0','13','104','96','77');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(225,'Angelo Lutz - Monthly Rent Subsidy','false','2019-12-16','250.0','13','104','96','77');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(226,'James Richards - Monthly Rent Subsidy','false','2020-01-13','200.0','13','124','116','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(227,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-10-15','150.0','13','32','53','59');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(228,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-12-13','150.0','13','32','53','59');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(229,'Jaylin Morgan - Monthly Rent Subsidy','false','2020-01-13','150.0','13','32','53','59');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(230,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-11-15','150.0','13','32','53','59');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(231,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-09-24','150.0','13','32','53','59');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(232,'Nico Rivers - Monthly Rent Subsidy','false','2019-10-15','175.0','13','40','63','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(233,'Nico Rivers - Monthly Rent Subsidy','false','2020-01-13','175.0','13','40','63','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(234,'Nico Rivers - Monthly Rent Subsidy','false','2019-12-13','175.0','13','40','63','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(235,'Naima Crawford - Subsidized Lunch','false','2019-12-09','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(236,'Naima Crawford - Subsidized Lunch','false','2019-12-03','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(237,'Naima Crawford - Subsidized Lunch','false','2019-12-02','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(238,'Naima Crawford - Subsidized Lunch','false','2019-12-04','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(239,'Naima Crawford - Subsidized Lunch','false','2019-12-06','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(240,'Naima Crawford - Subsidized Lunch','false','2019-12-12','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(241,'Naima Crawford - Subsidized Lunch','false','2019-12-10','1.0','3','','4','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(242,'Fabian Hughes - Subsidized Lunch','false','2019-09-10','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(243,'Fabian Hughes - Subsidized Lunch','false','2019-09-20','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(244,'Fabian Hughes - Subsidized Lunch','false','2019-09-09','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(245,'Fabian Hughes - Subsidized Lunch','false','2019-09-11','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(246,'Fabian Hughes - Subsidized Lunch','false','2019-09-17','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(247,'Fabian Hughes - Subsidized Lunch','false','2019-09-23','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(248,'Fabian Hughes - Subsidized Lunch','false','2019-09-12','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(249,'Fabian Hughes - Subsidized Lunch','false','2019-09-13','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(250,'Fabian Hughes - Subsidized Lunch','false','2019-09-16','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(251,'Fabian Hughes - Subsidized Lunch','false','2019-09-18','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(252,'Fabian Hughes - Subsidized Lunch','false','2019-09-19','1.0','3','','46','25');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(253,'Abraham Sims - Subsidized Lunch','false','2020-01-07','','3','','125','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(254,'Abraham Sims - Subsidized Lunch','false','2020-01-10','','3','','125','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(255,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(256,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(257,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(258,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(259,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(260,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(261,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(262,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(263,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(264,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(265,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(266,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(267,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(268,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(269,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(270,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(271,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(272,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(273,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(274,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(275,'Yuliana Bird - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(276,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(277,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(278,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(279,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(280,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(281,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(282,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(283,'Nico Rivers - Monthly Rent Subsidy','false','2019-12-19','175.0','13','40','63','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(284,'Nico Rivers - Monthly Rent Subsidy','false','2019-11-15','175.0','13','40','63','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(285,'Emelia Mercer - Monthly Rent Subsidy','false','2019-11-15','200.0','13','56','80','71');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(286,'Emelia Mercer - Monthly Rent Subsidy','false','2019-10-15','200.0','13','56','80','71');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(287,'Emelia Mercer - Monthly Rent Subsidy','false','2020-01-13','200.0','13','56','80','71');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(288,'Emelia Mercer - Monthly Rent Subsidy','false','2019-12-13','200.0','13','56','80','71');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(289,'Dalia Osborn - Monthly Rent Subsidy','false','2020-01-13','400.0','13','64','160','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(290,'Isaac Grant - Monthly Rent Subsidy','false','2019-11-15','250.0','13','91','17','60');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(291,'Isaac Grant - Monthly Rent Subsidy','false','2020-01-13','250.0','13','91','17','60');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(292,'Isaac Grant - Monthly Rent Subsidy','false','2019-12-13','250.0','13','91','17','60');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(293,'Yusef Flores - ESL Classroom Hours','false','2020-01-07','2.0','14','','135','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(294,'Yusef Flores - ESL Classroom Hours','false','2020-01-09','2.0','14','','135','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(295,'Semaj Wall - ESL Classroom Hours','false','2019-11-12','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(296,'Semaj Wall - ESL Classroom Hours','false','2019-12-12','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(297,'Semaj Wall - ESL Classroom Hours','false','2020-01-09','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(298,'Semaj Wall - ESL Classroom Hours','false','2019-11-21','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(299,'Semaj Wall - ESL Classroom Hours','false','2019-10-22','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(300,'Semaj Wall - ESL Classroom Hours','false','2019-10-17','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(301,'Semaj Wall - ESL Classroom Hours','false','2019-11-07','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(302,'Semaj Wall - ESL Classroom Hours','false','2019-10-01','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(303,'Semaj Wall - ESL Classroom Hours','false','2019-12-10','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(304,'Semaj Wall - ESL Classroom Hours','false','2019-12-19','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(305,'Semaj Wall - ESL Classroom Hours','false','2019-10-15','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(306,'Semaj Wall - ESL Classroom Hours','false','2019-10-31','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(307,'Semaj Wall - ESL Classroom Hours','false','2019-11-19','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(308,'Semaj Wall - ESL Classroom Hours','false','2019-12-05','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(309,'Semaj Wall - ESL Classroom Hours','false','2019-10-08','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(310,'Semaj Wall - ESL Classroom Hours','false','2019-10-29','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(311,'Semaj Wall - ESL Classroom Hours','false','2019-11-05','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(312,'Semaj Wall - ESL Classroom Hours','false','2019-11-14','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(313,'Abraham Sims - Subsidized Lunch','false','2020-01-06','','3','','125','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(314,'Abraham Sims - Subsidized Lunch','false','2020-01-09','','3','','125','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(315,'Abraham Sims - Subsidized Lunch','false','2020-01-13','','3','','125','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(316,'Abraham Sims - Subsidized Lunch','false','2020-01-08','','3','','125','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(317,'Sonia Gentry - Subsidized Lunch','false','2019-12-03','','3','','105','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(318,'Sonia Gentry - Subsidized Lunch','false','2019-12-02','','3','','105','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(319,'Sonia Gentry - Subsidized Lunch','false','2019-12-02','','3','','105','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(320,'Tom Higgins - Subsidized Lunch','false','2019-10-01','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(321,'Tom Higgins - Subsidized Lunch','false','2019-11-05','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(322,'Tom Higgins - Subsidized Lunch','false','2019-11-06','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(323,'Tom Higgins - Subsidized Lunch','false','2019-11-04','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(324,'Tom Higgins - Subsidized Lunch','false','2019-11-12','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(325,'Tom Higgins - Subsidized Lunch','false','2019-11-07','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(326,'Tom Higgins - Subsidized Lunch','false','2019-10-14','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(327,'Tom Higgins - Subsidized Lunch','false','2019-11-06','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(328,'Tom Higgins - Subsidized Lunch','false','2019-11-11','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(329,'Tom Higgins - Subsidized Lunch','false','2019-10-09','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(330,'Tom Higgins - Subsidized Lunch','false','2019-11-01','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(331,'Tom Higgins - Subsidized Lunch','false','2019-10-03','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(332,'Tom Higgins - Subsidized Lunch','false','2019-11-14','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(333,'Tom Higgins - Subsidized Lunch','false','2019-10-04','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(334,'Tom Higgins - Subsidized Lunch','false','2019-10-07','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(335,'Tom Higgins - Subsidized Lunch','false','2019-11-13','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(336,'Tom Higgins - Subsidized Lunch','false','2019-11-08','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(337,'Tom Higgins - Subsidized Lunch','false','2019-10-08','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(338,'Tom Higgins - Subsidized Lunch','false','2019-10-10','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(339,'Tom Higgins - Subsidized Lunch','false','2019-10-11','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(340,'Tom Higgins - Subsidized Lunch','false','2019-10-02','1.0','3','','152','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(341,'Arlene Baker - Job Interviews completed','false','2019-10-11','1.0','4','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(342,'Arlene Baker - Job Interviews completed','false','2019-10-15','2.0','4','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(343,'Gary Wood - Financial Advisor Sessions','false','2019-10-02','0.5','5','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(344,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(345,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(346,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(347,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(348,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(349,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(350,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(351,'Jessica Woods - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(352,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(353,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(354,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(355,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(356,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(357,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(358,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(359,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(360,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(361,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(362,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(363,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(364,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(365,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(366,'Alia Duarte - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(367,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(368,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(369,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(370,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(371,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(372,'Semaj Wall - ESL Classroom Hours','false','2019-12-17','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(373,'Semaj Wall - ESL Classroom Hours','false','2020-01-07','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(374,'Semaj Wall - ESL Classroom Hours','false','2019-11-26','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(375,'Semaj Wall - ESL Classroom Hours','false','2019-10-03','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(376,'Semaj Wall - ESL Classroom Hours','false','2019-10-10','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(377,'Semaj Wall - ESL Classroom Hours','false','2019-10-24','2.0','14','','136','18');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(378,'Fernando Beltran - ESL Classroom Hours','false','2019-12-19','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(379,'Fernando Beltran - ESL Classroom Hours','false','2020-01-09','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(380,'Fernando Beltran - ESL Classroom Hours','false','2019-12-10','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(381,'Fernando Beltran - ESL Classroom Hours','false','2019-12-12','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(382,'Fernando Beltran - ESL Classroom Hours','false','2019-12-05','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(383,'Fernando Beltran - ESL Classroom Hours','false','2020-01-07','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(384,'Fernando Beltran - ESL Classroom Hours','false','2019-12-17','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(385,'Fernando Beltran - ESL Classroom Hours','false','2019-12-03','2.0','14','','112','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(386,'Barbara Johnson - ESL Classroom Hours','false','2019-09-05','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(387,'Barbara Johnson - ESL Classroom Hours','false','2019-10-29','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(388,'Barbara Johnson - ESL Classroom Hours','false','2019-11-12','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(389,'Barbara Johnson - ESL Classroom Hours','false','2019-11-26','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(390,'Barbara Johnson - ESL Classroom Hours','false','2019-09-24','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(391,'Barbara Johnson - ESL Classroom Hours','false','2019-12-05','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(392,'Barbara Johnson - ESL Classroom Hours','false','2019-12-12','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(393,'Barbara Johnson - ESL Classroom Hours','false','2019-10-22','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(394,'Barbara Johnson - ESL Classroom Hours','false','2019-11-05','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(395,'Barbara Johnson - ESL Classroom Hours','false','2019-11-19','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(396,'Barbara Johnson - ESL Classroom Hours','false','2019-11-21','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(397,'Barbara Johnson - ESL Classroom Hours','false','2019-09-10','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(398,'Barbara Johnson - ESL Classroom Hours','false','2019-10-24','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(399,'Barbara Johnson - ESL Classroom Hours','false','2019-11-14','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(400,'Barbara Johnson - ESL Classroom Hours','false','2019-09-19','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(401,'Barbara Johnson - ESL Classroom Hours','false','2019-12-19','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(402,'Gary Wood - Financial Advisor Sessions','false','2019-11-04','0.5','5','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(403,'Gary Wood - Financial Advisor Sessions','true','2020-01-02','0.5','5','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(404,'Gary Wood - Financial Advisor Sessions','true','2019-12-03','0.5','5','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(405,'Gary Wood - Financial Advisor Sessions','true','2020-01-02','0.5','5','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(406,'Arlene Baker - Financial Advisor Sessions','false','2019-09-05','0.5','5','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(407,'Arlene Baker - Financial Advisor Sessions','false','2019-12-04','0.5','5','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(408,'Arlene Baker - Financial Advisor Sessions','false','2019-10-07','0.5','5','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(409,'Arlene Baker - Financial Advisor Sessions','false','2019-11-05','0.5','5','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(410,'Arlene Baker - Financial Advisor Sessions','false','2020-01-06','0.5','5','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(411,'Robin Brooks - Financial Advisor Sessions','false','2019-10-07','0.5','5','','26','73');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(412,'Robin Brooks - Financial Advisor Sessions','false','2019-11-04','0.5','5','','26','73');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(413,'Robin Brooks - Financial Advisor Sessions','false','2019-09-09','0.5','5','','26','73');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(414,'Adrianna Norman - Job Readiness Coaching','false','2020-01-07','1.0','6','','50','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(415,'Gary Wood - Job Readiness Coaching','false','2019-12-20','0.75','6','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(416,'Gary Wood - Job Readiness Coaching','false','2019-11-21','0.75','6','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(417,'Gary Wood - Job Readiness Coaching','false','2019-10-25','0.75','6','','62','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(418,'Arlene Baker - Job Readiness Coaching','false','2019-11-27','0.5','6','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(419,'Arlene Baker - Job Readiness Coaching','false','2019-11-29','0.75','6','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(420,'Arlene Baker - Job Readiness Coaching','false','2019-09-25','0.75','6','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(421,'Arlene Baker - Job Readiness Coaching','false','2019-10-30','0.75','6','','157','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(422,'Robin Brooks - Job Readiness Coaching','false','2019-12-20','0.75','6','','26','73');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(423,'Robin Brooks - Job Readiness Coaching','false','2019-10-28','0.75','6','','26','73');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(424,'Robin Brooks - Job Readiness Coaching','false','2019-09-27','0.75','6','','26','73');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(425,'Javon Rodgers - After School Activities','false','2019-10-29','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(426,'Javon Rodgers - After School Activities','false','2019-10-15','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(427,'Javon Rodgers - After School Activities','false','2019-10-22','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(428,'Javon Rodgers - After School Activities','false','2019-10-01','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(429,'Javon Rodgers - After School Activities','false','2019-11-05','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(430,'Javon Rodgers - After School Activities','false','2019-12-10','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(431,'Javon Rodgers - After School Activities','false','2020-01-07','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(432,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(433,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(434,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(435,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(436,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(437,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(438,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(439,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(440,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(441,'Casey Kline - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(442,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-11','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(443,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-16','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(444,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-23','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(445,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-30','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(446,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-18','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(447,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-25','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(448,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-09','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(449,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-11','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(450,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-18','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(451,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-06','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(452,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-13','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(453,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-20','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(454,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-04','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(455,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-02','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(456,'Diego Case - Middle School STEM Classroom Hours','false','2020-01-08','2.0','8','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(457,'Taniyah Rios - STEM Field Trips','false','2019-11-25','1.0','9','','82','1');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(458,'Alana Owen - STEM Field Trips','false','2019-11-25','1.0','9','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(459,'Alana Owen - STEM Field Trips','false','2019-11-25','','9','','85','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(460,'Naima Crawford - STEM Field Trips','false','2019-11-25','1.0','9','','4','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(461,'Barbara Johnson - ESL Classroom Hours','false','2019-10-10','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(462,'Barbara Johnson - ESL Classroom Hours','false','2019-12-17','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(463,'Barbara Johnson - ESL Classroom Hours','false','2020-01-09','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(464,'Barbara Johnson - ESL Classroom Hours','false','2019-10-01','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(465,'Barbara Johnson - ESL Classroom Hours','false','2019-10-31','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(466,'Barbara Johnson - ESL Classroom Hours','false','2019-11-07','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(467,'Barbara Johnson - ESL Classroom Hours','false','2019-10-08','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(468,'Barbara Johnson - ESL Classroom Hours','false','2019-09-03','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(469,'Barbara Johnson - ESL Classroom Hours','false','2019-09-26','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(470,'Barbara Johnson - ESL Classroom Hours','false','2019-09-12','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(471,'Barbara Johnson - ESL Classroom Hours','false','2019-10-03','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(472,'Barbara Johnson - ESL Classroom Hours','false','2019-10-17','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(473,'Barbara Johnson - ESL Classroom Hours','false','2019-10-15','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(474,'Barbara Johnson - ESL Classroom Hours','false','2019-12-03','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(475,'Barbara Johnson - ESL Classroom Hours','false','2019-09-17','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(476,'Barbara Johnson - ESL Classroom Hours','false','2019-12-10','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(477,'Barbara Johnson - ESL Classroom Hours','false','2020-01-07','2.0','14','','90','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(478,'Samir Neal - ESL Classroom Hours','false','2019-10-17','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(479,'Samir Neal - ESL Classroom Hours','false','2019-10-24','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(480,'Samir Neal - ESL Classroom Hours','false','2019-11-19','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(481,'Samir Neal - ESL Classroom Hours','false','2019-10-22','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(482,'Samir Neal - ESL Classroom Hours','false','2020-01-07','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(483,'Samir Neal - ESL Classroom Hours','false','2019-10-10','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(484,'Samir Neal - ESL Classroom Hours','false','2019-09-12','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(485,'Samir Neal - ESL Classroom Hours','false','2019-12-19','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(486,'Samir Neal - ESL Classroom Hours','false','2020-01-09','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(487,'Samir Neal - ESL Classroom Hours','false','2019-10-29','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(488,'Samir Neal - ESL Classroom Hours','false','2019-10-31','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(489,'Samir Neal - ESL Classroom Hours','false','2019-11-07','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(490,'Samir Neal - ESL Classroom Hours','false','2019-11-21','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(491,'Javon Rodgers - After School Activities','false','2019-10-08','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(492,'Javon Rodgers - After School Activities','false','2019-11-26','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(493,'Javon Rodgers - After School Activities','false','2019-12-17','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(494,'Javon Rodgers - After School Activities','false','2019-12-03','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(495,'Javon Rodgers - After School Activities','false','2019-11-12','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(496,'Javon Rodgers - After School Activities','false','2019-11-19','1.0','7','','164','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(497,'Marco Escobar - After School Activities','false','2019-10-04','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(498,'Marco Escobar - After School Activities','false','2019-09-20','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(499,'Marco Escobar - After School Activities','false','2019-10-25','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(500,'Marco Escobar - After School Activities','false','2019-12-13','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(501,'Marco Escobar - After School Activities','false','2019-12-20','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(502,'Marco Escobar - After School Activities','false','2019-09-13','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(503,'Marco Escobar - After School Activities','false','2019-11-01','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(504,'Marco Escobar - After School Activities','false','2019-11-22','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(505,'Marco Escobar - After School Activities','false','2019-09-27','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(506,'Marco Escobar - After School Activities','false','2019-10-18','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(507,'Marco Escobar - After School Activities','false','2019-10-11','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(508,'Marco Escobar - After School Activities','false','2020-01-10','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(509,'Marco Escobar - After School Activities','false','2019-11-15','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(510,'Marco Escobar - After School Activities','false','2019-11-29','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(511,'Marco Escobar - After School Activities','false','2019-11-08','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(512,'Marco Escobar - After School Activities','false','2019-12-06','1.0','7','','122','10');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(513,'Fabian Hughes - After School Activities','false','2019-09-13','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(514,'Fabian Hughes - After School Activities','false','2019-10-25','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(515,'Fabian Hughes - After School Activities','false','2019-11-22','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(516,'Fabian Hughes - After School Activities','false','2019-10-11','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(517,'Fabian Hughes - After School Activities','false','2020-01-10','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(518,'Fabian Hughes - After School Activities','false','2019-11-15','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(519,'Fabian Hughes - After School Activities','false','2019-09-20','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(520,'Fabian Hughes - After School Activities','false','2019-09-27','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(521,'Ayanna Gonzalez - STEM Field Trips','false','2019-11-25','1.0','9','','168','14');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(522,'Abraham Sims - STEM Field Trips','false','2019-11-25','1.0','9','','125','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(523,'Yuliana Bird - STEM Field Trips','false','2019-11-25','1.0','9','','113','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(524,'Jessica Woods - STEM Field Trips','false','2019-11-25','1.0','9','','8','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(525,'Alia Duarte - STEM Field Trips','false','2019-11-25','1.0','9','','172','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(526,'Casey Kline - STEM Field Trips','false','2019-11-25','1.0','9','','11','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(527,'Diego Case - STEM Field Trips','false','2019-11-25','1.0','9','','13','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(528,'Samir Neal - ESL Classroom Hours','false','2019-09-10','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(529,'Samir Neal - ESL Classroom Hours','false','2019-09-24','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(530,'Samir Neal - ESL Classroom Hours','false','2019-09-26','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(531,'Samir Neal - ESL Classroom Hours','false','2019-12-03','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(532,'Samir Neal - ESL Classroom Hours','false','2019-12-12','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(533,'Samir Neal - ESL Classroom Hours','false','2019-10-01','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(534,'Samir Neal - ESL Classroom Hours','false','2019-11-05','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(535,'Samir Neal - ESL Classroom Hours','false','2019-09-17','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(536,'Samir Neal - ESL Classroom Hours','false','2019-11-12','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(537,'Samir Neal - ESL Classroom Hours','false','2019-12-05','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(538,'Samir Neal - ESL Classroom Hours','false','2019-10-08','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(539,'Samir Neal - ESL Classroom Hours','false','2019-11-14','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(540,'Samir Neal - ESL Classroom Hours','false','2019-10-15','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(541,'Samir Neal - ESL Classroom Hours','false','2019-11-26','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(542,'Samir Neal - ESL Classroom Hours','false','2019-12-10','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(543,'Samir Neal - ESL Classroom Hours','false','2019-09-19','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(544,'Samir Neal - ESL Classroom Hours','false','2019-12-17','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(545,'Samir Neal - ESL Classroom Hours','false','2019-10-03','2.0','14','','92','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(546,'Semaj Wall - Financial Literacy Classroom Hours','false','2020-01-10','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(547,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-25','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(548,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-09-13','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(549,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-12-13','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(550,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-09-20','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(551,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-01','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(552,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-09-27','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(553,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-08','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(554,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-22','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(555,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-12-20','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(556,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-04','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(557,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-18','2.0','2','','136','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(558,'Fabian Hughes - After School Activities','false','2019-10-04','1.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(559,'Fabian Hughes - After School Activities','false','2019-11-01','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(560,'Fabian Hughes - After School Activities','false','2019-10-18','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(561,'Fabian Hughes - After School Activities','false','2019-12-20','1.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(562,'Fabian Hughes - After School Activities','false','2019-11-08','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(563,'Fabian Hughes - After School Activities','false','2019-12-06','3.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(564,'Fabian Hughes - After School Activities','false','2019-12-13','2.0','7','','46','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(565,'Emilie Costa - After School Activities','false','2020-01-10','2.0','7','','43','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(566,'Jace Hampton - After School Activities','false','2020-01-07','1.0','7','','119','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(567,'Sonia Gentry - After School Activities','false','2019-11-20','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(568,'Sonia Gentry - After School Activities','false','2019-10-10','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(569,'Sonia Gentry - After School Activities','false','2019-10-31','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(570,'Sonia Gentry - After School Activities','false','2019-11-14','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(571,'Sonia Gentry - After School Activities','false','2019-10-24','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(572,'Sonia Gentry - After School Activities','false','2019-11-06','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(573,'Sonia Gentry - After School Activities','false','2019-12-05','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(574,'Sonia Gentry - After School Activities','false','2019-11-13','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(575,'Sonia Gentry - After School Activities','false','2019-12-04','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(576,'Sonia Gentry - After School Activities','false','2019-12-12','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(577,'Sonia Gentry - After School Activities','false','2019-12-18','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(578,'Sonia Gentry - After School Activities','false','2019-10-16','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(579,'Sonia Gentry - After School Activities','false','2019-11-21','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(580,'Sonia Gentry - After School Activities','false','2019-10-17','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(581,'Sonia Gentry - After School Activities','false','2019-10-30','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(582,'Sonia Gentry - After School Activities','false','2019-12-11','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(583,'Sonia Gentry - After School Activities','false','2019-12-19','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(584,'Sonia Gentry - After School Activities','false','2019-10-09','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(585,'Sonia Gentry - After School Activities','false','2019-10-23','1.0','7','','105','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(586,'Kellen Cooley - After School Activities','false','2019-12-10','1.0','7','','108','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(587,'Kellen Cooley - After School Activities','false','2019-12-03','1.0','7','','108','41');
CREATE TABLE "pmdm__Service__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"UnitOfMeasurement__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Service__c" VALUES(1,'Grade 1-8 Reading Tutoring','Grade 1-8 Reading Tutoring','Active','Hours','1');
INSERT INTO "pmdm__Service__c" VALUES(2,'Financial Literacy Classroom Hours','Financial Literacy Classroom Hours','Active','Hours','9');
INSERT INTO "pmdm__Service__c" VALUES(3,'Subsidized Lunch','','Active','Lunches','10');
INSERT INTO "pmdm__Service__c" VALUES(4,'Job Interviews completed','','Active','Completed Interviews','2');
INSERT INTO "pmdm__Service__c" VALUES(5,'Financial Advisor Sessions','','Active','Hours','2');
INSERT INTO "pmdm__Service__c" VALUES(6,'Job Readiness Coaching','','Active','Hours','2');
INSERT INTO "pmdm__Service__c" VALUES(7,'After School Activities','Indoor/Outdoor After-School Activities','Active','Sessions','3');
INSERT INTO "pmdm__Service__c" VALUES(8,'Middle School STEM Classroom Hours','','Active','Hours','4');
INSERT INTO "pmdm__Service__c" VALUES(9,'STEM Field Trips','','Active','Field Trips','4');
INSERT INTO "pmdm__Service__c" VALUES(10,'Town Hall Meeting, 1/8/2020','','Active','Attendees','5');
INSERT INTO "pmdm__Service__c" VALUES(11,'Letter writing campaign to Council Members','','Active','Letters','5');
INSERT INTO "pmdm__Service__c" VALUES(12,'12 Step Recovery Program','12 Step Recovery Program','Active','Session','6');
INSERT INTO "pmdm__Service__c" VALUES(13,'Monthly Rent Subsidy','Monthly Rent Subsidy - sliding scale','Active','Dollars','7');
INSERT INTO "pmdm__Service__c" VALUES(14,'ESL Classroom Hours','ESL Classroom Hours','Active','Hours','8');
COMMIT;
