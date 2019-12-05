BEGIN TRANSACTION;

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
	PRIMARY KEY (id)
);
INSERT INTO "organization_accounts" VALUES(
    1,
    'Marble Foundation',
    '',
    '',
    '',
    '',
    '',
    '',
    '555-389-74399',
    '',
    '',
    '',
    '',
    '',
    'Foundation'
);
INSERT INTO "organization_accounts" VALUES(
    2,
    'Future Potential Fund',
    '',
    '',
    '',
    '',
    '',
    '',
    '555-278-7643',
    '',
    '',
    '',
    '',
    '',
    'Foundation'
);
INSERT INTO "organization_accounts" VALUES(
    3,
    'City Department of Human Services',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'Government'
);

COMMIT;