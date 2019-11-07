BEGIN TRANSACTION;
CREATE TABLE caseman__account_program_offerings (
	sf_id VARCHAR(255) NOT NULL, 
	accountrole__c VARCHAR(255), 
	account__c VARCHAR(255), 
	program_offering__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__account_program_offerings" VALUES('a0uR0000003ePrZIAU','Funder','001R000001ORqfYIAT','a1AR0000002Aml9MAC');
INSERT INTO "caseman__account_program_offerings" VALUES('a0uR0000003ePraIAE','Funder','001R000001ORqfZIAT','a1AR0000002Aml3MAC');
INSERT INTO "caseman__account_program_offerings" VALUES('a0uR0000003ePrbIAE','Funder','001R000001ORqfZIAT','a1AR0000002Aml9MAC');
INSERT INTO "caseman__account_program_offerings" VALUES('a0uR0000003ePrcIAE','Location','001R000001ORqfaIAD','a1AR0000002Aml3MAC');
INSERT INTO "caseman__account_program_offerings" VALUES('a0uR0000003ePrdIAE','Service Provider','001R000001ORqfaIAD','a1AR0000002Aml3MAC');
INSERT INTO "caseman__account_program_offerings" VALUES('a0uR0000003ePreIAE','Service Provider','001R000001ORqfaIAD','a1AR0000002Aml6MAC');
CREATE TABLE caseman__action_item_templates (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfZIAU','Pass an age appropriate reading proficiency exam');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfaIAE','Maintain 2 years active engagement in workforce');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfbIAE','Meet job requirement standards');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfcIAE','Complete Stability Assessment');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfdIAE','Month 6: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfeIAE','Month 2: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TffIAE','Month 1: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfgIAE','Get an job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfhIAE','Open a bank account');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfiIAE','Meet with legal assistance advisor');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfjIAE','Read and interpret a banking account statement');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfkIAE','Month 2: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TflIAE','Month 1: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfmIAE','Month 3: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfnIAE','Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfoIAE','Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfpIAE','Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfqIAE','Pass English proficiency exam with a score of 65 or above');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfrIAE','Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfsIAE','Month 4: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TftIAE','Month 4: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfuIAE','Month 1: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfvIAE','Month 5: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfwIAE','Month 5: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfxIAE','Month 3: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfyIAE','Month 6: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TfzIAE','Month 6: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg0IAE','Month 2: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg1IAE','Open a Savings Account');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg2IAE','Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg3IAE','Complete Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg4IAE','Meet with Financial Advisor');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg5IAE','Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg6IAE','Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg7IAE','Get a passing grade in Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg8IAE','Register for Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045Tg9IAE','Pass basic financial literacy course');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgAIAU','Complete online job applications to at least 3 appropriate job openings');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgBIAU','Month 3: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgCIAU','Month 4: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgDIAU','Month 5: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgEIAU','Get a job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgFIAU','Complete resume workshop');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgGIAU','Complete interview workshop');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgHIAU','Pass mock interview');
INSERT INTO "caseman__action_item_templates" VALUES('a0vR00000045TgIIAU','Update resume');
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
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8VIAQ','Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','003R000001P0KsAIAV','a0zR0000002qG0zIAE','a17R0000002GAoLIAW','a0vR00000045TfZIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8WIAQ','Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoOIAW','a0vR00000045TgAIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8XIAQ','Get a job readiness coach','Completed','2019-09-05','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoOIAW','a0vR00000045TgEIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8YIAQ','Complete resume workshop','Not Started','2019-10-11','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoOIAW','a0vR00000045TgFIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8ZIAQ','Complete interview workshop','Not Started','2019-11-04','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoOIAW','a0vR00000045TgGIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8aIAA','Pass mock interview','Not Started','2019-11-06','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoOIAW','a0vR00000045TgHIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8bIAA','Update resume','Not Started','2019-10-25','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoOIAW','a0vR00000045TgIIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8cIAA','Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfeIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8dIAA','Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TffIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8eIAA','Open a bank account','Completed','2019-09-06','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfhIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8fIAA','Read and interpret a banking account statement','Not Started','2019-09-30','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfjIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8gIAA','Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfmIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8hIAA','Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfsIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8iIAA','Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TftIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8jIAA','Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfuIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8kIAA','Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfvIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8lIAA','Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfwIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8mIAA','Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfxIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8nIAA','Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfyIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8oIAA','Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045TfzIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8pIAA','Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045Tg0IAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8qIAA','Pass basic financial literacy course','In Progress','2019-09-30','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoMIAW','a0vR00000045Tg9IAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8rIAA','Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoNIAW','a0vR00000045TfdIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8sIAA','Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoNIAW','a0vR00000045TfkIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8tIAA','Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoNIAW','a0vR00000045TflIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8uIAA','Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoNIAW','a0vR00000045TgBIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8vIAA','Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoNIAW','a0vR00000045TgCIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8wIAA','Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoNIAW','a0vR00000045TgDIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8xIAA','Maintain 2 years active engagement in workforce','Not Started','2021-09-01','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoTIAW','a0vR00000045TfaIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8yIAA','Meet job requirement standards','Not Started','2020-04-15','003R000001P0KsFIAV','a0zR0000002qG10IAE','a17R0000002GAoTIAW','a0vR00000045TfbIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v8zIAA','Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoWIAW','a0vR00000045TgAIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v90IAA','Get a job readiness coach','Completed','2019-09-05','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoWIAW','a0vR00000045TgEIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v91IAA','Complete resume workshop','Not Started','2019-09-27','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoWIAW','a0vR00000045TgFIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v92IAA','Complete interview workshop','Not Started','2019-10-20','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoWIAW','a0vR00000045TgGIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v93IAA','Pass mock interview','Not Started','2019-10-31','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoWIAW','a0vR00000045TgHIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v94IAA','Update resume','Not Started','2019-10-09','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoWIAW','a0vR00000045TgIIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v95IAA','Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoUIAW','a0vR00000045TfeIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v96IAA','Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoUIAW','a0vR00000045TffIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v97IAA','Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoUIAW','a0vR00000045TfmIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v98IAA','Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoUIAW','a0vR00000045TfuIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v99IAA','Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoUIAW','a0vR00000045TfxIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9AIAQ','Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoUIAW','a0vR00000045Tg0IAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9BIAQ','Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoVIAW','a0vR00000045TfdIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9CIAQ','Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoVIAW','a0vR00000045TfkIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9DIAQ','Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoVIAW','a0vR00000045TflIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9EIAQ','Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoVIAW','a0vR00000045TgBIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9FIAQ','Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoVIAW','a0vR00000045TgCIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9GIAQ','Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','003R000001P0KsGIAV','a0zR0000002qG11IAE','a17R0000002GAoVIAW','a0vR00000045TgDIAU');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9HIAQ','Participate in a 12-step program','In Progress','2019-12-31','003R000001P0KsGIAV','a0zR0000002qG12IAE','a17R0000002GAoaIAG','a0vR00000045TfnIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9IIAQ','Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','003R000001P0KsKIAV','a0zR0000002qG13IAE','a17R0000002GAobIAG','a0vR00000045TfoIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9JIAQ','Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','003R000001P0KsKIAV','a0zR0000002qG13IAE','a17R0000002GAobIAG','a0vR00000045TfpIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9KIAQ','Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','003R000001P0KsKIAV','a0zR0000002qG13IAE','a17R0000002GAobIAG','a0vR00000045TfrIAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9LIAQ','Open a Savings Account','Completed','2019-09-09','003R000001P0KsKIAV','a0zR0000002qG13IAE','a17R0000002GAobIAG','a0vR00000045Tg1IAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9MIAQ','Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','003R000001P0KsKIAV','a0zR0000002qG13IAE','a17R0000002GAobIAG','a0vR00000045Tg9IAE');
INSERT INTO "caseman__action_items" VALUES('a0wR00000058v9NIAQ','Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','003R000001P0KsTIAV','a0zR0000002qG14IAE','a17R0000002GAodIAG','a0vR00000045TfqIAE');
CREATE TABLE caseman__appointment_attendees (
	sf_id VARCHAR(255) NOT NULL, 
	reason__c VARCHAR(255), 
	role__c VARCHAR(255), 
	status__c VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__appointment_attendees" VALUES('a0xR0000004L4geIAC','Client','Attendee','Attending','a0yR0000002V7exIAC','003R000001P0KsCIAV');
INSERT INTO "caseman__appointment_attendees" VALUES('a0xR0000004L4gfIAC','Check in on Jason''s progress with Workplace Readiness.','Attendee','New','a0yR0000002V7eyIAC','003R000001P0KsKIAV');
INSERT INTO "caseman__appointment_attendees" VALUES('a0xR0000004L4ggIAC','','Attendee','New','a0yR0000002V7ezIAC','003R000001P0KsTIAV');
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
INSERT INTO "caseman__appointments" VALUES('a0yR0000002V7ewIAC','Math Appointment','Scheduled','Corner Office','2020-12-29T16:00:00.000Z','2020-12-29T17:00:00.000Z','We should talk about your grades');
INSERT INTO "caseman__appointments" VALUES('a0yR0000002V7exIAC','Program Evaluation','Scheduled','AC-1223','2020-12-29T16:00:00.000Z','2020-12-29T17:00:00.000Z','Initial program evaluation');
INSERT INTO "caseman__appointments" VALUES('a0yR0000002V7eyIAC','Check-in with Jason Barnes','Scheduled','127th STreet Community Center, Meeting Room 2-B','2020-08-25T20:00:00.000Z','2020-08-25T21:00:00.000Z','Check-in on Jason''s progress with Workplace Readiness');
INSERT INTO "caseman__appointments" VALUES('a0yR0000002V7ezIAC','Barbara Johnson English Tutor','Scheduled','127th Street Community Center Meeting Room A','2020-07-16T01:00:00.000Z','2020-07-16T02:00:00.000Z','Discuss getting Barbara a tutor to improve her conversational confidence');
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
INSERT INTO "caseman__branch_accounts" VALUES('001R000001ORqfhIAD','127th Street Community Center','','','','','','','555-398-2090','','','','','','','1500.0','Branch');
CREATE TABLE caseman__branch_contacts (
	sf_id VARCHAR(255) NOT NULL, 
	"Roles" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	account_id VARCHAR(255), 
	contact_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeQIAQ','','true','001R000001ORqfKIAT','003R000001P0Ks9IAF');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeRIAQ','','true','001R000001ORqfLIAT','003R000001P0KsAIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeSIAQ','','true','001R000001ORqfLIAT','003R000001P0KsBIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeTIAQ','','true','001R000001ORqfMIAT','003R000001P0KsCIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeUIAQ','','true','001R000001ORqfMIAT','003R000001P0KsDIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeVIAQ','','true','001R000001ORqfNIAT','003R000001P0KsEIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeWIAQ','','true','001R000001ORqfNIAT','003R000001P0KsFIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeXIAQ','','true','001R000001ORqfOIAT','003R000001P0KsGIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeYIAQ','','true','001R000001ORqfOIAT','003R000001P0KsHIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeZIAQ','','true','001R000001ORqfPIAT','003R000001P0KsIIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeaIAA','','true','001R000001ORqfPIAT','003R000001P0KsJIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbebIAA','','true','001R000001ORqfPIAT','003R000001P0KsKIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbecIAA','','true','001R000001ORqfQIAT','003R000001P0KsLIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbedIAA','','true','001R000001ORqfRIAT','003R000001P0KsMIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeeIAA','','true','001R000001ORqfSIAT','003R000001P0KsNIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbefIAA','','true','001R000001ORqfTIAT','003R000001P0KsOIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbegIAA','','true','001R000001ORqfUIAT','003R000001P0KsPIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbehIAA','','true','001R000001ORqfVIAT','003R000001P0KsQIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeiIAA','','true','001R000001ORqfWIAT','003R000001P0KsRIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbejIAA','','true','001R000001ORqfWIAT','003R000001P0KsSIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbekIAA','','true','001R000001ORqfWIAT','003R000001P0KsTIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbexIAA','Other','true','001R000001ORqfhIAD','003R000001P0KsCIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbeyIAA','','true','001R000001ORqfhIAD','003R000001P0KsDIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbezIAA','Client','true','001R000001ORqfhIAD','003R000001P0KsFIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf0IAA','Client','true','001R000001ORqfhIAD','003R000001P0KsGIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf1IAA','Client','true','001R000001ORqfhIAD','003R000001P0KsKIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf2IAA','','true','001R000001ORqfhIAD','003R000001P0KsLIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf3IAA','','true','001R000001ORqfhIAD','003R000001P0KsMIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf4IAA','Client','true','001R000001ORqfhIAD','003R000001P0KsNIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf5IAA','','true','001R000001ORqfhIAD','003R000001P0KsOIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf6IAA','','true','001R000001ORqfhIAD','003R000001P0KsPIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf7IAA','Client','true','001R000001ORqfhIAD','003R000001P0KsQIAV');
INSERT INTO "caseman__branch_contacts" VALUES('07kR0000003qbf8IAA','Client','true','001R000001ORqfhIAD','003R000001P0KsTIAV');
CREATE TABLE caseman__case_plans (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG0yIAE','Socialization Case Plan - Tom Higgins','003R000001P0KsAIAV');
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG0zIAE','Reading Case Plan - Tom Higgins','003R000001P0KsAIAV');
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG10IAE','Arlene Baker''s Workforce Re-entry Case Plan','003R000001P0KsFIAV');
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG11IAE','Robin Banks'' Job Readiness Case Plan','003R000001P0KsGIAV');
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG12IAE','Robin Banks'' Sobriety Case Plan','003R000001P0KsGIAV');
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG13IAE','Financial Literacy Case Plan - Jason Barnes','003R000001P0KsKIAV');
INSERT INTO "caseman__case_plans" VALUES('a0zR0000002qG14IAE','English proficiency case plan - Barbara Johnson','003R000001P0KsTIAV');
CREATE TABLE caseman__client_alerts (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_alerts" VALUES('a10R0000005XEZzIAO','Tom has anger issues','true','','003R000001P0KsAIAV');
INSERT INTO "caseman__client_alerts" VALUES('a10R0000005XEa0IAG','Tom''s sister passed away recently (very emotional)','true','','003R000001P0KsAIAV');
INSERT INTO "caseman__client_alerts" VALUES('a10R0000005XEa1IAG','Robin was recently released from rehab','true','','003R000001P0KsGIAV');
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
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGnIAO','Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','003R000001P0KsAIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGoIAO','Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','003R000001P0KsAIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGpIAO','Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','003R000001P0KsFIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGqIAO','Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','003R000001P0KsGIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGrIAO','Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','003R000001P0KsKIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGsIAO','Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','003R000001P0KsTIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGlIAO','Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','003R000001P0KsAIAV','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('500R0000009LAGmIAO','Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','003R000001P0KsAIAV','ClientCase');
CREATE TABLE caseman__client_note_relationships (
	sf_id VARCHAR(255) NOT NULL, 
	"RelatedId__c" VARCHAR(255), 
	"RelatedName__c" VARCHAR(255), 
	"RelatedObject__c" VARCHAR(255), 
	case__c VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	program_engagement__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_note_relationships" VALUES('a11R00000060lqNIAQ','a1554000000FXRBAA4','PE-00000007','ProgramEngagement__c','','a12R00000023I2nIAE','','a18R0000005YaxPIAS');
INSERT INTO "caseman__client_note_relationships" VALUES('a11R00000060lqOIAQ','a16S0000002pKVPIA2','PE-00000003','caseman__ProgramEngagement__c','','a12R00000023I2oIAE','','a18R0000005YaxKIAS');
INSERT INTO "caseman__client_note_relationships" VALUES('a11R00000060lqPIAQ','500540000032nuJAAQ','00001008','Case','500R0000009LAGqIAO','a12R00000023I2pIAE','','');
INSERT INTO "caseman__client_note_relationships" VALUES('a11R00000060lqQIAQ','500540000032nuKAAQ','00001009','Case','500R0000009LAGrIAO','a12R00000023I2qIAE','','');
INSERT INTO "caseman__client_note_relationships" VALUES('a11R00000060lqRIAQ','500540000032nuLAAQ','00001010','Case','500R0000009LAGsIAO','a12R00000023I2rIAE','','');
CREATE TABLE caseman__client_notes (
	sf_id VARCHAR(255) NOT NULL, 
	content__c VARCHAR(255), 
	subject__c VARCHAR(255), 
	status__c VARCHAR(255), 
	interactiondate__c VARCHAR(255), 
	draft__c VARCHAR(255), 
	minutes_spent_with_client__c VARCHAR(255), 
	client__c VARCHAR(255), 
	program_engagement__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_notes" VALUES('a12R00000023I2nIAE','<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','003R000001P0KsAIAV','');
INSERT INTO "caseman__client_notes" VALUES('a12R00000023I2oIAE','<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','003R000001P0KsAIAV','');
INSERT INTO "caseman__client_notes" VALUES('a12R00000023I2pIAE','<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','003R000001P0KsGIAV','');
INSERT INTO "caseman__client_notes" VALUES('a12R00000023I2qIAE','<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','003R000001P0KsKIAV','');
INSERT INTO "caseman__client_notes" VALUES('a12R00000023I2rIAE','<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','003R000001P0KsTIAV','');
CREATE TABLE caseman__goal_action_item_templates (
	sf_id VARCHAR(255) NOT NULL, 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNTIAY','a16R0000001TwbYIAS','a0vR00000045TfZIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNUIAY','a16R0000001TwbZIAS','a0vR00000045TfqIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNVIAY','a16R0000001TwbaIAC','a0vR00000045TfeIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNWIAY','a16R0000001TwbaIAC','a0vR00000045TffIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNXIAY','a16R0000001TwbaIAC','a0vR00000045TfhIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNYIAY','a16R0000001TwbaIAC','a0vR00000045TfjIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNZIAY','a16R0000001TwbaIAC','a0vR00000045TfmIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNaIAI','a16R0000001TwbaIAC','a0vR00000045TfsIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNbIAI','a16R0000001TwbaIAC','a0vR00000045TftIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNcIAI','a16R0000001TwbaIAC','a0vR00000045TfuIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNdIAI','a16R0000001TwbaIAC','a0vR00000045TfvIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNeIAI','a16R0000001TwbaIAC','a0vR00000045TfwIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNfIAI','a16R0000001TwbaIAC','a0vR00000045TfxIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNgIAI','a16R0000001TwbaIAC','a0vR00000045TfyIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNhIAI','a16R0000001TwbaIAC','a0vR00000045TfzIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNiIAI','a16R0000001TwbaIAC','a0vR00000045Tg0IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNjIAI','a16R0000001TwbaIAC','a0vR00000045Tg9IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNkIAI','a16R0000001TwbbIAC','a0vR00000045TfkIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNlIAI','a16R0000001TwbbIAC','a0vR00000045TflIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNmIAI','a16R0000001TwbbIAC','a0vR00000045TgBIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNnIAI','a16R0000001TwbbIAC','a0vR00000045TgCIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNoIAI','a16R0000001TwbbIAC','a0vR00000045TgDIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNpIAI','a16R0000001TwbdIAC','a0vR00000045TfnIAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNqIAI','a16R0000001TwbgIAC','a0vR00000045TgAIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNrIAI','a16R0000001TwbgIAC','a0vR00000045TgEIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNsIAI','a16R0000001TwbgIAC','a0vR00000045TgFIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNtIAI','a16R0000001TwbgIAC','a0vR00000045TgGIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNuIAI','a16R0000001TwbgIAC','a0vR00000045TgHIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNvIAI','a16R0000001TwbgIAC','a0vR00000045TgIIAU');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNwIAI','a16R0000001TwbjIAC','a0vR00000045Tg7IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNxIAI','a16R0000001TwbjIAC','a0vR00000045Tg8IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNyIAI','a16R0000001TwblIAC','a0vR00000045Tg1IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilNzIAI','a16R0000001TwblIAC','a0vR00000045Tg2IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilO0IAI','a16R0000001TwblIAC','a0vR00000045Tg5IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilO1IAI','a16R0000001TwblIAC','a0vR00000045Tg6IAE');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a14R0000002ilO2IAI','a16R0000001TwbzIAC','a0vR00000045TfqIAE');
CREATE TABLE caseman__goal_templates (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbYIAS','Reach an age appropriate level of proficiency in reading');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbZIAS','Reach proficiency in reading, writing, speaking, and listening');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbaIAC','Develop basic financial literacy skills');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbbIAC','Get and keep job for 6 - 12 months');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbcIAC','Stabilize career path');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbdIAC','Acquire and adopt healthy skills to address problems');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbeIAC','Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbfIAC','Reach proficiency level in reading, writing, speaking & listening per state std');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbgIAC','Develop soft skills');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbhIAC','Stabilize housing');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbiIAC','Complete Advancement program');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbjIAC','Complete Financial Literacy Course');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbkIAC','Build respectful peer relationships');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwblIAC','Deposit 10% of income in Savings Account for 3 months');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbmIAC','Build respectful intergenerational relationships');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbnIAC','Identify industry/career path');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwboIAC','Complete Advancement program');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbpIAC','Meet job requirement standards');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbqIAC','Complete Succeed program');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbrIAC','Meet with a Financial Advisor');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbsIAC','Stabilize employment');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbtIAC','Get a Job Readiness Coach');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbuIAC','Meet with Legal Assistance Advisor');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbvIAC','Visioning career path');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbwIAC','Complete Stability Assessment');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbxIAC','Complete Jump Start program');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbyIAC','Get any required certifications');
INSERT INTO "caseman__goal_templates" VALUES('a16R0000001TwbzIAC','Get a passing grade in ESL I Class');
CREATE TABLE caseman__goals (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoJIAW','Build respectful peer relationships','003R000001P0KsAIAV','a0zR0000002qG0yIAE','a16R0000001TwbkIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoKIAW','Build respectful inter-generational relationships','003R000001P0KsAIAV','a0zR0000002qG0yIAE','a16R0000001TwbmIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoLIAW','Reach an age appropriate level of proficiency in reading','003R000001P0KsAIAV','a0zR0000002qG0zIAE','a16R0000001TwbYIAS');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoMIAW','Develop basic financial literacy skills','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbaIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoNIAW','Get and keep job for 6 - 12 months','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbbIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoOIAW','Develop Soft Skills','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbgIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoPIAW','Stabilize housing','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbhIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoQIAW','Identify industry/career path','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbnIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoRIAW','Meet job requirement standards','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbpIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoSIAW','Complete Succeed Program','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbqIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoTIAW','Stabilize Employment','003R000001P0KsFIAV','a0zR0000002qG10IAE','a16R0000001TwbsIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoUIAW','Develop basic financial literacy skills','003R000001P0KsGIAV','a0zR0000002qG11IAE','a16R0000001TwbaIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoVIAW','Get and keep job for 6 - 12 months','003R000001P0KsGIAV','a0zR0000002qG11IAE','a16R0000001TwbbIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoWIAW','Develop Soft Skills','003R000001P0KsGIAV','a0zR0000002qG11IAE','a16R0000001TwbgIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoXIAW','Meet job requirement standards','003R000001P0KsGIAV','a0zR0000002qG11IAE','a16R0000001TwbpIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoYIAW','Complete Succeed Program','003R000001P0KsGIAV','a0zR0000002qG11IAE','a16R0000001TwbqIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoZIAW','Stabilize Employment','003R000001P0KsGIAV','a0zR0000002qG11IAE','a16R0000001TwbsIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAoaIAG','Adopt healthy skills to address dependency issues','003R000001P0KsGIAV','a0zR0000002qG12IAE','a16R0000001TwbdIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAobIAG','Complete Financial Literacy Course','003R000001P0KsKIAV','a0zR0000002qG13IAE','a16R0000001TwbjIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAocIAG','Deposit 10% of income in Savings Account for 3 months','003R000001P0KsKIAV','a0zR0000002qG13IAE','a16R0000001TwblIAC');
INSERT INTO "caseman__goals" VALUES('a17R0000002GAodIAG','Reach proficiency level in reading, writing, speaking & listening per state std','003R000001P0KsTIAV','a0zR0000002qG14IAE','a16R0000001TwbfIAC');
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
INSERT INTO "caseman__incident_cases" VALUES('500R0000009LAGyIAO','Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','001R000001ORqfhIAD','003R000001P0KsAIAV','Incident');
INSERT INTO "caseman__incident_cases" VALUES('500R0000009LAGzIAO','Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','001R000001ORqfhIAD','003R000001P0KsAIAV','Incident');
INSERT INTO "caseman__incident_cases" VALUES('500R0000009LAH0IAO','Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','001R000001ORqfhIAD','003R000001P0KsAIAV','Incident');
INSERT INTO "caseman__incident_cases" VALUES('500R0000009LAGxIAO','Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','003R000001P0KsAIAV','Incident');
INSERT INTO "caseman__incident_cases" VALUES('500R0000009LAH1IAO','Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','001R000001ORqfhIAD','003R000001P0KsAIAV','Incident');
CREATE TABLE caseman__program_engagements (
	sf_id VARCHAR(255) NOT NULL, 
	"Status__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	program_offering__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	case__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxGIAS','Enrolled','2019-06-01','','a1AR0000002Aml3MAC','003R000001P0KsAIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxHIAS','Enrolled','2019-09-04','2020-05-15','a1AR0000002Aml4MAC','003R000001P0KsTIAV','500R0000009LAGsIAO');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxIIAS','In Progress','2019-09-04','2019-12-13','a1AR0000002Aml5MAC','003R000001P0KsKIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxJIAS','Enrolled','2019-09-03','','a1AR0000002Aml6MAC','003R000001P0KsAIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxKIAS','In Progress','2019-06-03','2020-05-15','a1AR0000002Aml7MAC','003R000001P0KsAIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxLIAS','Enrolled','2019-09-04','2020-04-15','a1AR0000002Aml9MAC','003R000001P0KsFIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxMIAS','Applied','2019-08-14','','a1AR0000002Aml9MAC','003R000001P0KsFIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxNIAS','In Progress','2019-09-04','2020-04-15','a1AR0000002Aml9MAC','003R000001P0KsGIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxOIAS','Applied','2019-06-03','','a1AR0000002Aml9MAC','003R000001P0KsGIAV','500R0000009LAGqIAO');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxPIAS','Applied','2019-09-03','','a1AR0000002AmlBMAS','003R000001P0KsAIAV','');
INSERT INTO "caseman__program_engagements" VALUES('a18R0000005YaxQIAS','In Progress','2019-06-03','2019-12-31','a1AR0000002Aml2MAC','003R000001P0KsGIAV','');
CREATE TABLE caseman__program_goal_templates (
	sf_id VARCHAR(255) NOT NULL, 
	"IsRequired__c" VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8DIAW','true','a16R0000001TwbYIAS','a1CR0000005DsOdMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8EIAW','false','a16R0000001TwbZIAS','a1CR0000005DsOaMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8FIAW','true','a16R0000001TwbaIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8GIAW','true','a16R0000001TwbbIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8HIAW','false','a16R0000001TwbcIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8IIAW','true','a16R0000001TwbdIAC','a1CR0000005DsOYMA0');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8JIAW','true','a16R0000001TwbgIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8KIAW','false','a16R0000001TwbhIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8LIAW','false','a16R0000001TwbiIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8MIAW','true','a16R0000001TwbjIAC','a1CR0000005DsObMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8NIAW','false','a16R0000001TwbkIAC','a1CR0000005DsOfMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8OIAW','false','a16R0000001TwblIAC','a1CR0000005DsObMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8PIAW','false','a16R0000001TwbmIAC','a1CR0000005DsOfMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8QIAW','false','a16R0000001TwbnIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8RIAW','false','a16R0000001TwbpIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8SIAW','false','a16R0000001TwbqIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8TIAW','false','a16R0000001TwbsIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8UIAW','false','a16R0000001TwbvIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8VIAW','true','a16R0000001TwbwIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8WIAW','false','a16R0000001TwbxIAC','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_goal_templates" VALUES('a19R0000002ET8XIAW','false','a16R0000001TwbyIAC','a1CR0000005DsOeMAK');
CREATE TABLE caseman__program_offerings (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	description__c VARCHAR(255), 
	summary__c VARCHAR(255), 
	duration__c VARCHAR(255), 
	durationunit__c VARCHAR(255), 
	startdate__c VARCHAR(255), 
	enddate__c VARCHAR(255), 
	status__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml2MAC','2019 Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','','Months','2019-01-01','2019-12-31','Active','a1CR0000005DsOYMA0');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml3MAC','Clothing Program Summer 2019','Serving families with children under the age of 18.','Part of the Housing Assistance program, the  Clothing program program provides assistance for families with children under the age of 18.','','Months','2019-06-01','2019-08-31','Active','a1CR0000005DsOZMA0');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml4MAC','ESL I Course 2019-2020','A language instruction educational program for students whose primary language is not English.','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','','Months','2019-09-04','2020-05-30','Active','a1CR0000005DsOaMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml5MAC','Financial Literacy Program, Fall 2019','Teaches students the basics of money management.','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','','Months','2019-09-04','2019-12-13','Active','a1CR0000005DsObMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml6MAC','School Lunch Program Summer 2019','Serving families with children under the age of 18.','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','','Months','2019-09-03','2020-05-30','Active','a1CR0000005DsOcMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml7MAC','Remedial Reading, 2019','Provides students the support they need to achieve an age appropriate reading level.','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','','Months','2019-06-03','2020-05-15','Active','a1CR0000005DsOdMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml8MAC','Jump Start, Spring 2019-2020','Assisting adults who have experienced a prolonged absence from the workforce.','Assisting adults under the poverty line, seeking to re-enter the workforce after an absence or seeking to progressively stabilize their experience in the workforce.','','Months','2019-04-15','2020-04-30','Active','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002Aml9MAC','Succeed, Spring 2019-2020','Assisting adults who have experienced poverty and an absence from the workforce.','This program assists adults under the poverty line re-entering the workforce after an absence of up to two years. The program''s goal is to achieve a 60% completion rate and to successfully re-integrate 50% of its clients completing the program to full time employment within 6 months of completing the program.','','Months','2019-04-15','2020-04-30','Active','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002AmlAMAS','Advancement, Spring 2019-2020','Assisting adults who have experienced a prolonged absence from the workforce develop an appropriate, stable and rewarding career path.','This program serves adults under the poverty line, seeking to re-enter the workforce after an absence or seeking to progressively stabilize their experience in the workforce.','','Months','2019-04-15','2020-04-30','Active','a1CR0000005DsOeMAK');
INSERT INTO "caseman__program_offerings" VALUES('a1AR0000002AmlBMAS','After School Program, Ages 11-13, Summer 2019','An after school program for children enrolled in district 31.','This program''s goal is to provide a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','','Months','2019-09-03','2020-05-30','Active','a1CR0000005DsOfMAK');
CREATE TABLE caseman__programs (
	sf_id VARCHAR(255) NOT NULL, 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOYMA0','Drug and Alcohol Recovery Management','Adult individuals, families and communities affected by addiction to alcohol and other drugs.','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','1.0','Years','2019-12-31','2019-01-01','Active','Annual program. Rolling enrollment.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOZMA0','Housing Assistance Program','Families with children under the age of 18','Providing assistance for families with children under the age of 18.','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','365.0','Days','','2019-05-01','Active','Annual program with rolling applications.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOaMAK','ESL Program','A practical conversational  English class for those whose primary language is not English.','A language instruction educational program for students whose primary language is not English.','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','1.0','Years','2020-05-30','2019-09-03','Active','Offered each academic year. Enrollment in August prior to the start of the academic year.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsObMAK','Financial Literacy Program','Children aged 15-18 enrolled in school district 31','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','Teaches students the basics of money management.','4.0','Months','2019-12-13','2019-09-04','Active','Program offered fall of academic year. Applications accepted August prior to semester.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOcMAK','School Lunch Program','Children under 18  enrolled in school district 31','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','9.0','Months','2020-05-30','2019-09-03','Active','Program runs for the academic year. Enrollment is the first week of every month.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOdMAK','Remedial Reading Program','Children under 18  enrolled in school district 31','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','Provides students the support they need to achieve an age appropriate reading level.','15.0','Months','2020-05-15','2019-06-03','Active','Program runs for the academic year with application period July-August preceding the academic year.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOeMAK','Job Readiness Program','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2.0','Years','2021-04-15','2019-04-15','Active','2 year program with rolling enrollment.');
INSERT INTO "caseman__programs" VALUES('a1CR0000005DsOfMAK','After School Program, Ages 11-13','Children aged 11-13 enrolled in school district 31','An after school program for children enrolled in district 31.','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','9.0','Months','2020-05-31','2019-09-01','Active','Runs through school year with enrollment the first week of each month.');
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
	"Volunteer_Auto_Reminder_Email_Opt_Out__c" VARCHAR(255), 
	"Volunteer_Availability__c" VARCHAR(255), 
	"Volunteer_Last_Web_Signup_Date__c" VARCHAR(255), 
	"Volunteer_Manager_Notes__c" VARCHAR(255), 
	"Volunteer_Notes__c" VARCHAR(255), 
	"Volunteer_Organization__c" VARCHAR(255), 
	"Volunteer_Skills__c" VARCHAR(255), 
	"Volunteer_Status__c" VARCHAR(255), 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "contacts" VALUES('003R000001OwXWMIA3','','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-09-23','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','','false','','false','','','','','','','','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','','0.0','','0.0','','','','0.0','','0.0','','','','','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','001R000001OVn1xIAD','');
INSERT INTO "contacts" VALUES('003R000001P0Ks9IAF','','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-09-01','One Market Street','San Francisco','CA','94105','USA','','','','','','','','','','','','false','','false','','','','','','','','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','','0.0','','0.0','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','001R000001ORqfKIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsAIAV','','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','Child','','Mother','Male','068R0000000WDvNIAW','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-10-17','false','','','','','','','','','','thiggins@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','true','true','false','','','false','','','','','','','','','','0.0','001R000001ORqfLIAT','003R000001P0KsBIAV');
INSERT INTO "contacts" VALUES('003R000001P0KsBIAV','','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','','','','','','','','','','','','false','','false','','','','','','','','','','lhiggins@example.com','Personal','Home','Home','false','','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfLIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsCIAV','Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','','she/her/hers','Client;Donor;Volunteer','false','','false','','','','','','','','','','angelaadams@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfMIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsDIAV','Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','Call','','Phone','555-648-7204','he/him/his','Client','false','','false','','','','','','','','','','jeremyadams@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfMIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsEIAV','','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','','','','','','','','','','','','false','','false','','','','','','','','','','','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfNIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsFIAV','','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','Adult','','Friend','','068R0000000WDvSIAW','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','false','','','','','','','','','','alanbaker@example.com','Personal','Home','Home','false','','','','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfNIAT','003R000001P0KsCIAV');
INSERT INTO "contacts" VALUES('003R000001P0KsGIAV','','Robin','Banks','robinbanks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','Adult','','Partner','','068R0000000WDvdIAG','','','','','she/her/hers','Client','true','2019-10-17','false','','','','','','','','','','robinbanks@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfOIAT','003R000001P0KsHIAV');
INSERT INTO "contacts" VALUES('003R000001P0KsHIAV','','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','','','','','','','','','','','','false','','false','','','','','','','','','','darrylgraham@example.com','Personal','Home','Home','false','','','','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','0.0','400.0','0.0','1.0','0.0','1.0','400.0','','','','','400.0','400.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfOIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsIIAV','','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','','false','','false','','','','','','','','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfPIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsJIAV','','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','','','','','','','','','','','','false','','false','','','','','','','','','','davidbarnes@example.com','Personal','Home','Home','false','','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','001R000001ORqfPIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsKIAV','','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','Youth','88841515','Mother','Male','068R0000000WDvcIAG','','','','','he/him/his','Client','false','','false','','','','','','','','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','001R000001ORqfPIAT','003R000001P0KsIIAV');
INSERT INTO "contacts" VALUES('003R000001P0KsLIAV','Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','Adult','','Friend','Female','','','','','','she/her/hers','Client','false','','false','','','','','','','','','','anneboyd@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfQIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsMIAV','','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','Senior','','Friend','Non-binary','','','','','','they/them/theirs','Client','false','','false','','','','','','','','','','normaburke@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfRIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsNIAV','','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','Adult','','Friend','Male','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-10-17','false','','','','','','','','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfSIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsOIAV','','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','Adult','','Friend','','','','','','','they/them/theirs','Client','false','','false','','','','','','','','','','anthonyhill@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfTIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsPIAV','Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','Adult','','Friend','','','','','','','she/her/hers','Client;Donor','false','','false','','','','','','','','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfUIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsQIAV','','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','Adult','','Friend','','','','','','','he/him/his','Donor','false','','false','','','','','','','','','','josejenkins@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfVIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsRIAV','','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','','false','','false','','','','','','','','','','craigjohnso@example.com','Personal','Home','Home','false','','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfWIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsSIAV','','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','','','','','','','','','','','','false','','false','','','','','','','','','','','Personal','Home','Home','false','','','','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','true','true','true','','','false','','','','','','','','','','0.0','001R000001ORqfWIAT','');
INSERT INTO "contacts" VALUES('003R000001P0KsTIAV','','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','','Adult','','Husband','','068R0000000WDvXIAW','','','','','she/her/hers','Client','false','','false','','','','','','','','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','false','false','false','false','false','','','false','','','','','','','','','','0.0','001R000001ORqfWIAT','003R000001P0KsRIAV');
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
	"SYSTEM_AccountType__c" VARCHAR(255), 
	"SYSTEMIsIndividual__c" VARCHAR(255), 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "household_accounts" VALUES('001R000001OVn1xIAD','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','true','','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfKIAT','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfLIAT','Higgins Household','','','','','','','555-248-3956','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfMIAT','Adams Household','','','','','','','555-648-7204','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfNIAT','Baker Household','','','','','','','555-524-0749','','','','','','Household','','Household Account','true','','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfOIAT','Banks and Graham Household','','','','','','','555-648-7204','','','','','','Household','','Household Account','true','','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','400.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfPIAT','Barnes Household','','','','','','','555-893-4763','','','','','','Household','','Household Account','true','','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfQIAT','Boyd Household','','','','','','','555-380-8532','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfRIAT','Burke Household','','','','','','','555-830-5295','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfSIAT','Henderson Household','','','','','','','555-830-5295','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfTIAT','Hill Household','','','','','','','555-395-9737','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfUIAT','Holmes Household','','','','','','','555-930-8759','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfVIAT','Jenkins Household','','','','','','','555-469-9873','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('001R000001ORqfWIAT','Johnson Household','','','','','','','555-248-3956','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
CREATE TABLE npe4__relationships (
	sf_id VARCHAR(255) NOT NULL, 
	"SYSTEM_SystemCreated__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	"Related_Opportunity_Contact_Role__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	related_contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqPMAW','false','','Current','Mother','','003R000001P0KsAIAV','003R000001P0KsBIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqRMAW','true','','Current','Son','','003R000001P0KsBIAV','003R000001P0KsAIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqTMAW','true','Arthur is Arlene''s recently deceased father.','Current','Child','','003R000001P0KsEIAV','003R000001P0KsFIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqVMAW','false','Arthur is Arlene''s recently deceased father.','Current','Father','Tribute','003R000001P0KsFIAV','003R000001P0KsEIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqXMAW','true','','Current','Son','','003R000001P0KsIIAV','003R000001P0KsKIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqZMAW','true','','Current','Son','','003R000001P0KsJIAV','003R000001P0KsKIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqbMAG','false','','Current','Mother','','003R000001P0KsKIAV','003R000001P0KsIIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqdMAG','false','','Current','Father','','003R000001P0KsKIAV','003R000001P0KsJIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqfMAG','true','','Current','Spouse','','003R000001P0KsRIAV','003R000001P0KsTIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqhMAG','true','','Current','Parent','','003R000001P0KsSIAV','003R000001P0KsTIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqjMAG','false','','Current','Husband','','003R000001P0KsTIAV','003R000001P0KsRIAV');
INSERT INTO "npe4__relationships" VALUES('a0GR0000006DTqlMAG','false','','Current','Daughter','','003R000001P0KsTIAV','003R000001P0KsSIAV');
CREATE TABLE "npsp__OpportunityContactRole" (
	sf_id VARCHAR(255) NOT NULL, 
	"Role" VARCHAR(255), 
	"IsPrimary" VARCHAR(255), 
	contact_id VARCHAR(255), 
	opportunity_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMz9MAE','Donor','true','003R000001P0KsFIAV','006R000000VBEwYIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzAMAU','Donor','true','003R000001P0KsHIAV','006R000000VBEwZIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzBMAU','Donor','true','003R000001P0KsIIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzCMAU','Tribute','false','003R000001P0KsEIAV','006R000000VBEwYIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzDMAU','Household Member','false','003R000001P0KsGIAV','006R000000VBEwZIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzEMAU','Household Member','false','003R000001P0KsJIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzFMAU','Household Member','false','003R000001P0KsKIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzJMAU','Tribute','false','003R000001P0KsEIAV','006R000000VBEwYIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzKMAU','Tribute','false','003R000001P0KsEIAV','006R000000VBEwYIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzLMAU','Donor','true','003R000001P0KsFIAV','006R000000VBEwYIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzMMAU','Donor','true','003R000001P0KsFIAV','006R000000VBEwYIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzNMAU','Household Member','false','003R000001P0KsGIAV','006R000000VBEwZIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzOMAU','Household Member','false','003R000001P0KsGIAV','006R000000VBEwZIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzPMAU','Donor','true','003R000001P0KsHIAV','006R000000VBEwZIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzQMAU','Donor','true','003R000001P0KsHIAV','006R000000VBEwZIAX');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzRMAU','Donor','true','003R000001P0KsIIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzSMAU','Donor','true','003R000001P0KsIIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzTMAU','Household Member','false','003R000001P0KsJIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzUMAU','Household Member','false','003R000001P0KsJIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzVMAU','Household Member','false','003R000001P0KsKIAV','006R000000VBEwaIAH');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00KR0000002vMzWMAU','Household Member','false','003R000001P0KsKIAV','006R000000VBEwaIAH');
CREATE TABLE npsp__donations (
	sf_id VARCHAR(255) NOT NULL, 
	"Contact_Id_for_Role__c" VARCHAR(255), 
	"Membership_Origin__c" VARCHAR(255), 
	"Member_Level__c" VARCHAR(255), 
	"Membership_Start_Date__c" VARCHAR(255), 
	"Membership_End_Date__c" VARCHAR(255), 
	"Do_Not_Automatically_Create_Payment__c" VARCHAR(255), 
	"systemHouseholdContactRoleProcessor__c" VARCHAR(255), 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "npsp__donations" VALUES('006R000000VBEwYIAX','0035400000Hsa3XAAR','','','','','false','All Opportunities','Arthur Baker Donation in Memoriam','','','Closed Won','','Closed','100.0','','','2019-09-02','500.0','false','','','Arlene Baker','Arthur Baker','','','','','','Memorial','Phone','','','To Be Acknowledged','','','','','','','','2019-09-06','','','','','false','false','false','001R000001ORqfNIAT','003R000001P0KsFIAV','003R000001P0KsEIAV','003R000001P0KsFIAV');
INSERT INTO "npsp__donations" VALUES('006R000000VBEwZIAX','0035400000HtExuAAF','','','','','false','All Opportunities','Darryl Graham 2019 In-Kind Donation','','','In-Kind Received','','Omitted','100.0','','','2019-08-05','400.0','false','','','','','','','','','<p>PSA Production for fundraising drive</p>','','','','Services','Acknowledged','','','','','','','','2019-08-09','','','800.0','','false','true','false','001R000001ORqfOIAT','003R000001P0KsHIAV','','');
INSERT INTO "npsp__donations" VALUES('006R000000VBEwaIAH','0035400000HtEyZAAV','','','','','false','All Opportunities','Lynn Barnes 1019 Donation','','','Closed Won','','Closed','100.0','','','2019-07-01','500.0','false','','','','','','','','','','','','','','Acknowledged','','','','','','','','2019-07-05','','','','','false','false','false','001R000001ORqfPIAT','003R000001P0KsIIAV','','');
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
	"SYSTEM_AccountType__c" VARCHAR(255), 
	"SYSTEMIsIndividual__c" VARCHAR(255), 
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
	PRIMARY KEY (sf_id)
);
INSERT INTO "organization_accounts" VALUES('001R000001OVn1yIAD','Sample Organization','','','','','','','','','','','','','','','','false','','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('001R000001ORqfXIAT','Sample Organization','','','','','','','','','','','','','','','','false','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('001R000001ORqfYIAT','Marble Foundation','','','','','','','555-389-74399','','','','','','Foundation','','','false','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('001R000001ORqfZIAT','Future Potential Fund','','','','','','','555-278-7643','','','','','','Foundation','','','false','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('001R000001ORqfaIAD','City Department of Human Services','','','','','','','','','','','','','Government','','','false','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
CREATE TABLE "pmdm__ProgramEngagement__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"ApplicationDate__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"Role__c" VARCHAR(255), 
	"Stage__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	account__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0czIAA','Housing Assistance Program: Tom Higgins','2019-05-25','','Client','Enrolled','2019-06-01','','003R000001P0KsAIAV','a0tR00000032oUMIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d0IAA','ESL Program: Barbara Johnson','2019-07-03','','Client','Enrolled','2019-09-04','','003R000001P0KsTIAV','a0tR00000032oUNIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d1IAA','Financial Literacy Program: Jason Barnes','2019-08-23','','Client','In Progress','2019-09-04','','003R000001P0KsKIAV','a0tR00000032oUOIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d2IAA','School Lunch Program: Tom Higgins','2019-06-08','','Client','Enrolled','2019-09-03','','003R000001P0KsAIAV','a0tR00000032oUPIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d3IAA','Remedial Reading Program: Tom Higgins','2019-04-12','','Client','In Progress','2019-06-03','','003R000001P0KsAIAV','a0tR00000032oUQIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d4IAA','Job Readiness Program: Arlene Baker','2019-06-19','','Client','Enrolled','2019-09-04','','003R000001P0KsFIAV','a0tR00000032oURIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d5IAA','Job Readiness Program: Arlene Baker','2019-06-02','','Client','Applied','2019-08-14','','003R000001P0KsFIAV','a0tR00000032oURIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d6IAA','Job Readiness Program: Robin Banks','2019-09-02','','Client','In Progress','2019-09-04','','003R000001P0KsGIAV','a0tR00000032oURIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d7IAA','Job Readiness Program: Robin Banks','2019-03-19','','Client','Applied','2019-06-03','','003R000001P0KsGIAV','a0tR00000032oURIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d8IAA','After School Program, Ages 11-13: Tom Higgins','2019-08-29','','Client','Applied','2019-09-03','','003R000001P0KsAIAV','a0tR00000032oUSIAY');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a0sR0000003y0d9IAA','Drug and Alcohol Recovery Management: Robin Banks','2019-04-24','','Client','In Progress','2019-06-03','','003R000001P0KsGIAV','a0tR00000032oULIAY');
CREATE TABLE "pmdm__Program__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"ProgramIssueArea__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Summary__c" VARCHAR(255), 
	"TargetPopulation__c" VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oULIAY','Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2019-12-31','','2019-01-01','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oUMIAY','Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2019-05-01','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oUNIAY','ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2020-05-30','','2019-09-03','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oUOIAY','Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','2019-12-13','Education','2019-09-04','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oUPIAY','School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2020-05-30','Food and Nutrition','2019-09-03','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oUQIAY','Remedial Reading Program','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','2020-05-15','Education','2019-06-03','Active','Provides students the support they need to achieve an age appropriate reading level.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oURIAY','Job Readiness Program','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','Employment','2019-04-15','Active','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce');
INSERT INTO "pmdm__Program__c" VALUES('a0tR00000032oUSIAY','After School Program, Ages 11-13','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','2020-05-31','Education','2019-09-01','Active','An after school program for children enrolled in district 31.','Children aged 11-13 enrolled in school district 31');
COMMIT;
