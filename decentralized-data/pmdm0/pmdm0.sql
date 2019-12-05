BEGIN TRANSACTION;

CREATE TABLE "pmdm__ProgramCohort__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Summary__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__ProgramCohort__c" VALUES(1,'Eastgate','Eastgate neighborhood service area','','2019-02-01','Active','Eastgate neighborhood service area','1');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(2,'Genellen','Genellen neighborhood service area','','2019-02-01','Active','Genellen neighborhood service area','1');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(3,'Riverside','Riverside neighborhood service area','','2019-02-01','Active','Riverside neighborhood service area','1');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(4,'Fall 2019 STEM','','2019-12-20','2019-09-09','Active','Semester participation in STEM programFall 2019 semester STEM participation','10');
INSERT INTO "pmdm__ProgramCohort__c" VALUES(5,'Highpoint','Highpoint neighborhood service area','','2019-02-01','Active','Highpoint neighborhood service area','1');

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
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(1,'Yesenia  Ritter - Prenatal and Early Childhood Health Program','2019-08-05','false','','Client','In Progress','2019-11-22','','100','1','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(2,'Abraham  Sims - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','','101','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(3,'Karissa  Aguilar - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-20','','118','1','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(4,'Maya  Johnson - After School Program, Ages 11-13','','false','','Client','Enrolled','2019-11-20','','65','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(5,'Barbara  Johnson - ESL Program','2019-07-03','false','','Client','Enrolled','2019-09-04','','66','4','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(6,'Barbara  Johnson - School Lunch Program','2019-11-20','false','','Client','Applied','','','66','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(7,'Tom  Higgins - Housing Assistance Program','2019-05-25','false','','Client','Enrolled','2019-06-01','','110','3','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(8,'Tom  Higgins - School Lunch Program','2019-06-08','false','','Client','Enrolled','2019-09-03','','110','6','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(9,'Tom  Higgins - Remedial Reading Program','2019-04-12','false','','Client','In Progress','2019-06-03','','110','7','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(10,'Tom  Higgins - After School Program, Ages 11-13','2019-08-29','false','','Client','Applied','2019-09-03','','110','9','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(11,'Yuliana  Bird - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','139','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(12,'Ayanna  Gonzalez - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','157','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(13,'Naima  Crawford - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','173','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(14,'Arlene  Baker - Job Readiness Program','2019-06-19','false','','Client','Enrolled','2019-09-04','','135','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(15,'Olive  Leach - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-08','','27','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(16,'Marisol  Gonzales - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-18','','43','1','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(17,'Nancy  Arroyo - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-10-15','','46','1','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(18,'Dayana  Atkins - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-11-22','','58','1','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(19,'Audrina  Rojas - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-11-06','','70','1','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(20,'Caylee  Pollard - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-11-20','','73','1','2');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(21,'Simone  Keller - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-12','','76','1','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(22,'Violet  Ellis - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-03','','77','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(23,'Mira  Mcconnell - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-04-24','','79','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(24,'Emelia  Fletcher - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-04-08','','85','1','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(25,'Juliette  Cisneros - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-11-21','','90','1','5');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(26,'Amelie  Bond - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-07-30','','97','1','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(27,'Cora  Hall - Prenatal and Early Childhood Health Program','','false','','Client','Enrolled','2019-08-12','','103','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(28,'Delilah  Ibarra - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-05-08','','106','1','1');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(29,'Robin  Banks - Drug and Alcohol Recovery Management','2019-04-24','false','','Client','In Progress','2019-06-03','','146','2','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(30,'Robin  Banks - Job Readiness Program','2019-09-02','false','','Client','In Progress','2019-09-04','','146','8','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(31,'Jessica  Woods - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','35','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(32,'Taniyah  Rios - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','50','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(33,'Casey  Kline - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','61','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(34,'Diego  Case - Mobile Middle School STEM Program','','false','2019-12-20','Client','In Progress','2019-09-09','','63','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(35,'Jason  Barnes - Financial Literacy Program','2019-08-23','false','','Client','In Progress','2019-09-04','','160','5','');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(36,'Alana  Owen - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','','91','10','4');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(37,'Lauryn  Odom - Prenatal and Early Childhood Health Program','','false','','Client','In Progress','2019-08-21','','109','1','3');
INSERT INTO "pmdm__ProgramEngagement__c" VALUES(38,'Alia  Duarte - Mobile Middle School STEM Program','','false','','Client','In Progress','2019-09-09','79','164','10','4');

CREATE TABLE "pmdm__Program__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"ProgramIssueArea__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Summary__c" VARCHAR(255), 
	"TargetPopulation__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Program__c" VALUES(1,'Prenatal and Early Childhood Health Program','','','Food and Nutrition','','Active','','');
INSERT INTO "pmdm__Program__c" VALUES(2,'Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2019-12-31','','2019-01-01','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "pmdm__Program__c" VALUES(3,'Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2019-05-01','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "pmdm__Program__c" VALUES(4,'ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2020-05-30','','2019-09-03','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "pmdm__Program__c" VALUES(5,'Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','2019-12-13','Education','2019-09-04','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(6,'School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2020-05-30','Food and Nutrition','2019-09-03','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(7,'Remedial Reading Program','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','2020-05-15','Education','2019-06-03','Active','Provides students the support they need to achieve an age appropriate reading level.','Children under 18  enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(8,'Job Readiness Program','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2021-04-15','Employment','2019-04-15','Active','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce');
INSERT INTO "pmdm__Program__c" VALUES(9,'After School Program, Ages 11-13','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','2020-05-31','Education','2019-09-01','Active','An after school program for children enrolled in district 31.','Children aged 11-13 enrolled in school district 31');
INSERT INTO "pmdm__Program__c" VALUES(10,'Mobile Middle School STEM Program','The program focuses on bringing hands-on mid-level STEM courses into the classroom at least twice a week, and promotes awareness of the STEM fields and occupations. It provides standards-based structured inquiry-based and real-world problem-based learning, connecting all four of the STEM subjects, science, technology, engineering, and math. The goal is to pique students'' interest in them wanting to pursue the courses, not because they have to.','2020-05-15','Education','2019-09-09','Active','The program brings hands-on mid-level STEM courses into the classroom at least twice a week','Middle School students aged 11-14');
INSERT INTO "pmdm__Program__c" VALUES(11,'Urban Horticulture Food Forest','A green space program to provide healthy and fresh food to our community, teach the connection between the local environment and food production and reclaim sovereignty over food production using environmentally dynamic systems.','','Food and Nutrition','2018-04-03','Active','A green space program to provide healthy and fresh food to our community, teach the connection between the local environment and food production.','Community gardeners, students, and community members including food banks.');
INSERT INTO "pmdm__Program__c" VALUES(12,'No More Food Deserts Advocacy','Advocacy program calling attention to and seeking remediation for the area''s lack of affordable grocery store options. This is an awareness-building campaign intended to garner support and funding for affordable alternatives from grantmakers and to be supported by the city and county councils.','','Advocacy','2019-08-01','Active','Calling attention to and seeking remediation for the area''s lack of affordable grocery store options.','Area residents, city and county government and grantmakers funding in the region.');

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
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(1,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(2,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(3,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(4,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(5,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(6,'Alana Owen - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(7,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(8,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(9,'Alana Owen - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(10,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(11,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(12,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(13,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(14,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(15,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(16,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(17,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(18,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(19,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(20,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(21,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(22,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(23,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(24,'Abraham Sims - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(25,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(26,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(27,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(28,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(29,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(30,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(31,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(32,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(33,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(34,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(35,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(36,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(37,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(38,'Yuliana Bird - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(39,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(40,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(41,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(42,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(43,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(44,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(45,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(46,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(47,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(48,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(49,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(50,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(51,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(52,'Ayanna Gonzalez - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(53,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(54,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(55,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(56,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(57,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(58,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(59,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(60,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(61,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(62,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(63,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(64,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(65,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(66,'Alia Duarte - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(67,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(68,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(69,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(70,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(71,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(72,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(73,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(74,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(75,'Marisol Gonzales - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-14','1.0','2','','43','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(76,'Nancy Arroyo - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-16','1.0','2','','46','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(77,'Dayana Atkins - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','1.0','2','','58','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(78,'Caylee Pollard - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-22','1.0','2','','73','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(79,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-08-14','1.0','2','','77','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(80,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-02','1.0','2','','77','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(81,'Violet Ellis - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-13','1.0','2','','77','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(82,'Emelia Fletcher - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-25','','2','','85','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(83,'Juliette Cisneros - Prenatal Care Sessions (appointments and walk-ins)','false','2019-11-20','1.0','2','','90','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(84,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','false','2019-10-30','1.0','2','','27','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(85,'Olive Leach - Prenatal Care Sessions (appointments and walk-ins)','false','2019-09-18','1.0','2','','27','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(86,'Alana Owen - Girls STEM outreach, 10/3/19','false','2019-11-25','','5','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(87,'Violet Ellis - Administer Early Childcare Vaccines','false','2019-11-13','3.0','3','','77','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(88,'Mira Mcconnell - Administer Early Childcare Vaccines','false','2019-08-19','3.0','3','','79','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(89,'Emelia Fletcher - Administer Early Childcare Vaccines','false','2019-11-06','3.0','3','','85','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(90,'Karissa Aguilar - Administer Early Childcare Vaccines','false','2019-11-25','','3','','118','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(91,'Emelia Fletcher - Refer to Caregivers Support Group','false','2019-11-06','1.0','4','','85','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(92,'Delilah Ibarra - Refer to Caregivers Support Group','false','2019-11-13','1.0','4','','106','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(93,'Karissa Aguilar - Refer to Caregivers Support Group','false','2019-11-25','','4','','118','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(94,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(95,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(96,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(97,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(98,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(99,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(100,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(101,'Naima Crawford - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(102,'Jessica Woods - STEM Field Trips','false','2019-11-25','1.0','8','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(103,'Taniyah Rios - STEM Field Trips','false','2019-11-25','1.0','8','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(104,'Casey Kline - STEM Field Trips','false','2019-11-25','1.0','8','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(105,'Diego Case - STEM Field Trips','false','2019-11-25','1.0','8','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(106,'Alana Owen - STEM Field Trips','false','2019-11-25','1.0','8','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(107,'Alana Owen - STEM Field Trips','false','2019-11-25','','8','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(108,'Abraham Sims - STEM Field Trips','false','2019-11-25','1.0','8','','101','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(109,'Yuliana Bird - STEM Field Trips','false','2019-11-25','1.0','8','','139','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(110,'Ayanna Gonzalez - STEM Field Trips','false','2019-11-25','1.0','8','','157','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(111,'Alia Duarte - STEM Field Trips','false','2019-11-25','1.0','8','','164','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(112,'Naima Crawford - STEM Field Trips','false','2019-11-25','1.0','8','','173','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(113,'Marisol Gonzales - Provide Prenatal Vitamins','false','2019-10-14','','1','','43','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(114,'Nancy Arroyo - Provide Prenatal Vitamins','false','2019-10-16','30.0','1','','46','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(115,'Dayana Atkins - Provide Prenatal Vitamins','false','2019-11-25','30.0','1','','58','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(116,'Juliette Cisneros - Provide Prenatal Vitamins','false','2019-11-20','30.0','1','','90','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(117,'Olive Leach - Provide Prenatal Vitamins','false','2019-09-18','30.0','1','','27','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(118,'Olive Leach - Provide Prenatal Vitamins','false','2019-10-30','30.0','1','','27','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(119,'Arlene Baker - Job Interviews completed','false','2019-10-11','1.0','15','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(120,'Arlene Baker - Job Interviews completed','false','2019-10-15','2.0','15','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(121,'Robin Banks - Financial Advisor Sessions','false','2019-10-07','0.5','16','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(122,'Robin Banks - Financial Advisor Sessions','false','2019-10-07','0.5','16','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(123,'Robin Banks - Financial Advisor Sessions','false','2019-11-04','0.5','16','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(124,'Robin Banks - Financial Advisor Sessions','false','2019-09-09','0.5','16','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(125,'Arlene Baker - Financial Advisor Sessions','false','2019-10-07','0.5','16','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(126,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(127,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(128,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(129,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(130,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(131,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(132,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(133,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(134,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(135,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(136,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(137,'Jessica Woods - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','35','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(138,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(139,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(140,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(141,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(142,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(143,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(144,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(145,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(146,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(147,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(148,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(149,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(150,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(151,'Taniyah Rios - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','50','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(152,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(153,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(154,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(155,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(156,'Arlene Baker - Financial Advisor Sessions','false','2019-11-05','0.5','16','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(157,'Arlene Baker - Financial Advisor Sessions','false','2020-01-06','0.5','16','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(158,'Arlene Baker - Financial Advisor Sessions','false','2019-09-05','0.5','16','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(159,'Arlene Baker - Financial Advisor Sessions','false','2019-12-04','0.5','16','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(160,'Robin Banks - Job Readiness Coaching','false','2019-12-20','0.75','17','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(161,'Robin Banks - Job Readiness Coaching','false','2019-10-28','0.75','17','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(162,'Robin Banks - Job Readiness Coaching','false','2019-09-27','0.75','17','','146','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(163,'Arlene Baker - Job Readiness Coaching','false','2019-11-27','0.5','17','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(164,'Arlene Baker - Job Readiness Coaching','false','2019-11-29','0.75','17','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(165,'Arlene Baker - Job Readiness Coaching','false','2019-09-25','0.75','17','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(166,'Arlene Baker - Job Readiness Coaching','false','2019-10-30','0.75','17','','135','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(167,'Tom Higgins - Subsidized Lunch','false','2019-11-05','1.0','13','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(168,'Tom Higgins - Subsidized Lunch','false','2019-11-06','1.0','13','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(169,'Tom Higgins - Subsidized Lunch','false','2019-11-04','1.0','13','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(170,'Barbara Johnson - Grade 1-8 Reading Tutoring','false','2019-11-20','1.25','14','','66','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(171,'Tom Higgins - Food received from urban food forest','false','2019-10-31','0.25','9','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(172,'Tom Higgins - Food received from urban food forest','false','2019-12-31','0.25','9','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(173,'Tom Higgins - Food received from urban food forest','false','2019-09-30','0.25','9','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(174,'Tom Higgins - Food received from urban food forest','false','2019-11-29','0.25','9','','110','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(175,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(176,'Casey Kline - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(177,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(178,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(179,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(180,'Casey Kline - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(181,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(182,'Casey Kline - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(183,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(184,'Casey Kline - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','61','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(185,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-11','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(186,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-16','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(187,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(188,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-30','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(189,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-18','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(190,'Diego Case - Middle School STEM Classroom Hours','false','2019-09-25','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(191,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-09','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(192,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(193,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-18','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(194,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-06','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(195,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-13','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(196,'Diego Case - Middle School STEM Classroom Hours','false','2019-11-20','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(197,'Diego Case - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(198,'Diego Case - Middle School STEM Classroom Hours','false','2019-10-02','2.0','7','','63','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(199,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-04','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(200,'Alana Owen - Middle School STEM Classroom Hours','false','2019-12-11','2.0','7','','91','');
INSERT INTO "pmdm__ServiceDelivery__c" VALUES(201,'Alana Owen - Middle School STEM Classroom Hours','false','2019-10-23','2.0','7','','91','');

CREATE TABLE "pmdm__Service__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"UnitOfService__c" VARCHAR(255), 
	program__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "pmdm__Service__c" VALUES(1,'Provide Prenatal Vitamins','','Active','Dosages','1');
INSERT INTO "pmdm__Service__c" VALUES(2,'Prenatal Care Sessions (appointments and walk-ins)','','Active','Sessions','1');
INSERT INTO "pmdm__Service__c" VALUES(3,'Administer Early Childcare Vaccines','','Active','Vaccines','1');
INSERT INTO "pmdm__Service__c" VALUES(4,'Refer to Caregivers Support Group','','Active','Referrals','1');
INSERT INTO "pmdm__Service__c" VALUES(5,'Girls STEM outreach, 10/3/19','','Active','Attendees','10');
INSERT INTO "pmdm__Service__c" VALUES(6,'Robotics Competition 9/25/19','','Active','Participants','10');
INSERT INTO "pmdm__Service__c" VALUES(7,'Middle School STEM Classroom Hours','','Active','Hours','10');
INSERT INTO "pmdm__Service__c" VALUES(8,'STEM Field Trips','','Active','Field Trips','10');
INSERT INTO "pmdm__Service__c" VALUES(9,'Food received from urban food forest','','Active','Pounds','11');
INSERT INTO "pmdm__Service__c" VALUES(10,'Town Hall Meeting, 8/19/19','','Active','Attendees','12');
INSERT INTO "pmdm__Service__c" VALUES(11,'City Council Lobby Day 2019','','Active','Participants','12');
INSERT INTO "pmdm__Service__c" VALUES(12,'Letter writing campaign to Council Members','','Active','Letters','12');
INSERT INTO "pmdm__Service__c" VALUES(13,'Subsidized Lunch','','Active','Lunches','6');
INSERT INTO "pmdm__Service__c" VALUES(14,'Grade 1-8 Reading Tutoring','','Active','Hours','7');
INSERT INTO "pmdm__Service__c" VALUES(15,'Job Interviews completed','','Active','Completed Interviews','8');
INSERT INTO "pmdm__Service__c" VALUES(16,'Financial Advisor Sessions','','Active','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(17,'Job Readiness Coaching','','Active','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(18,'Resume Review','','Active','Hours','8');
INSERT INTO "pmdm__Service__c" VALUES(19,'Job Placements','','Active','Job Placements','8');

COMMIT;
