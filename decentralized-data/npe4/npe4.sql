BEGIN TRANSACTION;
CREATE TABLE contacts (
	id INTEGER NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE npe4__relationships (
	id INTEGER NOT NULL, 
	"npe4__SYSTEM_SystemCreated__c" VARCHAR(255), 
	"npe4__Description__c" VARCHAR(255), 
	"npe4__Status__c" VARCHAR(255), 
	"npe4__Type__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	related_contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npe4__relationships" VALUES(1,'false','','Current','Mother','0035400000Os8YeAAJ','0035400000Os8YfAAJ');
INSERT INTO "npe4__relationships" VALUES(2,'true','','Current','Son','0035400000Os8YfAAJ','0035400000Os8YeAAJ');
INSERT INTO "npe4__relationships" VALUES(3,'true','Arthur is Arlene''s recently deceased father.','Current','Child','0035400000Os8YiAAJ','0035400000Os8YjAAJ');
INSERT INTO "npe4__relationships" VALUES(4,'false','Arthur is Arlene''s recently deceased father.','Current','Father','0035400000Os8YjAAJ','0035400000Os8YiAAJ');
INSERT INTO "npe4__relationships" VALUES(5,'true','','Current','Son','0035400000Os8YmAAJ','0035400000Os8YoAAJ');
INSERT INTO "npe4__relationships" VALUES(6,'true','','Current','Son','0035400000Os8YnAAJ','0035400000Os8YoAAJ');
INSERT INTO "npe4__relationships" VALUES(7,'false','','Current','Mother','0035400000Os8YoAAJ','0035400000Os8YmAAJ');
INSERT INTO "npe4__relationships" VALUES(8,'false','','Current','Father','0035400000Os8YoAAJ','0035400000Os8YnAAJ');
INSERT INTO "npe4__relationships" VALUES(9,'true','','Current','Spouse','0035400000Os8YwAAJ','0035400000Os8YyAAJ');
INSERT INTO "npe4__relationships" VALUES(10,'true','','Current','Parent','0035400000Os8YxAAJ','0035400000Os8YyAAJ');
INSERT INTO "npe4__relationships" VALUES(11,'false','','Current','Husband','0035400000Os8YyAAJ','0035400000Os8YwAAJ');
INSERT INTO "npe4__relationships" VALUES(12,'false','','Current','Daughter','0035400000Os8YyAAJ','0035400000Os8YxAAJ');
COMMIT;
