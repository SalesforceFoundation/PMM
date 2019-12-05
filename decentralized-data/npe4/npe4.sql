BEGIN TRANSACTION;

CREATE TABLE npe4__relationships (
	id INTEGER NOT NULL, 
	"npe4__Related_Opportunity_Contact_Role__c" VARCHAR(255), 
	"npe4__SYSTEM_SystemCreated__c" VARCHAR(255), 
	"npe4__Description__c" VARCHAR(255), 
	"npe4__Status__c" VARCHAR(255), 
	"npe4__Type__c" VARCHAR(255), 
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

COMMIT;
