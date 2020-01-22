BEGIN TRANSACTION;
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
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "contacts" VALUES(1,'','Naima','Crawford','naimacrawford@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','naimacrawford@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','41','');
INSERT INTO "contacts" VALUES(2,'','Joe','Salinas','joesalinas@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','joesalinas@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','20','');
INSERT INTO "contacts" VALUES(3,'','Maleah','Bullock','maleahbullock@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','maleahbullock@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','21','');
INSERT INTO "contacts" VALUES(4,'','Anika','Solomon','anikasolomon@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anikasolomon@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','22','');



-- caseman contacts
INSERT INTO "contacts" VALUES(5,'','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','false','false','true','true','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','thiggins@example.com','Personal','Home','Home','false','','','','Child','','Mother','Male','0681g000000kSozAAE','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-12-16','23',6);
INSERT INTO "contacts" VALUES(6,'','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','lhiggins@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','23','');
INSERT INTO "contacts" VALUES(7,'Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jeremyadams@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','Call','','Phone','555-648-7204','he/him/his','Client','false','','24','');
INSERT INTO "contacts" VALUES(8,'Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','angelaadams@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','','she/her/hers','Client;Donor;Volunteer','false','','24','');
INSERT INTO "contacts" VALUES(9,'','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','25','');
INSERT INTO "contacts" VALUES(10,'','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','','','alanbaker@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','0680x0000029NfuAAE','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','25',8);
INSERT INTO "contacts" VALUES(11,'','Robin','Banks','robinbanks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','robinbanks@example.com','Personal','Home','Home','false','','','','Adult','','Partner','','0681g000000kSp4AAE','','','','','she/her/hers','Client','true','2019-12-16','26',12);
INSERT INTO "contacts" VALUES(12,'','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','0.0','400.0','0.0','1.0','0.0','1.0','400.0','','','','','400.0','400.0','','','darrylgraham@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','26','');
INSERT INTO "contacts" VALUES(13,'','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','27','');
INSERT INTO "contacts" VALUES(14,'','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','','','davidbarnes@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','27','');
INSERT INTO "contacts" VALUES(15,'','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','Youth','88841515','Mother','Male','0681g000000kSopAAE','','','','','he/him/his','Client','false','','27',13);
INSERT INTO "contacts" VALUES(16,'Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anneboyd@example.com','Personal','Home','Home','false','','','','Adult','','Friend','Female','','','','','','she/her/hers','Client','false','','28','');


INSERT INTO "contacts" VALUES(17,'','Ariella','Branch','ariellabranch@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ariellabranch@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','3','');


INSERT INTO "contacts" VALUES(18,'','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','normaburke@example.com','Personal','Home','Home','false','','','','Senior','','Friend','Non-binary','','','','','','they/them/theirs','Client','false','','29','');
INSERT INTO "contacts" VALUES(19,'','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','Adult','','Friend','Male','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-12-16','30','');
INSERT INTO "contacts" VALUES(20,'','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','anthonyhill@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','','they/them/theirs','Client','false','','31','');
INSERT INTO "contacts" VALUES(21,'Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','','she/her/hers','Client;Donor','false','','32','');
INSERT INTO "contacts" VALUES(22,'','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','josejenkins@example.com','Personal','Home','Home','false','','','','Adult','','Friend','','','','','','','he/him/his','Donor','false','','33','');
INSERT INTO "contacts" VALUES(23,'','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','craigjohnso@example.com','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','34','');
INSERT INTO "contacts" VALUES(24,'','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','United States','false','false','true','true','true','','','false','','','','','','','','','','0.0','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','','Personal','Home','Home','false','','','','','','','','','','','','','','','false','','34','');
INSERT INTO "contacts" VALUES(25,'','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','Adult','','Husband','','0681g000000kSouAAE','','','','','she/her/hers','Client','false','','34',23);



INSERT INTO "contacts" VALUES(26,'','Jose','Burgess','joseburgess@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','joseburgess@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','35','');
INSERT INTO "contacts" VALUES(27,'','Brenda','Bass','brendabass@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','brendabass@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','36','');
INSERT INTO "contacts" VALUES(28,'','Nikhil','Bishop','nikhilbishop@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nikhilbishop@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','37','');
INSERT INTO "contacts" VALUES(29,'','Juliette','Cisneros','juliettecisneros@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','juliettecisneros@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','38','');
INSERT INTO "contacts" VALUES(30,'','Jaydon','Bates','jaydonbates@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jaydonbates@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','4','');
INSERT INTO "contacts" VALUES(31,'','Alana','Owen','alanaowen@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alanaowen@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','39','');
INSERT INTO "contacts" VALUES(32,'','Cruz','Kerr','cruzkerr@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','cruzkerr@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','40','');
INSERT INTO "contacts" VALUES(33,'','Beau','Eaton','beaueaton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','beaueaton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','42','');
INSERT INTO "contacts" VALUES(34,'','Chance','Rasmussen','chancerasmussen@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','chancerasmussen@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','43','');
INSERT INTO "contacts" VALUES(35,'','James','Richards','jamesrichards@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jamesrichards@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','65','');
INSERT INTO "contacts" VALUES(36,'','Khloe','Campos','khloecampos@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','khloecampos@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','44','');
INSERT INTO "contacts" VALUES(37,'','Amelie','Bond','ameliebond@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ameliebond@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','45','');
INSERT INTO "contacts" VALUES(38,'','Julie','Myers','juliemyers@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','juliemyers@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','46','');
INSERT INTO "contacts" VALUES(39,'','Jayda','Stanton','jaydastanton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jaydastanton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','47','');
INSERT INTO "contacts" VALUES(40,'','Heidi','Woods','heidiwoods@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','heidiwoods@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','48','');
INSERT INTO "contacts" VALUES(41,'','Javon','Rodgers','javonrodgers@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','javonrodgers@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','5','');
INSERT INTO "contacts" VALUES(42,'','Leia','Spence','leiaspence@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','leiaspence@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','49','');
INSERT INTO "contacts" VALUES(43,'','Leon','Clayton','leonclayton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','leonclayton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','50','');
INSERT INTO "contacts" VALUES(44,'','Marc','Richard','marcrichard@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marcrichard@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','51','');
INSERT INTO "contacts" VALUES(45,'','Jordan','Waller','jordanwaller@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jordanwaller@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','52','');
INSERT INTO "contacts" VALUES(46,'','Jace','Hampton','jacehampton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jacehampton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','53','');
INSERT INTO "contacts" VALUES(47,'','Silas','Neal','silasneal@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','silasneal@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','54','');
INSERT INTO "contacts" VALUES(48,'','Sonia','Gentry','soniagentry@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','soniagentry@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','55','');
INSERT INTO "contacts" VALUES(49,'','Alison','Barr','alisonbarr@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alisonbarr@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','56','');
INSERT INTO "contacts" VALUES(50,'','Vu','Pham','vupham@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','vupham@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','57','');
INSERT INTO "contacts" VALUES(51,'','Kellen','Cooley','kellencooley@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','kellencooley@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','58','');
INSERT INTO "contacts" VALUES(52,'','Josie','Mcclure','josiemcclure@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','josiemcclure@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','6','');
INSERT INTO "contacts" VALUES(53,'','Jay','Zimmerman','jayzimmerman@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jayzimmerman@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','59','');
INSERT INTO "contacts" VALUES(54,'','Melanie','Wheeler','melaniewheeler@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','melaniewheeler@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','60','');
INSERT INTO "contacts" VALUES(55,'','Fernando','Beltran','fernandobeltran@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','fernandobeltran@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','61','');
INSERT INTO "contacts" VALUES(56,'','Yuliana','Bird','yulianabird@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yulianabird@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','62','');
INSERT INTO "contacts" VALUES(57,'','Alyson','Duffy','alysonduffy@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alysonduffy@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','63','');
INSERT INTO "contacts" VALUES(58,'','Nyla','Woods','nylawoods@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nylawoods@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','64','');
INSERT INTO "contacts" VALUES(59,'','Aaron','Valdez','aaronvaldez@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aaronvaldez@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','66','');
INSERT INTO "contacts" VALUES(60,'','John','Mills','johnmills@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','johnmills@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','67','');
INSERT INTO "contacts" VALUES(61,'','Shannon','Greene','shannongreene@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','shannongreene@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','68','');
INSERT INTO "contacts" VALUES(62,'','Marco','Escobar','marcoescobar@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marcoescobar@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','69','');
INSERT INTO "contacts" VALUES(63,'','Marcus','Huynh','marcushuynh@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marcushuynh@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','7','');
INSERT INTO "contacts" VALUES(64,'','Lorelai','Gross','lorelaigross@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','lorelaigross@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','70','');
INSERT INTO "contacts" VALUES(65,'','Elsa','Guerrero','elsaguerrero@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','elsaguerrero@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','71','');
INSERT INTO "contacts" VALUES(66,'','Yesenia','Ritter','yeseniaritter@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yeseniaritter@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','72','');
INSERT INTO "contacts" VALUES(67,'','Abraham','Sims','abrahamsims@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','abrahamsims@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','73','');
INSERT INTO "contacts" VALUES(68,'','Kyle','Huffman','kylehuffman@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','kylehuffman@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','74','');
INSERT INTO "contacts" VALUES(69,'','Cora','Hall','corahall@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','corahall@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','75','');
INSERT INTO "contacts" VALUES(70,'','Isaac','Barker','isaacbarker@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','isaacbarker@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','76','');
INSERT INTO "contacts" VALUES(71,'','Kailey','Glass','kaileyglass@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','kaileyglass@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','77','');
INSERT INTO "contacts" VALUES(72,'','Delilah','Ibarra','delilahibarra@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','delilahibarra@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','78','');
INSERT INTO "contacts" VALUES(73,'','Zackery','Morgan','zackerymorgan@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','zackerymorgan@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','79','');
INSERT INTO "contacts" VALUES(74,'','Ayanna','Gonzalez','ayannagonzalez@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ayannagonzalez@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','8','');
INSERT INTO "contacts" VALUES(75,'','Duncan','Bowers','duncanbowers@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','duncanbowers@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','80','');
INSERT INTO "contacts" VALUES(76,'','Lauryn','Odom','laurynodom@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','laurynodom@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','81','');
INSERT INTO "contacts" VALUES(77,'','Yusef','Flores','yusefflores@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yusefflores@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','82','');
INSERT INTO "contacts" VALUES(78,'','Semaj','Wall','semajwall@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','semajwall@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','83','');
INSERT INTO "contacts" VALUES(79,'','Frankie','Waller','frankiewaller@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','frankiewaller@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','84','');
INSERT INTO "contacts" VALUES(80,'','Eliezer','Bray','eliezerbray@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','eliezerbray@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','85','');
INSERT INTO "contacts" VALUES(81,'','Jaden','Conner','jadenconner@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jadenconner@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','86','');
INSERT INTO "contacts" VALUES(82,'','Steven','Harper','stevenharper@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','stevenharper@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','87','');
INSERT INTO "contacts" VALUES(83,'','Karissa','Aguilar','karissaaguilar@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','karissaaguilar@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','88','');
INSERT INTO "contacts" VALUES(84,'','Tiara','Cummings','tiaracummings@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tiaracummings@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','89','');
INSERT INTO "contacts" VALUES(85,'','Taniya','Singleton','taniyasingleton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','taniyasingleton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','9','');
INSERT INTO "contacts" VALUES(86,'','Cecilia','Cardenas','ceciliacardenas@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ceciliacardenas@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','90','');
INSERT INTO "contacts" VALUES(87,'','Christina','Webster','christinawebster@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','christinawebster@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','91','');
INSERT INTO "contacts" VALUES(88,'','Emilie','Costa','emiliecosta@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','emiliecosta@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','92','');
INSERT INTO "contacts" VALUES(89,'','Ayana','Humphrey','ayanahumphrey@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ayanahumphrey@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','93','');
INSERT INTO "contacts" VALUES(90,'','Lucia','Cain','luciacain@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','luciacain@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','94','');
INSERT INTO "contacts" VALUES(91,'','Amaya','Dunlap','amayadunlap@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','amayadunlap@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','95','');
INSERT INTO "contacts" VALUES(92,'','Derrick','Blackwell','derrickblackwell@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','derrickblackwell@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','96','');
INSERT INTO "contacts" VALUES(93,'','Alice','Irwin','aliceirwin@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aliceirwin@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','97','');
INSERT INTO "contacts" VALUES(94,'','Fabian','Hughes','fabianhughes@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','fabianhughes@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','98','');
INSERT INTO "contacts" VALUES(95,'','Raelynn','Wells','raelynnwells@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','raelynnwells@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','99','');
INSERT INTO "contacts" VALUES(96,'','Dalia','Osborn','daliaosborn@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','daliaosborn@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','1','');
INSERT INTO "contacts" VALUES(97,'','Laura','Woodard','laurawoodard@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','laurawoodard@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','10','');
INSERT INTO "contacts" VALUES(98,'','Simon','Davila','simondavila@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','simondavila@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','100','');
INSERT INTO "contacts" VALUES(99,'','Jamarcus','Barnett','jamarcusbarnett@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jamarcusbarnett@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','101','');
INSERT INTO "contacts" VALUES(100,'','Adrianna','Norman','adriannanorman@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','adriannanorman@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','102','');
INSERT INTO "contacts" VALUES(101,'','Donna','Snow','donnasnow@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','donnasnow@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','103','');
INSERT INTO "contacts" VALUES(102,'','Gary','Wood','garywood@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','garywood@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','104','');
INSERT INTO "contacts" VALUES(103,'','Reagan','Norton','reagannorton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','reagannorton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','105','');
INSERT INTO "contacts" VALUES(104,'','Jaylin','Morgan','jaylinmorgan@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jaylinmorgan@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','106','');
INSERT INTO "contacts" VALUES(105,'','Mira','Decker','miradecker@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','miradecker@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','107','');
INSERT INTO "contacts" VALUES(106,'','Maya','Lambert','mayalambert@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mayalambert@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','108','');
INSERT INTO "contacts" VALUES(107,'','Finley','Barry','finleybarry@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','finleybarry@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','109','');
INSERT INTO "contacts" VALUES(108,'','Shane','Gibson','shanegibson@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','shanegibson@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','11','');
INSERT INTO "contacts" VALUES(109,'','Ben','Oneill','benoneill@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','benoneill@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','110','');
INSERT INTO "contacts" VALUES(110,'','Maia','Cooley','maiacooley@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','maiacooley@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','111','');
INSERT INTO "contacts" VALUES(111,'','Olive','Leach','oliveleach@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','oliveleach@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','112','');
INSERT INTO "contacts" VALUES(112,'','Oswaldo','Pacheco','oswaldopacheco@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','oswaldopacheco@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','113','');
INSERT INTO "contacts" VALUES(113,'','Nico','Rivers','nicorivers@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nicorivers@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','114','');
INSERT INTO "contacts" VALUES(114,'','Tiara','Griffith','tiaragriffith@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tiaragriffith@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','115','');
INSERT INTO "contacts" VALUES(115,'','Declan','Glenn','declanglenn@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','declanglenn@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','116','');
INSERT INTO "contacts" VALUES(116,'','Madalyn','Francis','madalynfrancis@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','madalynfrancis@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','117','');
INSERT INTO "contacts" VALUES(117,'','Mathew','Rhodes','mathewrhodes@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mathewrhodes@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','118','');
INSERT INTO "contacts" VALUES(118,'','Jessica','Woods','jessicawoods@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jessicawoods@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','140','');
INSERT INTO "contacts" VALUES(119,'','Alia','Duarte','aliaduarte@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aliaduarte@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','12','');
INSERT INTO "contacts" VALUES(120,'','Eli','White','eliwhite@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','eliwhite@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','119','');
INSERT INTO "contacts" VALUES(121,'','Tatiana','Lang','tatianalang@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tatianalang@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','120','');
INSERT INTO "contacts" VALUES(122,'','Gia','Ramirez','giaramirez@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','giaramirez@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','121','');
INSERT INTO "contacts" VALUES(123,'','Alejandro','Serrano','alejandroserrano@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','alejandroserrano@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','122','');
INSERT INTO "contacts" VALUES(124,'','Mya','Galloway','myagalloway@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','myagalloway@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','123','');
INSERT INTO "contacts" VALUES(125,'','Adam','Clark','adamclark@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','adamclark@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','124','');
INSERT INTO "contacts" VALUES(126,'','Marisol','Gonzales','marisolgonzales@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','marisolgonzales@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','125','');
INSERT INTO "contacts" VALUES(127,'','Mya','Cobb','myacobb@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','myacobb@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','126','');
INSERT INTO "contacts" VALUES(128,'','Jay','Shah','jayshah@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jayshah@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','127','');
INSERT INTO "contacts" VALUES(129,'','Nancy','Arroyo','nancyarroyo@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','nancyarroyo@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','128','');
INSERT INTO "contacts" VALUES(130,'','Neil','Huerta','neilhuerta@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','neilhuerta@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','13','');
INSERT INTO "contacts" VALUES(131,'','Aubrie','Booker','aubriebooker@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aubriebooker@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','129','');
INSERT INTO "contacts" VALUES(132,'','Emelia','Mercer','emeliamercer@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','emeliamercer@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','130','');
INSERT INTO "contacts" VALUES(133,'','Yadiel','Horton','yadielhorton@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','yadielhorton@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','131','');
INSERT INTO "contacts" VALUES(134,'','Taniyah','Rios','taniyahrios@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','taniyahrios@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','132','');
INSERT INTO "contacts" VALUES(135,'','Peyton','Craig','peytoncraig@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','peytoncraig@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','133','');
INSERT INTO "contacts" VALUES(136,'','Francesca','Oliver','francescaoliver@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','francescaoliver@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','134','');
INSERT INTO "contacts" VALUES(137,'','Albert','Montgomery','albertmontgomery@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','albertmontgomery@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','135','');
INSERT INTO "contacts" VALUES(138,'','Meredith','Cooke','meredithcooke@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','meredithcooke@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','136','');
INSERT INTO "contacts" VALUES(139,'','Mckayla','Morrison','mckaylamorrison@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mckaylamorrison@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','137','');
INSERT INTO "contacts" VALUES(140,'','Hayley','Bright','hayleybright@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','hayleybright@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','138','');
INSERT INTO "contacts" VALUES(141,'','Laura','Hernandez','laurahernandez@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','laurahernandez@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','14','');
INSERT INTO "contacts" VALUES(142,'','Dayana','Atkins','dayanaatkins@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','dayanaatkins@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','139','');
INSERT INTO "contacts" VALUES(143,'','Khloe','Stanley','khloestanley@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','khloestanley@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','141','');
INSERT INTO "contacts" VALUES(144,'','Ray','Fischer','rayfischer@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','rayfischer@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','142','');
INSERT INTO "contacts" VALUES(145,'','Casey','Kline','caseykline@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','caseykline@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','143','');
INSERT INTO "contacts" VALUES(146,'','Aron','Joyce','aronjoyce@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aronjoyce@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','144','');
INSERT INTO "contacts" VALUES(147,'','Diego','Case','diegocase@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','diegocase@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','145','');
INSERT INTO "contacts" VALUES(148,'','Chelsea','Graves','chelseagraves@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','chelseagraves@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','146','');
INSERT INTO "contacts" VALUES(149,'','Ruth','Wu','ruthwu@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ruthwu@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','147','');
INSERT INTO "contacts" VALUES(150,'','Isaac','Grant','isaacgrant@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','isaacgrant@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','148','');
INSERT INTO "contacts" VALUES(151,'','Audrina','Rojas','audrinarojas@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','audrinarojas@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','149','');
INSERT INTO "contacts" VALUES(152,'','Makhi','Villegas','makhivillegas@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','makhivillegas@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','15','');
INSERT INTO "contacts" VALUES(153,'','Koen','Chase','koenchase@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','koenchase@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','150','');
INSERT INTO "contacts" VALUES(154,'','Hailie','Holder','hailieholder@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','hailieholder@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','151','');
INSERT INTO "contacts" VALUES(155,'','Caylee','Pollard','cayleepollard@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','cayleepollard@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','152','');
INSERT INTO "contacts" VALUES(156,'','Guillermo','Quinn','guillermoquinn@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','guillermoquinn@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','153','');
INSERT INTO "contacts" VALUES(157,'','Dominik','Wilkinson','dominikwilkinson@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','dominikwilkinson@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','154','');
INSERT INTO "contacts" VALUES(158,'','Simone','Keller','simonekeller@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','simonekeller@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','155','');
INSERT INTO "contacts" VALUES(159,'','Violet','Ellis','violetellis@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','violetellis@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','156','');
INSERT INTO "contacts" VALUES(160,'','Samir','Neal','samirneal@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','samirneal@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','157','');
INSERT INTO "contacts" VALUES(161,'','Mira','Mcconnell','miramcconnell@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','miramcconnell@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','158','');
INSERT INTO "contacts" VALUES(162,'','Aniya','Arellano','aniyaarellano@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','aniyaarellano@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','159','');
INSERT INTO "contacts" VALUES(163,'','Rafael','Velasquez','rafaelvelasquez@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','rafaelvelasquez@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','16','');
INSERT INTO "contacts" VALUES(164,'','Jakayla','Glover','jakaylaglover@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','jakaylaglover@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','160','');
INSERT INTO "contacts" VALUES(165,'','Angelo','Lutz','angelolutz@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','angelolutz@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','161','');
INSERT INTO "contacts" VALUES(166,'','Audrina','Graves','audrinagraves@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','audrinagraves@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','162','');
INSERT INTO "contacts" VALUES(167,'','Turner','Carson','turnercarson@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','turnercarson@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','163','');
INSERT INTO "contacts" VALUES(168,'','Emelia','Fletcher','emeliafletcher@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','emeliafletcher@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','164','');
INSERT INTO "contacts" VALUES(169,'','Mackenzie','Hernandez','mackenziehernandez@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','mackenziehernandez@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','165','');
INSERT INTO "contacts" VALUES(170,'','Ryan','Hardin','ryanhardin@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','ryanhardin@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','17','');
INSERT INTO "contacts" VALUES(171,'','Mira','Olson','miraolson@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','miraolson@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','18','');
INSERT INTO "contacts" VALUES(172,'','Anna','Orr','annaorr@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','annaorr@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','19','');
INSERT INTO "contacts" VALUES(173,'','Tyrone','Pearson','tyronepearson@example.com','','','','','','','','','','','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','','','tyronepearson@example.com','Personal','Home','','false','','','','','','','','','','','','','','','','','2','');
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
INSERT INTO "household_accounts" VALUES(1,'Osborn Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(2,'Pearson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(3,'Branch Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(4,'Bates Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(5,'Rodgers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(6,'Mcclure Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(7,'Huynh Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(8,'Gonzalez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(9,'Singleton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(10,'Woodard Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(11,'Gibson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(12,'Duarte Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(13,'Huerta Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(14,'Hernandez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(15,'Villegas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(16,'Velasquez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(17,'Hardin Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(18,'Olson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(19,'Orr Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(20,'Salinas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(21,'Bullock Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(22,'Solomon Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(23,'Higgins Household','','','','','','','555-248-3956','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(24,'Adams Household','','','','','','','555-648-7204','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(25,'Baker Household','','','','','','','555-524-0749','','','','','','Household','','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(26,'Banks and Graham Household','','','','','','','555-648-7204','','','','','','Household','','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','400.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(27,'Barnes Household','','','','','','','555-893-4763','','','','','','Household','','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(28,'Boyd Household','','','','','','','555-380-8532','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(29,'Burke Household','','','','','','','555-830-5295','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(30,'Henderson Household','','','','','','','555-830-5295','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(31,'Hill Household','','','','','','','555-395-9737','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(32,'Holmes Household','','','','','','','555-930-8759','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(33,'Jenkins Household','','','','','','','555-469-9873','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(34,'Johnson Household','','','','','','','555-248-3956','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(35,'Burgess Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(36,'Bass Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(37,'Bishop Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(38,'Cisneros Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(39,'Owen Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(40,'Kerr Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(41,'Crawford Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(42,'Eaton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(43,'Rasmussen Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(44,'Campos Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(45,'Bond Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(46,'Myers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(47,'Stanton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(48,'Woods Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(49,'Spence Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(50,'Clayton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(51,'Richard Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(52,'Waller Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(53,'Hampton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(54,'Neal Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(55,'Gentry Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(56,'Barr Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(57,'Pham Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(58,'Cooley Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(59,'Zimmerman Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(60,'Wheeler Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(61,'Beltran Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(62,'Bird Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(63,'Duffy Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(64,'Woods Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(65,'Richards Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(66,'Valdez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(67,'Mills Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(68,'Greene Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(69,'Escobar Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(70,'Gross Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(71,'Guerrero Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(72,'Ritter Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(73,'Sims Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(74,'Huffman Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(75,'Hall Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(76,'Barker Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(77,'Glass Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(78,'Ibarra Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(79,'Morgan Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(80,'Bowers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(81,'Odom Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(82,'Flores Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(83,'Wall Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(84,'Waller Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(85,'Bray Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(86,'Conner Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(87,'Harper Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(88,'Aguilar Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(89,'Cummings Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(90,'Cardenas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(91,'Webster Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(92,'Costa Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(93,'Humphrey Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(94,'Cain Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(95,'Dunlap Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(96,'Blackwell Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(97,'Irwin Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(98,'Hughes Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(99,'Wells Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(100,'Davila Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(101,'Barnett Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(102,'Norman Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(103,'Snow Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(104,'Wood Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(105,'Norton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(106,'Morgan Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(107,'Decker Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(108,'Lambert Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(109,'Barry Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(110,'Oneill Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(111,'Cooley Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(112,'Leach Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(113,'Pacheco Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(114,'Rivers Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(115,'Griffith Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(116,'Glenn Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(117,'Francis Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(118,'Rhodes Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(119,'White Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(120,'Lang Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(121,'Ramirez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(122,'Serrano Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(123,'Galloway Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(124,'Clark Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(125,'Gonzales Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(126,'Cobb Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(127,'Shah Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(128,'Arroyo Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(129,'Booker Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(130,'Mercer Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(131,'Horton Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(132,'Rios Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(133,'Craig Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(134,'Oliver Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(135,'Montgomery Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(136,'Cooke Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(137,'Morrison Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(138,'Bright Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(139,'Atkins Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(140,'Woods Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(141,'Stanley Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(142,'Fischer Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(143,'Kline Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(144,'Joyce Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(145,'Case Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(146,'Graves Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(147,'Wu Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(148,'Grant Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(149,'Rojas Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(150,'Chase Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(151,'Holder Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(152,'Pollard Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(153,'Quinn Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(154,'Wilkinson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(155,'Keller Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(156,'Ellis Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(157,'Neal Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(158,'Mcconnell Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(159,'Arellano Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(160,'Glover Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(161,'Lutz Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(162,'Graves Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(163,'Carson Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(164,'Fletcher Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
INSERT INTO "household_accounts" VALUES(165,'Hernandez Household','','','','','','','','','','','','','Household','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Household Account','true','','HH_Account');
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
INSERT INTO "npe4__relationships" VALUES(1,'','false','','Current','Mother','5','6');
INSERT INTO "npe4__relationships" VALUES(2,'','true','','Current','Son','6','5');
INSERT INTO "npe4__relationships" VALUES(3,'','true','Arthur is Arlene''s recently deceased father.','Current','Child','9','10');
INSERT INTO "npe4__relationships" VALUES(4,'Tribute','false','Arthur is Arlene''s recently deceased father.','Current','Father','10','9');
INSERT INTO "npe4__relationships" VALUES(5,'','true','','Current','Son','13','15');
INSERT INTO "npe4__relationships" VALUES(6,'','true','','Current','Son','14','15');
INSERT INTO "npe4__relationships" VALUES(7,'','false','','Current','Mother','15','13');
INSERT INTO "npe4__relationships" VALUES(8,'','false','','Current','Father','15','14');
INSERT INTO "npe4__relationships" VALUES(9,'','true','','Current','Spouse','23','25');
INSERT INTO "npe4__relationships" VALUES(10,'','true','','Current','Parent','24','25');
INSERT INTO "npe4__relationships" VALUES(11,'','false','','Current','Husband','25','23');
INSERT INTO "npe4__relationships" VALUES(12,'','false','','Current','Daughter','25','24');
CREATE TABLE "npsp__OpportunityContactRole" (
	id INTEGER NOT NULL, 
	"Role" VARCHAR(255), 
	"IsPrimary" VARCHAR(255), 
	contact_id VARCHAR(255), 
	opportunity_id VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__OpportunityContactRole" VALUES(1,'Tribute','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(2,'Tribute','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(3,'Tribute','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(4,'Tribute','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(5,'Tribute','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(6,'Household Member','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(7,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(8,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(9,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(10,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(11,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(12,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(13,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(14,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(15,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(16,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(17,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(18,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(19,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(20,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(21,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(22,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(23,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(24,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(25,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(26,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(27,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(28,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(29,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(30,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(31,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(32,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(33,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(34,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(35,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(36,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(37,'Household Member','false','15','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(38,'Household Member','false','15','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(39,'Household Member','false','15','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(40,'Household Member','false','15','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(41,'Household Member','false','15','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(42,'Household Member','false','15','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(43,'Donor','true','10','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(44,'Donor','true','12','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(45,'Donor','true','13','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(46,'Tribute','false','9','1');
INSERT INTO "npsp__OpportunityContactRole" VALUES(47,'Household Member','false','11','2');
INSERT INTO "npsp__OpportunityContactRole" VALUES(48,'Household Member','false','14','3');
INSERT INTO "npsp__OpportunityContactRole" VALUES(49,'Household Member','false','15','3');
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
INSERT INTO "npsp__donations" VALUES(1,'Arthur Baker Donation in Memoriam','','','Closed Won','','Closed','100.0','','','2019-09-02','500.0','false','','','Arlene Baker','Arthur Baker','','','','','','Memorial','Phone','','','To Be Acknowledged','','','','','','','','2019-09-06','','','','','false','false','false','All Opportunities','0035400000Hsa3XAAR','','','','','false','25','10','9','10');
INSERT INTO "npsp__donations" VALUES(2,'Darryl Graham 2019 In-Kind Donation','','','In-Kind Received','','Omitted','100.0','','','2019-08-05','400.0','false','','','','','','','','','<p>PSA Production for fundraising drive</p>','','','','Services','Acknowledged','','','','','','','','2019-08-09','','','800.0','','false','true','false','All Opportunities','0035400000HtExuAAF','','','','','false','26','12','','');
INSERT INTO "npsp__donations" VALUES(3,'Lynn Barnes 1019 Donation','','','Closed Won','','Closed','100.0','','','2019-07-01','500.0','false','','','','','','','','','','','','','','Acknowledged','','','','','','','','2019-07-05','','','','','false','false','false','All Opportunities','0035400000HtEyZAAV','','','','','false','27','13','','');
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
INSERT INTO "pmdm__ProgramCohort__c" VALUES(2,'Genellen','Genellen neighborhood service area','','2019-02-01','Active','6');
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
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(1,'Tatiana  Lang - Mobile Middle School STEM Program','','false','','Client','Enrolled','2020-01-06','','121','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(2,'Julie  Myers - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-12-11','','38','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(3,'Fernando  Beltran - ESL Program','','false','','Client','Enrolled','2019-12-02','','55','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(4,'Emilie  Costa - After School Program, Ages 11-13','','false','','Client','Enrolled','2020-02-08','','88','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(5,'Turner  Carson - Drug and Alcohol Recovery Management','','false','','Client','Enrolled','2019-12-10','','167','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(6,'Sonia  Gentry - After School Program, Ages 11-13','','false','2019-12-20','Client','In Progress','2019-09-09','','48','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(7,'Mira  Olson - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2020-02-03','','171','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(8,'Abraham  Sims - School Lunch Program','','false','','Client','Enrolled','2020-01-06','','67','11','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(9,'Yusef  Flores - ESL Program','','false','','Client','Enrolled','2020-01-06','','77','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(10,'Ariella  Branch - ESL Program','','false','','Client','Enrolled','2020-02-03','','17','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(11,'Joe  Salinas - Job Readiness Program','','false','','Client','Enrolled','2020-02-06','','2','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(12,'Fabian  Hughes - School Lunch Program','','false','','Client','In Progress','2019-09-09','','94','11','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(13,'Gary  Wood - Job Readiness Program','','false','','Client','In Progress','2019-10-02','','102','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(14,'Alana  Owen - School Lunch Program','2019-09-09','false','','Client','In Progress','2019-12-19','','31','11','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(15,'Alison  Barr - Drug and Alcohol Recovery Management','','false','','Client','Enrolled','2019-02-04','','49','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(16,'Zackery  Morgan - Drug and Alcohol Recovery Management','','false','','Client','In Progress','2019-10-18','','73','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(17,'Neil  Huerta - Drug and Alcohol Recovery Management','','false','','Client','Enrolled','2020-01-08','','130','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(18,'Khloe  Stanley - Mobile Middle School STEM Program','','false','','Client','Enrolled','2020-02-03','','143','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(19,'Sonia  Gentry - School Lunch Program','','false','','Client','Enrolled','2019-12-02','','48','11','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(20,'Marc  Richard - No More Food Deserts Advocacy','','false','','Volunteer','In Progress','2019-08-12','','44','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(21,'Lucia  Cain - Financial Literacy Program','','false','','Client','Enrolled','2020-01-06','','90','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(22,'Christina  Webster - Remedial Reading Program','','false','','Client','Enrolled','2020-02-03','','87','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(23,'Eliezer  Bray - No More Food Deserts Advocacy','','false','','Volunteer','Enrolled','2020-02-08','','80','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(24,'Marcus  Huynh - No More Food Deserts Advocacy','','false','','Volunteer','Enrolled','2020-01-08','','63','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(25,'Steven  Harper - Financial Literacy Program','2020-02-03','false','','Client','Enrolled','2020-02-03','','82','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(26,'Semaj  Wall - Financial Literacy Program','','false','','Client','In Progress','2019-09-09','','78','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(27,'Aaron  Valdez - No More Food Deserts Advocacy','','false','','Volunteer','In Progress','2019-10-02','','59','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(28,'Yesenia  Ritter - Prenatal and Early Childhood Health Program','2019-08-05','false','','Client','In Progress','2019-11-22','','66','6','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(29,'Abraham  Sims - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','','67','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(30,'Cora  Hall - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-12','','69','6','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(31,'Delilah  Ibarra - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-05-08','','72','6','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(32,'Lauryn  Odom - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-21','','76','6','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(33,'Tom  Higgins - Housing Assistance Program','2019-05-25','false','','Client','Enrolled','2019-06-01','23','5','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(34,'Tom  Higgins - School Lunch Program','2019-06-08','false','','Client','Enrolled','2019-09-03','','5','11','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(35,'Tom  Higgins - Remedial Reading Program','2019-04-12','false','','Client','In Progress','2019-09-09','','5','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(36,'Tom  Higgins - After School Program, Ages 11-13','2019-08-29','false','','Client','In Progress','2019-09-03','','5','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(37,'Karissa  Aguilar - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-20','','83','6','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(38,'Arlene  Baker - Job Readiness Program','2019-06-19','false','','Client','In Progress','2019-09-04','','10','2','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(39,'Yuliana  Bird - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','56','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(40,'Robin  Banks - Drug and Alcohol Recovery Management','2019-08-24','false','','Client','In Progress','2019-09-03','','11','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(41,'Robin  Banks - Job Readiness Program','2019-09-02','false','','Client','In Progress','2019-09-04','','11','2','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(42,'Ayanna  Gonzalez - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','74','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(43,'Jason  Barnes - Financial Literacy Program','2019-08-23','false','','Client','In Progress','2019-09-09','','15','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(44,'Naima  Crawford - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','1','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(45,'Olive  Leach - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-08','','111','6','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(46,'Jessica  Woods - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','118','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(47,'Marisol  Gonzales - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-18','','126','6','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(48,'Nancy  Arroyo - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-10-15','','129','6','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(49,'Taniyah  Rios - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','134','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(50,'Dayana  Atkins - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-11-22','','142','6','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(51,'Casey  Kline - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','145','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(52,'Diego  Case - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','147','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(53,'Maya  Johnson - After School Program, Ages 11-13','','false','','Client','Enrolled','2019-12-02','','24','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(54,'Barbara  Johnson - ESL Program','2019-07-03','false','','Client','In Progress','2019-09-09','','25','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(55,'Audrina  Rojas - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-11-06','','151','6','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(56,'Caylee  Pollard - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-11-20','','155','6','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(57,'Simone  Keller - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-12','','158','6','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(58,'Violet  Ellis - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-03','','159','6','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(59,'Mira  Mcconnell - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-04-24','','161','6','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(60,'Emelia  Fletcher - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-04-08','','168','6','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(61,'Juliette  Cisneros - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-11-21','','29','6','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(62,'Alana  Owen - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','','31','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(63,'Amelie  Bond - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-30','','37','6','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(64,'Alia  Duarte - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','12','119','4','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(65,'Kellen  Cooley - After School Program, Ages 11-13','','false','','Client','In Progress','2019-12-02','','51','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(66,'Marco  Escobar - After School Program, Ages 11-13','','false','','Client','In Progress','2019-09-09','','62','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(67,'Javon  Rodgers - After School Program, Ages 11-13','','false','','Client','In Progress','2019-10-01','','41','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(68,'Aubrie  Booker - Mobile Middle School STEM Program','','false','','Client','Enrolled','2020-01-06','','131','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(69,'Jay  Shah - Mobile Middle School STEM Program','','false','','Client','Enrolled','2019-12-02','','128','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(70,'Fabian  Hughes - After School Program, Ages 11-13','','false','','Client','In Progress','2019-09-09','','94','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(71,'Jace  Hampton - After School Program, Ages 11-13','','false','','Client','Enrolled','2020-01-06','','46','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(72,'Emelia  Mercer - Housing Assistance Program','','false','','Client','In Progress','2019-10-02','','132','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(73,'Josie  Mcclure - Financial Literacy Program','','false','','Client','Enrolled','2019-09-09','','52','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(74,'Isaac  Barker - Financial Literacy Program','','false','','Client','In Progress','2019-09-09','','70','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(75,'Fabian  Hughes - Remedial Reading Program','2019-12-02','false','','Client','Enrolled','2019-12-19','','94','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(76,'Laura  Woodard - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2020-01-10','','97','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(77,'Leon  Clayton - No More Food Deserts Advocacy','','false','','Volunteer','In Progress','2019-09-10','','43','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(78,'Taniya  Singleton - No More Food Deserts Advocacy','','false','','Volunteer','Enrolled','2019-12-02','','85','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(79,'Anthony  Hill - Job Readiness Program','','false','','Client','Enrolled','2019-12-19','','20','2','6');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(80,'Semaj  Wall - ESL Program','','false','','Client','In Progress','2019-10-01','','78','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(81,'Samir  Neal - ESL Program','','false','','Client','In Progress','2019-09-09','','160','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(82,'Adrianna  Norman - Job Readiness Program','','false','','Client','Enrolled','2020-01-06','','100','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(83,'Anika  Solomon - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-12-02','','4','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(84,'James  Richards - Housing Assistance Program','','false','','Client','Enrolled','2020-01-06','','35','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(85,'Zackery  Morgan - No More Food Deserts Advocacy','','false','','Volunteer','Enrolled','2020-01-07','','73','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(86,'Shannon  Greene - No More Food Deserts Advocacy','','false','','Volunteer','Enrolled','2020-01-08','','61','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(87,'John  Mills - No More Food Deserts Advocacy','','false','','Volunteer','In Progress','2019-09-02','','60','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(88,'Yusef  Flores - Financial Literacy Program','','false','','Client','In Progress','2019-09-09','','77','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(89,'Dalia  Osborn - Housing Assistance Program','','false','','Client','Enrolled','2020-01-06','','96','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(90,'Hailie  Holder - Housing Assistance Program','','false','','Client','Enrolled','2020-02-03','','154','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(91,'Alice  Irwin - Financial Literacy Program','','false','','Client','Enrolled','2019-12-02','','93','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(92,'Naima  Crawford - School Lunch Program','','false','','Client','Enrolled','2020-02-03','','1','11','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(93,'Emilie  Costa - Remedial Reading Program','','false','','Client','Enrolled','2020-01-06','','88','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(94,'Angelo  Lutz - Housing Assistance Program','','false','','Client','Enrolled','2019-12-02','','165','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(95,'Isaac  Grant - Housing Assistance Program','','false','','Client','In Progress','2019-11-04','','150','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(96,'Jaylin  Morgan - Housing Assistance Program','','false','','Client','In Progress','2019-09-24','','104','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(97,'Jay  Zimmerman - No More Food Deserts Advocacy','','false','','Volunteer','In Progress','2019-11-12','','53','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(98,'Nico  Rivers - Housing Assistance Program','','false','','Client','In Progress','2019-09-19','','113','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(99,'Marco  Escobar - Remedial Reading Program','','false','','Client','In Progress','2019-09-09','','62','1','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(100,'Frankie  Waller - Financial Literacy Program','','false','','Client','In Progress','2019-12-19','','79','10','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(101,'Jordan  Waller - Remedial Reading Program','','false','','Client','In Progress','2019-09-09','','45','1','');
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
INSERT INTO "pmdm__Program__c" VALUES(6,'Prenatal and Early Childhood Health Program','','','Food and Nutrition','','Active','','');
INSERT INTO "pmdm__Program__c" VALUES(7,'Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2019-12-31','','2019-01-01','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "pmdm__Program__c" VALUES(8,'Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2019-05-01','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "pmdm__Program__c" VALUES(9,'ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2020-05-30','','2019-09-09','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "pmdm__Program__c" VALUES(10,'Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','2019-12-13','Education','2019-09-04','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(11,'School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2020-05-30','Food and Nutrition','2019-09-03','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
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
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(1,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(2,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(3,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(4,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(5,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(6,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(7,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(8,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(9,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(10,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(11,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(12,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(13,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(14,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(15,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(16,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(17,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(18,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(19,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(20,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(21,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(22,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(23,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(24,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(25,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(26,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(27,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(28,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(29,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(30,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(31,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(32,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(33,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(34,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(35,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(36,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(37,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(38,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(39,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(40,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(41,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(42,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(43,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(44,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(45,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(46,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(47,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(48,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(49,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(50,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(51,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(52,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(53,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(54,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(55,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(56,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(57,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(58,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(59,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(60,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(61,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(62,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(63,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-09-20','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(64,'Maya Johnson - After School Activities','false','2019-12-13','2.0','15','','24','53');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(65,'Fabian Hughes - After School Activities','false','2019-09-13','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(66,'Fabian Hughes - After School Activities','false','2019-10-25','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(67,'Marco Escobar - After School Activities','false','2019-10-04','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(68,'Barbara Johnson - ESL Classroom Hours','false','2019-09-05','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(69,'Barbara Johnson - ESL Classroom Hours','false','2019-10-29','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(70,'Barbara Johnson - ESL Classroom Hours','false','2019-11-12','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(71,'Samir Neal - ESL Classroom Hours','false','2019-10-17','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(72,'Samir Neal - ESL Classroom Hours','false','2019-10-24','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(73,'Samir Neal - ESL Classroom Hours','false','2019-11-19','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(74,'Olive Leach - Provide Prenatal Vitamins','false','2019-11-30','30.0','2','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(75,'Olive Leach - Provide Prenatal Vitamins','false','2019-12-31','30.0','2','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(76,'Olive Leach - Provide Prenatal Vitamins','false','2020-01-31','30.0','2','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(77,'Taniyah Rios - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(78,'Barbara Johnson - ESL Classroom Hours','false','2019-11-26','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(79,'Yusef Flores - ESL Classroom Hours','false','2020-01-07','2.0','16','','77','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(80,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(81,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(82,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(83,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(84,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(85,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(86,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(87,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(88,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(89,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(90,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(91,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(92,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(93,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(94,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(95,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(96,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(97,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(98,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(99,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(100,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(101,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(102,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(103,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(104,'Abraham Sims - STEM Field Trips','false','2019-11-25','1.0','6','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(105,'Yuliana Bird - STEM Field Trips','false','2019-11-25','1.0','6','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(106,'Ayanna Gonzalez - STEM Field Trips','false','2019-11-25','1.0','6','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(107,'Alia Duarte - STEM Field Trips','false','2019-11-25','1.0','6','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(108,'Naima Crawford - STEM Field Trips','false','2019-11-25','1.0','6','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(109,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(110,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(111,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(112,'Jessica Woods - STEM Field Trips','false','2019-11-25','1.0','6','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(113,'Taniyah Rios - STEM Field Trips','false','2019-11-25','1.0','6','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(114,'Casey Kline - STEM Field Trips','false','2019-11-25','1.0','6','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(115,'Diego Case - STEM Field Trips','false','2019-11-25','1.0','6','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(116,'Alana Owen - STEM Field Trips','false','2019-11-25','1.0','6','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(117,'Alana Owen - STEM Field Trips','false','2019-11-25','','6','','31','62');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(118,'Samir Neal - ESL Classroom Hours','false','2019-10-22','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(119,'Samir Neal - ESL Classroom Hours','false','2020-01-07','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(120,'Semaj Wall - ESL Classroom Hours','false','2019-10-17','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(121,'Semaj Wall - ESL Classroom Hours','false','2019-11-07','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(122,'Tom Higgins - Subsidized Lunch','false','2019-10-01','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(123,'Dalia Osborn - Monthly Rent Subsidy','false','2020-01-13','400.0','1','1','96','89');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(124,'Naima Crawford - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(125,'Javon Rodgers - After School Activities','false','2019-10-29','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(126,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(127,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(128,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(129,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(130,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(131,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(132,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(133,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','1','44');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(134,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(135,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(136,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(137,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(138,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(139,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(140,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(141,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(142,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','134','49');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(143,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(144,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(145,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(146,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(147,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(148,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(149,'Arlene Baker - Financial Advisor Sessions','false','2019-09-05','0.5','12','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(150,'Arlene Baker - Financial Advisor Sessions','false','2019-12-04','0.5','12','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(151,'Robin Banks - Financial Advisor Sessions','false','2019-10-07','0.5','12','','11','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(152,'Robin Banks - Financial Advisor Sessions','false','2019-10-07','0.5','12','','11','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(153,'Robin Banks - Financial Advisor Sessions','false','2019-11-04','0.5','12','','11','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(154,'Robin Banks - Financial Advisor Sessions','false','2019-09-09','0.5','12','','11','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(155,'Arlene Baker - Job Readiness Coaching','false','2019-11-27','0.5','13','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(156,'Barbara Johnson - ESL Classroom Hours','false','2019-09-24','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(157,'Karissa Aguilar - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-11','1.0','3','','83','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(158,'Lauryn Odom - Refer to Caregivers Support Group','false','2019-09-14','1.0','4','','76','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(159,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-30','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(160,'Arlene Baker - Job Readiness Coaching','false','2019-11-29','0.75','13','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(161,'Arlene Baker - Job Readiness Coaching','false','2019-09-25','0.75','13','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(162,'Arlene Baker - Job Readiness Coaching','false','2019-10-30','0.75','13','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(163,'Robin Banks - Job Readiness Coaching','false','2019-12-20','0.75','13','','11','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(164,'Robin Banks - Job Readiness Coaching','false','2019-10-28','0.75','13','','11','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(165,'Robin Banks - Job Readiness Coaching','false','2019-09-27','0.75','13','','11','41');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(166,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-30','1.0','3','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(167,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-18','1.0','3','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(168,'Barbara Johnson - ESL Classroom Hours','false','2019-12-05','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(169,'Fernando Beltran - ESL Classroom Hours','false','2019-12-19','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(170,'Olive Leach - Provide Prenatal Vitamins','false','2019-09-18','30.0','2','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(171,'Olive Leach - Provide Prenatal Vitamins','false','2019-10-30','30.0','2','','111','45');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(172,'Marisol Gonzales - Provide Prenatal Vitamins','false','2019-10-14','30.0','2','','126','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(173,'Nancy Arroyo - Provide Prenatal Vitamins','false','2019-10-16','30.0','2','','129','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(174,'Dayana Atkins - Provide Prenatal Vitamins','false','2019-11-25','30.0','2','','142','50');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(175,'Juliette Cisneros - Provide Prenatal Vitamins','false','2019-11-20','30.0','2','','29','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(176,'Tom Higgins - Subsidized Lunch','false','2019-11-05','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(177,'Tom Higgins - Subsidized Lunch','false','2019-11-06','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(178,'Tom Higgins - Subsidized Lunch','false','2019-11-04','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(179,'Arlene Baker - Job Interviews completed','false','2019-10-11','1.0','11','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(180,'Arlene Baker - Job Interviews completed','false','2019-10-15','2.0','11','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(181,'Arlene Baker - Financial Advisor Sessions','false','2019-10-07','0.5','12','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(182,'Arlene Baker - Financial Advisor Sessions','false','2019-11-05','0.5','12','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(183,'Arlene Baker - Financial Advisor Sessions','false','2020-01-06','0.5','12','','10','38');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(184,'Marisol Gonzales - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-14','1.0','3','','126','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(185,'Nancy Arroyo - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-16','1.0','3','','129','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(186,'Dayana Atkins - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','1.0','3','','142','50');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(187,'Caylee Pollard - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-22','1.0','3','','155','56');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(188,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-14','1.0','3','','159','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(189,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-02','1.0','3','','159','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(190,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-13','1.0','3','','159','58');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(191,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(192,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(193,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(194,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(195,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(196,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(197,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(198,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(199,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(200,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-16','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(201,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(202,'Emelia Fletcher - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','1.0','3','','168','60');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(203,'Juliette Cisneros - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-20','1.0','3','','29','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(204,'Delilah Ibarra - Refer to Caregivers Support Group','false','2019-11-13','1.0','4','','72','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(205,'Karissa Aguilar - Refer to Caregivers Support Group','false','2019-11-25','','4','','83','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(206,'Emelia Fletcher - Refer to Caregivers Support Group','false','2019-11-06','1.0','4','','168','60');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(207,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(208,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-11','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(209,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(210,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-20','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(211,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(212,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-30','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(213,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-18','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(214,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-13','2.0','5','','67','29');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(215,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-09','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(216,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-06','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(217,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-23','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(218,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-11','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(219,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-18','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(220,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-04','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(221,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-25','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(222,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-02','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(223,'Fabian Hughes - Subsidized Lunch','false','2019-09-10','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(224,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-10-04','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(225,'Emilie Costa - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','10','','88','93');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(226,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-09-27','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(227,'Tom Higgins - Subsidized Lunch','false','2019-11-12','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(228,'Samir Neal - ESL Classroom Hours','false','2019-10-10','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(229,'Semaj Wall - ESL Classroom Hours','false','2019-10-01','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(230,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-12-06','2.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(231,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-04','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(232,'Barbara Johnson - ESL Classroom Hours','false','2019-12-12','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(233,'Fernando Beltran - ESL Classroom Hours','false','2020-01-09','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(234,'Samir Neal - ESL Classroom Hours','false','2019-09-12','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(235,'Tom Higgins - Subsidized Lunch','false','2019-11-07','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(236,'Naima Crawford - Subsidized Lunch','false','2019-12-11','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(237,'Jay Zimmerman - Letter writing campaign to Council Members','false','2019-11-12','1.0','8','','53','97');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(238,'Marc Richard - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','44','20');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(239,'Zackery Morgan - 12 Step Recovery Program','false','2019-10-29','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(240,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-05','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(241,'Diego Case - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','147','52');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(242,'Semaj Wall - Financial Literacy Classroom Hours','false','2020-01-10','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(243,'Fabian Hughes - After School Activities','false','2019-11-22','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(244,'Marco Escobar - After School Activities','false','2019-09-20','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(245,'Marco Escobar - After School Activities','false','2019-10-25','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(246,'Marco Escobar - After School Activities','false','2019-12-13','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(247,'Kellen Cooley - After School Activities','false','2019-12-10','1.0','15','','51','65');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(248,'Sonia Gentry - After School Activities','false','2019-10-30','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(249,'Sonia Gentry - After School Activities','false','2019-12-11','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(250,'Sonia Gentry - After School Activities','false','2019-12-19','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(251,'Javon Rodgers - After School Activities','false','2019-10-15','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(252,'Javon Rodgers - After School Activities','false','2019-10-22','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(253,'Tom Higgins - After School Activities','false','2019-09-13','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(254,'Tom Higgins - After School Activities','false','2019-10-18','2.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(255,'Tom Higgins - After School Activities','false','2019-11-08','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(256,'Sonia Gentry - After School Activities','false','2019-10-09','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(257,'Sonia Gentry - After School Activities','false','2019-10-23','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(258,'Tom Higgins - After School Activities','false','2019-11-01','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(259,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-12-06','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(260,'Maya Johnson - After School Activities','false','2019-12-20','2.0','15','','24','53');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(261,'Javon Rodgers - After School Activities','false','2019-10-01','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(262,'Javon Rodgers - After School Activities','false','2019-11-05','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(263,'Sonia Gentry - After School Activities','false','2019-11-14','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(264,'Javon Rodgers - After School Activities','false','2019-12-10','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(265,'Javon Rodgers - After School Activities','false','2020-01-07','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(266,'Kellen Cooley - After School Activities','false','2019-12-03','1.0','15','','51','65');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(267,'Sonia Gentry - After School Activities','false','2019-10-24','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(268,'Sonia Gentry - After School Activities','false','2019-11-06','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(269,'Sonia Gentry - After School Activities','false','2019-12-05','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(270,'Robin Banks - 12 Step Recovery Program','false','2019-09-03','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(271,'Robin Banks - 12 Step Recovery Program','false','2019-09-10','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(272,'Robin Banks - 12 Step Recovery Program','false','2019-09-17','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(273,'Robin Banks - 12 Step Recovery Program','false','2019-09-24','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(274,'Neil Huerta - 12 Step Recovery Program','false','2020-01-13','1.0','14','','130','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(275,'Turner Carson - 12 Step Recovery Program','false','2019-12-30','1.0','14','','167','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(276,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-12','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(277,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-03','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(278,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-10','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(279,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-10-11','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(280,'Marco Escobar - After School Activities','false','2019-12-20','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(281,'Semaj Wall - ESL Classroom Hours','false','2019-12-10','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(282,'Semaj Wall - ESL Classroom Hours','false','2019-12-19','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(283,'Gary Wood - Job Readiness Coaching','false','2019-12-20','0.75','13','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(284,'Barbara Johnson - ESL Classroom Hours','false','2019-10-22','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(285,'Barbara Johnson - ESL Classroom Hours','false','2019-11-05','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(286,'Barbara Johnson - ESL Classroom Hours','false','2019-11-19','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(287,'Barbara Johnson - ESL Classroom Hours','false','2019-11-21','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(288,'Fernando Beltran - ESL Classroom Hours','false','2019-12-10','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(289,'Fernando Beltran - ESL Classroom Hours','false','2019-12-12','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(290,'Samir Neal - ESL Classroom Hours','false','2019-12-19','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(291,'Samir Neal - ESL Classroom Hours','false','2020-01-09','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(292,'Semaj Wall - ESL Classroom Hours','false','2019-10-15','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(293,'Semaj Wall - ESL Classroom Hours','false','2019-10-31','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(294,'Semaj Wall - ESL Classroom Hours','false','2019-11-19','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(295,'Semaj Wall - ESL Classroom Hours','false','2019-12-05','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(296,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-11','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(297,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-25','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(298,'Javon Rodgers - After School Activities','false','2019-10-08','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(299,'Javon Rodgers - After School Activities','false','2019-11-26','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(300,'Sonia Gentry - After School Activities','false','2019-11-13','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(301,'Fabian Hughes - After School Activities','false','2019-10-11','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(302,'Samir Neal - ESL Classroom Hours','false','2019-10-29','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(303,'Samir Neal - ESL Classroom Hours','false','2019-10-31','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(304,'Samir Neal - ESL Classroom Hours','false','2019-11-07','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(305,'Samir Neal - ESL Classroom Hours','false','2019-11-21','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(306,'Semaj Wall - ESL Classroom Hours','false','2019-10-08','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(307,'Semaj Wall - ESL Classroom Hours','false','2019-10-29','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(308,'Semaj Wall - ESL Classroom Hours','false','2019-11-05','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(309,'Semaj Wall - ESL Classroom Hours','false','2019-11-14','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(310,'Barbara Johnson - ESL Classroom Hours','false','2019-09-10','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(311,'Barbara Johnson - ESL Classroom Hours','false','2019-10-24','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(312,'Barbara Johnson - ESL Classroom Hours','false','2019-11-14','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(313,'Fabian Hughes - After School Activities','false','2020-01-10','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(314,'Barbara Johnson - ESL Classroom Hours','false','2019-09-19','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(315,'Barbara Johnson - ESL Classroom Hours','false','2019-12-19','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(316,'Samir Neal - ESL Classroom Hours','false','2019-09-10','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(317,'Samir Neal - ESL Classroom Hours','false','2019-09-24','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(318,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-12-13','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(319,'Samir Neal - ESL Classroom Hours','false','2019-09-26','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(320,'Barbara Johnson - ESL Classroom Hours','false','2019-10-10','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(321,'Sonia Gentry - After School Activities','false','2019-12-04','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(322,'Fernando Beltran - ESL Classroom Hours','false','2019-12-05','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(323,'Semaj Wall - ESL Classroom Hours','false','2019-12-17','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(324,'Semaj Wall - ESL Classroom Hours','false','2020-01-07','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(325,'Gary Wood - Financial Advisor Sessions','false','2019-10-02','0.5','12','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(326,'Gary Wood - Financial Advisor Sessions','false','2019-11-04','0.5','12','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(327,'Abraham Sims - Subsidized Lunch','false','2020-01-07','','9','','67','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(328,'Sonia Gentry - Subsidized Lunch','false','2019-12-03','','9','','48','19');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(329,'Fabian Hughes - Subsidized Lunch','false','2019-09-20','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(330,'Isaac Grant - Monthly Rent Subsidy','false','2019-11-15','250.0','1','148','150','95');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(331,'Semaj Wall - ESL Classroom Hours','false','2019-11-26','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(332,'Gary Wood - Job Readiness Coaching','false','2019-11-21','0.75','13','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(333,'Samir Neal - ESL Classroom Hours','false','2019-12-03','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(334,'Samir Neal - ESL Classroom Hours','false','2019-12-12','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(335,'Turner Carson - 12 Step Recovery Program','false','2020-01-07','1.0','14','','167','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(336,'Jessica Woods - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','118','46');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(337,'Barbara Johnson - ESL Classroom Hours','false','2019-12-17','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(338,'Barbara Johnson - ESL Classroom Hours','false','2020-01-09','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(339,'Samir Neal - ESL Classroom Hours','false','2019-10-01','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(340,'Samir Neal - ESL Classroom Hours','false','2019-11-05','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(341,'Sonia Gentry - After School Activities','false','2019-12-12','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(342,'Taniya Singleton - Town Hall Meeting, 8/19/19','false','2020-01-08','1.0','7','','85','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(343,'Eliezer Bray - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','80','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(344,'Tom Higgins - Subsidized Lunch','false','2019-10-14','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(345,'Mira Olson - Prenatal Care Sessions (appointments and walk-ins)','false','2020-02-03','1.0','3','','171','7');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(346,'Nancy Arroyo - Provide Prenatal Vitamins','false','2020-01-16','30.0','2','','129','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(347,'Dayana Atkins - Provide Prenatal Vitamins','false','2020-01-24','30.0','2','','142','50');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(348,'Karissa Aguilar - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','1.0','3','','83','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(349,'Tom Higgins - Subsidized Lunch','false','2019-11-06','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(350,'Tom Higgins - Subsidized Lunch','false','2019-11-11','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(351,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-25','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(352,'Barbara Johnson - ESL Classroom Hours','false','2019-10-01','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(353,'Barbara Johnson - ESL Classroom Hours','false','2019-10-31','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(354,'Barbara Johnson - ESL Classroom Hours','false','2019-11-07','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(355,'Robin Banks - 12 Step Recovery Program','false','2020-01-07','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(356,'Alice Irwin - Financial Literacy Classroom Hours','false','2019-12-20','2.0','17','','93','91');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(357,'Marcus Huynh - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','63','24');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(358,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-10-04','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(359,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-09-13','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(360,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-11','4.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(361,'Neil Huerta - 12 Step Recovery Program','false','2020-01-16','1.0','14','','130','17');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(362,'Turner Carson - 12 Step Recovery Program','false','2019-12-17','1.0','14','','167','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(363,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-19','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(364,'Zackery Morgan - 12 Step Recovery Program','false','2019-11-26','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(365,'Nancy Arroyo - Provide Prenatal Vitamins','false','2019-11-15','30.0','2','','129','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(366,'Julie Myers - Prenatal Care Sessions (appointments and walk-ins)','false','2019-12-11','1.0','3','','38','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(367,'Zackery Morgan - 12 Step Recovery Program','false','2019-12-24','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(368,'Zackery Morgan - 12 Step Recovery Program','false','2020-01-07','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(369,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-12-13','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(370,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-04','4.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(371,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-22','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(372,'Karissa Aguilar - Refer to Caregivers Support Group','false','2019-10-14','1.0','4','','83','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(373,'Audrina Rojas - Refer to Caregivers Support Group','false','2019-12-10','1.0','4','','151','55');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(374,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-09-27','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(375,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-08','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(376,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-09-13','4.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(377,'Lauryn Odom - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-05','1.0','3','','76','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(378,'Delilah Ibarra - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-07','1.0','3','','72','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(379,'Naima Crawford - Subsidized Lunch','false','2019-12-05','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(380,'Sonia Gentry - Subsidized Lunch','false','2019-12-02','','9','','48','19');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(381,'Fabian Hughes - Subsidized Lunch','false','2019-09-09','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(382,'Aaron Valdez - Letter writing campaign to Council Members','false','2019-10-02','1.0','8','','59','27');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(383,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-15','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(384,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-29','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(385,'Jason Barnes - Financial Literacy Classroom Hours','false','2020-01-10','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(386,'Alice Irwin - Financial Literacy Classroom Hours','false','2019-12-06','2.0','17','','93','91');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(387,'Lucia Cain - Financial Literacy Classroom Hours','false','2019-12-13','2.0','17','','90','21');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(388,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-09-20','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(389,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-15','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(390,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-29','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(391,'Shannon Greene - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','61','86');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(392,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-01','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(393,'John Mills - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','60','87');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(394,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-01','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(395,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-12-20','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(396,'Lucia Cain - Financial Literacy Classroom Hours','false','2019-12-20','2.0','17','','90','21');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(397,'Lucia Cain - Financial Literacy Classroom Hours','false','2020-01-10','2.0','17','','90','21');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(398,'Alice Irwin - Financial Literacy Classroom Hours','false','2019-12-13','2.0','17','','93','91');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(399,'Lucia Cain - Financial Literacy Classroom Hours','false','2019-12-06','2.0','17','','90','21');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(400,'Marco Escobar - After School Activities','false','2019-09-13','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(401,'Marco Escobar - After School Activities','false','2019-11-01','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(402,'Marco Escobar - After School Activities','false','2019-11-22','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(403,'Javon Rodgers - After School Activities','false','2019-12-17','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(404,'Sonia Gentry - After School Activities','false','2019-12-18','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(405,'Fernando Beltran - ESL Classroom Hours','false','2020-01-07','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(406,'Samir Neal - ESL Classroom Hours','false','2019-09-17','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(407,'Lauryn Odom - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-14','1.0','3','','76','32');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(408,'Cora Hall - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-12','1.0','3','','69','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(409,'Simone Keller - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-12','1.0','3','','158','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(410,'Robin Banks - 12 Step Recovery Program','false','2019-10-29','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(411,'Robin Banks - 12 Step Recovery Program','false','2019-11-19','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(412,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-09-20','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(413,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-01','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(414,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-22','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(415,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(416,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-08','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(417,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-22','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(418,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-12-13','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(419,'Maya Johnson - After School Activities','false','2019-12-06','2.0','15','','24','53');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(420,'Fabian Hughes - After School Activities','false','2019-11-15','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(421,'Barbara Johnson - ESL Classroom Hours','false','2019-10-08','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(422,'Fernando Beltran - ESL Classroom Hours','false','2019-12-17','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(423,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-10-15','150.0','1','106','104','96');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(424,'Javon Rodgers - After School Activities','false','2019-12-03','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(425,'Tom Higgins - After School Activities','false','2019-09-27','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(426,'Tom Higgins - After School Activities','false','2019-10-25','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(427,'Tom Higgins - After School Activities','false','2019-11-29','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(428,'Tom Higgins - After School Activities','false','2020-01-10','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(429,'Marco Escobar - After School Activities','false','2019-09-27','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(430,'Samir Neal - ESL Classroom Hours','false','2019-11-12','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(431,'Samir Neal - ESL Classroom Hours','false','2019-12-05','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(432,'Semaj Wall - ESL Classroom Hours','false','2019-10-03','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(433,'Turner Carson - 12 Step Recovery Program','false','2019-12-24','1.0','14','','167','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(434,'Julie Myers - Refer to Caregivers Support Group','false','2020-01-16','1.0','4','','38','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(435,'Fabian Hughes - Grade 1-8 Reading Tutoring','false','2019-12-20','1.0','10','','94','75');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(436,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(437,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-15','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(438,'Tom Higgins - After School Activities','false','2019-12-13','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(439,'Tom Higgins - After School Activities','false','2019-12-20','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(440,'Maya Johnson - After School Activities','false','2020-01-10','2.0','15','','24','53');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(441,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-29','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(442,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-09-27','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(443,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-01','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(444,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-15','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(445,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-11-29','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(446,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-12-13','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(447,'Barbara Johnson - ESL Classroom Hours','false','2019-09-03','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(448,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-12-13','150.0','1','106','104','96');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(449,'Jaylin Morgan - Monthly Rent Subsidy','false','2020-01-13','150.0','1','106','104','96');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(450,'Emelia Mercer - Monthly Rent Subsidy','false','2019-11-15','200.0','1','130','132','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(451,'Fabian Hughes - After School Activities','false','2019-09-20','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(452,'Fabian Hughes - After School Activities','false','2019-09-27','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(453,'Fabian Hughes - After School Activities','false','2019-10-04','1.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(454,'Fabian Hughes - After School Activities','false','2019-11-01','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(455,'Marco Escobar - After School Activities','false','2019-10-18','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(456,'Fabian Hughes - After School Activities','false','2019-10-18','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(457,'Tom Higgins - After School Activities','false','2019-09-20','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(458,'Tom Higgins - After School Activities','false','2019-10-04','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(459,'Tom Higgins - After School Activities','false','2019-10-11','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(460,'Tom Higgins - After School Activities','false','2019-11-22','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(461,'Barbara Johnson - ESL Classroom Hours','false','2019-09-26','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(462,'Abraham Sims - Subsidized Lunch','false','2020-01-10','','9','','67','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(463,'Cora Hall - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-07','1.0','3','','69','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(464,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-10-18','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(465,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-11-08','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(466,'Fabian Hughes - After School Activities','false','2019-12-20','1.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(467,'Marco Escobar - After School Activities','false','2019-10-11','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(468,'Marco Escobar - After School Activities','false','2020-01-10','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(469,'Tom Higgins - After School Activities','false','2019-11-15','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(470,'Tom Higgins - After School Activities','false','2019-12-06','4.0','15','','5','36');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(471,'Fabian Hughes - After School Activities','false','2019-11-08','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(472,'Gary Wood - Financial Advisor Sessions','true','2020-01-02','0.5','12','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(473,'Tom Higgins - Subsidized Lunch','false','2019-10-09','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(474,'Isaac Grant - Monthly Rent Subsidy','false','2020-01-13','250.0','1','148','150','95');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(475,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-11-15','150.0','1','106','104','96');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(476,'Marisol Gonzales - Provide Prenatal Vitamins','false','2019-11-14','30.0','2','','126','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(477,'Marisol Gonzales - Provide Prenatal Vitamins','false','2019-12-13','30.0','2','','126','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(478,'Laura Woodard - Prenatal Care Sessions (appointments and walk-ins)','false','2020-01-10','1.0','3','','97','76');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(479,'Cora Hall - Refer to Caregivers Support Group','false','2019-09-12','1.0','4','','69','30');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(480,'Robin Banks - 12 Step Recovery Program','false','2019-11-26','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(481,'Tom Higgins - Subsidized Lunch','false','2019-11-01','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(482,'Robin Banks - 12 Step Recovery Program','false','2019-12-24','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(483,'Robin Banks - 12 Step Recovery Program','false','2020-01-14','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(484,'Turner Carson - 12 Step Recovery Program','false','2019-12-10','1.0','14','','167','5');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(485,'Semaj Wall - ESL Classroom Hours','false','2019-10-10','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(486,'Semaj Wall - ESL Classroom Hours','false','2019-10-24','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(487,'Karissa Aguilar - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-15','1.0','3','','83','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(488,'Marco Escobar - After School Activities','false','2019-11-15','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(489,'Marco Escobar - After School Activities','false','2019-11-29','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(490,'Sonia Gentry - After School Activities','false','2019-10-16','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(491,'Sonia Gentry - After School Activities','false','2019-11-21','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(492,'Barbara Johnson - ESL Classroom Hours','false','2019-09-12','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(493,'Barbara Johnson - ESL Classroom Hours','false','2019-10-03','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(494,'Barbara Johnson - ESL Classroom Hours','false','2019-10-17','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(495,'Eliezer Bray - Letter writing campaign to Council Members','false','2020-01-08','1.0','8','','80','23');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(496,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-09-27','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(497,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-08','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(498,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-18','1.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(499,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-10-25','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(500,'Samir Neal - ESL Classroom Hours','false','2019-10-08','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(501,'Samir Neal - ESL Classroom Hours','false','2019-11-14','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(502,'Fabian Hughes - Subsidized Lunch','false','2019-09-11','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(503,'Nico Rivers - Monthly Rent Subsidy','false','2019-10-15','175.0','1','114','113','98');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(504,'Marisol Gonzales - Provide Prenatal Vitamins','false','2020-01-14','30.0','2','','126','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(505,'Juliette Cisneros - Provide Prenatal Vitamins','false','2019-12-20','30.0','2','','29','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(506,'Delilah Ibarra - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-13','1.0','3','','72','31');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(507,'Robin Banks - 12 Step Recovery Program','false','2019-10-01','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(508,'Robin Banks - 12 Step Recovery Program','false','2019-11-12','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(509,'Casey Kline - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','145','51');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(510,'Taniya Singleton - Letter writing campaign to Council Members','false','2019-12-02','1.0','8','','85','78');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(511,'Marc Richard - Letter writing campaign to Council Members','false','2019-08-12','1.0','8','','44','20');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(512,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-11-22','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(513,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-12-06','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(514,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-22','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(515,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-12-20','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(516,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-09-27','4.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(517,'Robin Banks - 12 Step Recovery Program','false','2019-10-08','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(518,'Robin Banks - 12 Step Recovery Program','false','2019-10-15','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(519,'Tom Higgins - Subsidized Lunch','false','2019-10-03','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(520,'Jaylin Morgan - Monthly Rent Subsidy','false','2019-09-24','150.0','1','106','104','96');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(521,'Zackery Morgan - 12 Step Recovery Program','false','2020-01-07','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(522,'Naima Crawford - Subsidized Lunch','false','2019-12-09','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(523,'Angelo Lutz - Monthly Rent Subsidy','false','2020-01-13','250.0','1','161','165','94');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(524,'Naima Crawford - Subsidized Lunch','false','2019-12-03','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(525,'Tom Higgins - Subsidized Lunch','false','2019-11-14','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(526,'Naima Crawford - Subsidized Lunch','false','2019-12-02','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(527,'Fabian Hughes - Subsidized Lunch','false','2019-09-17','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(528,'Fabian Hughes - Subsidized Lunch','false','2019-09-23','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(529,'Robin Banks - 12 Step Recovery Program','false','2019-12-30','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(530,'Tom Higgins - Subsidized Lunch','false','2019-10-04','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(531,'Tom Higgins - Subsidized Lunch','false','2019-10-07','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(532,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','74','42');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(533,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(534,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-12-20','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(535,'Fabian Hughes - After School Activities','false','2019-12-06','3.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(536,'Fabian Hughes - After School Activities','false','2019-12-13','2.0','15','','94','70');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(537,'Marco Escobar - After School Activities','false','2019-11-08','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(538,'Javon Rodgers - After School Activities','false','2019-11-12','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(539,'Kellen Cooley - After School Activities','false','2019-12-17','1.0','15','','51','65');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(540,'Kellen Cooley - After School Activities','false','2020-01-07','1.0','15','','51','65');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(541,'Sonia Gentry - After School Activities','false','2019-10-17','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(542,'Fabian Hughes - Grade 1-8 Reading Tutoring','false','2020-01-10','3.0','10','','94','75');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(543,'Marco Escobar - Grade 1-8 Reading Tutoring','false','2019-09-13','3.0','10','','62','99');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(544,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-09-13','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(545,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-10-25','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(546,'Jordan Waller - Grade 1-8 Reading Tutoring','false','2019-12-20','3.0','10','','45','101');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(547,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-12-20','2.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(548,'Sonia Gentry - After School Activities','false','2019-11-20','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(549,'Semaj Wall - ESL Classroom Hours','false','2019-11-12','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(550,'Semaj Wall - ESL Classroom Hours','false','2019-12-12','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(551,'Semaj Wall - ESL Classroom Hours','false','2020-01-09','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(552,'Barbara Johnson - ESL Classroom Hours','false','2019-10-15','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(553,'Barbara Johnson - ESL Classroom Hours','false','2019-12-03','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(554,'Fernando Beltran - ESL Classroom Hours','false','2019-12-03','2.0','16','','55','3');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(555,'Yusef Flores - ESL Classroom Hours','false','2020-01-09','2.0','16','','77','9');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(556,'Samir Neal - ESL Classroom Hours','false','2019-10-15','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(557,'Samir Neal - ESL Classroom Hours','false','2019-11-26','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(558,'Samir Neal - ESL Classroom Hours','false','2019-12-10','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(559,'Gary Wood - Job Readiness Coaching','false','2019-10-25','0.75','13','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(560,'Emilie Costa - After School Activities','false','2020-01-10','2.0','15','','88','4');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(561,'Sonia Gentry - After School Activities','false','2019-10-10','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(562,'Barbara Johnson - ESL Classroom Hours','false','2019-09-17','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(563,'Marco Escobar - After School Activities','false','2019-12-06','1.0','15','','62','66');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(564,'Javon Rodgers - After School Activities','false','2019-11-19','1.0','15','','41','67');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(565,'Sonia Gentry - After School Activities','false','2019-10-31','1.0','15','','48','6');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(566,'Jace Hampton - After School Activities','false','2020-01-07','1.0','15','','46','71');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(567,'Semaj Wall - ESL Classroom Hours','false','2019-11-21','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(568,'Barbara Johnson - ESL Classroom Hours','false','2019-12-10','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(569,'Barbara Johnson - ESL Classroom Hours','false','2020-01-07','2.0','16','','25','54');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(570,'Samir Neal - ESL Classroom Hours','false','2019-09-19','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(571,'Samir Neal - ESL Classroom Hours','false','2019-12-17','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(572,'Zackery Morgan - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','73','85');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(573,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-01','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(574,'Tom Higgins - Subsidized Lunch','false','2019-11-13','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(575,'Naima Crawford - Subsidized Lunch','false','2019-12-04','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(576,'Abraham Sims - Subsidized Lunch','false','2020-01-06','','9','','67','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(577,'Fabian Hughes - Subsidized Lunch','false','2019-09-12','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(578,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-12-06','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(579,'Samir Neal - ESL Classroom Hours','false','2019-10-03','2.0','16','','160','81');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(580,'Semaj Wall - ESL Classroom Hours','false','2019-10-22','2.0','16','','78','80');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(581,'Tom Higgins - Subsidized Lunch','false','2019-11-08','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(582,'Naima Crawford - Subsidized Lunch','false','2019-12-06','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(583,'Naima Crawford - Subsidized Lunch','false','2019-12-12','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(584,'Abraham Sims - Subsidized Lunch','false','2020-01-09','','9','','67','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(585,'Abraham Sims - Subsidized Lunch','false','2020-01-13','','9','','67','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(586,'Fabian Hughes - Subsidized Lunch','false','2019-09-13','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(587,'Tom Higgins - Subsidized Lunch','false','2019-10-08','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(588,'Tom Higgins - Subsidized Lunch','false','2019-10-10','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(589,'Anika Solomon - Prenatal Care Sessions (appointments and walk-ins)','false','2019-12-02','1.0','3','','4','83');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(590,'Dayana Atkins - Provide Prenatal Vitamins','false','2019-12-23','30.0','2','','142','50');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(591,'Julie Myers - Prenatal Care Sessions (appointments and walk-ins)','false','2020-01-14','1.0','3','','38','2');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(592,'Karissa Aguilar - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-14','1.0','3','','83','37');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(593,'Angelo Lutz - Monthly Rent Subsidy','false','2019-12-16','250.0','1','161','165','94');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(594,'Adrianna Norman - Job Readiness Coaching','false','2020-01-07','1.0','13','','100','82');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(595,'Fabian Hughes - Subsidized Lunch','false','2019-09-16','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(596,'Tom Higgins - Subsidized Lunch','false','2019-10-11','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(597,'Marisol Gonzales - Refer to Caregivers Support Group','false','2020-01-07','1.0','4','','126','47');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(598,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-04','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(599,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-18','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(600,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-12-06','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(601,'Amelie Bond - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-11','1.0','3','','37','63');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(602,'Yuliana Bird - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','56','39');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(603,'Naima Crawford - Subsidized Lunch','false','2019-12-10','1.0','9','','1','92');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(604,'Abraham Sims - Subsidized Lunch','false','2020-01-08','','9','','67','8');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(605,'Sonia Gentry - Subsidized Lunch','false','2019-12-02','','9','','48','19');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(606,'Fabian Hughes - Subsidized Lunch','false','2019-09-18','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(607,'Fabian Hughes - Subsidized Lunch','false','2019-09-19','1.0','9','','94','12');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(608,'Tom Higgins - Subsidized Lunch','false','2019-10-02','1.0','9','','5','34');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(609,'Emelia Mercer - Monthly Rent Subsidy','false','2019-10-15','200.0','1','130','132','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(610,'Isaac Grant - Monthly Rent Subsidy','false','2019-12-13','250.0','1','148','150','95');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(611,'Nico Rivers - Monthly Rent Subsidy','false','2020-01-13','175.0','1','114','113','98');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(612,'James Richards - Monthly Rent Subsidy','false','2020-01-13','200.0','1','65','35','84');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(613,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-10-25','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(614,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-09-13','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(615,'Gary Wood - Financial Advisor Sessions','true','2019-12-03','0.5','12','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(616,'Gary Wood - Financial Advisor Sessions','true','2020-01-02','0.5','12','','102','13');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(617,'Nico Rivers - Monthly Rent Subsidy','false','2019-12-13','175.0','1','114','113','98');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(618,'Amelie Bond - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-07','1.0','3','','37','63');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(619,'Robin Banks - 12 Step Recovery Program','false','2019-10-22','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(620,'Robin Banks - 12 Step Recovery Program','false','2019-12-10','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(621,'Simone Keller - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-25','1.0','3','','158','57');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(622,'Emelia Mercer - Monthly Rent Subsidy','false','2020-01-13','200.0','1','130','132','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(623,'Robin Banks - 12 Step Recovery Program','false','2019-11-05','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(624,'Robin Banks - 12 Step Recovery Program','false','2019-12-03','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(625,'Robin Banks - 12 Step Recovery Program','false','2019-12-17','1.0','14','','11','40');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(626,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-10-11','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(627,'Alice Irwin - Financial Literacy Classroom Hours','false','2020-01-10','2.0','17','','93','91');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(628,'Nico Rivers - Monthly Rent Subsidy','false','2019-12-19','175.0','1','114','113','98');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(629,'Nico Rivers - Monthly Rent Subsidy','false','2019-11-15','175.0','1','114','113','98');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(630,'Emelia Mercer - Monthly Rent Subsidy','false','2019-12-13','200.0','1','130','132','72');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(631,'Nancy Arroyo - Provide Prenatal Vitamins','false','2019-12-16','30.0','2','','129','48');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(632,'Juliette Cisneros - Provide Prenatal Vitamins','false','2020-01-20','30.0','2','','29','61');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(633,'Zackery Morgan - 12 Step Recovery Program','false','2019-10-22','1.0','14','','73','16');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(634,'Alia Duarte - Middle School STEM Classroom Hours','false','2020-01-08','2.0','5','','119','64');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(635,'Shannon Greene - Letter writing campaign to Council Members','false','2020-01-08','1.0','8','','61','86');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(636,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-09-20','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(637,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-11-15','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(638,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-11-08','3.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(639,'John Mills - Letter writing campaign to Council Members','false','2019-09-02','1.0','8','','60','87');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(640,'Leon Clayton - Letter writing campaign to Council Members','false','2019-09-10','1.0','8','','43','77');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(641,'Semaj Wall - Financial Literacy Classroom Hours','false','2019-10-11','2.0','17','','78','26');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(642,'Tom Higgins - Grade 1-8 Reading Tutoring','false','2019-09-20','4.0','10','','5','35');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(643,'Leon Clayton - Town Hall Meeting, 1/8/2020','false','2020-01-08','1.0','7','','43','77');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(644,'Zackery Morgan - Letter writing campaign to Council Members','false','2020-01-07','1.0','8','','73','85');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(645,'Jason Barnes - Financial Literacy Classroom Hours','false','2019-12-13','2.0','17','','15','43');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(646,'Frankie Waller - Financial Literacy Classroom Hours','false','2020-01-10','2.0','17','','79','100');
CREATE TABLE "pmdm__Service__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"UnitOfMeasurement__c" VARCHAR(255),
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Service__c" VALUES(1,'Monthly Rent Subsidy','Monthly Rent Subsidy - sliding scale','Active','Dollars','8');
INSERT INTO "pmdm__Service__c" VALUES(2,'Provide Prenatal Vitamins','','Active','Dosages','6');
INSERT INTO "pmdm__Service__c" VALUES(3,'Prenatal Care Sessions (appointments and walk-ins)','','Active','Sessions','6');
INSERT INTO "pmdm__Service__c" VALUES(4,'Refer to Caregivers Support Group','','Active','Referrals','6');
INSERT INTO "pmdm__Service__c" VALUES(5,'Middle School STEM Classroom Hours','','Active','Hours','4');
INSERT INTO "pmdm__Service__c" VALUES(6,'STEM Field Trips','','Active','Field Trips','4');
INSERT INTO "pmdm__Service__c" VALUES(7,'Town Hall Meeting, 1/8/2020','','Active','Attendees','5');
INSERT INTO "pmdm__Service__c" VALUES(8,'Letter writing campaign to Council Members','','Active','Letters','5');
INSERT INTO "pmdm__Service__c" VALUES(9,'Subsidized Lunch','','Active','Lunches','11');
INSERT INTO "pmdm__Service__c" VALUES(10,'Grade 1-8 Reading Tutoring','Grade 1-8 Reading Tutoring','Active','Hours','1');
INSERT INTO "pmdm__Service__c" VALUES(11,'Job Interviews completed','','Active','Completed Interviews','2');
INSERT INTO "pmdm__Service__c" VALUES(12,'Financial Advisor Sessions','','Active','Hours','2');
INSERT INTO "pmdm__Service__c" VALUES(13,'Job Readiness Coaching','','Active','Hours','2');
INSERT INTO "pmdm__Service__c" VALUES(14,'12 Step Recovery Program','12 Step Recovery Program','Active','Session','7');
INSERT INTO "pmdm__Service__c" VALUES(15,'After School Activities','Indoor/Outdoor After-School Activities','Active','Sessions','3');
INSERT INTO "pmdm__Service__c" VALUES(16,'ESL Classroom Hours','ESL Classroom Hours','Active','Hours','9');
INSERT INTO "pmdm__Service__c" VALUES(17,'Financial Literacy Classroom Hours','Financial Literacy Classroom Hours','Active','Hours','10');

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
INSERT INTO "caseman__action_items" VALUES(1,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15',5,2,19,1);
INSERT INTO "caseman__action_items" VALUES(2,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07',10,3,20,16);
INSERT INTO "caseman__action_items" VALUES(3,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05',10,3,20,17);
INSERT INTO "caseman__action_items" VALUES(4,'Open a bank account','Completed','2019-09-06',10,3,20,19);
INSERT INTO "caseman__action_items" VALUES(5,'Read and interpret a banking account statement','Not Started','2019-09-30',10,3,20,21);
INSERT INTO "caseman__action_items" VALUES(6,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05',10,3,20,24);
INSERT INTO "caseman__action_items" VALUES(7,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28',10,3,20,30);
INSERT INTO "caseman__action_items" VALUES(8,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04',10,3,20,31);
INSERT INTO "caseman__action_items" VALUES(9,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29',10,3,20,32);
INSERT INTO "caseman__action_items" VALUES(10,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31',10,3,20,33);
INSERT INTO "caseman__action_items" VALUES(11,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31',10,3,20,35);
INSERT INTO "caseman__action_items" VALUES(12,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30',10,3,20,36);
INSERT INTO "caseman__action_items" VALUES(13,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04',10,3,20,37);
INSERT INTO "caseman__action_items" VALUES(14,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31',10,3,20,38);
INSERT INTO "caseman__action_items" VALUES(15,'Pass basic financial literacy course','In Progress','2019-09-30',10,3,20,2);
INSERT INTO "caseman__action_items" VALUES(16,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26',10,3,21,15);
INSERT INTO "caseman__action_items" VALUES(17,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30',10,3,21,22);
INSERT INTO "caseman__action_items" VALUES(18,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25',10,3,21,23);
INSERT INTO "caseman__action_items" VALUES(19,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29',10,3,21,4);
INSERT INTO "caseman__action_items" VALUES(20,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30',10,3,21,5);
INSERT INTO "caseman__action_items" VALUES(21,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29',10,3,21,6);
INSERT INTO "caseman__action_items" VALUES(22,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08',10,3,1,3);
INSERT INTO "caseman__action_items" VALUES(23,'Get a job readiness coach','Completed','2019-09-05',10,3,1,7);
INSERT INTO "caseman__action_items" VALUES(24,'Complete resume workshop','Not Started','2019-10-11',10,3,1,8);
INSERT INTO "caseman__action_items" VALUES(25,'Complete interview workshop','Not Started','2019-11-04',10,3,1,9);
INSERT INTO "caseman__action_items" VALUES(26,'Pass mock interview','Not Started','2019-11-06',10,3,1,10);
INSERT INTO "caseman__action_items" VALUES(27,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06',10,3,20,34);
INSERT INTO "caseman__action_items" VALUES(28,'Update resume','Not Started','2019-10-25',10,3,1,11);
INSERT INTO "caseman__action_items" VALUES(29,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01',10,3,6,12);
INSERT INTO "caseman__action_items" VALUES(30,'Meet job requirement standards','Not Started','2020-04-15',10,3,6,13);
INSERT INTO "caseman__action_items" VALUES(31,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07',11,4,7,16);
INSERT INTO "caseman__action_items" VALUES(32,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09',11,4,7,17);
INSERT INTO "caseman__action_items" VALUES(33,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04',11,4,7,24);
INSERT INTO "caseman__action_items" VALUES(34,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30',11,4,7,32);
INSERT INTO "caseman__action_items" VALUES(35,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29',11,4,7,35);
INSERT INTO "caseman__action_items" VALUES(36,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31',11,4,7,38);
INSERT INTO "caseman__action_items" VALUES(37,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24',11,4,8,15);
INSERT INTO "caseman__action_items" VALUES(38,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28',11,4,8,22);
INSERT INTO "caseman__action_items" VALUES(39,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27',11,4,8,23);
INSERT INTO "caseman__action_items" VALUES(40,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25',11,4,8,4);
INSERT INTO "caseman__action_items" VALUES(41,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20',11,4,8,5);
INSERT INTO "caseman__action_items" VALUES(42,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27',11,4,8,6);
INSERT INTO "caseman__action_items" VALUES(43,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15',11,4,9,3);
INSERT INTO "caseman__action_items" VALUES(44,'Get a job readiness coach','Completed','2019-09-05',11,4,9,7);
INSERT INTO "caseman__action_items" VALUES(45,'Complete resume workshop','Not Started','2019-09-27',11,4,9,8);
INSERT INTO "caseman__action_items" VALUES(46,'Complete interview workshop','Not Started','2019-10-20',11,4,9,9);
INSERT INTO "caseman__action_items" VALUES(47,'Pass mock interview','Not Started','2019-10-31',11,4,9,10);
INSERT INTO "caseman__action_items" VALUES(48,'Update resume','Not Started','2019-10-09',11,4,9,11);
INSERT INTO "caseman__action_items" VALUES(49,'Participate in a 12-step program','In Progress','2019-12-31',11,5,13,25);
INSERT INTO "caseman__action_items" VALUES(50,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30',15,6,14,26);
INSERT INTO "caseman__action_items" VALUES(51,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31',15,6,14,27);
INSERT INTO "caseman__action_items" VALUES(52,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29',15,6,14,29);
INSERT INTO "caseman__action_items" VALUES(53,'Open a Savings Account','Completed','2019-09-09',15,6,14,39);
INSERT INTO "caseman__action_items" VALUES(54,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13',15,6,14,2);
INSERT INTO "caseman__action_items" VALUES(55,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15',25,7,16,28);
CREATE TABLE caseman__appointment_attendees (
	sf_id VARCHAR(255) NOT NULL, 
	reason__c VARCHAR(255), 
	role__c VARCHAR(255), 
	status__c VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__appointment_attendees" VALUES(1,'Client','Attendee','Attending',2,8);
INSERT INTO "caseman__appointment_attendees" VALUES(2,'Check in on Jason''s progress with Workplace Readiness.','Attendee','New',3,15);
INSERT INTO "caseman__appointment_attendees" VALUES(3,'','Attendee','New',4,25);
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
INSERT INTO "caseman__assessments" VALUES(1,'Arlene Baker-9/19','2019-09-16','Arlene has been out of the active workforce for more than one year','75.0','75.0','70.0',10);
INSERT INTO "caseman__assessments" VALUES(2,'Arlene Baker-11/19','2019-11-15','Arlene''s financial stability score declined due to a rent increase. She is revising her budget.','80.0','73.0','85.0',10);
INSERT INTO "caseman__assessments" VALUES(3,'Robin Banks 12/19','2019-12-01','Robin has shown diligence in the resume and interview workshops.','85.0','80.0','83.0',11);
INSERT INTO "caseman__assessments" VALUES(4,'Arlene Baker-1/20','2020-01-15','Arlene has shown resilience and ability to adapt to adverse circumstances.','90.0','80.0','88.0',10);
INSERT INTO "caseman__assessments" VALUES(5,'Robin Banks-10/19','2019-10-01','','75.0','70.0','75.0',11);
INSERT INTO "caseman__assessments" VALUES(6,'Robin Banks-11/19','2019-11-01','Robin is settling into her case plan more easily than I expected.','80.0','75.0','80.0',11);
INSERT INTO "caseman__assessments" VALUES(7,'Robin Banks 1/20','2020-01-03','Note that some of Robin''s financial stability score reflects her partner''s job','85.0','80.0','85.0',11);
INSERT INTO "caseman__assessments" VALUES(8,'Arlene Baker-10/19','2019-10-15','Arlene is very diligent with her case plan','76.0','76.0','75.0',10);
INSERT INTO "caseman__assessments" VALUES(9,'ESL - July 2019','2019-07-01','ESL July 2019 Assessment','63.24','','',25);
INSERT INTO "caseman__assessments" VALUES(10,'ESL - August 2019','2019-08-01','ESL August Assessment Score','68.5','','',25);
INSERT INTO "caseman__assessments" VALUES(11,'ESL - September 2019','2019-09-01','ESL September Assessment Score','70.25','','',25);
INSERT INTO "caseman__assessments" VALUES(12,'ESL - June 2019','2019-06-01','Entry level score in ESL program','51.5','','',25);
INSERT INTO "caseman__assessments" VALUES(13,'ESL - October 2019','2019-10-01','ESL October Assessment Score','74.55','','',25);
INSERT INTO "caseman__assessments" VALUES(14,'ESL - November 2019','2019-11-01','ESL November Assessment Score','77.43','','',25);
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
INSERT INTO "caseman__branch_accounts" VALUES(1,'127th Street Community Center','','','','','','','555-398-2090','','','','','','','1500.0','Branch');
CREATE TABLE caseman__branch_contacts (
	sf_id VARCHAR(255) NOT NULL, 
	"Roles" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	account_id VARCHAR(255), 
	contact_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__branch_contacts" VALUES(1,'','true',23,5);
INSERT INTO "caseman__branch_contacts" VALUES(2,'','true',23,6);
INSERT INTO "caseman__branch_contacts" VALUES(3,'','true',24,8);
INSERT INTO "caseman__branch_contacts" VALUES(4,'','true',24,7);
INSERT INTO "caseman__branch_contacts" VALUES(5,'','true',25,9);
INSERT INTO "caseman__branch_contacts" VALUES(6,'','true',25,10);
INSERT INTO "caseman__branch_contacts" VALUES(7,'','true',26,11);
INSERT INTO "caseman__branch_contacts" VALUES(8,'','true',26,12);
INSERT INTO "caseman__branch_contacts" VALUES(9,'','true',27,13);
INSERT INTO "caseman__branch_contacts" VALUES(10,'','true',27,14);
INSERT INTO "caseman__branch_contacts" VALUES(11,'','true',27,15);
INSERT INTO "caseman__branch_contacts" VALUES(12,'','true',28,16);
INSERT INTO "caseman__branch_contacts" VALUES(13,'','true',29,18);
INSERT INTO "caseman__branch_contacts" VALUES(14,'','true',30,19);
INSERT INTO "caseman__branch_contacts" VALUES(15,'','true',31,20);
INSERT INTO "caseman__branch_contacts" VALUES(16,'','true',32,21);
INSERT INTO "caseman__branch_contacts" VALUES(17,'','true',33,22);
INSERT INTO "caseman__branch_contacts" VALUES(18,'','true',34,23);
INSERT INTO "caseman__branch_contacts" VALUES(19,'','true',34,24);
INSERT INTO "caseman__branch_contacts" VALUES(20,'','true',34,25);
INSERT INTO "caseman__branch_contacts" VALUES(21,'Other','true',1,8);
INSERT INTO "caseman__branch_contacts" VALUES(22,'','true',1,7);
INSERT INTO "caseman__branch_contacts" VALUES(23,'Client','true',1,10);
INSERT INTO "caseman__branch_contacts" VALUES(24,'Client','true',1,11);
INSERT INTO "caseman__branch_contacts" VALUES(25,'Client','true',1,15);
INSERT INTO "caseman__branch_contacts" VALUES(26,'','true',1,16);
INSERT INTO "caseman__branch_contacts" VALUES(27,'','true',1,18);
INSERT INTO "caseman__branch_contacts" VALUES(28,'Client','true',1,19);
INSERT INTO "caseman__branch_contacts" VALUES(29,'','true',1,20);
INSERT INTO "caseman__branch_contacts" VALUES(30,'','true',1,21);
INSERT INTO "caseman__branch_contacts" VALUES(31,'Client','true',1,22);
INSERT INTO "caseman__branch_contacts" VALUES(32,'Client','true',1,25);
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
INSERT INTO "caseman__case_plans" VALUES(1,'Socialization Case Plan - Tom Higgins','','','','',5);
INSERT INTO "caseman__case_plans" VALUES(2,'Reading Case Plan - Tom Higgins','','','','2019-10-01',5);
INSERT INTO "caseman__case_plans" VALUES(3,'Arlene Baker''s Workforce Re-entry Case Plan','','','','2019-11-01',10);
INSERT INTO "caseman__case_plans" VALUES(4,'Robin Banks'' Job Readiness Case Plan','','','','2019-11-05',11);
INSERT INTO "caseman__case_plans" VALUES(5,'Robin Banks'' Sobriety Case Plan','','','','',11);
INSERT INTO "caseman__case_plans" VALUES(6,'Financial Literacy Case Plan - Jason Barnes','','','','2019-11-04',15);
INSERT INTO "caseman__case_plans" VALUES(7,'English proficiency case plan - Barbara Johnson','','','','',25);
CREATE TABLE caseman__client_alerts (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_alerts" VALUES(1,'Tom has anger issues','true','',5);
INSERT INTO "caseman__client_alerts" VALUES(2,'Tom''s sister passed away recently (very emotional)','true','',5);
INSERT INTO "caseman__client_alerts" VALUES(3,'Robin was recently released from rehab','true','',11);
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
INSERT INTO "caseman__client_cases" VALUES(1,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','',5,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(2,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','',5,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(3,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','',5,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(4,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','',5,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(5,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','',10,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(6,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','',11,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(7,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','',15,'ClientCase');
INSERT INTO "caseman__client_cases" VALUES(8,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','',25,'ClientCase');
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
INSERT INTO "caseman__client_notes" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','',5);
INSERT INTO "caseman__client_notes" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0',5);
INSERT INTO "caseman__client_notes" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0',11);
INSERT INTO "caseman__client_notes" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','',15);
INSERT INTO "caseman__client_notes" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0',25);

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
INSERT INTO "caseman__goals" VALUES(1,'Develop Soft Skills',10,3,9);
INSERT INTO "caseman__goals" VALUES(2,'Stabilize housing',10,3,10);
INSERT INTO "caseman__goals" VALUES(3,'Identify industry/career path',10,3,16);
INSERT INTO "caseman__goals" VALUES(4,'Meet job requirement standards',10,3,18);
INSERT INTO "caseman__goals" VALUES(5,'Complete Succeed Program',10,3,19);
INSERT INTO "caseman__goals" VALUES(6,'Stabilize Employment',10,3,21);
INSERT INTO "caseman__goals" VALUES(7,'Develop basic financial literacy skills',11,4,3);
INSERT INTO "caseman__goals" VALUES(8,'Get and keep job for 6 - 12 months',11,4,4);
INSERT INTO "caseman__goals" VALUES(9,'Develop Soft Skills',11,4,9);
INSERT INTO "caseman__goals" VALUES(10,'Meet job requirement standards',11,4,18);
INSERT INTO "caseman__goals" VALUES(11,'Complete Succeed Program',11,4,19);
INSERT INTO "caseman__goals" VALUES(12,'Stabilize Employment',11,4,21);
INSERT INTO "caseman__goals" VALUES(13,'Adopt healthy skills to address dependency issues',11,5,6);
INSERT INTO "caseman__goals" VALUES(14,'Complete Financial Literacy Course',15,6,12);
INSERT INTO "caseman__goals" VALUES(15,'Deposit 10% of income in Savings Account for 3 months',15,6,14);
INSERT INTO "caseman__goals" VALUES(16,'Reach proficiency level in reading, writing, speaking & listening per state std',25,7,8);
INSERT INTO "caseman__goals" VALUES(17,'Build respectful peer relationships',5,1,13);
INSERT INTO "caseman__goals" VALUES(18,'Build respectful inter-generational relationships',5,1,15);
INSERT INTO "caseman__goals" VALUES(19,'Reach an age appropriate level of proficiency in reading',5,2,1);
INSERT INTO "caseman__goals" VALUES(20,'Develop basic financial literacy skills',10,3,3);
INSERT INTO "caseman__goals" VALUES(21,'Get and keep job for 6 - 12 months',10,3,4);

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
INSERT INTO "caseman__incident_cases" VALUES(1,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low',1,5,'Incident');
INSERT INTO "caseman__incident_cases" VALUES(2,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High',1,5,'Incident');
INSERT INTO "caseman__incident_cases" VALUES(3,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium',1,5,'Incident');
INSERT INTO "caseman__incident_cases" VALUES(4,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','',5,'Incident');
INSERT INTO "caseman__incident_cases" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium',1,5,'Incident');



COMMIT;
