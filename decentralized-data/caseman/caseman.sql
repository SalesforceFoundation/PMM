BEGIN TRANSACTION;
CREATE TABLE "Account__Branch" (
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
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account__Branch" VALUES(1,'127th Street Community Center','','','','','','','555-398-2090','','','','','','','1500.0','Branch');
CREATE TABLE "Account__HH_Account" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account__HH_Account" VALUES(1,'Osborn Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(2,'Pearson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(3,'Branch Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(4,'Bates Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(5,'Rodgers Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(6,'Mcclure Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(7,'Huynh Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(8,'Gonzalez Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(9,'Singleton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(10,'Woodard Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(11,'Gibson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(12,'Duarte Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(13,'Huerta Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(14,'Hernandez Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(15,'Villegas Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(16,'Velasquez Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(17,'Hardin Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(18,'Olson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(19,'Orr Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(20,'Salinas Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(21,'Bullock Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(22,'Solomon Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(23,'Higgins Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(24,'Adams Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(25,'Baker Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(26,'Banks and Graham Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(27,'Barnes Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(28,'Boyd Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(29,'Burke Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(30,'Henderson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(31,'Hill Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(32,'Holmes Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(33,'Jenkins Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(34,'Johnson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(35,'Burgess Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(36,'Bass Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(37,'Bishop Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(38,'Cisneros Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(39,'Owen Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(40,'Kerr Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(41,'Crawford Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(42,'Eaton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(43,'Rasmussen Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(44,'Campos Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(45,'Bond Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(46,'Myers Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(47,'Stanton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(48,'Woods Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(49,'Spence Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(50,'Clayton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(51,'Richard Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(52,'Waller Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(53,'Hampton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(54,'Neal Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(55,'Gentry Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(56,'Barr Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(57,'Pham Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(58,'Cooley Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(59,'Zimmerman Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(60,'Wheeler Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(61,'Beltran Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(62,'Bird Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(63,'Duffy Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(64,'Woods Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(65,'Richards Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(66,'Valdez Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(67,'Mills Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(68,'Greene Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(69,'Escobar Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(70,'Gross Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(71,'Guerrero Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(72,'Ritter Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(73,'Sims Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(74,'Huffman Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(75,'Hall Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(76,'Barker Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(77,'Glass Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(78,'Ibarra Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(79,'Morgan Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(80,'Bowers Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(81,'Odom Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(82,'Flores Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(83,'Wall Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(84,'Waller Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(85,'Bray Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(86,'Conner Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(87,'Harper Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(88,'Aguilar Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(89,'Cummings Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(90,'Cardenas Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(91,'Webster Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(92,'Costa Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(93,'Humphrey Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(94,'Cain Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(95,'Dunlap Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(96,'Blackwell Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(97,'Irwin Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(98,'Hughes Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(99,'Wells Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(100,'Davila Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(101,'Barnett Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(102,'Norman Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(103,'Snow Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(104,'Wood Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(105,'Norton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(106,'Morgan Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(107,'Decker Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(108,'Lambert Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(109,'Barry Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(110,'Oneill Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(111,'Cooley Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(112,'Leach Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(113,'Pacheco Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(114,'Rivers Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(115,'Griffith Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(116,'Glenn Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(117,'Francis Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(118,'Rhodes Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(119,'White Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(120,'Lang Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(121,'Ramirez Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(122,'Serrano Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(123,'Galloway Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(124,'Clark Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(125,'Gonzales Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(126,'Cobb Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(127,'Shah Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(128,'Arroyo Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(129,'Booker Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(130,'Mercer Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(131,'Horton Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(132,'Rios Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(133,'Craig Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(134,'Oliver Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(135,'Montgomery Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(136,'Cooke Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(137,'Morrison Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(138,'Bright Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(139,'Atkins Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(140,'Woods Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(141,'Stanley Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(142,'Fischer Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(143,'Kline Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(144,'Joyce Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(145,'Case Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(146,'Graves Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(147,'Wu Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(148,'Grant Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(149,'Rojas Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(150,'Chase Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(151,'Holder Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(152,'Pollard Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(153,'Quinn Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(154,'Wilkinson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(155,'Keller Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(156,'Ellis Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(157,'Neal Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(158,'Mcconnell Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(159,'Arellano Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(160,'Glover Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(161,'Lutz Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(162,'Graves Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(163,'Carson Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(164,'Fletcher Household','','HH_Account');
INSERT INTO "Account__HH_Account" VALUES(165,'Hernandez Household','','HH_Account');
CREATE TABLE "Account__Organization" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__MaximumClientsServed__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account__Organization" VALUES(1,'Marble Foundation','','Organization');
INSERT INTO "Account__Organization" VALUES(2,'Future Potential Fund','','Organization');
INSERT INTO "Account__Organization" VALUES(3,'City Department of Human Services','','Organization');
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
	contact_id VARCHAR(255), 
	branch__c VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Case__ClientCase" VALUES(1,'Arlene Baker Workforce Re-entry, Summer  2019','Medium','Active','Email','Arlene has applied to join the Workforce Re-entry program after a two-year absence from the workforce while caring for her elderly father who was diagnosed with dementia.','','','','','','','','','87','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(2,'Robin Banks Application to Workforce Re-entry Program','Medium','Active','Phone','Robin is working to rejoin the workforce after 3 months in a rehab facility for alcohol addiction','','','','','','','','','88','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(3,'Jason Barnes Workplace Readiness Program Offering','Medium','Active','Phone','','','','','','','','','','92','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(4,'Barbara Johnson ESL I','Medium','Active','Email','Barbara is enrolled in ESL I to learn English to enhance her employment potential.','','','','','','','','','102','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(5,'Tom Higgins School Lunch program Summer 2019','Medium','Active','Phone','','','','','','','','','','82','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(6,'Tom Higgins Remedial Reading Summer 2019','Medium','Active','Email','','','','','','','','','','82','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(7,'Tom Higgins After School Program (rolling enrollment)','Medium','Active','Phone','Tom is enrolled in the afterschool program to increase his socialization and provide care while his parents are working','','','','','','','','','82','','ClientCase');
INSERT INTO "Case__ClientCase" VALUES(8,'Tom Higgins  Clothing Program Summer 2019','Medium','Active','Email','Tome is receiving clothing assistance while his family is in the Housing Assistance Program.','','','','','','','','','82','','ClientCase');
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
	contact_id VARCHAR(255), 
	branch__c VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Case__Incident" VALUES(1,'Skipped group field trip','Medium','Closed','','Tom ran off and skipped the group field trip','','','','','2019-06-04T19:00:00.000Z','Other','','Medium','82','','Incident');
INSERT INTO "Case__Incident" VALUES(2,'Broke toilet stall door','Medium','Working','','Tom ran away from the group to the boys restroom and kicked in the stall door, breaking it.','','','','','2019-04-12T21:00:00.000Z','Property Damage','','Low','82','1','Incident');
INSERT INTO "Case__Incident" VALUES(3,'Breakdown during session','Medium','New','Phone','Tom lost his temper and couldn''t get himself back together','','','','','2019-04-24T20:30:00.000Z','Other','','High','82','1','Incident');
INSERT INTO "Case__Incident" VALUES(4,'Bullying','Medium','New','','Older girls teased Tom about his shoes, causing him to lose his temper.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','82','1','Incident');
INSERT INTO "Case__Incident" VALUES(5,'Left afterschool program without permission','Medium','Closed','','Tom left the program without telling the counselor. He was found an hour later behind the neighborhood convenience store.','','','','','2019-06-03T19:00:00.000Z','Other','','Medium','82','1','Incident');
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Email" VARCHAR(255), 
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
INSERT INTO "Contact" VALUES(1,'Dalia','Osborn','daliaosborn@example.com','','','','','','','','','','','false','','1','');
INSERT INTO "Contact" VALUES(2,'Laura','Woodard','laurawoodard@example.com','','','','','','','','','','','false','','10','');
INSERT INTO "Contact" VALUES(3,'Simon','Davila','simondavila@example.com','','','','','','','','','','','false','','100','');
INSERT INTO "Contact" VALUES(4,'Jamarcus','Barnett','jamarcusbarnett@example.com','','','','','','','','','','','false','','101','');
INSERT INTO "Contact" VALUES(5,'Adrianna','Norman','adriannanorman@example.com','','','','','','','','','','','false','','102','');
INSERT INTO "Contact" VALUES(6,'Donna','Snow','donnasnow@example.com','','','','','','','','','','','false','','103','');
INSERT INTO "Contact" VALUES(7,'Gary','Wood','garywood@example.com','','','','','','','','','','','false','','104','');
INSERT INTO "Contact" VALUES(8,'Reagan','Norton','reagannorton@example.com','','','','','','','','','','','false','','105','');
INSERT INTO "Contact" VALUES(9,'Jaylin','Morgan','jaylinmorgan@example.com','','','','','','','','','','','false','','106','');
INSERT INTO "Contact" VALUES(10,'Mira','Decker','miradecker@example.com','','','','','','','','','','','false','','107','');
INSERT INTO "Contact" VALUES(11,'Maya','Lambert','mayalambert@example.com','','','','','','','','','','','false','','108','');
INSERT INTO "Contact" VALUES(12,'Finley','Barry','finleybarry@example.com','','','','','','','','','','','false','','109','');
INSERT INTO "Contact" VALUES(13,'Shane','Gibson','shanegibson@example.com','','','','','','','','','','','false','','11','');
INSERT INTO "Contact" VALUES(14,'Ben','Oneill','benoneill@example.com','','','','','','','','','','','false','','110','');
INSERT INTO "Contact" VALUES(15,'Maia','Cooley','maiacooley@example.com','','','','','','','','','','','false','','111','');
INSERT INTO "Contact" VALUES(16,'Olive','Leach','oliveleach@example.com','','','','','','','','','','','false','','112','');
INSERT INTO "Contact" VALUES(17,'Oswaldo','Pacheco','oswaldopacheco@example.com','','','','','','','','','','','false','','113','');
INSERT INTO "Contact" VALUES(18,'Nico','Rivers','nicorivers@example.com','','','','','','','','','','','false','','114','');
INSERT INTO "Contact" VALUES(19,'Tiara','Griffith','tiaragriffith@example.com','','','','','','','','','','','false','','115','');
INSERT INTO "Contact" VALUES(20,'Declan','Glenn','declanglenn@example.com','','','','','','','','','','','false','','116','');
INSERT INTO "Contact" VALUES(21,'Madalyn','Francis','madalynfrancis@example.com','','','','','','','','','','','false','','117','');
INSERT INTO "Contact" VALUES(22,'Mathew','Rhodes','mathewrhodes@example.com','','','','','','','','','','','false','','118','');
INSERT INTO "Contact" VALUES(23,'Eli','White','eliwhite@example.com','','','','','','','','','','','false','','119','');
INSERT INTO "Contact" VALUES(24,'Alia','Duarte','aliaduarte@example.com','','','','','','','','','','','false','','12','');
INSERT INTO "Contact" VALUES(25,'Tatiana','Lang','tatianalang@example.com','','','','','','','','','','','false','','120','');
INSERT INTO "Contact" VALUES(26,'Gia','Ramirez','giaramirez@example.com','','','','','','','','','','','false','','121','');
INSERT INTO "Contact" VALUES(27,'Alejandro','Serrano','alejandroserrano@example.com','','','','','','','','','','','false','','122','');
INSERT INTO "Contact" VALUES(28,'Mya','Galloway','myagalloway@example.com','','','','','','','','','','','false','','123','');
INSERT INTO "Contact" VALUES(29,'Adam','Clark','adamclark@example.com','','','','','','','','','','','false','','124','');
INSERT INTO "Contact" VALUES(30,'Marisol','Gonzales','marisolgonzales@example.com','','','','','','','','','','','false','','125','');
INSERT INTO "Contact" VALUES(31,'Mya','Cobb','myacobb@example.com','','','','','','','','','','','false','','126','');
INSERT INTO "Contact" VALUES(32,'Jay','Shah','jayshah@example.com','','','','','','','','','','','false','','127','');
INSERT INTO "Contact" VALUES(33,'Nancy','Arroyo','nancyarroyo@example.com','','','','','','','','','','','false','','128','');
INSERT INTO "Contact" VALUES(34,'Aubrie','Booker','aubriebooker@example.com','','','','','','','','','','','false','','129','');
INSERT INTO "Contact" VALUES(35,'Neil','Huerta','neilhuerta@example.com','','','','','','','','','','','false','','13','');
INSERT INTO "Contact" VALUES(36,'Emelia','Mercer','emeliamercer@example.com','','','','','','','','','','','false','','130','');
INSERT INTO "Contact" VALUES(37,'Yadiel','Horton','yadielhorton@example.com','','','','','','','','','','','false','','131','');
INSERT INTO "Contact" VALUES(38,'Taniyah','Rios','taniyahrios@example.com','','','','','','','','','','','false','','132','');
INSERT INTO "Contact" VALUES(39,'Peyton','Craig','peytoncraig@example.com','','','','','','','','','','','false','','133','');
INSERT INTO "Contact" VALUES(40,'Francesca','Oliver','francescaoliver@example.com','','','','','','','','','','','false','','134','');
INSERT INTO "Contact" VALUES(41,'Albert','Montgomery','albertmontgomery@example.com','','','','','','','','','','','false','','135','');
INSERT INTO "Contact" VALUES(42,'Meredith','Cooke','meredithcooke@example.com','','','','','','','','','','','false','','136','');
INSERT INTO "Contact" VALUES(43,'Mckayla','Morrison','mckaylamorrison@example.com','','','','','','','','','','','false','','137','');
INSERT INTO "Contact" VALUES(44,'Hayley','Bright','hayleybright@example.com','','','','','','','','','','','false','','138','');
INSERT INTO "Contact" VALUES(45,'Dayana','Atkins','dayanaatkins@example.com','','','','','','','','','','','false','','139','');
INSERT INTO "Contact" VALUES(46,'Laura','Hernandez','laurahernandez@example.com','','','','','','','','','','','false','','14','');
INSERT INTO "Contact" VALUES(47,'Jessica','Woods','jessicawoods@example.com','','','','','','','','','','','false','','140','');
INSERT INTO "Contact" VALUES(48,'Khloe','Stanley','khloestanley@example.com','','','','','','','','','','','false','','141','');
INSERT INTO "Contact" VALUES(49,'Ray','Fischer','rayfischer@example.com','','','','','','','','','','','false','','142','');
INSERT INTO "Contact" VALUES(50,'Casey','Kline','caseykline@example.com','','','','','','','','','','','false','','143','');
INSERT INTO "Contact" VALUES(51,'Aron','Joyce','aronjoyce@example.com','','','','','','','','','','','false','','144','');
INSERT INTO "Contact" VALUES(52,'Diego','Case','diegocase@example.com','','','','','','','','','','','false','','145','');
INSERT INTO "Contact" VALUES(53,'Chelsea','Graves','chelseagraves@example.com','','','','','','','','','','','false','','146','');
INSERT INTO "Contact" VALUES(54,'Ruth','Wu','ruthwu@example.com','','','','','','','','','','','false','','147','');
INSERT INTO "Contact" VALUES(55,'Isaac','Grant','isaacgrant@example.com','','','','','','','','','','','false','','148','');
INSERT INTO "Contact" VALUES(56,'Audrina','Rojas','audrinarojas@example.com','','','','','','','','','','','false','','149','');
INSERT INTO "Contact" VALUES(57,'Makhi','Villegas','makhivillegas@example.com','','','','','','','','','','','false','','15','');
INSERT INTO "Contact" VALUES(58,'Koen','Chase','koenchase@example.com','','','','','','','','','','','false','','150','');
INSERT INTO "Contact" VALUES(59,'Hailie','Holder','hailieholder@example.com','','','','','','','','','','','false','','151','');
INSERT INTO "Contact" VALUES(60,'Caylee','Pollard','cayleepollard@example.com','','','','','','','','','','','false','','152','');
INSERT INTO "Contact" VALUES(61,'Guillermo','Quinn','guillermoquinn@example.com','','','','','','','','','','','false','','153','');
INSERT INTO "Contact" VALUES(62,'Dominik','Wilkinson','dominikwilkinson@example.com','','','','','','','','','','','false','','154','');
INSERT INTO "Contact" VALUES(63,'Simone','Keller','simonekeller@example.com','','','','','','','','','','','false','','155','');
INSERT INTO "Contact" VALUES(64,'Violet','Ellis','violetellis@example.com','','','','','','','','','','','false','','156','');
INSERT INTO "Contact" VALUES(65,'Samir','Neal','samirneal@example.com','','','','','','','','','','','false','','157','');
INSERT INTO "Contact" VALUES(66,'Mira','Mcconnell','miramcconnell@example.com','','','','','','','','','','','false','','158','');
INSERT INTO "Contact" VALUES(67,'Aniya','Arellano','aniyaarellano@example.com','','','','','','','','','','','false','','159','');
INSERT INTO "Contact" VALUES(68,'Rafael','Velasquez','rafaelvelasquez@example.com','','','','','','','','','','','false','','16','');
INSERT INTO "Contact" VALUES(69,'Jakayla','Glover','jakaylaglover@example.com','','','','','','','','','','','false','','160','');
INSERT INTO "Contact" VALUES(70,'Angelo','Lutz','angelolutz@example.com','','','','','','','','','','','false','','161','');
INSERT INTO "Contact" VALUES(71,'Audrina','Graves','audrinagraves@example.com','','','','','','','','','','','false','','162','');
INSERT INTO "Contact" VALUES(72,'Turner','Carson','turnercarson@example.com','','','','','','','','','','','false','','163','');
INSERT INTO "Contact" VALUES(73,'Emelia','Fletcher','emeliafletcher@example.com','','','','','','','','','','','false','','164','');
INSERT INTO "Contact" VALUES(74,'Mackenzie','Hernandez','mackenziehernandez@example.com','','','','','','','','','','','false','','165','');
INSERT INTO "Contact" VALUES(75,'Ryan','Hardin','ryanhardin@example.com','','','','','','','','','','','false','','17','');
INSERT INTO "Contact" VALUES(76,'Mira','Olson','miraolson@example.com','','','','','','','','','','','false','','18','');
INSERT INTO "Contact" VALUES(77,'Anna','Orr','annaorr@example.com','','','','','','','','','','','false','','19','');
INSERT INTO "Contact" VALUES(78,'Tyrone','Pearson','tyronepearson@example.com','','','','','','','','','','','false','','2','');
INSERT INTO "Contact" VALUES(79,'Joe','Salinas','joesalinas@example.com','','','','','','','','','','','false','','20','');
INSERT INTO "Contact" VALUES(80,'Maleah','Bullock','maleahbullock@example.com','','','','','','','','','','','false','','21','');
INSERT INTO "Contact" VALUES(81,'Anika','Solomon','anikasolomon@example.com','','','','','','','','','','','false','','22','');
INSERT INTO "Contact" VALUES(82,'Tom','Higgins','thiggins@example.com','Child','','Mother','0680R000000l41WQAQ','','Thomas Higgins','Home Phone','555-248-3956','he/him/his','Client','true','2020-01-08','23','83');
INSERT INTO "Contact" VALUES(83,'Lisa','Higgins','lhiggins@example.com','','','','','','','','','','','false','','23','');
INSERT INTO "Contact" VALUES(84,'Jeremy','Adams','jeremyadams@example.com','Adult','','Friend','','Call','','Phone','555-648-7204','he/him/his','Client','false','','24','');
INSERT INTO "Contact" VALUES(85,'Angela','Adams','angelaadams@example.com','Adult','','Friend','','','','','','she/her/hers','Client;Donor;Volunteer','false','','24','');
INSERT INTO "Contact" VALUES(86,'Arthur','Baker','','','','','','','','','','','','false','','25','');
INSERT INTO "Contact" VALUES(87,'Arlene','Baker','alanbaker@example.com','Adult','','Friend','0680x0000029NfuAAE','','Alan Baker','','','she/her/hers','Client;Volunteer','false','','25','85');
INSERT INTO "Contact" VALUES(88,'Robin','Banks','robinbanks@example.com','Adult','','Partner','0680R000000l41bQAA','','','','','she/her/hers','Client','true','2020-01-08','26','89');
INSERT INTO "Contact" VALUES(89,'Darryl','Graham','darrylgraham@example.com','','','','','','','','','','','false','','26','');
INSERT INTO "Contact" VALUES(90,'Lynn','Barnes','lynnbarnes@example.com','','','','','','','','','','','false','','27','');
INSERT INTO "Contact" VALUES(91,'David','Barnes','davidbarnes@example.com','','','','','','','','','','','false','','27','');
INSERT INTO "Contact" VALUES(92,'Jason','Barnes','jasonbarnes@example.com','Youth','88841515','Mother','0680R000000l41RQAQ','','','','','he/him/his','Client','false','','27','90');
INSERT INTO "Contact" VALUES(93,'Anne','Boyd','anneboyd@example.com','Adult','','Friend','','','','','','she/her/hers','Client','false','','28','');
INSERT INTO "Contact" VALUES(94,'Norma','Burke','normaburke@example.com','Senior','','Friend','','','','','','they/them/theirs','Client','false','','29','');
INSERT INTO "Contact" VALUES(95,'Ariella','Branch','ariellabranch@example.com','','','','','','','','','','','false','','3','');
INSERT INTO "Contact" VALUES(96,'Bobby','Henderson','bobbyhenderson@example.com','Adult','','Friend','06854000000G0PNAA0','','','','','he/him/his','Client','true','2020-01-08','30','');
INSERT INTO "Contact" VALUES(97,'Anthony','Hill','anthonyhill@example.com','Adult','','Friend','','','','','','they/them/theirs','Client','false','','31','');
INSERT INTO "Contact" VALUES(98,'Virginia','Holmes','virginiaholmes@example.com','Adult','','Friend','','','','','','she/her/hers','Client;Donor','false','','32','');
INSERT INTO "Contact" VALUES(99,'Jose','Jenkins','josejenkins@example.com','Adult','','Friend','','','','','','he/him/his','Donor','false','','33','');
INSERT INTO "Contact" VALUES(100,'Craig','Johnson','craigjohnso@example.com','','','','','','','','','','','false','','34','');
INSERT INTO "Contact" VALUES(101,'Maya','Johnson','','','','','','','','','','','','false','','34','');
INSERT INTO "Contact" VALUES(102,'Barbara','Johnson','barbarajohnson@example.com','Adult','','Husband','0680R000000l41MQAQ','','','','','she/her/hers','Client','false','','34','100');
INSERT INTO "Contact" VALUES(103,'Jose','Burgess','joseburgess@example.com','','','','','','','','','','','false','','35','');
INSERT INTO "Contact" VALUES(104,'Brenda','Bass','brendabass@example.com','','','','','','','','','','','false','','36','');
INSERT INTO "Contact" VALUES(105,'Nikhil','Bishop','nikhilbishop@example.com','','','','','','','','','','','false','','37','');
INSERT INTO "Contact" VALUES(106,'Juliette','Cisneros','juliettecisneros@example.com','','','','','','','','','','','false','','38','');
INSERT INTO "Contact" VALUES(107,'Alana','Owen','alanaowen@example.com','','','','','','','','','','','false','','39','');
INSERT INTO "Contact" VALUES(108,'Jaydon','Bates','jaydonbates@example.com','','','','','','','','','','','false','','4','');
INSERT INTO "Contact" VALUES(109,'Cruz','Kerr','cruzkerr@example.com','','','','','','','','','','','false','','40','');
INSERT INTO "Contact" VALUES(110,'Naima','Crawford','naimacrawford@example.com','','','','','','','','','','','false','','41','');
INSERT INTO "Contact" VALUES(111,'Beau','Eaton','beaueaton@example.com','','','','','','','','','','','false','','42','');
INSERT INTO "Contact" VALUES(112,'Chance','Rasmussen','chancerasmussen@example.com','','','','','','','','','','','false','','43','');
INSERT INTO "Contact" VALUES(113,'Khloe','Campos','khloecampos@example.com','','','','','','','','','','','false','','44','');
INSERT INTO "Contact" VALUES(114,'Amelie','Bond','ameliebond@example.com','','','','','','','','','','','false','','45','');
INSERT INTO "Contact" VALUES(115,'Julie','Myers','juliemyers@example.com','','','','','','','','','','','false','','46','');
INSERT INTO "Contact" VALUES(116,'Jayda','Stanton','jaydastanton@example.com','','','','','','','','','','','false','','47','');
INSERT INTO "Contact" VALUES(117,'Heidi','Woods','heidiwoods@example.com','','','','','','','','','','','false','','48','');
INSERT INTO "Contact" VALUES(118,'Leia','Spence','leiaspence@example.com','','','','','','','','','','','false','','49','');
INSERT INTO "Contact" VALUES(119,'Javon','Rodgers','javonrodgers@example.com','','','','','','','','','','','false','','5','');
INSERT INTO "Contact" VALUES(120,'Leon','Clayton','leonclayton@example.com','','','','','','','','','','','false','','50','');
INSERT INTO "Contact" VALUES(121,'Marc','Richard','marcrichard@example.com','','','','','','','','','','','false','','51','');
INSERT INTO "Contact" VALUES(122,'Jordan','Waller','jordanwaller@example.com','','','','','','','','','','','false','','52','');
INSERT INTO "Contact" VALUES(123,'Jace','Hampton','jacehampton@example.com','','','','','','','','','','','false','','53','');
INSERT INTO "Contact" VALUES(124,'Silas','Neal','silasneal@example.com','','','','','','','','','','','false','','54','');
INSERT INTO "Contact" VALUES(125,'Sonia','Gentry','soniagentry@example.com','','','','','','','','','','','false','','55','');
INSERT INTO "Contact" VALUES(126,'Alison','Barr','alisonbarr@example.com','','','','','','','','','','','false','','56','');
INSERT INTO "Contact" VALUES(127,'Vu','Pham','vupham@example.com','','','','','','','','','','','false','','57','');
INSERT INTO "Contact" VALUES(128,'Kellen','Cooley','kellencooley@example.com','','','','','','','','','','','false','','58','');
INSERT INTO "Contact" VALUES(129,'Jay','Zimmerman','jayzimmerman@example.com','','','','','','','','','','','false','','59','');
INSERT INTO "Contact" VALUES(130,'Josie','Mcclure','josiemcclure@example.com','','','','','','','','','','','false','','6','');
INSERT INTO "Contact" VALUES(131,'Melanie','Wheeler','melaniewheeler@example.com','','','','','','','','','','','false','','60','');
INSERT INTO "Contact" VALUES(132,'Fernando','Beltran','fernandobeltran@example.com','','','','','','','','','','','false','','61','');
INSERT INTO "Contact" VALUES(133,'Yuliana','Bird','yulianabird@example.com','','','','','','','','','','','false','','62','');
INSERT INTO "Contact" VALUES(134,'Alyson','Duffy','alysonduffy@example.com','','','','','','','','','','','false','','63','');
INSERT INTO "Contact" VALUES(135,'Nyla','Woods','nylawoods@example.com','','','','','','','','','','','false','','64','');
INSERT INTO "Contact" VALUES(136,'James','Richards','jamesrichards@example.com','','','','','','','','','','','false','','65','');
INSERT INTO "Contact" VALUES(137,'Aaron','Valdez','aaronvaldez@example.com','','','','','','','','','','','false','','66','');
INSERT INTO "Contact" VALUES(138,'John','Mills','johnmills@example.com','','','','','','','','','','','false','','67','');
INSERT INTO "Contact" VALUES(139,'Shannon','Greene','shannongreene@example.com','','','','','','','','','','','false','','68','');
INSERT INTO "Contact" VALUES(140,'Marco','Escobar','marcoescobar@example.com','','','','','','','','','','','false','','69','');
INSERT INTO "Contact" VALUES(141,'Marcus','Huynh','marcushuynh@example.com','','','','','','','','','','','false','','7','');
INSERT INTO "Contact" VALUES(142,'Lorelai','Gross','lorelaigross@example.com','','','','','','','','','','','false','','70','');
INSERT INTO "Contact" VALUES(143,'Elsa','Guerrero','elsaguerrero@example.com','','','','','','','','','','','false','','71','');
INSERT INTO "Contact" VALUES(144,'Yesenia','Ritter','yeseniaritter@example.com','','','','','','','','','','','false','','72','');
INSERT INTO "Contact" VALUES(145,'Abraham','Sims','abrahamsims@example.com','','','','','','','','','','','false','','73','');
INSERT INTO "Contact" VALUES(146,'Kyle','Huffman','kylehuffman@example.com','','','','','','','','','','','false','','74','');
INSERT INTO "Contact" VALUES(147,'Cora','Hall','corahall@example.com','','','','','','','','','','','false','','75','');
INSERT INTO "Contact" VALUES(148,'Isaac','Barker','isaacbarker@example.com','','','','','','','','','','','false','','76','');
INSERT INTO "Contact" VALUES(149,'Kailey','Glass','kaileyglass@example.com','','','','','','','','','','','false','','77','');
INSERT INTO "Contact" VALUES(150,'Delilah','Ibarra','delilahibarra@example.com','','','','','','','','','','','false','','78','');
INSERT INTO "Contact" VALUES(151,'Zackery','Morgan','zackerymorgan@example.com','','','','','','','','','','','false','','79','');
INSERT INTO "Contact" VALUES(152,'Ayanna','Gonzalez','ayannagonzalez@example.com','','','','','','','','','','','false','','8','');
INSERT INTO "Contact" VALUES(153,'Duncan','Bowers','duncanbowers@example.com','','','','','','','','','','','false','','80','');
INSERT INTO "Contact" VALUES(154,'Lauryn','Odom','laurynodom@example.com','','','','','','','','','','','false','','81','');
INSERT INTO "Contact" VALUES(155,'Yusef','Flores','yusefflores@example.com','','','','','','','','','','','false','','82','');
INSERT INTO "Contact" VALUES(156,'Semaj','Wall','semajwall@example.com','','','','','','','','','','','false','','83','');
INSERT INTO "Contact" VALUES(157,'Frankie','Waller','frankiewaller@example.com','','','','','','','','','','','false','','84','');
INSERT INTO "Contact" VALUES(158,'Eliezer','Bray','eliezerbray@example.com','','','','','','','','','','','false','','85','');
INSERT INTO "Contact" VALUES(159,'Jaden','Conner','jadenconner@example.com','','','','','','','','','','','false','','86','');
INSERT INTO "Contact" VALUES(160,'Steven','Harper','stevenharper@example.com','','','','','','','','','','','false','','87','');
INSERT INTO "Contact" VALUES(161,'Karissa','Aguilar','karissaaguilar@example.com','','','','','','','','','','','false','','88','');
INSERT INTO "Contact" VALUES(162,'Tiara','Cummings','tiaracummings@example.com','','','','','','','','','','','false','','89','');
INSERT INTO "Contact" VALUES(163,'Taniya','Singleton','taniyasingleton@example.com','','','','','','','','','','','false','','9','');
INSERT INTO "Contact" VALUES(164,'Cecilia','Cardenas','ceciliacardenas@example.com','','','','','','','','','','','false','','90','');
INSERT INTO "Contact" VALUES(165,'Christina','Webster','christinawebster@example.com','','','','','','','','','','','false','','91','');
INSERT INTO "Contact" VALUES(166,'Emilie','Costa','emiliecosta@example.com','','','','','','','','','','','false','','92','');
INSERT INTO "Contact" VALUES(167,'Ayana','Humphrey','ayanahumphrey@example.com','','','','','','','','','','','false','','93','');
INSERT INTO "Contact" VALUES(168,'Lucia','Cain','luciacain@example.com','','','','','','','','','','','false','','94','');
INSERT INTO "Contact" VALUES(169,'Amaya','Dunlap','amayadunlap@example.com','','','','','','','','','','','false','','95','');
INSERT INTO "Contact" VALUES(170,'Derrick','Blackwell','derrickblackwell@example.com','','','','','','','','','','','false','','96','');
INSERT INTO "Contact" VALUES(171,'Alice','Irwin','aliceirwin@example.com','','','','','','','','','','','false','','97','');
INSERT INTO "Contact" VALUES(172,'Fabian','Hughes','fabianhughes@example.com','','','','','','','','','','','false','','98','');
INSERT INTO "Contact" VALUES(173,'Raelynn','Wells','raelynnwells@example.com','','','','','','','','','','','false','','99','');
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
	"Status__c" VARCHAR(255), 
	"DueDate__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	case_plan__c VARCHAR(255), 
	goal__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ActionItem__c" VALUES(1,'Pass mock interview','Not Started','2019-11-06','87','1','8','10');
INSERT INTO "caseman__ActionItem__c" VALUES(2,'Update resume','Not Started','2019-10-25','87','1','8','11');
INSERT INTO "caseman__ActionItem__c" VALUES(3,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-08','87','1','8','3');
INSERT INTO "caseman__ActionItem__c" VALUES(4,'Get a job readiness coach','Completed','2019-09-05','87','1','8','7');
INSERT INTO "caseman__ActionItem__c" VALUES(5,'Complete resume workshop','Not Started','2019-10-11','87','1','8','8');
INSERT INTO "caseman__ActionItem__c" VALUES(6,'Complete interview workshop','Not Started','2019-11-04','87','1','8','9');
INSERT INTO "caseman__ActionItem__c" VALUES(7,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','87','1','6','16');
INSERT INTO "caseman__ActionItem__c" VALUES(8,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-05','87','1','6','17');
INSERT INTO "caseman__ActionItem__c" VALUES(9,'Open a bank account','Completed','2019-09-06','87','1','6','19');
INSERT INTO "caseman__ActionItem__c" VALUES(10,'Pass basic financial literacy course','In Progress','2019-09-30','87','1','6','2');
INSERT INTO "caseman__ActionItem__c" VALUES(11,'Read and interpret a banking account statement','Not Started','2019-09-30','87','1','6','21');
INSERT INTO "caseman__ActionItem__c" VALUES(12,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-05','87','1','6','24');
INSERT INTO "caseman__ActionItem__c" VALUES(13,'Month 4: Deposit 10% of income to savings account end of month','Not Started','2020-02-28','87','1','6','30');
INSERT INTO "caseman__ActionItem__c" VALUES(14,'Month 4: Meet Financial Advisor beginning of month','Not Started','2019-12-04','87','1','6','31');
INSERT INTO "caseman__ActionItem__c" VALUES(15,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','87','1','6','32');
INSERT INTO "caseman__ActionItem__c" VALUES(16,'Month 5: Deposit 10% of income to savings account end of month','Not Started','2020-03-31','87','1','6','33');
INSERT INTO "caseman__ActionItem__c" VALUES(17,'Month 5: Meet Financial Advisor beginning of month','Not Started','2020-01-06','87','1','6','34');
INSERT INTO "caseman__ActionItem__c" VALUES(18,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2020-01-31','87','1','6','35');
INSERT INTO "caseman__ActionItem__c" VALUES(19,'Month 6: Deposit 10% of income to savings account end of month','Not Started','2020-04-30','87','1','6','36');
INSERT INTO "caseman__ActionItem__c" VALUES(20,'Month 6: Meet Financial Advisor beginning of month','Not Started','2020-02-04','87','1','6','37');
INSERT INTO "caseman__ActionItem__c" VALUES(21,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-12-31','87','1','6','38');
INSERT INTO "caseman__ActionItem__c" VALUES(22,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-26','87','1','7','15');
INSERT INTO "caseman__ActionItem__c" VALUES(23,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-30','87','1','7','22');
INSERT INTO "caseman__ActionItem__c" VALUES(24,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-25','87','1','7','23');
INSERT INTO "caseman__ActionItem__c" VALUES(25,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-29','87','1','7','4');
INSERT INTO "caseman__ActionItem__c" VALUES(26,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-30','87','1','7','5');
INSERT INTO "caseman__ActionItem__c" VALUES(27,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-29','87','1','7','6');
INSERT INTO "caseman__ActionItem__c" VALUES(28,'Maintain 2 years active engagement in workforce','Not Started','2021-09-01','87','1','5','12');
INSERT INTO "caseman__ActionItem__c" VALUES(29,'Meet job requirement standards','Not Started','2020-04-15','87','1','5','13');
INSERT INTO "caseman__ActionItem__c" VALUES(30,'Month 2: Meet Financial Advisor beginning of month','Not Started','2019-10-07','88','2','12','16');
INSERT INTO "caseman__ActionItem__c" VALUES(31,'Month 1: Meet Financial Advisor beginning of month','Completed','2019-09-09','88','2','12','17');
INSERT INTO "caseman__ActionItem__c" VALUES(32,'Month 3: Meet Financial Advisor beginning of month','Not Started','2019-11-04','88','2','12','24');
INSERT INTO "caseman__ActionItem__c" VALUES(33,'Month 1: Deposit 10% of income to savings account end of month','Not Started','2019-09-30','88','2','12','32');
INSERT INTO "caseman__ActionItem__c" VALUES(34,'Month 3: Deposit 10% of income to savings account end of month','Not Started','2019-11-29','88','2','12','35');
INSERT INTO "caseman__ActionItem__c" VALUES(35,'Month 2: Deposit 10% of income to savings account end of month','Not Started','2019-10-31','88','2','12','38');
INSERT INTO "caseman__ActionItem__c" VALUES(36,'Month 6: Meet Job Readiness Coach end of month','Not Started','2020-02-24','88','2','13','15');
INSERT INTO "caseman__ActionItem__c" VALUES(37,'Month 2: Meet Job Readiness Coach end of month','Not Started','2019-10-28','88','2','13','22');
INSERT INTO "caseman__ActionItem__c" VALUES(38,'Month 1: Meet Job Readiness Coach end of month','Not Started','2019-09-27','88','2','13','23');
INSERT INTO "caseman__ActionItem__c" VALUES(39,'Month 3: Meet Job Readiness Coach end of month','Not Started','2019-11-25','88','2','13','4');
INSERT INTO "caseman__ActionItem__c" VALUES(40,'Month 4: Meet Job Readiness Coach end of month','Not Started','2019-12-20','88','2','13','5');
INSERT INTO "caseman__ActionItem__c" VALUES(41,'Month 5: Meet Job Readiness Coach end of month','Not Started','2020-01-27','88','2','13','6');
INSERT INTO "caseman__ActionItem__c" VALUES(42,'Pass mock interview','Not Started','2019-10-31','88','2','14','10');
INSERT INTO "caseman__ActionItem__c" VALUES(43,'Update resume','Not Started','2019-10-09','88','2','14','11');
INSERT INTO "caseman__ActionItem__c" VALUES(44,'Complete online job applications to at least 3 appropriate job openings','Not Started','2019-11-15','88','2','14','3');
INSERT INTO "caseman__ActionItem__c" VALUES(45,'Get a job readiness coach','Completed','2019-09-05','88','2','14','7');
INSERT INTO "caseman__ActionItem__c" VALUES(46,'Complete resume workshop','Not Started','2019-09-27','88','2','14','8');
INSERT INTO "caseman__ActionItem__c" VALUES(47,'Complete interview workshop','Not Started','2019-10-20','88','2','14','9');
INSERT INTO "caseman__ActionItem__c" VALUES(48,'Participate in a 12-step program','In Progress','2019-12-31','88','3','15','25');
INSERT INTO "caseman__ActionItem__c" VALUES(49,'Pass Financial Literacy Course with a grade of 65% or above','In Progress','2019-12-13','92','4','16','2');
INSERT INTO "caseman__ActionItem__c" VALUES(50,'Deposit 10% of Paycheck: Month 1','Not Started','2019-09-30','92','4','16','26');
INSERT INTO "caseman__ActionItem__c" VALUES(51,'Deposit 10% of Paycheck: Month 2','Not Started','2019-10-31','92','4','16','27');
INSERT INTO "caseman__ActionItem__c" VALUES(52,'Deposit 10% of Paycheck: Month 3','Not Started','2019-11-29','92','4','16','29');
INSERT INTO "caseman__ActionItem__c" VALUES(53,'Open a Savings Account','Completed','2019-09-09','92','4','16','39');
INSERT INTO "caseman__ActionItem__c" VALUES(54,'Pass English proficiency exam with a score of 65 or above','In Progress','2020-05-15','102','5','18','28');
INSERT INTO "caseman__ActionItem__c" VALUES(55,'Pass age appropriate reading comprehension exam with a score of 65 or above','In Progress','2020-05-15','82','7','21','1');
CREATE TABLE "caseman__AppointmentAttendee__c" (
	id INTEGER NOT NULL, 
	"caseman__Reason__c" VARCHAR(255), 
	"caseman__Role__c" VARCHAR(255), 
	"caseman__Status__c" VARCHAR(255), 
	appointment__c VARCHAR(255), 
	attendee__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__AppointmentAttendee__c" VALUES(1,'Client','Attendee','Attending','2','85');
INSERT INTO "caseman__AppointmentAttendee__c" VALUES(2,'Check in on Jason''s progress with Workplace Readiness.','Attendee','New','3','92');
INSERT INTO "caseman__AppointmentAttendee__c" VALUES(3,'','Attendee','New','4','102');
CREATE TABLE "caseman__Appointment__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Type__c" VARCHAR(255), 
	"caseman__Location__c" VARCHAR(255), 
	"caseman__StartDateTime__c" VARCHAR(255), 
	"caseman__EndDateTime__c" VARCHAR(255), 
	"caseman__Description__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__Appointment__c" VALUES(1,'Math Appointment','Scheduled','Corner Office','2022-01-26T16:00:00.000Z','2022-01-26T17:00:00.000Z','We should talk about your grades');
INSERT INTO "caseman__Appointment__c" VALUES(2,'Program Evaluation','Scheduled','AC-1223','2022-01-26T16:00:00.000Z','2022-01-26T17:00:00.000Z','Initial program evaluation');
INSERT INTO "caseman__Appointment__c" VALUES(3,'Check-in with Jason Barnes','Scheduled','127th STreet Community Center, Meeting Room 2-B','2021-09-22T20:00:00.000Z','2021-09-22T21:00:00.000Z','Check-in on Jason''s progress with Workplace Readiness');
INSERT INTO "caseman__Appointment__c" VALUES(4,'Barbara Johnson English Tutor','Scheduled','127th Street Community Center Meeting Room A','2021-08-13T01:00:00.000Z','2021-08-13T02:00:00.000Z','Discuss getting Barbara a tutor to improve her conversational confidence');
CREATE TABLE "caseman__CasePlan__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__CasePlan__c" VALUES(1,'Arlene Baker''s Workforce Re-entry Case Plan','87');
INSERT INTO "caseman__CasePlan__c" VALUES(2,'Robin Banks'' Job Readiness Case Plan','88');
INSERT INTO "caseman__CasePlan__c" VALUES(3,'Robin Banks'' Sobriety Case Plan','88');
INSERT INTO "caseman__CasePlan__c" VALUES(4,'Financial Literacy Case Plan - Jason Barnes','92');
INSERT INTO "caseman__CasePlan__c" VALUES(5,'English proficiency case plan - Barbara Johnson','102');
INSERT INTO "caseman__CasePlan__c" VALUES(6,'Socialization Case Plan - Tom Higgins','82');
INSERT INTO "caseman__CasePlan__c" VALUES(7,'Reading Case Plan - Tom Higgins','82');
CREATE TABLE "caseman__ClientAlert__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"caseman__Active__c" VARCHAR(255), 
	"caseman__Description__c" VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ClientAlert__c" VALUES(1,'Robin was recently released from rehab','true','','88');
INSERT INTO "caseman__ClientAlert__c" VALUES(2,'Tom has anger issues','true','','82');
INSERT INTO "caseman__ClientAlert__c" VALUES(3,'Tom''s sister passed away recently (very emotional)','true','','82');
CREATE TABLE "caseman__ClientNoteRelationship__c" (
	id INTEGER NOT NULL, 
	"caseman__RelatedName__c" VARCHAR(255),
	case__c VARCHAR(255), 
	client_note__c VARCHAR(255), 
	contact__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__ClientNoteRelationship__c" VALUES(1,'','2','1','');
INSERT INTO "caseman__ClientNoteRelationship__c" VALUES(2,'','3','2','');
INSERT INTO "caseman__ClientNoteRelationship__c" VALUES(3,'','4','3','');
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
INSERT INTO "caseman__ClientNote__c" VALUES(1,'<p><span style="color: rgb(62, 62, 60);">Met with Robin upon her discharge from rehab for alcohol abuse. She appears to have done well in the program but will require further monitoring. We talked about her application to the Workforce Re-entry workshop. She is eager to get back on track, but I want to make sure it does not introduce too much stress too soon.</span></p>','Discharge from Rehab','Complete','2019-08-09','true','60.0','88');
INSERT INTO "caseman__ClientNote__c" VALUES(2,'<p><span style="color: rgb(62, 62, 60);">Reviewed and corrected birthdate on record. Enrolled him in Workplace Readiness program. remember to set up an appointment to check in with him after program has started to see how he&#39;s doing.</span></p>','Client intake review','Complete','2019-08-08','false','','92');
INSERT INTO "caseman__ClientNote__c" VALUES(3,'<p><span style="color: rgb(62, 62, 60);">Met with Barbara. She is beginning to overcome her debilitating shyness. I will find an ESL tutor for her, because a lot of her reticence stems from her rudimentary English skills.</span></p>','Find her an ESL tutor','Draft','2019-08-06','false','60.0','102');
INSERT INTO "caseman__ClientNote__c" VALUES(4,'<p><span style="color: rgb(62, 62, 60);">Coordinate more closely with Tom&#39;s after school program monitors to see if we can develop a de-escalation strategy for him. He&#39;s had a lot of anger-related incidents, and we need to do better defusing his anger before he lashes out and help him develop some better communication and coping skills.</span></p>','Coordinate with Tom''s after school program monitors','Complete','2019-08-06','true','','82');
INSERT INTO "caseman__ClientNote__c" VALUES(5,'<p><span style="color: rgb(62, 62, 60);">Tom Higgins&#39; remedial reading teacher reports that Tom&#39;s reading skills are beginning to improve, albeit slowly.</span></p><p><span style="color: rgb(62, 62, 60);">I met with Tom today and he was agitated. I told him about the report from his teacher and he began to engage more fully with me. He even read a bit from his reader. This seems to be a bright spot we can work with. I&#39;ve asked him to bring his reader to our sessions so we can celebrate his progress more regularly.</span></p>','Tom''s reading skills are improving','Complete','2019-09-05','false','45.0','82');
CREATE TABLE "caseman__GoalActionItemTemplate__c" (
	id INTEGER NOT NULL, 
	"caseman__IsRequired__c" VARCHAR(255),
	goal_template__c VARCHAR(255), 
	action_item_template__c VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(1,'false','1','1');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(2,'false','12','45');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(3,'false','12','46');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(4,'false','14','39');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(5,'false','14','40');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(6,'false','14','43');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(7,'false','14','44');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(8,'false','2','28');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(9,'false','28','28');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(10,'false','3','16');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(11,'false','3','17');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(12,'false','3','19');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(13,'false','3','2');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(14,'false','3','21');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(15,'false','3','24');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(16,'false','3','30');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(17,'false','3','31');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(18,'false','3','32');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(19,'false','3','33');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(20,'false','3','34');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(21,'false','3','35');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(22,'false','3','36');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(23,'false','3','37');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(24,'false','3','38');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(25,'false','4','22');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(26,'false','4','23');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(27,'false','4','4');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(28,'false','4','5');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(29,'false','4','6');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(30,'false','6','25');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(31,'false','9','10');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(32,'false','9','11');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(33,'false','9','3');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(34,'false','9','7');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(35,'false','9','8');
INSERT INTO "caseman__GoalActionItemTemplate__c" VALUES(36,'false','9','9');
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
INSERT INTO "caseman__Goal__c" VALUES(1,'Stabilize housing','87','1','10');
INSERT INTO "caseman__Goal__c" VALUES(2,'Identify industry/career path','87','1','16');
INSERT INTO "caseman__Goal__c" VALUES(3,'Meet job requirement standards','87','1','18');
INSERT INTO "caseman__Goal__c" VALUES(4,'Complete Succeed Program','87','1','19');
INSERT INTO "caseman__Goal__c" VALUES(5,'Stabilize Employment','87','1','21');
INSERT INTO "caseman__Goal__c" VALUES(6,'Develop basic financial literacy skills','87','1','3');
INSERT INTO "caseman__Goal__c" VALUES(7,'Get and keep job for 6 - 12 months','87','1','4');
INSERT INTO "caseman__Goal__c" VALUES(8,'Develop Soft Skills','87','1','9');
INSERT INTO "caseman__Goal__c" VALUES(9,'Meet job requirement standards','88','2','18');
INSERT INTO "caseman__Goal__c" VALUES(10,'Complete Succeed Program','88','2','19');
INSERT INTO "caseman__Goal__c" VALUES(11,'Stabilize Employment','88','2','21');
INSERT INTO "caseman__Goal__c" VALUES(12,'Develop basic financial literacy skills','88','2','3');
INSERT INTO "caseman__Goal__c" VALUES(13,'Get and keep job for 6 - 12 months','88','2','4');
INSERT INTO "caseman__Goal__c" VALUES(14,'Develop Soft Skills','88','2','9');
INSERT INTO "caseman__Goal__c" VALUES(15,'Adopt healthy skills to address dependency issues','88','3','6');
INSERT INTO "caseman__Goal__c" VALUES(16,'Complete Financial Literacy Course','92','4','12');
INSERT INTO "caseman__Goal__c" VALUES(17,'Deposit 10% of income in Savings Account for 3 months','92','4','14');
INSERT INTO "caseman__Goal__c" VALUES(18,'Reach proficiency level in reading, writing, speaking & listening per state std','102','5','8');
INSERT INTO "caseman__Goal__c" VALUES(19,'Build respectful peer relationships','82','6','13');
INSERT INTO "caseman__Goal__c" VALUES(20,'Build respectful inter-generational relationships','82','6','15');
INSERT INTO "caseman__Goal__c" VALUES(21,'Reach an age appropriate level of proficiency in reading','82','7','1');
COMMIT;
