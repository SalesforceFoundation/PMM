BEGIN TRANSACTION;
CREATE TABLE caseman__account_program_offerings (
	sf_id VARCHAR(255) NOT NULL, 
	accountrole__c VARCHAR(255), 
	account__c VARCHAR(255), 
	program_offering__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__account_program_offerings" VALUES('a0S1D000002FiV9UAK','Funder','0011D00000eOo0YQAS','a121D000001pWJZQA2');
INSERT INTO "caseman__account_program_offerings" VALUES('a0S1D000002FiVAUA0','Funder','0011D00000eOo0ZQAS','a121D000001pWJTQA2');
INSERT INTO "caseman__account_program_offerings" VALUES('a0S1D000002FiVBUA0','Funder','0011D00000eOo0ZQAS','a121D000001pWJZQA2');
INSERT INTO "caseman__account_program_offerings" VALUES('a0S1D000002FiVCUA0','Location','0011D00000eOo0aQAC','a121D000001pWJTQA2');
INSERT INTO "caseman__account_program_offerings" VALUES('a0S1D000002FiVDUA0','Service Provider','0011D00000eOo0aQAC','a121D000001pWJTQA2');
INSERT INTO "caseman__account_program_offerings" VALUES('a0S1D000002FiVEUA0','Service Provider','0011D00000eOo0aQAC','a121D000001pWJWQA2');
CREATE TABLE caseman__action_item_templates (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec0UAC','Meet job requirement standards');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec1UAC','Complete Stability Assessment');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec2UAC','Month 6: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec3UAC','Month 2: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec4UAC','Month 1: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec5UAC','Get an job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec6UAC','Open a bank account');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec7UAC','Meet with legal assistance advisor');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec8UAC','Read and interpret a banking account statement');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001Jec9UAC','Month 2: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecAUAS','Month 1: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecBUAS','Month 3: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecCUAS','Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecDUAS','Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecEUAS','Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecFUAS','Pass English proficiency exam with a score of 65 or above');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecGUAS','Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecHUAS','Month 4: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecIUAS','Month 4: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecJUAS','Month 1: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecKUAS','Month 5: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecLUAS','Month 5: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecMUAS','Month 3: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecNUAS','Month 6: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecOUAS','Month 6: Meet Financial Advisor beginning of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecPUAS','Month 2: Deposit 10% of income to savings account - end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecQUAS','Open a Savings Account');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecRUAS','Deposit 10% of Paycheck: Month 1');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecSUAS','Complete Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JebyUAC','Pass an age appropriate reading proficiency exam');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JebzUAC','Maintain 2 years active engagement in workforce');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecTUAS','Meet with Financial Advisor');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecUUAS','Deposit 10% of Paycheck: Month 2');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecVUAS','Deposit 10% of Paycheck: Month 3');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecWUAS','Get a passing grade in Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecXUAS','Register for Financial Literacy Course');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecYUAS','Pass basic financial literacy course');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecZUAS','Complete online job applications to at least 3 appropriate job openings');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecaUAC','Month 3: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecbUAC','Month 4: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JeccUAC','Month 5: Meet Job Readiness Coach end of month');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecdUAC','Get a job readiness coach');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JeceUAC','Complete resume workshop');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecfUAC','Complete interview workshop');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JecgUAC','Pass mock interview');
INSERT INTO "caseman__action_item_templates" VALUES('a0T1D000001JechUAC','Update resume');
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
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WWUAY','Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','0031D00000Pq21vQAB','a0r1D000000ej8nQAA','a0z1D000000wVUXQA2','a0T1D000001JebyUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WXUAY','Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001Jec3UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WYUAY','Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001Jec4UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WZUAY','Open a bank account','Completed','2019-09-06','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001Jec6UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WaUAI','Read and interpret a banking account statement','Not Started','2019-09-30','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001Jec8UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WbUAI','Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecBUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WcUAI','Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecHUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WdUAI','Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecIUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WeUAI','Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecJUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WfUAI','Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecKUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WgUAI','Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecLUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WhUAI','Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecMUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WiUAI','Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecNUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WjUAI','Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecOUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WkUAI','Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecPUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WlUAI','Pass basic financial literacy course','In Progress','2019-09-30','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUYQA2','a0T1D000001JecYUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WmUAI','Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUZQA2','a0T1D000001Jec2UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WnUAI','Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUZQA2','a0T1D000001Jec9UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WoUAI','Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUZQA2','a0T1D000001JecAUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WpUAI','Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUZQA2','a0T1D000001JecaUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WqUAI','Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUZQA2','a0T1D000001JecbUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WrUAI','Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUZQA2','a0T1D000001JeccUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WsUAI','Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUaQAM','a0T1D000001JecZUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WtUAI','Get a job readiness coach','Completed','2019-09-05','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUaQAM','a0T1D000001JecdUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WuUAI','Complete resume workshop','Not Started','2019-10-11','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUaQAM','a0T1D000001JeceUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WvUAI','Complete interview workshop','Not Started','2019-11-04','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUaQAM','a0T1D000001JecfUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WwUAI','Pass mock interview','Not Started','2019-11-06','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUaQAM','a0T1D000001JecgUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WxUAI','Update resume','Not Started','2019-10-25','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUaQAM','a0T1D000001JechUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WyUAI','Maintain 2 years active engagement in workforce','Not Started','2021-09-01','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUfQAM','a0T1D000001JebzUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5WzUAI','Meet job requirement standards','Not Started','2020-04-15','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0z1D000000wVUfQAM','a0T1D000001Jec0UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X0UAI','Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUgQAM','a0T1D000001Jec3UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X1UAI','Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUgQAM','a0T1D000001Jec4UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X2UAI','Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUgQAM','a0T1D000001JecBUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X3UAI','Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUgQAM','a0T1D000001JecJUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X4UAI','Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUgQAM','a0T1D000001JecMUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X5UAI','Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUgQAM','a0T1D000001JecPUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X6UAI','Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUhQAM','a0T1D000001Jec2UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X7UAI','Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUhQAM','a0T1D000001Jec9UAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X8UAI','Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUhQAM','a0T1D000001JecAUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5X9UAI','Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUhQAM','a0T1D000001JecaUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XAUAY','Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUhQAM','a0T1D000001JecbUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XBUAY','Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUhQAM','a0T1D000001JeccUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XCUAY','Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUiQAM','a0T1D000001JecZUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XDUAY','Get a job readiness coach','Completed','2019-09-05','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUiQAM','a0T1D000001JecdUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XEUAY','Complete resume workshop','Not Started','2019-09-27','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUiQAM','a0T1D000001JeceUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XFUAY','Complete interview workshop','Not Started','2019-10-20','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUiQAM','a0T1D000001JecfUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XGUAY','Pass mock interview','Not Started','2019-10-31','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUiQAM','a0T1D000001JecgUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XHUAY','Update resume','Not Started','2019-10-09','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0z1D000000wVUiQAM','a0T1D000001JechUAC');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XIUAY','Participate in a 12-step program','In Progress','2019-12-31','0031D00000Pq221QAB','a0r1D000000ej8qQAA','a0z1D000000wVUmQAM','a0T1D000001JecCUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XJUAY','Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0z1D000000wVUnQAM','a0T1D000001JecDUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XKUAY','Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0z1D000000wVUnQAM','a0T1D000001JecEUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XLUAY','Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0z1D000000wVUnQAM','a0T1D000001JecGUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XMUAY','Open a Savings Account','Completed','2019-09-09','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0z1D000000wVUnQAM','a0T1D000001JecQUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XNUAY','Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0z1D000000wVUnQAM','a0T1D000001JecYUAS');
INSERT INTO "caseman__action_items" VALUES('a0U1D000000h5XOUAY','Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','0031D00000Pq22EQAR','a0r1D000000ej8sQAA','a0z1D000000wVUpQAM','a0T1D000001JecFUAS');
CREATE TABLE caseman__appointment_attendees (
	sf_id VARCHAR(255) NOT NULL, 
	reason__c VARCHAR(255), 
	role__c VARCHAR(255), 
	status__c VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__appointment_attendees" VALUES('a0V1D0000015kcdUAA','Client','Attendee','Attending','a0W1D000001CcNBUA0','0031D00000Pq21xQAB');
INSERT INTO "caseman__appointment_attendees" VALUES('a0V1D0000015kceUAA','Check in on Jason''s progress with Workplace Readiness.','Attendee','New','a0W1D000001CcNCUA0','0031D00000Pq225QAB');
INSERT INTO "caseman__appointment_attendees" VALUES('a0V1D0000015kcfUAA','','Attendee','New','a0W1D000001CcNDUA0','0031D00000Pq22EQAR');
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
INSERT INTO "caseman__appointments" VALUES('a0W1D000001CcNAUA0','Math Appointment','Scheduled','Corner Office','2020-12-29T16:00:00.000Z','2020-12-29T17:00:00.000Z','We should talk about your grades');
INSERT INTO "caseman__appointments" VALUES('a0W1D000001CcNBUA0','Program Evaluation','Scheduled','AC-1223','2020-12-29T16:00:00.000Z','2020-12-29T17:00:00.000Z','Initial program evaluation');
INSERT INTO "caseman__appointments" VALUES('a0W1D000001CcNCUA0','Check-in with Jason Barnes','Scheduled','127th STreet Community Center, Meeting Room 2-B','2020-08-25T20:00:00.000Z','2020-08-25T21:00:00.000Z','Check-in on Jason''s progress with Workplace Readiness');
INSERT INTO "caseman__appointments" VALUES('a0W1D000001CcNDUA0','Barbara Johnson English Tutor','Scheduled','127th Street Community Center Meeting Room A','2020-07-16T01:00:00.000Z','2020-07-16T02:00:00.000Z','Discuss getting Barbara a tutor to improve her conversational confidence');
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
INSERT INTO "caseman__branch_accounts" VALUES('0011D00000eOo11QAC','127th Street Community Center','','','','','','','555-398-2090','','','','','','','1500.0','Branch');
CREATE TABLE caseman__branch_contacts (
	sf_id VARCHAR(255) NOT NULL, 
	"Roles" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	account_id VARCHAR(255), 
	contact_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XPQAY','','true','0011D00000eOo0JQAS','0031D00000Pq21uQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XQQAY','','true','0011D00000eOo0KQAS','0031D00000Pq21vQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XRQAY','','true','0011D00000eOo0KQAS','0031D00000Pq21wQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XSQAY','','true','0011D00000eOo0LQAS','0031D00000Pq21xQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XTQAY','','true','0011D00000eOo0LQAS','0031D00000Pq21yQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XUQAY','','true','0011D00000eOo0MQAS','0031D00000Pq21zQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XVQAY','','true','0011D00000eOo0MQAS','0031D00000Pq220QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XWQAY','','true','0011D00000eOo0NQAS','0031D00000Pq221QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XXQAY','','true','0011D00000eOo0NQAS','0031D00000Pq222QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XYQAY','','true','0011D00000eOo0OQAS','0031D00000Pq223QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XZQAY','','true','0011D00000eOo0OQAS','0031D00000Pq224QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XaQAI','','true','0011D00000eOo0OQAS','0031D00000Pq225QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XbQAI','','true','0011D00000eOo0PQAS','0031D00000Pq226QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XcQAI','','true','0011D00000eOo0QQAS','0031D00000Pq227QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XdQAI','','true','0011D00000eOo0RQAS','0031D00000Pq228QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XeQAI','','true','0011D00000eOo0SQAS','0031D00000Pq229QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XfQAI','','true','0011D00000eOo0TQAS','0031D00000Pq22AQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XgQAI','','true','0011D00000eOo0UQAS','0031D00000Pq22BQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XhQAI','','true','0011D00000eOo0VQAS','0031D00000Pq22CQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XiQAI','','true','0011D00000eOo0VQAS','0031D00000Pq22DQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XjQAI','','true','0011D00000eOo0VQAS','0031D00000Pq22EQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XkQAI','','true','0011D00000eOo0IQAS','0031D00000Pq22FQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XxQAI','Other','true','0011D00000eOo11QAC','0031D00000Pq21xQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XyQAI','','true','0011D00000eOo11QAC','0031D00000Pq21yQAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0XzQAI','Client','true','0011D00000eOo11QAC','0031D00000Pq220QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y0QAI','Client','true','0011D00000eOo11QAC','0031D00000Pq221QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y1QAI','Client','true','0011D00000eOo11QAC','0031D00000Pq225QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y2QAI','','true','0011D00000eOo11QAC','0031D00000Pq226QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y3QAI','','true','0011D00000eOo11QAC','0031D00000Pq227QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y4QAI','Client','true','0011D00000eOo11QAC','0031D00000Pq228QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y5QAI','','true','0011D00000eOo11QAC','0031D00000Pq229QAB');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y6QAI','','true','0011D00000eOo11QAC','0031D00000Pq22AQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y7QAI','Client','true','0011D00000eOo11QAC','0031D00000Pq22BQAR');
INSERT INTO "caseman__branch_contacts" VALUES('07k1D000006p0Y8QAI','Client','true','0011D00000eOo11QAC','0031D00000Pq22EQAR');
CREATE TABLE caseman__case_plans (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8mQAA','Socialization Case Plan - Tom Higgins','0031D00000Pq21vQAB');
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8nQAA','Reading Case Plan - Tom Higgins','0031D00000Pq21vQAB');
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8oQAA','Arlene Baker''s Workforce Re-entry Case Plan','0031D00000Pq220QAB');
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8pQAA','Robin Banks'' Job Readiness Case Plan','0031D00000Pq221QAB');
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8qQAA','Robin Banks'' Sobriety Case Plan','0031D00000Pq221QAB');
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8rQAA','Financial Literacy Case Plan - Jason Barnes','0031D00000Pq225QAB');
INSERT INTO "caseman__case_plans" VALUES('a0r1D000000ej8sQAA','English proficiency case plan - Barbara Johnson','0031D00000Pq22EQAR');
CREATE TABLE caseman__client_alerts (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	active__c VARCHAR(255), 
	description__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__client_alerts" VALUES('a0s1D000000OqslQAC','Tom has anger issues','true','','0031D00000Pq21vQAB');
INSERT INTO "caseman__client_alerts" VALUES('a0s1D000000OqsmQAC','Tom''s sister passed away recently (very emotional)','true','','0031D00000Pq21vQAB');
INSERT INTO "caseman__client_alerts" VALUES('a0s1D000000OqsnQAC','Robin was recently released from rehab','true','','0031D00000Pq221QAB');
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
INSERT INTO "caseman__client_cases" VALUES('5001D000003RigbQAC','Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','','0031D00000Pq21vQAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RigcQAC','Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','','0031D00000Pq21vQAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RigdQAC','Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','','0031D00000Pq21vQAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RigeQAC','Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','','0031D00000Pq21vQAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RigfQAC','Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','','0031D00000Pq220QAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RiggQAC','Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','','0031D00000Pq221QAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RighQAC','Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','','0031D00000Pq225QAB','ClientCase');
INSERT INTO "caseman__client_cases" VALUES('5001D000003RigiQAC','Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','','0031D00000Pq22EQAR','ClientCase');
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
INSERT INTO "caseman__client_note_relationships" VALUES('a0t1D000002ASk3QAG','a1554000000FXRBAA4','PE-00000007','ProgramEngagement__c','','a0u1D000000gtH6QAI','','a101D000000XUhWQAW');
INSERT INTO "caseman__client_note_relationships" VALUES('a0t1D000002ASk4QAG','a16S0000002pKVPIA2','PE-00000003','caseman__ProgramEngagement__c','','a0u1D000000gtH7QAI','','a101D000000XUhRQAW');
INSERT INTO "caseman__client_note_relationships" VALUES('a0t1D000002ASk5QAG','500540000032nuJAAQ','00001008','Case','5001D000003RiggQAC','a0u1D000000gtH8QAI','','');
INSERT INTO "caseman__client_note_relationships" VALUES('a0t1D000002ASk6QAG','500540000032nuKAAQ','00001009','Case','5001D000003RighQAC','a0u1D000000gtH9QAI','','');
INSERT INTO "caseman__client_note_relationships" VALUES('a0t1D000002ASk7QAG','500540000032nuLAAQ','00001010','Case','5001D000003RigiQAC','a0u1D000000gtHAQAY','','');
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
INSERT INTO "caseman__client_notes" VALUES('a0u1D000000gtH6QAI','<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','0031D00000Pq21vQAB','');
INSERT INTO "caseman__client_notes" VALUES('a0u1D000000gtH7QAI','<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','0031D00000Pq21vQAB','');
INSERT INTO "caseman__client_notes" VALUES('a0u1D000000gtH8QAI','<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','0031D00000Pq221QAB','');
INSERT INTO "caseman__client_notes" VALUES('a0u1D000000gtH9QAI','<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','0031D00000Pq225QAB','');
INSERT INTO "caseman__client_notes" VALUES('a0u1D000000gtHAQAY','<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','0031D00000Pq22EQAR','');
CREATE TABLE caseman__goal_action_item_templates (
	sf_id VARCHAR(255) NOT NULL, 
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VjQAK','a0y1D000000O07IQAS','a0T1D000001JecIUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VkQAK','a0y1D000000O07IQAS','a0T1D000001JecJUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VlQAK','a0y1D000000O07IQAS','a0T1D000001JecKUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VmQAK','a0y1D000000O07IQAS','a0T1D000001JecLUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VnQAK','a0y1D000000O07IQAS','a0T1D000001JecMUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VoQAK','a0y1D000000O07IQAS','a0T1D000001JecNUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VpQAK','a0y1D000000O07IQAS','a0T1D000001JecOUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VqQAK','a0y1D000000O07IQAS','a0T1D000001JecPUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VrQAK','a0y1D000000O07IQAS','a0T1D000001JecYUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VsQAK','a0y1D000000O07JQAS','a0T1D000001Jec9UAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VtQAK','a0y1D000000O07JQAS','a0T1D000001JecAUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VuQAK','a0y1D000000O07JQAS','a0T1D000001JecaUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VvQAK','a0y1D000000O07JQAS','a0T1D000001JecbUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VwQAK','a0y1D000000O07JQAS','a0T1D000001JeccUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VxQAK','a0y1D000000O07LQAS','a0T1D000001JecCUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VyQAK','a0y1D000000O07OQAS','a0T1D000001JecZUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VzQAK','a0y1D000000O07OQAS','a0T1D000001JecdUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W0QAK','a0y1D000000O07OQAS','a0T1D000001JeceUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W1QAK','a0y1D000000O07OQAS','a0T1D000001JecfUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W2QAK','a0y1D000000O07OQAS','a0T1D000001JecgUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W3QAK','a0y1D000000O07OQAS','a0T1D000001JechUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W4QAK','a0y1D000000O07RQAS','a0T1D000001JecWUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VfQAK','a0y1D000000O07IQAS','a0T1D000001Jec6UAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VgQAK','a0y1D000000O07IQAS','a0T1D000001Jec8UAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VhQAK','a0y1D000000O07IQAS','a0T1D000001JecBUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2ViQAK','a0y1D000000O07IQAS','a0T1D000001JecHUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W5QAK','a0y1D000000O07RQAS','a0T1D000001JecXUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W6QAK','a0y1D000000O07TQAS','a0T1D000001JecQUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W7QAK','a0y1D000000O07TQAS','a0T1D000001JecRUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W8QAK','a0y1D000000O07TQAS','a0T1D000001JecUUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2W9QAK','a0y1D000000O07TQAS','a0T1D000001JecVUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2WAQA0','a0y1D000000O07hQAC','a0T1D000001JecFUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VbQAK','a0y1D000000O07GQAS','a0T1D000001JebyUAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VcQAK','a0y1D000000O07HQAS','a0T1D000001JecFUAS');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VdQAK','a0y1D000000O07IQAS','a0T1D000001Jec3UAC');
INSERT INTO "caseman__goal_action_item_templates" VALUES('a0w1D000000P2VeQAK','a0y1D000000O07IQAS','a0T1D000001Jec4UAC');
CREATE TABLE caseman__goal_templates (
	sf_id VARCHAR(255) NOT NULL, 
	name VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07GQAS','Reach an age appropriate level of proficiency in reading');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07HQAS','Reach proficiency in reading, writing, speaking, and listening');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07IQAS','Develop basic financial literacy skills');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07JQAS','Get and keep job for 6 - 12 months');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07KQAS','Stabilize career path');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07LQAS','Acquire and adopt healthy skills to address problems');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07MQAS','Participate in a Twelve Step or other mutual-help group');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07NQAS','Reach proficiency level in reading, writing, speaking & listening per state std');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07OQAS','Develop soft skills');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07PQAS','Stabilize housing');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07QQAS','Complete Advancement program');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07RQAS','Complete Financial Literacy Course');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07SQAS','Build respectful peer relationships');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07TQAS','Deposit 10% of income in Savings Account for 3 months');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07UQAS','Build respectful intergenerational relationships');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07VQAS','Identify industry/career path');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07WQAS','Complete Advancement program');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07XQAS','Meet job requirement standards');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07YQAS','Complete Succeed program');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07ZQAS','Meet with a Financial Advisor');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07aQAC','Stabilize employment');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07bQAC','Get a Job Readiness Coach');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07cQAC','Meet with Legal Assistance Advisor');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07dQAC','Visioning career path');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07eQAC','Complete Stability Assessment');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07fQAC','Complete Jump Start program');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07gQAC','Get any required certifications');
INSERT INTO "caseman__goal_templates" VALUES('a0y1D000000O07hQAC','Get a passing grade in ESL I Class');
CREATE TABLE caseman__goals (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUVQA2','Build respectful peer relationships','0031D00000Pq21vQAB','a0r1D000000ej8mQAA','a0y1D000000O07SQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUWQA2','Build respectful inter-generational relationships','0031D00000Pq21vQAB','a0r1D000000ej8mQAA','a0y1D000000O07UQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUXQA2','Reach an age appropriate level of proficiency in reading','0031D00000Pq21vQAB','a0r1D000000ej8nQAA','a0y1D000000O07GQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUYQA2','Develop basic financial literacy skills','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07IQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUZQA2','Get and keep job for 6 - 12 months','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07JQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUaQAM','Develop Soft Skills','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07OQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUbQAM','Stabilize housing','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07PQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUcQAM','Identify industry/career path','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07VQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUdQAM','Meet job requirement standards','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07XQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUeQAM','Complete Succeed Program','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07YQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUfQAM','Stabilize Employment','0031D00000Pq220QAB','a0r1D000000ej8oQAA','a0y1D000000O07aQAC');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUgQAM','Develop basic financial literacy skills','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0y1D000000O07IQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUhQAM','Get and keep job for 6 - 12 months','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0y1D000000O07JQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUiQAM','Develop Soft Skills','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0y1D000000O07OQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUjQAM','Meet job requirement standards','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0y1D000000O07XQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUkQAM','Complete Succeed Program','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0y1D000000O07YQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUlQAM','Stabilize Employment','0031D00000Pq221QAB','a0r1D000000ej8pQAA','a0y1D000000O07aQAC');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUmQAM','Adopt healthy skills to address dependency issues','0031D00000Pq221QAB','a0r1D000000ej8qQAA','a0y1D000000O07LQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUnQAM','Complete Financial Literacy Course','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0y1D000000O07RQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUoQAM','Deposit 10% of income in Savings Account for 3 months','0031D00000Pq225QAB','a0r1D000000ej8rQAA','a0y1D000000O07TQAS');
INSERT INTO "caseman__goals" VALUES('a0z1D000000wVUpQAM','Reach proficiency level in reading, writing, speaking & listening per state std','0031D00000Pq22EQAR','a0r1D000000ej8sQAA','a0y1D000000O07NQAS');
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
INSERT INTO "caseman__incident_cases" VALUES('5001D000003RigkQAC','Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','0011D00000eOo11QAC','0031D00000Pq21vQAB','Incident');
INSERT INTO "caseman__incident_cases" VALUES('5001D000003RiglQAC','Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','0011D00000eOo11QAC','0031D00000Pq21vQAB','Incident');
INSERT INTO "caseman__incident_cases" VALUES('5001D000003RigmQAC','Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','0011D00000eOo11QAC','0031D00000Pq21vQAB','Incident');
INSERT INTO "caseman__incident_cases" VALUES('5001D000003RigjQAC','Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','','0031D00000Pq21vQAB','Incident');
INSERT INTO "caseman__incident_cases" VALUES('5001D000003RignQAC','Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','0011D00000eOo11QAC','0031D00000Pq21vQAB','Incident');
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
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhMQAW','In Progress','2019-06-03','2019-12-31','a121D000001pWJSQA2','0031D00000Pq221QAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhNQAW','Enrolled','2019-06-01','','a121D000001pWJTQA2','0031D00000Pq21vQAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhOQAW','Enrolled','2019-09-04','2020-05-15','a121D000001pWJUQA2','0031D00000Pq22EQAR','5001D000003RigiQAC');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhPQAW','In Progress','2019-09-04','2019-12-13','a121D000001pWJVQA2','0031D00000Pq225QAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhQQAW','Enrolled','2019-09-03','','a121D000001pWJWQA2','0031D00000Pq21vQAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhRQAW','In Progress','2019-06-03','2020-05-15','a121D000001pWJXQA2','0031D00000Pq21vQAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhSQAW','Enrolled','2019-09-04','2020-04-15','a121D000001pWJZQA2','0031D00000Pq220QAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhTQAW','Applied','2019-08-14','','a121D000001pWJZQA2','0031D00000Pq220QAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhUQAW','In Progress','2019-09-04','2020-04-15','a121D000001pWJZQA2','0031D00000Pq221QAB','');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhVQAW','Applied','2019-06-03','','a121D000001pWJZQA2','0031D00000Pq221QAB','5001D000003RiggQAC');
INSERT INTO "caseman__program_engagements" VALUES('a101D000000XUhWQAW','Applied','2019-09-03','','a121D000001pWJbQAM','0031D00000Pq21vQAB','');
CREATE TABLE caseman__program_goal_templates (
	sf_id VARCHAR(255) NOT NULL, 
	"IsRequired__c" VARCHAR(255), 
	goal_template__c VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCFQAY','true','a0y1D000000O07OQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCGQAY','false','a0y1D000000O07PQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCHQAY','false','a0y1D000000O07QQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCIQAY','true','a0y1D000000O07RQAS','a141D000000dCoeQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCJQAY','false','a0y1D000000O07SQAS','a141D000000dCoiQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCKQAY','false','a0y1D000000O07TQAS','a141D000000dCoeQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCLQAY','false','a0y1D000000O07UQAS','a141D000000dCoiQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCMQAY','false','a0y1D000000O07VQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCNQAY','false','a0y1D000000O07XQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCOQAY','false','a0y1D000000O07YQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCPQAY','false','a0y1D000000O07aQAC','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCQQAY','false','a0y1D000000O07dQAC','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCRQAY','true','a0y1D000000O07eQAC','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCSQAY','false','a0y1D000000O07fQAC','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCTQAY','false','a0y1D000000O07gQAC','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynC9QAI','true','a0y1D000000O07GQAS','a141D000000dCogQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCAQAY','false','a0y1D000000O07HQAS','a141D000000dCodQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCBQAY','true','a0y1D000000O07IQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCCQAY','true','a0y1D000000O07JQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCDQAY','false','a0y1D000000O07KQAS','a141D000000dCohQAE');
INSERT INTO "caseman__program_goal_templates" VALUES('a111D000000ynCEQAY','true','a0y1D000000O07LQAS','a141D000000dCobQAE');
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
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJSQA2','2019 Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','','Months','2019-01-01','2019-12-31','Active','a141D000000dCobQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJTQA2','Clothing Program Summer 2019','Serving families with children under the age of 18.','Part of the Housing Assistance program, the  Clothing program program provides assistance for families with children under the age of 18.','','Months','2019-06-01','2019-08-31','Active','a141D000000dCocQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJUQA2','ESL I Course 2019-2020','A language instruction educational program for students whose primary language is not English.','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','','Months','2019-09-04','2020-05-30','Active','a141D000000dCodQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJVQA2','Financial Literacy Program, Fall 2019','Teaches students the basics of money management.','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','','Months','2019-09-04','2019-12-13','Active','a141D000000dCoeQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJWQA2','School Lunch Program Summer 2019','Serving families with children under the age of 18.','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','','Months','2019-09-03','2020-05-30','Active','a141D000000dCofQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJXQA2','Remedial Reading, 2019','Provides students the support they need to achieve an age appropriate reading level.','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','','Months','2019-06-03','2020-05-15','Active','a141D000000dCogQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJYQA2','Jump Start, Spring 2019-2020','Assisting adults who have experienced a prolonged absence from the workforce.','Assisting adults under the poverty line, seeking to re-enter the workforce after an absence or seeking to progressively stabilize their experience in the workforce.','','Months','2019-04-15','2020-04-30','Active','a141D000000dCohQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJZQA2','Succeed, Spring 2019-2020','Assisting adults who have experienced poverty and an absence from the workforce.','This program assists adults under the poverty line re-entering the workforce after an absence of up to two years. The program''s goal is to achieve a 60% completion rate and to successfully re-integrate 50% of its clients completing the program to full time employment within 6 months of completing the program.','','Months','2019-04-15','2020-04-30','Active','a141D000000dCohQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJaQAM','Advancement, Spring 2019-2020','Assisting adults who have experienced a prolonged absence from the workforce develop an appropriate, stable and rewarding career path.','This program serves adults under the poverty line, seeking to re-enter the workforce after an absence or seeking to progressively stabilize their experience in the workforce.','','Months','2019-04-15','2020-04-30','Active','a141D000000dCohQAE');
INSERT INTO "caseman__program_offerings" VALUES('a121D000001pWJbQAM','After School Program, Ages 11-13, Summer 2019','An after school program for children enrolled in district 31.','This program''s goal is to provide a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','','Months','2019-09-03','2020-05-30','Active','a141D000000dCoiQAE');
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
INSERT INTO "caseman__programs" VALUES('a141D000000dCobQAE','Drug and Alcohol Recovery Management','Adult individuals, families and communities affected by addiction to alcohol and other drugs.','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','1.0','Years','2019-12-31','2019-01-01','Active','Annual program. Rolling enrollment.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCocQAE','Housing Assistance Program','Families with children under the age of 18','Providing assistance for families with children under the age of 18.','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','365.0','Days','','2019-05-01','Active','Annual program with rolling applications.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCodQAE','ESL Program','A practical conversational  English class for those whose primary language is not English.','A language instruction educational program for students whose primary language is not English.','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','1.0','Years','2020-05-30','2019-09-03','Active','Offered each academic year. Enrollment in August prior to the start of the academic year.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCoeQAE','Financial Literacy Program','Children aged 15-18 enrolled in school district 31','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','Teaches students the basics of money management.','4.0','Months','2019-12-13','2019-09-04','Active','Program offered fall of academic year. Applications accepted August prior to semester.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCofQAE','School Lunch Program','Children under 18  enrolled in school district 31','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','9.0','Months','2020-05-30','2019-09-03','Active','Program runs for the academic year. Enrollment is the first week of every month.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCogQAE','Remedial Reading Program','Children under 18  enrolled in school district 31','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','Provides students the support they need to achieve an age appropriate reading level.','15.0','Months','2020-05-15','2019-06-03','Active','Program runs for the academic year with application period July-August preceding the academic year.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCohQAE','Job Readiness Program','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2.0','Years','2021-04-15','2019-04-15','Active','2 year program with rolling enrollment.');
INSERT INTO "caseman__programs" VALUES('a141D000000dCoiQAE','After School Program, Ages 11-13','Children aged 11-13 enrolled in school district 31','An after school program for children enrolled in district 31.','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','9.0','Months','2020-05-31','2019-09-01','Active','Runs through school year with enrollment the first week of each month.');
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
	account_id VARCHAR(255), 
	emergency_contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "contacts" VALUES('0031D00000Pq21yQAB','Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','Client','false','','','','jeremyadams@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0LQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq21zQAB','','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','','','','','','','','','','','false','','','','','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0MQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq21uQAB','','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-09-01','One Market Street','San Francisco','CA','94105','USA','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','','','','','','false','','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','','0.0','','0.0','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0011D00000eOo0JQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq21vQAB','','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2007-04-03','3850 Wolf Pen Road','Oakland','CA','94612','','false','false','true','true','false','','','false','','','','','','','','','','0.0','Child','','Mother','0681D000000ZceVQAS','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2019-11-12','','','thiggins@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0KQAS','0031D00000Pq21wQAB');
INSERT INTO "contacts" VALUES('0031D00000Pq21wQAB','','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','','','','','','','','','','false','','','','lhiggins@example.com','Personal','Home','Home','false','','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0KQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq21xQAB','Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1970-01-04','1739 Lindale Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','','','','','','she/her/hers','Client;Donor;Volunteer','false','','','','angelaadams@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0LQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq226QAB','Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1970-01-01','3528 Rardin Drive','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','','','','','','she/her/hers','Client','false','','','','anneboyd@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0PQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq227QAB','','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1949-12-21','3160 Green Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Senior','','Friend','','','','','','they/them/theirs','Client','false','','','','normaburke@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0QQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq228QAB','','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1970-01-04','3547 Water Street','Oakland','CA','94606','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','Client','true','2019-11-12','','','bobbyhenderson@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0RQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq229QAB','','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1970-01-02','3611 Harrison Street','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','','','','','','they/them/theirs','Client','false','','','','anthonyhill@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0SQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq22AQAR','Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1969-12-26','4318 Lynch Street','Oakland','CA','94607','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','','','','','','she/her/hers','Client;Donor','false','','','','virginiaholmes@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0TQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq22BQAR','','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1970-01-12','2203 Alexander Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','','','','','','he/him/his','Donor','false','','','','josejenkins@example.com','Personal','Home','Home','false','','','','','0.0','','','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0UQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq22CQAR','','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','','','','','','','','','','false','','','','craigjohnso@example.com','Personal','Home','Home','false','','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0VQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq22DQAR','','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','','false','false','true','true','true','','','false','','','','','','','','','','0.0','','','','','','','','','','','false','','','','','Personal','Home','Home','false','','','','','0.0','','','','','2.0','0.0','','0.0','','','','0.0','','','Household__c.Name;Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0VQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq22EQAR','','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1970-01-09','3041 Park Street','Oakland','CA','94606','','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Husband','0681D000000ZceaQAC','','','','','she/her/hers','Client','false','','','','barbarajohnson@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0VQAS','0031D00000Pq22CQAR');
INSERT INTO "contacts" VALUES('0031D00000Pq22FQAR','','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-09-23','One Market Street','San Francisco','CA','94105','USA','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','','','','','','false','','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','','0.0','','0.0','','','','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0011D00000eOo0IQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq220QAB','','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1969-12-24','3810 Green Avenue','Oakland','CA','94612','United States','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Friend','0681D000000ZceLQAS','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','','','alanbaker@example.com','Personal','Home','Home','false','','','','','500.0','2019','500.0','2019-09-02','','0.0','500.0','2019-09-02','500.0','2019-09-02','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','0011D00000eOo0MQAS','0031D00000Pq21xQAB');
INSERT INTO "contacts" VALUES('0031D00000Pq221QAB','','Robin','Banks','robinbanks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1984-12-29','2546 Harrison Street','Oakland','CA','94612','','false','false','false','false','false','','','false','','','','','','','','','','0.0','Adult','','Partner','0681D000000ZcefQAC','','','','','she/her/hers','Client','true','2019-11-12','','','robinbanks@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','0.0','0011D00000eOo0NQAS','0031D00000Pq222QAB');
INSERT INTO "contacts" VALUES('0031D00000Pq222QAB','','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','','','','','','','','','','false','','','','darrylgraham@example.com','Personal','Home','Home','false','','','','','400.0','2019','400.0','2019-08-05','','1.0','400.0','2019-08-05','400.0','2019-08-05','','','400.0','','','','1.0','1.0','0.0','400.0','0.0','400.0','0.0','1.0','0.0','1.0','400.0','','','','','400.0','400.0','0011D00000eOo0NQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq223QAB','','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','false','false','false','false','false','','','false','','','','','','','','','','0.0','','','','','','','','','','','false','','','','lynnbarnes@example.com','Personal','Home','Home','false','','','','','500.0','2019','500.0','2019-07-01','','2.0','500.0','2019-07-01','500.0','2019-07-01','','','500.0','','','','1.0','1.0','0.0','500.0','0.0','500.0','0.0','1.0','0.0','1.0','500.0','','','','','500.0','500.0','0011D00000eOo0OQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq224QAB','','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','false','false','false','false','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','','','','','','','','','','','false','','','','davidbarnes@example.com','Personal','Home','Home','false','','','','','0.0','','','','','1.0','0.0','','0.0','','','','0.0','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','0011D00000eOo0OQAS','');
INSERT INTO "contacts" VALUES('0031D00000Pq225QAB','','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2002-10-29','2340 Thompson Drive','Oakland','CA','94621','','false','false','true','true','false','500.0','2019-07-01','false','500.0','2019-07-01','500.0','2019-07-01','1.0','1.0','0.0','1.0','0.0','500.0','Youth','88841515','Mother','0681D000000ZceQQAS','','','','','he/him/his','Client','false','','','','jasonbarnes@example.com','Personal','Home','Home','false','','','','','0.0','','','','','0.0','0.0','','0.0','','','','0.0','','','Household__c.Formal_Greeting__c;Household__c.Informal_Greeting__c','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','500.0','500.0','0.0','0.0','0.0','0011D00000eOo0OQAS','0031D00000Pq223QAB');
INSERT INTO "contacts" VALUES('0031D00000Pq1yNQAR','','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1985-10-19','One Market Street','San Francisco','CA','94105','USA','false','false','false','false','false','0.0','','false','0.0','','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','','','','','','','','','','','false','','','sample.contact@otheremail.com','sample.contact@email.com','Personal','Work','Home','false','','sample.contact@workemail.com','(202) 555-9654','','0.0','','0.0','','','','0.0','','0.0','','','','','','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0011D00000eOnpFQAS','');
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
INSERT INTO "household_accounts" VALUES('0011D00000eOo0IQAS','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0JQAS','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0KQAS','Higgins Household','','','','','','','555-248-3956','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0LQAS','Adams Household','','','','','','','555-648-7204','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0MQAS','Baker Household','','','','','','','555-524-0749','','','','','','Household','','Household Account','true','','2019-09-02','2019-09-02','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-09-02','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0NQAS','Banks and Graham Household','','','','','','','555-648-7204','','','','','','Household','','Household Account','true','','2019-08-05','2019-08-05','400.0','400.0','400.0','400.0','2019','400.0','400.0','400.0','400.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','400.0','','','','2019-08-05','400.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0OQAS','Barnes Household','','','','','','','555-893-4763','','','','','','Household','','Household Account','true','','2019-07-01','2019-07-01','500.0','500.0','500.0','500.0','2019','500.0','500.0','500.0','500.0','0.0','0.0','1.0','1.0','1.0','0.0','0.0','500.0','','','','2019-07-01','500.0','','1.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0PQAS','Boyd Household','','','','','','','555-380-8532','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0QQAS','Burke Household','','','','','','','555-830-5295','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0RQAS','Henderson Household','','','','','','','555-830-5295','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0SQAS','Hill Household','','','','','','','555-395-9737','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0TQAS','Holmes Household','','','','','','','555-930-8759','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0UQAS','Jenkins Household','','','','','','','555-469-9873','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOo0VQAS','Johnson Household','','','','','','','555-248-3956','','','','','','Household','','Household Account','true','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
INSERT INTO "household_accounts" VALUES('0011D00000eOnpFQAS','Contact Household','','','','','','','','(818) 555-4444','','','','','Household','','Household Account','true','','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','HH_Account');
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
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSkUAK','false','','Current','Mother','','0031D00000Pq21vQAB','0031D00000Pq21wQAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSlUAK','true','','Current','Son','','0031D00000Pq21wQAB','0031D00000Pq21vQAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSmUAK','true','Arthur is Arlene''s recently deceased father.','Current','Child','','0031D00000Pq21zQAB','0031D00000Pq220QAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSnUAK','false','Arthur is Arlene''s recently deceased father.','Current','Father','Tribute','0031D00000Pq220QAB','0031D00000Pq21zQAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSoUAK','true','','Current','Son','','0031D00000Pq223QAB','0031D00000Pq225QAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSpUAK','true','','Current','Son','','0031D00000Pq224QAB','0031D00000Pq225QAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSqUAK','false','','Current','Mother','','0031D00000Pq225QAB','0031D00000Pq223QAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSrUAK','false','','Current','Father','','0031D00000Pq225QAB','0031D00000Pq224QAB');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSsUAK','true','','Current','Spouse','','0031D00000Pq22CQAR','0031D00000Pq22EQAR');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlStUAK','true','','Current','Parent','','0031D00000Pq22DQAR','0031D00000Pq22EQAR');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSuUAK','false','','Current','Husband','','0031D00000Pq22EQAR','0031D00000Pq22CQAR');
INSERT INTO "npe4__relationships" VALUES('a0G1D000001PlSvUAK','false','','Current','Daughter','','0031D00000Pq22EQAR','0031D00000Pq22DQAR');
CREATE TABLE "npsp__OpportunityContactRole" (
	sf_id VARCHAR(255) NOT NULL, 
	"Role" VARCHAR(255), 
	"IsPrimary" VARCHAR(255), 
	contact_id VARCHAR(255), 
	opportunity_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8nUAG','Donor','true','0031D00000Pq220QAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8oUAG','Donor','true','0031D00000Pq222QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8pUAG','Donor','true','0031D00000Pq223QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8qUAG','Tribute','false','0031D00000Pq21zQAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8rUAG','Household Member','false','0031D00000Pq221QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8sUAG','Household Member','false','0031D00000Pq224QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8tUAG','Household Member','false','0031D00000Pq225QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8xUAG','Tribute','false','0031D00000Pq21zQAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8yUAG','Tribute','false','0031D00000Pq21zQAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV8zUAG','Tribute','false','0031D00000Pq21zQAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV90UAG','Donor','true','0031D00000Pq220QAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV91UAG','Donor','true','0031D00000Pq220QAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV92UAG','Donor','true','0031D00000Pq220QAB','0061D000007DmbnQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV93UAG','Household Member','false','0031D00000Pq221QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV94UAG','Household Member','false','0031D00000Pq221QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV95UAG','Household Member','false','0031D00000Pq221QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV96UAG','Donor','true','0031D00000Pq222QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV97UAG','Donor','true','0031D00000Pq222QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV98UAG','Donor','true','0031D00000Pq222QAB','0061D000007DmboQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV99UAG','Donor','true','0031D00000Pq223QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9AUAW','Donor','true','0031D00000Pq223QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9BUAW','Donor','true','0031D00000Pq223QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9CUAW','Household Member','false','0031D00000Pq224QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9DUAW','Household Member','false','0031D00000Pq224QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9EUAW','Household Member','false','0031D00000Pq224QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9FUAW','Household Member','false','0031D00000Pq225QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9GUAW','Household Member','false','0031D00000Pq225QAB','0061D000007DmbpQAC');
INSERT INTO "npsp__OpportunityContactRole" VALUES('00K1D000003OV9HUAW','Household Member','false','0031D00000Pq225QAB','0061D000007DmbpQAC');
CREATE TABLE npsp__donations (
	sf_id VARCHAR(255) NOT NULL, 
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
	"Contact_Id_for_Role__c" VARCHAR(255), 
	"Membership_Origin__c" VARCHAR(255), 
	"Member_Level__c" VARCHAR(255), 
	"Membership_Start_Date__c" VARCHAR(255), 
	"Membership_End_Date__c" VARCHAR(255), 
	"Do_Not_Automatically_Create_Payment__c" VARCHAR(255), 
	"systemHouseholdContactRoleProcessor__c" VARCHAR(255), 
	account_id VARCHAR(255), 
	primary_contact__c VARCHAR(255), 
	honoree_contact__c VARCHAR(255), 
	notification_recipient_contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "npsp__donations" VALUES('0061D000007DmbnQAC','Arthur Baker Donation in Memoriam','','','Closed Won','','Closed','100.0','','','2019-09-02','500.0','false','','','Arlene Baker','Arthur Baker','','','','','','Memorial','Phone','','','To Be Acknowledged','','','','','','','','2019-09-06','','','','','false','false','false','0035400000Hsa3XAAR','','','','','false','All Opportunities','0011D00000eOo0MQAS','0031D00000Pq220QAB','0031D00000Pq21zQAB','0031D00000Pq220QAB');
INSERT INTO "npsp__donations" VALUES('0061D000007DmboQAC','Darryl Graham 2019 In-Kind Donation','','','In-Kind Received','','Omitted','100.0','','','2019-08-05','400.0','false','','','','','','','','','<p>PSA Production for fundraising drive</p>','','','','Services','Acknowledged','','','','','','','','2019-08-09','','','800.0','','false','true','false','0035400000HtExuAAF','','','','','false','All Opportunities','0011D00000eOo0NQAS','0031D00000Pq222QAB','','');
INSERT INTO "npsp__donations" VALUES('0061D000007DmbpQAC','Lynn Barnes 1019 Donation','','','Closed Won','','Closed','100.0','','','2019-07-01','500.0','false','','','','','','','','','','','','','','Acknowledged','','','','','','','','2019-07-05','','','','','false','false','false','0035400000HtEyZAAV','','','','','false','All Opportunities','0011D00000eOo0OQAS','0031D00000Pq223QAB','','');
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
INSERT INTO "organization_accounts" VALUES('0011D00000eOo0WQAS','Sample Organization','','','','','','','','','','','','','','','','false','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0011D00000eOo0XQAS','Sample Organization','','','','','','','','','','','','','','','','false','','','','0.0','0.0','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0011D00000eOo0YQAS','Marble Foundation','','','','','','','555-389-74399','','','','','','Foundation','','','false','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0011D00000eOo0ZQAS','Future Potential Fund','','','','','','','555-278-7643','','','','','','Foundation','','','false','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0011D00000eOo0aQAC','City Department of Human Services','','','','','','','','','','','','','Government','','','false','','','','0.0','0.0','0.0','0.0','','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
INSERT INTO "organization_accounts" VALUES('0011D00000eOnpGQAS','Sample Organization','','','','','','','','','','','','','','','','false','','','','0.0','','0.0','0.0','','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','0.0','','','','','0.0','','0.0','Organization');
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
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvcQAA','Housing Assistance Program: Tom Higgins','2019-05-25','','Client','Enrolled','2019-06-01','','0031D00000Pq21vQAB','a171D000000fO5aQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvdQAA','School Lunch Program: Tom Higgins','2019-06-08','','Client','Enrolled','2019-09-03','','0031D00000Pq21vQAB','a171D000000fO5dQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddveQAA','Remedial Reading Program: Tom Higgins','2019-04-12','','Client','In Progress','2019-06-03','','0031D00000Pq21vQAB','a171D000000fO5eQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvfQAA','After School Program, Ages 11-13: Tom Higgins','2019-08-29','','Client','Applied','2019-09-03','','0031D00000Pq21vQAB','a171D000000fO5gQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvgQAA','Job Readiness Program: Arlene Baker','2019-06-19','','Client','Enrolled','2019-09-04','','0031D00000Pq220QAB','a171D000000fO5fQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvhQAA','Job Readiness Program: Arlene Baker','2019-06-02','','Client','Applied','2019-08-14','','0031D00000Pq220QAB','a171D000000fO5fQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddviQAA','Drug and Alcohol Recovery Management: Robin Banks','2019-04-24','','Client','In Progress','2019-06-03','','0031D00000Pq221QAB','a171D000000fO5ZQAU');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvjQAA','Job Readiness Program: Robin Banks','2019-09-02','','Client','In Progress','2019-09-04','','0031D00000Pq221QAB','a171D000000fO5fQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvkQAA','Job Readiness Program: Robin Banks','2019-03-19','','Client','Applied','2019-06-03','','0031D00000Pq221QAB','a171D000000fO5fQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvlQAA','Financial Literacy Program: Jason Barnes','2019-08-23','','Client','In Progress','2019-09-04','','0031D00000Pq225QAB','a171D000000fO5cQAE');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES('a161D000000ddvmQAA','ESL Program: Barbara Johnson','2019-07-03','','Client','Enrolled','2019-09-04','','0031D00000Pq22EQAR','a171D000000fO5bQAE');
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
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5ZQAU','Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2019-12-31','','2019-01-01','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5aQAE','Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2019-05-01','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5bQAE','ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2020-05-30','','2019-09-03','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5cQAE','Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','2019-12-13','Education','2019-09-04','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5dQAE','School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2020-05-30','Food and Nutrition','2019-09-03','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5eQAE','Remedial Reading Program','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','2020-05-15','Education','2019-06-03','Active','Provides students the support they need to achieve an age appropriate reading level.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5fQAE','Job Readiness Program','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','Employment','2019-04-15','Active','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce');
INSERT INTO "pmdm__Program__c" VALUES('a171D000000fO5gQAE','After School Program, Ages 11-13','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','2020-05-31','Education','2019-09-01','Active','An after school program for children enrolled in district 31.','Children aged 11-13 enrolled in school district 31');
CREATE TABLE "pmdm__ServiceDelivery__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"DeliveryDate__c" VARCHAR(255), 
	"Quantity__c" VARCHAR(255), 
	service__c VARCHAR(255), 
	account__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "pmdm__ServiceDelivery__c" VALUES('a181D000000RbNUQA0','Tom Higgins - Subsidized Lunch','2019-11-05','1.50','a191D0000015PZ0QAM','','0031D00000Pq21vQAB');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES('a181D000000RbNZQA0','Tom Higgins - Subsidized Lunch','2019-11-06','1.00','a191D0000015PZ0QAM','','0031D00000Pq21vQAB');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES('a181D000000RbNPQA0','Tom Higgins - Subsidized Lunch','2019-11-04','1.00','a191D0000015PZ0QAM','','0031D00000Pq21vQAB');
CREATE TABLE "pmdm__Service__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"UnitOfService__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "pmdm__Service__c" VALUES('a191D0000015PYvQAM','Resume Review','Hour','a171D000000fO5fQAE');
INSERT INTO "pmdm__Service__c" VALUES('a191D0000015PZ0QAM','Subsidized Lunch','Lunch','a171D000000fO5dQAE');
INSERT INTO "pmdm__Service__c" VALUES('a191D0000015PZ5QAM','Grade 1-8 Reading Tutoring','Hour','a171D000000fO5eQAE');
COMMIT;
