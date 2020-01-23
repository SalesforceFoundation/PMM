BEGIN TRANSACTION;
CREATE TABLE "Account__Branch" (
	id INTEGER NOT NULL, 
	"AccountNumber" VARCHAR(255), 
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
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account__Branch" VALUES(1,'127th Street Community Center','127th Street Community Center','','','','','','','555-398-2090','','','','','','1500.0','Branch');
CREATE TABLE "Account__HH_Account" (
	id INTEGER NOT NULL, 
	"AccountNumber" VARCHAR(255), 
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
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account__HH_Account" VALUES(1,'Higgins Household','Higgins Household','','','','','','','555-248-3956','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(2,'Adams Household','Adams Household','','','','','','','555-648-7204','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(3,'Baker Household','Baker Household','','','','','','','555-524-0749','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(4,'Banks and Graham Household','Banks and Graham Household','','','','','','','555-648-7204','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(5,'Barnes Household','Barnes Household','','','','','','','555-893-4763','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(6,'Boyd Household','Boyd Household','','','','','','','555-380-8532','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(7,'Burke Household','Burke Household','','','','','','','555-830-5295','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(8,'Henderson Household','Henderson Household','','','','','','','555-830-5295','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(9,'Hill Household','Hill Household','','','','','','','555-395-9737','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(10,'Holmes Household','Holmes Household','','','','','','','555-930-8759','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(11,'Jenkins Household','Jenkins Household','','','','','','','555-469-9873','','','','','Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(12,'Johnson Household','Johnson Household','','','','','','','555-248-3956','','','','','Household','','HH_Account');
CREATE TABLE "Account__Organization" (
	id INTEGER NOT NULL, 
	"AccountNumber" VARCHAR(255), 
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
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account__Organization" VALUES(1,'Marble Foundation','Marble Foundation','','','','','','','555-389-74399','','','','','Foundation','','Organization');
INSERT INTO "Account__Organization" VALUES(2,'Future Potential Fund','Future Potential Fund','','','','','','','555-278-7643','','','','','Foundation','','Organization');
INSERT INTO "Account__Organization" VALUES(3,'City Department of Human Services','City Department of Human Services','','','','','','','','','','','','Government','','Organization');
CREATE TABLE "Case__ClientCase" (
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
INSERT INTO "Case__ClientCase" VALUES(1,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','1','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(2,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','1','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(3,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','1','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(4,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','1','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(5,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','6','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(6,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','7','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(7,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','11','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(8,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','20','ClientCase');
CREATE TABLE "Case__Incident" (
	id INTEGER NOT NULL, 
	subject VARCHAR(255), 
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
INSERT INTO "Case__Incident" VALUES(1,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','1','1','Incident');
INSERT INTO "Case__Incident" VALUES(2,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','1','1','Incident');
INSERT INTO "Case__Incident" VALUES(3,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','1','Incident');
INSERT INTO "Case__Incident" VALUES(4,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','1','Incident');
INSERT INTO "Case__Incident" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','1','1','Incident');
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"Email" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Salutation" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"MobilePhone" VARCHAR(255), 
	"OtherPhone" VARCHAR(255), 
	"HomePhone" VARCHAR(255), 
	"Title" VARCHAR(255), 
	"Birthdate" VARCHAR(255), 
	"MailingStreet" VARCHAR(255), 
	"MailingCity" VARCHAR(255), 
	"MailingState" VARCHAR(255), 
	"MailingPostalCode" VARCHAR(255), 
	"MailingCountry" VARCHAR(255), 
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
INSERT INTO "Contact" VALUES(1,'thiggins@example.com','Tom','Higgins','','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','Child','','Mother','06817000000VpmvAAC','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2020-01-23','1','2');
INSERT INTO "Contact" VALUES(2,'lhiggins@example.com','Lisa','Higgins','','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','','','','','','','','','','','false','','1','');
INSERT INTO "Contact" VALUES(3,'angelaadams@example.com','Angela','Adams','Rev.','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','she/her/hers','Client;Donor;Volunteer','false','','2','');
INSERT INTO "Contact" VALUES(4,'jeremyadams@example.com','Jeremy','Adams','Dr.','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','Client','false','','2','');
INSERT INTO "Contact" VALUES(5,'','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','','','','','','','','','','','false','','3','');
INSERT INTO "Contact" VALUES(6,'alanbaker@example.com','Arlene','Baker','','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','Adult','','Friend','06817000000Vpn0AAC','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','3','3');
INSERT INTO "Contact" VALUES(7,'robinbanks@example.com','Robin','Banks','','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','Adult','','Partner','06817000000VpnFAAS','','','','','she/her/hers','Client','true','2020-01-23','4','8');
INSERT INTO "Contact" VALUES(8,'darrylgraham@example.com','Darryl','Graham','','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','','','','','','','','','','','false','','4','');
INSERT INTO "Contact" VALUES(9,'lynnbarnes@example.com','Lynn','Barnes','','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','false','','5','');
INSERT INTO "Contact" VALUES(10,'davidbarnes@example.com','David','Barnes','','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','false','','5','');
INSERT INTO "Contact" VALUES(11,'jasonbarnes@example.com','Jason','Barnes','','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','Youth','88841515','Mother','06817000000Vpn5AAC','','','','','he/him/his','Client','false','','5','9');
INSERT INTO "Contact" VALUES(12,'anneboyd@example.com','Anne','Boyd','Mrs.','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','Adult','','Friend','','','','','','she/her/hers','Client','false','','6','');
INSERT INTO "Contact" VALUES(13,'normaburke@example.com','Norma','Burke','','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','Senior','','Friend','','','','','','they/them/theirs','Client','false','','7','');
INSERT INTO "Contact" VALUES(14,'bobbyhenderson@example.com','Bobby','Henderson','','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','Client','true','2020-01-23','8','');
INSERT INTO "Contact" VALUES(15,'anthonyhill@example.com','Anthony','Hill','','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','Adult','','Friend','','','','','','they/them/theirs','Client','false','','9','');
INSERT INTO "Contact" VALUES(16,'virginiaholmes@example.com','Virginia','Holmes','Ms.','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','Adult','','Friend','','','','','','she/her/hers','Client;Donor','false','','10','');
INSERT INTO "Contact" VALUES(17,'josejenkins@example.com','Jose','Jenkins','','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','he/him/his','Donor','false','','11','');
INSERT INTO "Contact" VALUES(18,'craigjohnso@example.com','Craig','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','false','','12','');
INSERT INTO "Contact" VALUES(19,'','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','false','','12','');
INSERT INTO "Contact" VALUES(20,'barbarajohnson@example.com','Barbara','Johnson','','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','','Adult','','Husband','06817000000VpnAAAS','','','','','she/her/hers','Client','false','','12','18');
CREATE TABLE "caseman__ActionItemTemplate__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(1,'Pass an age appropriate reading proficiency exam');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(2,'Pass basic financial literacy course');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(3,'Complete online job applications to at least 3 appropriate job openings');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(4,'Month 3: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(5,'Month 4: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(6,'Month 5: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(7,'Get a job readiness coach');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(8,'Complete resume workshop');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(9,'Complete interview workshop');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(10,'Pass mock interview');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(11,'Update resume');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(12,'Maintain 2 years active engagement in workforce');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(13,'Meet job requirement standards');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(14,'Complete Stability Assessment');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(15,'Month 6: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(16,'Month 2: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(17,'Month 1: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(18,'Get an job readiness coach');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(19,'Open a bank account');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(20,'Meet with legal assistance advisor');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(21,'Read and interpret a banking account statement');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(22,'Month 2: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(23,'Month 1: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(24,'Month 3: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(25,'Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(26,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(27,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(28,'Pass English proficiency exam with a score of 65 or above');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(29,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(30,'Month 4: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(31,'Month 4: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(32,'Month 1: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(33,'Month 5: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(34,'Month 5: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(35,'Month 3: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(36,'Month 6: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(37,'Month 6: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(38,'Month 2: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(39,'Open a Savings Account');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(40,'Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(41,'Complete Financial Literacy Course');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(42,'Meet with Financial Advisor');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(43,'Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(44,'Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(45,'Get a passing grade in Financial Literacy Course');
INSERT INTO "caseman__ActionItemTemplate__c" VALUES(46,'Register for Financial Literacy Course');
CREATE TABLE "caseman__ActionItem__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Status__c" VARCHAR(255), 
	"caseman__DueDate__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ActionItem__c" VALUES(1,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','1','2','3','1');
INSERT INTO "caseman__ActionItem__c" VALUES(2,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','6','3','4','16');
INSERT INTO "caseman__ActionItem__c" VALUES(3,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','6','3','4','17');
INSERT INTO "caseman__ActionItem__c" VALUES(4,'Open a bank account','Completed','2019-09-06','6','3','4','19');
INSERT INTO "caseman__ActionItem__c" VALUES(5,'Read and interpret a banking account statement','Not Started','2019-09-30','6','3','4','21');
INSERT INTO "caseman__ActionItem__c" VALUES(6,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','6','3','4','24');
INSERT INTO "caseman__ActionItem__c" VALUES(7,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','6','3','4','30');
INSERT INTO "caseman__ActionItem__c" VALUES(8,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','6','3','4','31');
INSERT INTO "caseman__ActionItem__c" VALUES(9,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','6','3','4','32');
INSERT INTO "caseman__ActionItem__c" VALUES(10,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','6','3','4','33');
INSERT INTO "caseman__ActionItem__c" VALUES(11,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','6','3','4','34');
INSERT INTO "caseman__ActionItem__c" VALUES(12,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','6','3','4','35');
INSERT INTO "caseman__ActionItem__c" VALUES(13,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','6','3','4','36');
INSERT INTO "caseman__ActionItem__c" VALUES(14,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','6','3','4','37');
INSERT INTO "caseman__ActionItem__c" VALUES(15,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','6','3','4','38');
INSERT INTO "caseman__ActionItem__c" VALUES(16,'Pass basic financial literacy course','In Progress','2019-09-30','6','3','4','2');
INSERT INTO "caseman__ActionItem__c" VALUES(17,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','6','3','5','15');
INSERT INTO "caseman__ActionItem__c" VALUES(18,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','6','3','5','22');
INSERT INTO "caseman__ActionItem__c" VALUES(19,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','6','3','5','23');
INSERT INTO "caseman__ActionItem__c" VALUES(20,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','6','3','5','4');
INSERT INTO "caseman__ActionItem__c" VALUES(21,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','6','3','5','5');
INSERT INTO "caseman__ActionItem__c" VALUES(22,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','6','3','5','6');
INSERT INTO "caseman__ActionItem__c" VALUES(23,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','6','3','6','3');
INSERT INTO "caseman__ActionItem__c" VALUES(24,'Get a job readiness coach','Completed','2019-09-05','6','3','6','7');
INSERT INTO "caseman__ActionItem__c" VALUES(25,'Complete resume workshop','Not Started','2019-10-11','6','3','6','8');
INSERT INTO "caseman__ActionItem__c" VALUES(26,'Complete interview workshop','Not Started','2019-11-04','6','3','6','9');
INSERT INTO "caseman__ActionItem__c" VALUES(27,'Pass mock interview','Not Started','2019-11-06','6','3','6','10');
INSERT INTO "caseman__ActionItem__c" VALUES(28,'Update resume','Not Started','2019-10-25','6','3','6','11');
INSERT INTO "caseman__ActionItem__c" VALUES(29,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','6','3','11','12');
INSERT INTO "caseman__ActionItem__c" VALUES(30,'Meet job requirement standards','Not Started','2020-04-15','6','3','11','13');
INSERT INTO "caseman__ActionItem__c" VALUES(31,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','7','4','12','16');
INSERT INTO "caseman__ActionItem__c" VALUES(32,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','7','4','12','17');
INSERT INTO "caseman__ActionItem__c" VALUES(33,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','7','4','12','24');
INSERT INTO "caseman__ActionItem__c" VALUES(34,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','7','4','12','32');
INSERT INTO "caseman__ActionItem__c" VALUES(35,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','7','4','12','35');
INSERT INTO "caseman__ActionItem__c" VALUES(36,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','7','4','12','38');
INSERT INTO "caseman__ActionItem__c" VALUES(37,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','7','4','13','15');
INSERT INTO "caseman__ActionItem__c" VALUES(38,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','7','4','13','22');
INSERT INTO "caseman__ActionItem__c" VALUES(39,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','7','4','13','23');
INSERT INTO "caseman__ActionItem__c" VALUES(40,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','7','4','13','4');
INSERT INTO "caseman__ActionItem__c" VALUES(41,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','7','4','13','5');
INSERT INTO "caseman__ActionItem__c" VALUES(42,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','7','4','13','6');
INSERT INTO "caseman__ActionItem__c" VALUES(43,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','7','4','14','3');
INSERT INTO "caseman__ActionItem__c" VALUES(44,'Get a job readiness coach','Completed','2019-09-05','7','4','14','7');
INSERT INTO "caseman__ActionItem__c" VALUES(45,'Complete resume workshop','Not Started','2019-09-27','7','4','14','8');
INSERT INTO "caseman__ActionItem__c" VALUES(46,'Complete interview workshop','Not Started','2019-10-20','7','4','14','9');
INSERT INTO "caseman__ActionItem__c" VALUES(47,'Pass mock interview','Not Started','2019-10-31','7','4','14','10');
INSERT INTO "caseman__ActionItem__c" VALUES(48,'Update resume','Not Started','2019-10-09','7','4','14','11');
INSERT INTO "caseman__ActionItem__c" VALUES(49,'Participate in a 12-step program','In Progress','2019-12-31','7','5','18','25');
INSERT INTO "caseman__ActionItem__c" VALUES(50,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','11','6','19','26');
INSERT INTO "caseman__ActionItem__c" VALUES(51,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','11','6','19','27');
INSERT INTO "caseman__ActionItem__c" VALUES(52,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','11','6','19','29');
INSERT INTO "caseman__ActionItem__c" VALUES(53,'Open a Savings Account','Completed','2019-09-09','11','6','19','39');
INSERT INTO "caseman__ActionItem__c" VALUES(54,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','11','6','19','2');
INSERT INTO "caseman__ActionItem__c" VALUES(55,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','20','7','21','28');
CREATE TABLE "caseman__Assessment__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__AssessmentCompletedDate__c" VARCHAR(255), 
	"caseman__Comments__c" VARCHAR(255), 
	"caseman__TotalScore__c" VARCHAR(255), 
	"caseman__FinancialStabilityScore__c" VARCHAR(255), 
	"caseman__JobReadinessScore__c" VARCHAR(255), 
	client__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__Assessment__c" VALUES(1,'Arlene Baker-9/19','2019-09-16','Arlene has been out of the active workforce for more than one year','75.0','75.0','70.0','6');
INSERT INTO "caseman__Assessment__c" VALUES(2,'Arlene Baker-11/19','2019-11-15','Arlene''s financial stability score declined due to a rent increase. She is revising her budget.','80.0','73.0','85.0','6');
INSERT INTO "caseman__Assessment__c" VALUES(3,'Arlene Baker-1/20','2020-01-15','Arlene has shown resilience and ability to adapt to adverse circumstances.','90.0','80.0','88.0','6');
INSERT INTO "caseman__Assessment__c" VALUES(4,'Arlene Baker-10/19','2019-10-15','Arlene is very diligent with her case plan','76.0','76.0','75.0','6');
INSERT INTO "caseman__Assessment__c" VALUES(5,'Robin Banks 12/19','2019-12-01','Robin has shown diligence in the resume and interview workshops.','85.0','80.0','83.0','7');
INSERT INTO "caseman__Assessment__c" VALUES(6,'Robin Banks-10/19','2019-10-01','','75.0','70.0','75.0','7');
INSERT INTO "caseman__Assessment__c" VALUES(7,'Robin Banks-11/19','2019-11-01','Robin is settling into her case plan more easily than I expected.','80.0','75.0','80.0','7');
INSERT INTO "caseman__Assessment__c" VALUES(8,'Robin Banks 1/20','2020-01-03','Note that some of Robin''s financial stability score reflects her partner''s job','85.0','80.0','85.0','7');
INSERT INTO "caseman__Assessment__c" VALUES(9,'ESL - July 2019','2019-07-01','ESL July 2019 Assessment','63.24','','','20');
INSERT INTO "caseman__Assessment__c" VALUES(10,'ESL - August 2019','2019-08-01','ESL August Assessment Score','68.5','','','20');
INSERT INTO "caseman__Assessment__c" VALUES(11,'ESL - September 2019','2019-09-01','ESL September Assessment Score','70.25','','','20');
INSERT INTO "caseman__Assessment__c" VALUES(12,'ESL - June 2019','2019-06-01','Entry level score in ESL program','51.5','','','20');
INSERT INTO "caseman__Assessment__c" VALUES(13,'ESL - October 2019','2019-10-01','ESL October Assessment Score','74.55','','','20');
INSERT INTO "caseman__Assessment__c" VALUES(14,'ESL - November 2019','2019-11-01','ESL November Assessment Score','77.43','','','20');
CREATE TABLE "caseman__CasePlan__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Status__c" VARCHAR(255), 
	"caseman__AbandonedDate__c" VARCHAR(255), 
	"caseman__CompletedDate__c" VARCHAR(255), 
	"caseman__InProgressDate__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__CasePlan__c" VALUES(1,'Socialization Case Plan - Tom Higgins','','','','','1');
INSERT INTO "caseman__CasePlan__c" VALUES(2,'Reading Case Plan - Tom Higgins','','','','2019-10-01','1');
INSERT INTO "caseman__CasePlan__c" VALUES(3,'Arlene Baker''s Workforce Re-entry Case Plan','','','','2019-11-01','6');
INSERT INTO "caseman__CasePlan__c" VALUES(4,'Robin Banks'' Job Readiness Case Plan','','','','2019-11-05','7');
INSERT INTO "caseman__CasePlan__c" VALUES(5,'Robin Banks'' Sobriety Case Plan','','','','','7');
INSERT INTO "caseman__CasePlan__c" VALUES(6,'Financial Literacy Case Plan - Jason Barnes','','','','2019-11-04','11');
INSERT INTO "caseman__CasePlan__c" VALUES(7,'English proficiency case plan - Barbara Johnson','','','','','20');
CREATE TABLE "caseman__ClientAlert__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Active__c" VARCHAR(255), 
	"caseman__Description__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ClientAlert__c" VALUES(1,'Tom has anger issues','true','','1');
INSERT INTO "caseman__ClientAlert__c" VALUES(2,'Tom''s sister passed away recently (very emotional)','true','','1');
INSERT INTO "caseman__ClientAlert__c" VALUES(3,'Robin was recently released from rehab','true','','7');
CREATE TABLE "caseman__ClientNoteRelationship__c" (
	id INTEGER NOT NULL, 
	"caseman__RelatedName__c" VARCHAR(255), 
	case__c VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ClientNoteRelationship__c" VALUES(1,'00001008','6','3','');
INSERT INTO "caseman__ClientNoteRelationship__c" VALUES(2,'00001009','7','4','');
INSERT INTO "caseman__ClientNoteRelationship__c" VALUES(3,'00001010','8','5','');
CREATE TABLE "caseman__ClientNote__c" (
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
INSERT INTO "caseman__ClientNote__c" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','1');
INSERT INTO "caseman__ClientNote__c" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','1');
INSERT INTO "caseman__ClientNote__c" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','7');
INSERT INTO "caseman__ClientNote__c" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','11');
INSERT INTO "caseman__ClientNote__c" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','20');
CREATE TABLE "caseman__GoalActionItemTemplate__c" (
	id INTEGER NOT NULL, 
	"caseman__IsRequired__c" VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(1,'false','1','1');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(2,'false','2','28');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(3,'false','3','16');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(4,'false','3','17');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(5,'false','3','19');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(6,'false','3','21');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(7,'false','3','24');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(8,'false','3','30');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(9,'false','3','31');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(10,'false','3','32');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(11,'false','3','33');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(12,'false','3','34');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(13,'false','3','35');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(14,'false','3','36');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(15,'false','3','37');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(16,'false','3','38');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(17,'false','3','2');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(18,'false','4','22');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(19,'false','4','23');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(20,'false','4','4');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(21,'false','4','5');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(22,'false','4','6');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(23,'false','6','25');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(24,'false','9','3');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(25,'false','9','7');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(26,'false','9','8');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(27,'false','9','9');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(28,'false','9','10');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(29,'false','9','11');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(30,'false','12','45');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(31,'false','12','46');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(32,'false','14','39');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(33,'false','14','40');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(34,'false','14','43');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(35,'false','14','44');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(36,'false','28','28');
CREATE TABLE "caseman__GoalTemplate__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__GoalTemplate__c" VALUES(1,'Reach an age appropriate level of proficiency in reading');
INSERT INTO "caseman__GoalTemplate__c" VALUES(2,'Reach proficiency in reading, writing, speaking, and listening');
INSERT INTO "caseman__GoalTemplate__c" VALUES(3,'Develop basic financial literacy skills');
INSERT INTO "caseman__GoalTemplate__c" VALUES(4,'Get and keep job for 6 - 12 months');
INSERT INTO "caseman__GoalTemplate__c" VALUES(5,'Stabilize career path');
INSERT INTO "caseman__GoalTemplate__c" VALUES(6,'Acquire and adopt healthy skills to address problems');
INSERT INTO "caseman__GoalTemplate__c" VALUES(7,'Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__GoalTemplate__c" VALUES(8,'Reach proficiency level in reading, writing, speaking & listening per state std');
INSERT INTO "caseman__GoalTemplate__c" VALUES(9,'Develop soft skills');
INSERT INTO "caseman__GoalTemplate__c" VALUES(10,'Stabilize housing');
INSERT INTO "caseman__GoalTemplate__c" VALUES(11,'Complete Advancement program');
INSERT INTO "caseman__GoalTemplate__c" VALUES(12,'Complete Financial Literacy Course');
INSERT INTO "caseman__GoalTemplate__c" VALUES(13,'Build respectful peer relationships');
INSERT INTO "caseman__GoalTemplate__c" VALUES(14,'Deposit 10% of income in Savings Account for 3 months');
INSERT INTO "caseman__GoalTemplate__c" VALUES(15,'Build respectful intergenerational relationships');
INSERT INTO "caseman__GoalTemplate__c" VALUES(16,'Identify industry/career path');
INSERT INTO "caseman__GoalTemplate__c" VALUES(17,'Complete Advancement program');
INSERT INTO "caseman__GoalTemplate__c" VALUES(18,'Meet job requirement standards');
INSERT INTO "caseman__GoalTemplate__c" VALUES(19,'Complete Succeed program');
INSERT INTO "caseman__GoalTemplate__c" VALUES(20,'Meet with a Financial Advisor');
INSERT INTO "caseman__GoalTemplate__c" VALUES(21,'Stabilize employment');
INSERT INTO "caseman__GoalTemplate__c" VALUES(22,'Get a Job Readiness Coach');
INSERT INTO "caseman__GoalTemplate__c" VALUES(23,'Meet with Legal Assistance Advisor');
INSERT INTO "caseman__GoalTemplate__c" VALUES(24,'Visioning career path');
INSERT INTO "caseman__GoalTemplate__c" VALUES(25,'Complete Stability Assessment');
INSERT INTO "caseman__GoalTemplate__c" VALUES(26,'Complete Jump Start program');
INSERT INTO "caseman__GoalTemplate__c" VALUES(27,'Get any required certifications');
INSERT INTO "caseman__GoalTemplate__c" VALUES(28,'Get a passing grade in ESL I Class');
CREATE TABLE "caseman__Goal__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__Goal__c" VALUES(1,'Build respectful peer relationships','1','1','13');
INSERT INTO "caseman__Goal__c" VALUES(2,'Build respectful inter-generational relationships','1','1','15');
INSERT INTO "caseman__Goal__c" VALUES(3,'Reach an age appropriate level of proficiency in reading','1','2','1');
INSERT INTO "caseman__Goal__c" VALUES(4,'Develop basic financial literacy skills','6','3','3');
INSERT INTO "caseman__Goal__c" VALUES(5,'Get and keep job for 6 - 12 months','6','3','4');
INSERT INTO "caseman__Goal__c" VALUES(6,'Develop Soft Skills','6','3','9');
INSERT INTO "caseman__Goal__c" VALUES(7,'Stabilize housing','6','3','10');
INSERT INTO "caseman__Goal__c" VALUES(8,'Identify industry/career path','6','3','16');
INSERT INTO "caseman__Goal__c" VALUES(9,'Meet job requirement standards','6','3','18');
INSERT INTO "caseman__Goal__c" VALUES(10,'Complete Succeed Program','6','3','19');
INSERT INTO "caseman__Goal__c" VALUES(11,'Stabilize Employment','6','3','21');
INSERT INTO "caseman__Goal__c" VALUES(12,'Develop basic financial literacy skills','7','4','3');
INSERT INTO "caseman__Goal__c" VALUES(13,'Get and keep job for 6 - 12 months','7','4','4');
INSERT INTO "caseman__Goal__c" VALUES(14,'Develop Soft Skills','7','4','9');
INSERT INTO "caseman__Goal__c" VALUES(15,'Meet job requirement standards','7','4','18');
INSERT INTO "caseman__Goal__c" VALUES(16,'Complete Succeed Program','7','4','19');
INSERT INTO "caseman__Goal__c" VALUES(17,'Stabilize Employment','7','4','21');
INSERT INTO "caseman__Goal__c" VALUES(18,'Adopt healthy skills to address dependency issues','7','5','6');
INSERT INTO "caseman__Goal__c" VALUES(19,'Complete Financial Literacy Course','11','6','12');
INSERT INTO "caseman__Goal__c" VALUES(20,'Deposit 10% of income in Savings Account for 3 months','11','6','14');
INSERT INTO "caseman__Goal__c" VALUES(21,'Reach proficiency level in reading, writing, speaking & listening per state std','20','7','8');
COMMIT;
