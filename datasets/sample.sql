BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"RecordTypeId" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"BillingStreet" VARCHAR(255), 
	"BillingCity" VARCHAR(255), 
	"BillingState" VARCHAR(255), 
	"BillingPostalCode" VARCHAR(255), 
	"BillingCountry" VARCHAR(255), 
	"ShippingStreet" VARCHAR(255), 
	"ShippingCity" VARCHAR(255), 
	"ShippingState" VARCHAR(255), 
	"ShippingPostalCode" VARCHAR(255), 
	"ShippingCountry" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"AccountNumber" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"Type" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'0123F000004SEvwQAG','Sample Account for Entitlements','','','','','','','','','','','','','','','','','','');
INSERT INTO "Account" VALUES(2,'0123F000004SEvqQAG','Horton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(3,'0123F000004SEvqQAG','Rios Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(4,'0123F000004SEvqQAG','Craig Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(5,'0123F000004SEvqQAG','Oliver Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(6,'0123F000004SEvqQAG','Montgomery Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(7,'0123F000004SEvqQAG','Cooke Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(8,'0123F000004SEvqQAG','Morrison Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(9,'0123F000004SEvqQAG','Osborn Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(10,'0123F000004SEvqQAG','Bright Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(11,'0123F000004SEvqQAG','Pearson Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(12,'0123F000004SEvqQAG','Branch Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(13,'0123F000004SEvqQAG','Bates Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(14,'0123F000004SEvqQAG','Rodgers Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(15,'0123F000004SEvqQAG','Mcclure Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(16,'0123F000004SEvqQAG','Huynh Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(17,'0123F000004SEvqQAG','Gonzalez Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(18,'0123F000004SEvqQAG','Singleton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(19,'0123F000004SEvqQAG','Woodard Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(20,'0123F000004SEvqQAG','Gibson Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(21,'0123F000004SEvqQAG','Duarte Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(22,'0123F000004SEvqQAG','Huerta Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(23,'0123F000004SEvqQAG','Villegas Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(24,'0123F000004SEvqQAG','Velasquez Household','','502 8th Street','Oakland','CA','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(25,'0123F000004SEvqQAG','Hardin Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(26,'0123F000004SEvqQAG','Atkins Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(27,'0123F000004SEvqQAG','Anonymous Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(28,'0123F000004SEvqQAG','Fischer Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(29,'0123F000004SEvqQAG','Kline Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(30,'0123F000004SEvwQAG','Step In','','2625 Greenwich St','','Oakland','CA','','','','','','','555-555-3680','','','','','','');
INSERT INTO "Account" VALUES(31,'0123F000004SEvqQAG','Byrd Household','','3084 Sanford Way','Oakland','CA','','','','','','','','510-575-2217','','','','','','Household');
INSERT INTO "Account" VALUES(32,'0123F000004SEvqQAG','Bishop Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(33,'0123F000004SEvqQAG','Mathis Household','','609 9th St.','Oakland','CA','','','','','','','','510-924-1708','','','','','','Household');
INSERT INTO "Account" VALUES(34,'0123F000004SEvqQAG','Wilmont Household','','1639 Smith Avenue','Oakland','CA','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(35,'0123F000004SEvqQAG','Poole Household','','3502 Howard St','San Francisco','CA','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(36,'0123F000004SEvwQAG','Integrated Support Center','','3972 Seventh St.
Suite 340','San Francisco','CA','94103','','','','','','','415-651-7970','','','','','','');
INSERT INTO "Account" VALUES(37,'0123F000004SEvqQAG','Robinson Household','','129th Street','Oakland','CA','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(38,'0123F000004SEvqQAG','Anonymous Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(39,'0123F000004SEvqQAG','Case Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(40,'0123F000004SEvqQAG','Wu Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(41,'0123F000004SEvqQAG','Grant Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(42,'0123F000004SEvqQAG','Rojas Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(43,'0123F000004SEvqQAG','Chase Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(44,'0123F000004SEvqQAG','Holder Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(45,'0123F000004SEvqQAG','Anonymous Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(46,'0123F000004SEvqQAG','Quinn Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(47,'0123F000004SEvqQAG','Anonymous Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(48,'0123F000004SEvqQAG','Keller Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(49,'0123F000004SEvqQAG','Ellis Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(50,'0123F000004SEvqQAG','Neal Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(51,'0123F000004SEvqQAG','Mcconnell Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(52,'0123F000004SEvqQAG','Arellano Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(53,'0123F000004SEvqQAG','Reese Household','','2011 Otis Ave,','Oakland','CA','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(54,'0123F000004SEvwQAG','Oakdale School District','','','','','','','','','','','','','','','','','','');
INSERT INTO "Account" VALUES(55,'0123F000004SEvqQAG','Byrd Household','','3084 Sanford Way','Oakland','CA','','','','','','','','510-575-2217','','','','','','Household');
INSERT INTO "Account" VALUES(56,'0123F000004SEvqQAG','Glover Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(57,'0123F000004SEvqQAG','Lutz Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(58,'0123F000004SEvqQAG','Graves Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(59,'0123F000004SEvqQAG','Carson Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(60,'0123F000004SEvqQAG','Fletcher Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(61,'0123F000004SEvqQAG','Graham and Brooks Household','','','','','','','','','','','','555-648-7204','','','','','','Household');
INSERT INTO "Account" VALUES(62,'0123F000004SEvqQAG','Barnes Household','','','','','','','','','','','','555-893-4763','','','','','','Household');
INSERT INTO "Account" VALUES(63,'0123F000004SEvqQAG','Hernandez Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(64,'0123F000004SEvqQAG','Clayton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(65,'0123F000004SEvqQAG','Richard Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(66,'0123F000004SEvqQAG','Waller Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(67,'0123F000004SEvqQAG','Hampton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(68,'0123F000004SEvqQAG','Gentry Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(69,'0123F000004SEvqQAG','Barr Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(70,'0123F000004SEvqQAG','Pham Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(71,'0123F000004SEvqQAG','Cooley Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(72,'0123F000004SEvqQAG','Zimmerman Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(73,'0123F000004SEvqQAG','Bray Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(74,'0123F000004SEvqQAG','Wheeler Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(75,'0123F000004SEvqQAG','Beltran Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(76,'0123F000004SEvqQAG','Bird Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(77,'0123F000004SEvqQAG','Duffy Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(78,'0123F000004SEvqQAG','Richards Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(79,'0123F000004SEvqQAG','Valdez Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(80,'0123F000004SEvqQAG','Mills Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(81,'0123F000004SEvqQAG','Greene Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(82,'0123F000004SEvqQAG','Escobar Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(83,'0123F000004SEvqQAG','Gross Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(84,'0123F000004SEvqQAG','Guerrero Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(85,'0123F000004SEvqQAG','Ritter Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(86,'0123F000004SEvqQAG','Sims Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(87,'0123F000004SEvqQAG','Huffman Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(88,'0123F000004SEvqQAG','Hall Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(89,'0123F000004SEvqQAG','Barker Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(90,'0123F000004SEvqQAG','Glass Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(91,'0123F000004SEvqQAG','Ibarra Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(92,'0123F000004SEvqQAG','Morgan Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(93,'0123F000004SEvqQAG','Bowers Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(94,'0123F000004SEvqQAG','Odom Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(95,'0123F000004SEvqQAG','Flores Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(96,'0123F000004SEvqQAG','Wall Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(97,'0123F000004SEvqQAG','Conner Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(98,'0123F000004SEvqQAG','Harper Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(99,'0123F000004SEvqQAG','Aguilar Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(100,'0123F000004SEvqQAG','Cummings Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(101,'0123F000004SEvqQAG','Cardenas Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(102,'0123F000004SEvqQAG','Olson Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(103,'0123F000004SEvqQAG','Orr Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(104,'0123F000004SEvqQAG','Salinas Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(105,'0123F000004SEvqQAG','Bullock Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(106,'0123F000004SEvqQAG','Solomon Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(107,'0123F000004SEvqQAG','Higgins Household','','','','','','','','','','','','555-248-3956','','','','','','Household');
INSERT INTO "Account" VALUES(108,'0123F000004SEvqQAG','Adams Household','','','','','','','','','','','','555-648-7204','','','','','','Household');
INSERT INTO "Account" VALUES(109,'0123F000004SEvqQAG','Boyd Household','','','','','','','','','','','','555-380-8532','','','','','','Household');
INSERT INTO "Account" VALUES(110,'0123F000004SEvqQAG','Burke Household','','','','','','','','','','','','555-830-5295','','','','','','Household');
INSERT INTO "Account" VALUES(111,'0123F000004SEvqQAG','Henderson Household','','','','','','','','','','','','555-830-5295','','','','','','Household');
INSERT INTO "Account" VALUES(112,'0123F000004SEvqQAG','Hill Household','','','','','','','','','','','','555-395-9737','','','','','','Household');
INSERT INTO "Account" VALUES(113,'0123F000004SEvqQAG','Holmes Household','','','','','','','','','','','','555-930-8759','','','','','','Household');
INSERT INTO "Account" VALUES(114,'0123F000004SEvqQAG','Jenkins Household','','','','','','','','','','','','555-469-9873','','','','','','Household');
INSERT INTO "Account" VALUES(115,'0123F000004SEvqQAG','Rasmussen Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(116,'0123F000004SEvqQAG','Campos Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(117,'0123F000004SEvwQAG','Sample Organization','','','','','','','','','','','','','','','','','','');
INSERT INTO "Account" VALUES(118,'0123F000004SEvmQAG','127th Street Community Center','','','','','','','','','','','','555-398-2090','','','','','','');
INSERT INTO "Account" VALUES(119,'0123F000004SEvqQAG','Baker Household','','','','','','','','','','','','555-524-0749','','','','','','Household');
INSERT INTO "Account" VALUES(120,'0123F000004SEvqQAG','Costa Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(121,'0123F000004SEvqQAG','Brooks Household','','','','','','','','','','','','555-648-7204','','','','','','Household');
INSERT INTO "Account" VALUES(122,'0123F000004SEvqQAG','Contact Household','','','','','','','','','','','','','(818) 555-4444','','','','','Household');
INSERT INTO "Account" VALUES(123,'0123F000004SEvqQAG','Anonymous Household','','','','','','','','','','','','555-389-74399','','','','','','Household');
INSERT INTO "Account" VALUES(124,'0123F000004SEvqQAG','Anonymous Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(125,'0123F000004SEvqQAG','Johnson Household','','','','','','','','','','','','555-248-3956','','','','','','Household');
INSERT INTO "Account" VALUES(126,'0123F000004SEvqQAG','Burgess Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(127,'0123F000004SEvqQAG','Bass Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(128,'0123F000004SEvqQAG','Bishop Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(129,'0123F000004SEvqQAG','Cisneros Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(130,'0123F000004SEvqQAG','Owen Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(131,'0123F000004SEvqQAG','Kerr Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(132,'0123F000004SEvqQAG','Crawford Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(133,'0123F000004SEvqQAG','Eaton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(134,'0123F000004SEvqQAG','Bond Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(135,'0123F000004SEvqQAG','Norman Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(136,'0123F000004SEvqQAG','Snow Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(137,'0123F000004SEvqQAG','Wood Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(138,'0123F000004SEvqQAG','Myers Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(139,'0123F000004SEvqQAG','Norton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(140,'0123F000004SEvqQAG','Stanton Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(141,'0123F000004SEvqQAG','Woods Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(142,'0123F000004SEvqQAG','Spence Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(143,'0123F000004SEvqQAG','Webster Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(144,'0123F000004SEvqQAG','Humphrey Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(145,'0123F000004SEvqQAG','Cain Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(146,'0123F000004SEvqQAG','Dunlap Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(147,'0123F000004SEvqQAG','Blackwell Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(148,'0123F000004SEvqQAG','Irwin Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(149,'0123F000004SEvqQAG','Hughes Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(150,'0123F000004SEvqQAG','Wells Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(151,'0123F000004SEvqQAG','Davila Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(152,'0123F000004SEvqQAG','Lambert Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(153,'0123F000004SEvqQAG','Barry Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(154,'0123F000004SEvqQAG','Oneill Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(155,'0123F000004SEvqQAG','Rivers Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(156,'0123F000004SEvqQAG','Griffith Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(157,'0123F000004SEvqQAG','Glenn Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(158,'0123F000004SEvqQAG','Francis Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(159,'0123F000004SEvqQAG','Rhodes Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(160,'0123F000004SEvqQAG','Leach Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(161,'0123F000004SEvqQAG','White Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(162,'0123F000004SEvqQAG','Lang Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(163,'0123F000004SEvqQAG','Ramirez Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(164,'0123F000004SEvqQAG','Barnett Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(165,'0123F000004SEvqQAG','Decker Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(166,'0123F000004SEvqQAG','Pacheco Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(167,'0123F000004SEvqQAG','Serrano Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(168,'0123F000004SEvqQAG','Galloway Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(169,'0123F000004SEvqQAG','Clark Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(170,'0123F000004SEvqQAG','Gonzales Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(171,'0123F000004SEvqQAG','Cobb Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(172,'0123F000004SEvqQAG','Shah Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(173,'0123F000004SEvqQAG','Arroyo Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(174,'0123F000004SEvqQAG','Booker Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(175,'0123F000004SEvqQAG','Mercer Household','','','','','','','','','','','','','','','','','','Household');
INSERT INTO "Account" VALUES(176,'0123F000004SEvwQAG','Sample Account for Entitlements','','','','','','','','','','','','','','','','','','');
INSERT INTO "Account" VALUES(177,'','Sample Account for Entitlements','','','','','','','','','','','','','','','','','','');
CREATE TABLE "Account_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Account_rt_mapping" VALUES('0123F000004SEvmQAG','Branch');
INSERT INTO "Account_rt_mapping" VALUES('0123F000004SEvcQAG','Default');
INSERT INTO "Account_rt_mapping" VALUES('0123F000004SEvqQAG','HH_Account');
INSERT INTO "Account_rt_mapping" VALUES('0123F000004SEvwQAG','Organization');
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"Salutation" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Email" VARCHAR(255), 
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
	"AccountId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'','Hayley','Bright','hayleybright@example.com','','','','','','','','','','','','10');
INSERT INTO "Contact" VALUES(2,'','Tiara','Cummings','tiaracummings@example.com','','','','','','','','','','','','100');
INSERT INTO "Contact" VALUES(3,'','Cecilia','Cardenas','ceciliacardenas@example.com','','','','','','','','','','','','101');
INSERT INTO "Contact" VALUES(4,'','Mira','Olson','miraolson@example.com','','','','','','','','','','','','102');
INSERT INTO "Contact" VALUES(5,'','Anna','Orr','annaorr@example.com','','','','','','','','','','','','103');
INSERT INTO "Contact" VALUES(6,'','Joe','Salinas','joesalinas@example.com','','','','','','','','','','','','104');
INSERT INTO "Contact" VALUES(7,'','Maleah','Bullock','maleahbullock@example.com','','','','','','','','','','','','105');
INSERT INTO "Contact" VALUES(8,'','Anika','Solomon','anikasolomon@example.com','','','','','','','','','','','','106');
INSERT INTO "Contact" VALUES(9,'','Tom','Higgins','thiggins@example.com','555-248-3956','','','555-248-3956','','2008-08-25','3850 Wolf Pen Road','Oakland','CA','94612','','107');
INSERT INTO "Contact" VALUES(10,'','Lisa','Higgins','lhiggins@example.com','555-248-3956','','','555-248-3956','','','3850 Wolf Pen Road','Oakland','CA','94612','','107');
INSERT INTO "Contact" VALUES(11,'Dr.','Jeremy','Adams','jeremyadams@example.com','555-648-7204','555-510-9375','','555-648-7204','','1971-05-29','1739 Lindale Avenue','Oakland','CA','94612','United States','108');
INSERT INTO "Contact" VALUES(12,'Rev.','Angela','Adams','angelaadams@example.com','555-648-4704','1-333-444-5555','','555-648-4704','','1971-05-29','1739 Lindale Avenue','Oakland','CA','94612','United States','108');
INSERT INTO "Contact" VALUES(13,'Mrs.','Anne','Boyd','anneboyd@example.com','555-380-8532','555-673-2987','','555-380-8532','','1971-05-26','3528 Rardin Drive','Oakland','CA','94612','United States','109');
INSERT INTO "Contact" VALUES(14,'','Tyrone','Pearson','tyronepearson@example.com','','','','','','','','','','','','11');
INSERT INTO "Contact" VALUES(15,'','Norma','Burke','normaburke@example.com','555-830-5295','1-333-444-5555','','555-830-5295','','1951-05-15','3160 Green Avenue','Oakland','CA','94612','United States','110');
INSERT INTO "Contact" VALUES(16,'','Bobby','Henderson','bobbyhenderson@example.com','555-834-2386','1-333-444-5555','','555-834-2386','','1971-05-29','3547 Water Street','Oakland','CA','94606','United States','111');
INSERT INTO "Contact" VALUES(17,'','Anthony','Hill','anthonyhill@example.com','555-395-9737','1-333-444-5555','','555-395-9737','','1971-05-27','3611 Harrison Street','Oakland','CA','94612','United States','112');
INSERT INTO "Contact" VALUES(18,'Ms.','Virginia','Holmes','virginiaholmes@example.com','555-930-8759','1-333-444-5555','','555-930-8759','','1971-05-20','4318 Lynch Street','Oakland','CA','94607','United States','113');
INSERT INTO "Contact" VALUES(19,'','Jose','Jenkins','josejenkins@example.com','555-469-9873','1-333-444-5555','','555-469-9873','','1971-06-06','2203 Alexander Avenue','Oakland','CA','94612','United States','114');
INSERT INTO "Contact" VALUES(20,'','Chance','Rasmussen','chancerasmussen@example.com','','','','','','','','','','','','115');
INSERT INTO "Contact" VALUES(21,'','Khloe','Campos','khloecampos@example.com','','','','','','','','','','','','116');
INSERT INTO "Contact" VALUES(22,'','Arthur','Baker','','','','','','','','3810 Green Avenue','Oakland','CA','94612','United States','119');
INSERT INTO "Contact" VALUES(23,'','Arlene','Baker','alanbaker@example.com','555-524-0749','1-333-444-5555','','555-524-0749','','1971-05-18','3810 Green Avenue','Oakland','CA','94612','United States','119');
INSERT INTO "Contact" VALUES(24,'','Ariella','Branch','ariellabranch@example.com','','','','','','','','','','','','12');
INSERT INTO "Contact" VALUES(25,'','Sample','Contact','sample.contact@email.com','(202) 555-9654','(206) 555-7878','(215) 555-4567','(914) 555-1212','CEO','1987-04-16','One Market Street','San Francisco','CA','94105','USA','122');
INSERT INTO "Contact" VALUES(26,'','Craig','Johnson','craigjohnso@example.com','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','United States','125');
INSERT INTO "Contact" VALUES(27,'','Maya','Johnson','','555-349-3507','','','555-349-3507','','','3041 Park Street','Oakland','CA','94606','United States','125');
INSERT INTO "Contact" VALUES(28,'','Barbara','Johnson','barbarajohnson@example.com','555-349-3507','1-333-444-5555','','555-349-3507','','1971-06-03','3041 Park Street','Oakland','CA','94606','','125');
INSERT INTO "Contact" VALUES(29,'','Jose','Burgess','joseburgess@example.com','','','','','','','','','','','','126');
INSERT INTO "Contact" VALUES(30,'','Brenda','Bass','brendabass@example.com','','','','','','','','','','','','127');
INSERT INTO "Contact" VALUES(31,'','Nikhil','Bishop','nikhilbishop@example.com','','','','','','','','','','','','128');
INSERT INTO "Contact" VALUES(32,'','Juliette','Cisneros','juliettecisneros@example.com','','','','','','','','','','','','129');
INSERT INTO "Contact" VALUES(33,'','Alana','Owen','alanaowen@example.com','','','','','','','','','','','','130');
INSERT INTO "Contact" VALUES(34,'','Jaydon','Bates','jaydonbates@example.com','','','','','','','','','','','','13');
INSERT INTO "Contact" VALUES(35,'','Cruz','Kerr','cruzkerr@example.com','','','','','','','','','','','','131');
INSERT INTO "Contact" VALUES(36,'','Naima','Crawford','naimacrawford@example.com','','','','','','','','','','','','132');
INSERT INTO "Contact" VALUES(37,'','Beau','Eaton','beaueaton@example.com','','','','','','','','','','','','133');
INSERT INTO "Contact" VALUES(38,'','Amelie','Bond','ameliebond@example.com','','','','','','','','','','','','134');
INSERT INTO "Contact" VALUES(39,'','Adrianna','Norman','adriannanorman@example.com','','','','','','','','','','','','135');
INSERT INTO "Contact" VALUES(40,'','Donna','Snow','donnasnow@example.com','','','','','','','','','','','','136');
INSERT INTO "Contact" VALUES(41,'','Gary','Wood','garywood@example.com','','','','','','','','','','','','137');
INSERT INTO "Contact" VALUES(42,'','Julie','Myers','juliemyers@example.com','','','','','','','','','','','','138');
INSERT INTO "Contact" VALUES(43,'','Reagan','Norton','reagannorton@example.com','','','','','','','','','','','','139');
INSERT INTO "Contact" VALUES(44,'','Jayda','Stanton','jaydastanton@example.com','','','','','','','','','','','','140');
INSERT INTO "Contact" VALUES(45,'','Javon','Rodgers','javonrodgers@example.com','','','','','','','','','','','','14');
INSERT INTO "Contact" VALUES(46,'','Nyla','Woods','nylawoods@example.com','','','','','','','','','','','','141');
INSERT INTO "Contact" VALUES(47,'','Heidi','Woods','heidiwoods@example.com','','','','','','','','','','','','141');
INSERT INTO "Contact" VALUES(48,'','Jessica','Woods','jessicawoods@example.com','','','','','','','','','','','','141');
INSERT INTO "Contact" VALUES(49,'','Leia','Spence','leiaspence@example.com','','','','','','','','','','','','142');
INSERT INTO "Contact" VALUES(50,'','Christina','Webster','christinawebster@example.com','','','','','','','','','','','','143');
INSERT INTO "Contact" VALUES(51,'','Emilie','Costa','emiliecosta@example.com','','','','','','','','','','','','120');
INSERT INTO "Contact" VALUES(52,'','Ayana','Humphrey','ayanahumphrey@example.com','','','','','','','','','','','','144');
INSERT INTO "Contact" VALUES(53,'','Lucia','Cain','luciacain@example.com','','','','','','','','','','','','145');
INSERT INTO "Contact" VALUES(54,'','Amaya','Dunlap','amayadunlap@example.com','','','','','','','','','','','','146');
INSERT INTO "Contact" VALUES(55,'','Derrick','Blackwell','derrickblackwell@example.com','','','','','','','','','','','','147');
INSERT INTO "Contact" VALUES(56,'','Alice','Irwin','aliceirwin@example.com','','','','','','','','','','','','148');
INSERT INTO "Contact" VALUES(57,'','Fabian','Hughes','fabianhughes@example.com','','','','','','','','','','','','149');
INSERT INTO "Contact" VALUES(58,'','Josie','Mcclure','josiemcclure@example.com','','','','','','','','','','','','15');
INSERT INTO "Contact" VALUES(59,'','Raelynn','Wells','raelynnwells@example.com','','','','','','','','','','','','150');
INSERT INTO "Contact" VALUES(60,'','Simon','Davila','simondavila@example.com','','','','','','','','','','','','151');
INSERT INTO "Contact" VALUES(61,'','Maya','Lambert','mayalambert@example.com','','','','','','','','','','','','152');
INSERT INTO "Contact" VALUES(62,'','Finley','Barry','finleybarry@example.com','','','','','','','','','','','','153');
INSERT INTO "Contact" VALUES(63,'','Ben','Oneill','benoneill@example.com','','','','','','','','','','','','154');
INSERT INTO "Contact" VALUES(64,'','Nico','Rivers','nicorivers@example.com','','','','','','','','','','','','155');
INSERT INTO "Contact" VALUES(65,'','Tiara','Griffith','tiaragriffith@example.com','','','','','','','','','','','','156');
INSERT INTO "Contact" VALUES(66,'','Declan','Glenn','declanglenn@example.com','','','','','','','','','','','','157');
INSERT INTO "Contact" VALUES(67,'','Madalyn','Francis','madalynfrancis@example.com','','','','','','','','','','','','158');
INSERT INTO "Contact" VALUES(68,'','Mathew','Rhodes','mathewrhodes@example.com','','','','','','','','','','','','159');
INSERT INTO "Contact" VALUES(69,'','Marcus','Huynh','marcushuynh@example.com','','','','','','','','','','','','16');
INSERT INTO "Contact" VALUES(70,'','Olive','Leach','oliveleach@example.com','','','','','','2014-08-15','','','','','','160');
INSERT INTO "Contact" VALUES(71,'','Eli','White','eliwhite@example.com','','','','','','','','','','','','161');
INSERT INTO "Contact" VALUES(72,'','Tatiana','Lang','tatianalang@example.com','','','','','','','','','','','','162');
INSERT INTO "Contact" VALUES(73,'','Gia','Ramirez','giaramirez@example.com','','','','','','','','','','','','163');
INSERT INTO "Contact" VALUES(74,'','Jamarcus','Barnett','jamarcusbarnett@example.com','','','','','','','','','','','','164');
INSERT INTO "Contact" VALUES(75,'','Mira','Decker','miradecker@example.com','','','','','','','','','','','','165');
INSERT INTO "Contact" VALUES(76,'','Oswaldo','Pacheco','oswaldopacheco@example.com','','','','','','','','','','','','166');
INSERT INTO "Contact" VALUES(77,'','Alejandro','Serrano','alejandroserrano@example.com','','','','','','','','','','','','167');
INSERT INTO "Contact" VALUES(78,'','Mya','Galloway','myagalloway@example.com','','','','','','','','','','','','168');
INSERT INTO "Contact" VALUES(79,'','Adam','Clark','adamclark@example.com','','','','','','','','','','','','169');
INSERT INTO "Contact" VALUES(80,'','Ayanna','Gonzalez','ayannagonzalez@example.com','','','','','','','','','','','','17');
INSERT INTO "Contact" VALUES(81,'','Marisol','Gonzales','marisolgonzales@example.com','','','','','','','','','','','','170');
INSERT INTO "Contact" VALUES(82,'','Mya','Cobb','myacobb@example.com','','','','','','','','','','','','171');
INSERT INTO "Contact" VALUES(83,'','Jay','Shah','jayshah@example.com','','','','','','','','','','','','172');
INSERT INTO "Contact" VALUES(84,'','Nancy','Arroyo','nancyarroyo@example.com','','','','','','','','','','','','173');
INSERT INTO "Contact" VALUES(85,'','Aubrie','Booker','aubriebooker@example.com','','','','','','','','','','','','174');
INSERT INTO "Contact" VALUES(86,'','Emelia','Mercer','emeliamercer@example.com','','','','','','','','','','','','175');
INSERT INTO "Contact" VALUES(87,'','Taniya','Singleton','taniyasingleton@example.com','','','','','','','','','','','','18');
INSERT INTO "Contact" VALUES(88,'','Laura','Woodard','laurawoodard@example.com','','','','','','','','','','','','19');
INSERT INTO "Contact" VALUES(89,'','Yadiel','Horton','yadielhorton@example.com','','','','','','','','','','','','2');
INSERT INTO "Contact" VALUES(90,'','Shane','Gibson','shanegibson@example.com','','','','','','','','','','','','20');
INSERT INTO "Contact" VALUES(91,'','Alia','Duarte','aliaduarte@example.com','','','','','','','','','','','','21');
INSERT INTO "Contact" VALUES(92,'','Neil','Huerta','neilhuerta@example.com','','','','','','','','','','','','22');
INSERT INTO "Contact" VALUES(93,'','Makhi','Villegas','makhivillegas@example.com','','','','','','','','','','','','23');
INSERT INTO "Contact" VALUES(94,'','Elva','Velasquez','','317-855-2157','','','317-855-2157','','','502 8th Street','Oakland','CA','','','24');
INSERT INTO "Contact" VALUES(95,'','Rafael','Velasquez','rafaelvelasquez@example.com','','510-720-0537','','','','2021-05-30','502 8th Street','Oakland','CA','','','24');
INSERT INTO "Contact" VALUES(96,'','Ryan','Hardin','ryanhardin@example.com','','','','','','','','','','','','25');
INSERT INTO "Contact" VALUES(97,'','Dayana','Atkins','dayanaatkins@example.com','','','','','','','','','','','','26');
INSERT INTO "Contact" VALUES(98,'','Ray','Fischer','rayfischer@example.com','','','','','','','','','','','','28');
INSERT INTO "Contact" VALUES(99,'','Casey','Kline','caseykline@example.com','','','','','','','','','','','','29');
INSERT INTO "Contact" VALUES(100,'','Taniyah','Rios','taniyahrios@example.com','','','','','','','','','','','','3');
INSERT INTO "Contact" VALUES(101,'','Dominik','Wilkinson','dominikwilkinson@example.com','','','','','','','','','','','','30');
INSERT INTO "Contact" VALUES(102,'','Mary','Byrd','marybyrd@example.com','510-575-2217','','','510-575-2217','','','3084 Sanford Way','Oakland','CA','','','31');
INSERT INTO "Contact" VALUES(103,'','Rickey','Bishop','rbishop@example.com','','510-343-6004','','','','1976-04-05','','','','','','32');
INSERT INTO "Contact" VALUES(104,'','Ismael','Mathis','ismaelmathis@example.com','510-924-1708','','','510-924-1708','','1980-06-03','609 9th St.','Oakland','CA','','','33');
INSERT INTO "Contact" VALUES(105,'','Patrice','Wilmont','','','510-816-1924','','','','','1639 Smith Avenue','Oakland','CA','','','34');
INSERT INTO "Contact" VALUES(106,'','Grace','Poole','gracepoole@example.com','','510-409-8529','','','','2021-08-02','3502 Howard St','San Francisco','CA','','','35');
INSERT INTO "Contact" VALUES(107,'','Aron','Joyce','aronjoyce@example.com','','','','','','','','','','','','36');
INSERT INTO "Contact" VALUES(108,'','Caylee','Pollard','cayleepollard@example.com','','','','','','','','','','','','36');
INSERT INTO "Contact" VALUES(109,'','Benjamin','Robinson','benrobinson@example.com','','510-907-1073','','','','1982-01-02','129th Street','Oakland','CA','','','37');
INSERT INTO "Contact" VALUES(110,'','Diego','Case','diegocase@example.com','','','','','','','','','','','','39');
INSERT INTO "Contact" VALUES(111,'','Peyton','Craig','peytoncraig@example.com','','','','','','','','','','','','4');
INSERT INTO "Contact" VALUES(112,'','Ruth','Wu','ruthwu@example.com','','','','','','','','','','','','40');
INSERT INTO "Contact" VALUES(113,'','Isaac','Grant','isaacgrant@example.com','','','','','','','','','','','','41');
INSERT INTO "Contact" VALUES(114,'','Audrina','Rojas','audrinarojas@example.com','510-267-7332','','','510-267-7332','','2021-09-06','','','','','','42');
INSERT INTO "Contact" VALUES(115,'','Koen','Chase','koenchase@example.com','','','','','','','','','','','','43');
INSERT INTO "Contact" VALUES(116,'','Hailie','Holder','hailieholder@example.com','','','','','','','','','','','','44');
INSERT INTO "Contact" VALUES(117,'','Guillermo','Quinn','guillermoquinn@example.com','','','','','','','','','','','','46');
INSERT INTO "Contact" VALUES(118,'','Simone','Keller','simonekeller@example.com','','','','','','','','','','','','48');
INSERT INTO "Contact" VALUES(119,'','Violet','Ellis','violetellis@example.com','','','','','','','','','','','','49');
INSERT INTO "Contact" VALUES(120,'','Francesca','Oliver','francescaoliver@example.com','','','','','','','','','','','','5');
INSERT INTO "Contact" VALUES(121,'','Silas','Neal','silasneal@example.com','','','','','','','','','','','','50');
INSERT INTO "Contact" VALUES(122,'','Samir','Neal','samirneal@example.com','','','','','','','','','','','','50');
INSERT INTO "Contact" VALUES(123,'','Mira','Mcconnell','miramcconnell@example.com','','','','','','','','','','','','51');
INSERT INTO "Contact" VALUES(124,'','Aniya','Arellano','aniyaarellano@example.com','','','','','','','','','','','','52');
INSERT INTO "Contact" VALUES(125,'','Jeanette','Reese','jean.reese@example.com','415-573-5358','','','415-573-5358','','','2011 Otis Ave,','Oakland','CA','','','53');
INSERT INTO "Contact" VALUES(126,'','Jonathon','Reese','','415-573-5358','','','415-573-5358','','2012-04-05','2011 Otis Ave,','Oakland','CA','','','53');
INSERT INTO "Contact" VALUES(127,'','Khloe','Stanley','khloestanley@example.com','','','','','','','','','','','','54');
INSERT INTO "Contact" VALUES(128,'','Lynn','Byrd','','510-575-2217','','','510-575-2217','','2012-08-15','3084 Sanford Way','Oakland','CA','','','55');
INSERT INTO "Contact" VALUES(129,'','Jakayla','Glover','jakaylaglover@example.com','','','','','','','','','','','','56');
INSERT INTO "Contact" VALUES(130,'','Angelo','Lutz','angelolutz@example.com','','','','','','','','','','','','57');
INSERT INTO "Contact" VALUES(131,'','Audrina','Graves','audrinagraves@example.com','','','','','','','','','','','','58');
INSERT INTO "Contact" VALUES(132,'','Chelsea','Graves','chelseagraves@example.com','','','','','','','','','','','','58');
INSERT INTO "Contact" VALUES(133,'','Turner','Carson','turnercarson@example.com','','','','','','','','','','','','59');
INSERT INTO "Contact" VALUES(134,'','Albert','Montgomery','albertmontgomery@example.com','','','','','','','','','','','','6');
INSERT INTO "Contact" VALUES(135,'','Emelia','Fletcher','emeliafletcher@example.com','','','','','','','','','','','','60');
INSERT INTO "Contact" VALUES(136,'','Robin','Brooks','robinbrooks@example.com','555-347-3702','1-333-444-5555','','555-347-3702','','1986-05-23','2546 Harrison Street','Oakland','CA','94612','','61');
INSERT INTO "Contact" VALUES(137,'','Darryl','Graham','darrylgraham@example.com','555-347-3702','','','555-347-3702','','','2546 Harrison Street','Oakland','CA','94612','','61');
INSERT INTO "Contact" VALUES(138,'','Jason','Barnes','jasonbarnes@example.com','555-893-4763','1-333-444-5555','','555-893-4763','','2004-03-22','2340 Thompson Drive','Oakland','CA','94621','','62');
INSERT INTO "Contact" VALUES(139,'','Lynn','Barnes','lynnbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','62');
INSERT INTO "Contact" VALUES(140,'','David','Barnes','davidbarnes@example.com','555-893-4763','','','555-893-4763','','','2340 Thompson Drive','Oakland','CA','94621','','62');
INSERT INTO "Contact" VALUES(141,'','Mackenzie','Hernandez','mackenziehernandez@example.com','','','','','','','','','','','','63');
INSERT INTO "Contact" VALUES(142,'','Laura','Hernandez','laurahernandez@example.com','','','','','','','','','','','','63');
INSERT INTO "Contact" VALUES(143,'','Leon','Clayton','leonclayton@example.com','','','','','','','','','','','','64');
INSERT INTO "Contact" VALUES(144,'','Marc','Richard','marcrichard@example.com','','','','','','','','','','','','65');
INSERT INTO "Contact" VALUES(145,'','Jordan','Waller','jordanwaller@example.com','','','','','','','','','','','','66');
INSERT INTO "Contact" VALUES(146,'','Frankie','Waller','frankiewaller@example.com','','','','','','','','','','','','66');
INSERT INTO "Contact" VALUES(147,'','Jace','Hampton','jacehampton@example.com','','','','','','','','','','','','67');
INSERT INTO "Contact" VALUES(148,'','Sonia','Gentry','soniagentry@example.com','','','','','','','','','','','','68');
INSERT INTO "Contact" VALUES(149,'','Alison','Barr','alisonbarr@example.com','','','','','','','','','','','','69');
INSERT INTO "Contact" VALUES(150,'','Meredith','Cooke','meredithcooke@example.com','','','','','','','','','','','','7');
INSERT INTO "Contact" VALUES(151,'','Vu','Pham','vupham@example.com','','','','','','','','','','','','70');
INSERT INTO "Contact" VALUES(152,'','Kellen','Cooley','kellencooley@example.com','','','','','','','','','','','','71');
INSERT INTO "Contact" VALUES(153,'','Maia','Cooley','maiacooley@example.com','','','','','','','','','','','','71');
INSERT INTO "Contact" VALUES(154,'','Jay','Zimmerman','jayzimmerman@example.com','','','','','','','','','','','','72');
INSERT INTO "Contact" VALUES(155,'','Melanie','Wheeler','melaniewheeler@example.com','','','','','','','','','','','','74');
INSERT INTO "Contact" VALUES(156,'','Fernando','Beltran','fernandobeltran@example.com','','','','','','','','','','','','75');
INSERT INTO "Contact" VALUES(157,'','Yuliana','Bird','yulianabird@example.com','','','','','','','','','','','','76');
INSERT INTO "Contact" VALUES(158,'','Alyson','Duffy','alysonduffy@example.com','','','','','','','','','','','','77');
INSERT INTO "Contact" VALUES(159,'','James','Richards','jamesrichards@example.com','','','','','','','','','','','','78');
INSERT INTO "Contact" VALUES(160,'','Aaron','Valdez','aaronvaldez@example.com','','','','','','','','','','','','79');
INSERT INTO "Contact" VALUES(161,'','John','Mills','johnmills@example.com','','','','','','','','','','','','80');
INSERT INTO "Contact" VALUES(162,'','Mckayla','Morrison','mckaylamorrison@example.com','','','','','','','','','','','','8');
INSERT INTO "Contact" VALUES(163,'','Shannon','Greene','shannongreene@example.com','','','','','','','','','','','','81');
INSERT INTO "Contact" VALUES(164,'','Marco','Escobar','marcoescobar@example.com','','','','','','','','','','','','82');
INSERT INTO "Contact" VALUES(165,'','Lorelai','Gross','lorelaigross@example.com','','','','','','','','','','','','83');
INSERT INTO "Contact" VALUES(166,'','Elsa','Guerrero','elsaguerrero@example.com','','','','','','','','','','','','84');
INSERT INTO "Contact" VALUES(167,'','Yesenia','Ritter','yeseniaritter@example.com','','','','','','','','','','','','85');
INSERT INTO "Contact" VALUES(168,'','Abraham','Sims','abrahamsims@example.com','','','','','','','','','','','','86');
INSERT INTO "Contact" VALUES(169,'','Kyle','Huffman','kylehuffman@example.com','','','','','','','','','','','','87');
INSERT INTO "Contact" VALUES(170,'','Cora','Hall','corahall@example.com','','','','','','','','','','','','88');
INSERT INTO "Contact" VALUES(171,'','Isaac','Barker','isaacbarker@example.com','','','','','','','','','','','','89');
INSERT INTO "Contact" VALUES(172,'','Kailey','Glass','kaileyglass@example.com','','','','','','','','','','','','90');
INSERT INTO "Contact" VALUES(173,'','Dalia','Osborn','daliaosborn@example.com','','','','','','','','','','','','9');
INSERT INTO "Contact" VALUES(174,'','Delilah','Ibarra','delilahibarra@example.com','','','','','','','','','','','','91');
INSERT INTO "Contact" VALUES(175,'','Zackery','Morgan','zackerymorgan@example.com','','','','','','','','','','','','92');
INSERT INTO "Contact" VALUES(176,'','Jaylin','Morgan','jaylinmorgan@example.com','','','','','','','','','','','','92');
INSERT INTO "Contact" VALUES(177,'','Duncan','Bowers','duncanbowers@example.com','','','','','','','','','','','','93');
INSERT INTO "Contact" VALUES(178,'','Lauryn','Odom','laurynodom@example.com','','','','','','','','','','','','94');
INSERT INTO "Contact" VALUES(179,'','Yusef','Flores','yusefflores@example.com','','','','','','','','','','','','95');
INSERT INTO "Contact" VALUES(180,'','Semaj','Wall','semajwall@example.com','','','','','','','','','','','','96');
INSERT INTO "Contact" VALUES(181,'','Eliezer','Bray','eliezerbray@example.com','','','','','','','','','','','','73');
INSERT INTO "Contact" VALUES(182,'','Jaden','Conner','jadenconner@example.com','','','','','','','','','','','','97');
INSERT INTO "Contact" VALUES(183,'','Steven','Harper','stevenharper@example.com','','','','','','','','','','','','98');
INSERT INTO "Contact" VALUES(184,'','Karissa','Aguilar','karissaaguilar@example.com','','','','','','','','','','','','99');
CREATE TABLE "ProgramCohort__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Program__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ProgramCohort__c" VALUES(1,'Job Readiness 2019-2021','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2022-03-07','2020-03-06','Active','1');
INSERT INTO "ProgramCohort__c" VALUES(2,'Eastgate','Eastgate neighborhood service area','','2020-08-25','Active','1');
INSERT INTO "ProgramCohort__c" VALUES(3,'Fall 2019 STEM','','2020-11-13','2020-07-31','Active','3');
INSERT INTO "ProgramCohort__c" VALUES(4,'Genellen','Genellen neighborhood service area','','2020-07-31','Active','3');
INSERT INTO "ProgramCohort__c" VALUES(5,'Riverside','Riverside neighborhood service area','','2019-12-26','Active','5');
INSERT INTO "ProgramCohort__c" VALUES(6,'Highpoint','Highpoint neighborhood service area','','2019-12-26','Active','5');
CREATE TABLE "ProgramEngagement__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"ApplicationDate__c" VARCHAR(255), 
	"AutoName_Override__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"Role__c" VARCHAR(255), 
	"Stage__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"Account__c" VARCHAR(255), 
	"Contact__c" VARCHAR(255), 
	"Program__c" VARCHAR(255), 
	"ProgramCohort__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ProgramEngagement__c" VALUES(1,'Robin Brooks 2021-11-12: Financial Literacy Program','','False','','Client','Active','2021-06-03','','136','7','');
INSERT INTO "ProgramEngagement__c" VALUES(2,'Taniyah Rios 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','100','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(3,'Khloe Stanley 2021-01-06: Mobile Middle School STEM Program','','False','','Client','Enrolled','2020-12-28','','127','3','');
INSERT INTO "ProgramEngagement__c" VALUES(4,'Patrice Wilmont 2021-06-03: ESL Program','','False','','Client','Waitlisted','','','105','9','');
INSERT INTO "ProgramEngagement__c" VALUES(5,'Diego Case 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','110','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(6,'Isaac Grant 2020-10-06: Housing Assistance Program','','False','','Client','Active','2020-09-27','','113','8','');
INSERT INTO "ProgramEngagement__c" VALUES(7,'Audrina Rojas 2021-06-03: ESL Program','2021-06-20','False','','Client','Applied','','','114','9','');
INSERT INTO "ProgramEngagement__c" VALUES(8,'Hailie Holder 2021-01-06: Housing Assistance Program','','False','','Client','Enrolled','2020-12-28','','116','8','');
INSERT INTO "ProgramEngagement__c" VALUES(9,'Samir Neal 2020-08-09: ESL Program','','False','','Client','Active','2020-07-31','','122','9','');
INSERT INTO "ProgramEngagement__c" VALUES(10,'Angelo Lutz 2020-11-04: Housing Assistance Program','','False','','Client','Enrolled','2020-10-26','','130','8','');
INSERT INTO "ProgramEngagement__c" VALUES(11,'Turner Carson 2020-11-12: Drug and Alcohol Recovery Management','','False','','Client','Enrolled','2020-11-03','','133','5','');
INSERT INTO "ProgramEngagement__c" VALUES(12,'Robin Brooks 2020-08-04: Job Readiness Program','2020-07-24','False','','Client','Active','2020-07-26','','136','1','1');
INSERT INTO "ProgramEngagement__c" VALUES(13,'Jason Barnes 2020-08-09: Financial Literacy Program','2020-07-14','False','','Client','Active','2020-07-31','','138','7','');
INSERT INTO "ProgramEngagement__c" VALUES(14,'Leon Clayton 2020-08-10: No More Food Deserts Advocacy','','False','','Volunteer','Active','2020-08-01','','143','4','');
INSERT INTO "ProgramEngagement__c" VALUES(15,'Marc Richard 2020-07-12: No More Food Deserts Advocacy','','False','','Volunteer','Active','2020-07-03','','144','4','');
INSERT INTO "ProgramEngagement__c" VALUES(16,'Jordan Waller 2020-08-09: Remedial Reading Program','','False','','Client','Active','2020-07-31','','145','10','');
INSERT INTO "ProgramEngagement__c" VALUES(17,'Frankie Waller 2020-11-03: Financial Literacy Program','','False','','Client','Active','2020-10-25','','146','7','');
INSERT INTO "ProgramEngagement__c" VALUES(18,'Jace Hampton 2020-12-08: After School Program, Ages 11-13','','False','','Client','Enrolled','2020-11-29','','147','2','');
INSERT INTO "ProgramEngagement__c" VALUES(19,'Sonia Gentry 2020-08-09: After School Program, Ages 11-13','','False','2020-11-13','Client','Active','2020-07-31','','148','2','');
INSERT INTO "ProgramEngagement__c" VALUES(20,'Sonia Gentry 2020-11-04: School Lunch Program','','False','','Client','Enrolled','2020-10-26','','148','6','');
INSERT INTO "ProgramEngagement__c" VALUES(21,'Alison Barr 2020-01-07: Drug and Alcohol Recovery Management','','False','','Client','Enrolled','2019-12-29','','149','5','');
INSERT INTO "ProgramEngagement__c" VALUES(22,'Kellen Cooley 2020-11-04: After School Program, Ages 11-13','','False','','Client','Active','2020-10-26','','152','2','');
INSERT INTO "ProgramEngagement__c" VALUES(23,'Jay Zimmerman 2020-10-14: No More Food Deserts Advocacy','','False','','Volunteer','Active','2020-10-05','','154','4','');
INSERT INTO "ProgramEngagement__c" VALUES(24,'Fernando Beltran 2020-11-04: ESL Program','','False','','Client','Enrolled','2020-10-26','','156','9','');
INSERT INTO "ProgramEngagement__c" VALUES(25,'Yuliana Bird 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','157','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(26,'James Richards 2020-12-08: Housing Assistance Program','','False','','Client','Enrolled','2020-11-29','','159','8','');
INSERT INTO "ProgramEngagement__c" VALUES(27,'Aaron Valdez 2020-09-04: No More Food Deserts Advocacy','','False','','Volunteer','Active','2020-08-26','','160','4','');
INSERT INTO "ProgramEngagement__c" VALUES(28,'John Mills 2020-08-02: No More Food Deserts Advocacy','','False','','Volunteer','Active','2020-07-24','','161','4','');
INSERT INTO "ProgramEngagement__c" VALUES(29,'Shannon Greene 2020-12-10: No More Food Deserts Advocacy','','False','','Volunteer','Enrolled','2020-12-01','','163','4','');
INSERT INTO "ProgramEngagement__c" VALUES(30,'Marco Escobar 2020-08-09: Remedial Reading Program','','False','','Client','Active','2020-07-31','','164','10','');
INSERT INTO "ProgramEngagement__c" VALUES(31,'Marco Escobar 2020-08-09: After School Program, Ages 11-13','','False','','Client','Active','2020-07-31','','164','2','');
INSERT INTO "ProgramEngagement__c" VALUES(32,'Abraham Sims 2020-08-09: Mobile Middle School STEM Program','','False','','Client','Active','2020-07-31','','168','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(33,'Abraham Sims 2020-12-08: School Lunch Program','','False','','Client','Enrolled','2020-11-29','','168','6','');
INSERT INTO "ProgramEngagement__c" VALUES(34,'Anthony Hill 2020-11-21: Job Readiness Program','','False','','Client','Enrolled','2020-11-12','','17','1','1');
INSERT INTO "ProgramEngagement__c" VALUES(35,'Isaac Barker 2020-08-09: Financial Literacy Program','','False','','Client','Active','2020-07-31','','171','7','');
INSERT INTO "ProgramEngagement__c" VALUES(36,'Dalia Osborn 2020-12-08: Housing Assistance Program','','False','','Client','Enrolled','2020-11-29','','173','8','');
INSERT INTO "ProgramEngagement__c" VALUES(37,'Zackery Morgan 2020-12-09: No More Food Deserts Advocacy','','False','','Volunteer','Enrolled','2020-11-30','','175','4','');
INSERT INTO "ProgramEngagement__c" VALUES(38,'Zackery Morgan 2020-09-20: Drug and Alcohol Recovery Management','','False','','Client','Active','2020-09-11','','175','5','');
INSERT INTO "ProgramEngagement__c" VALUES(39,'Jaylin Morgan 2020-08-24: Housing Assistance Program','','False','','Client','Active','2020-08-15','','176','8','');
INSERT INTO "ProgramEngagement__c" VALUES(40,'Yusef Flores 2020-08-09: Financial Literacy Program','','False','','Client','Active','2020-07-31','','179','7','');
INSERT INTO "ProgramEngagement__c" VALUES(41,'Yusef Flores 2020-12-08: ESL Program','','False','','Client','Enrolled','2020-11-29','','179','9','');
INSERT INTO "ProgramEngagement__c" VALUES(42,'Semaj Wall 2020-08-09: Financial Literacy Program','','False','','Client','Active','2020-07-31','','180','7','');
INSERT INTO "ProgramEngagement__c" VALUES(43,'Semaj Wall 2020-09-03: ESL Program','','False','','Client','Active','2020-08-25','','180','9','');
INSERT INTO "ProgramEngagement__c" VALUES(44,'Eliezer Bray 2021-01-11: No More Food Deserts Advocacy','','False','','Volunteer','Enrolled','2021-01-02','','181','4','');
INSERT INTO "ProgramEngagement__c" VALUES(45,'Steven Harper 2020-09-12: Financial Literacy Program','2020-08-01','False','','Client','Enrolled','2020-09-03','','183','7','');
INSERT INTO "ProgramEngagement__c" VALUES(46,'Arlene Baker 2020-08-04: Job Readiness Program','2020-05-10','False','','Client','Active','2020-07-26','','23','1','1');
INSERT INTO "ProgramEngagement__c" VALUES(47,'Arlene Baker 2021-06-07: Financial Literacy Program','','False','','Client','Enrolled','2021-05-29','','23','7','');
INSERT INTO "ProgramEngagement__c" VALUES(48,'Ariella Branch 2021-01-06: ESL Program','','False','','Client','Enrolled','2020-12-28','','24','9','');
INSERT INTO "ProgramEngagement__c" VALUES(49,'Maya Johnson 2020-11-04: After School Program, Ages 11-13','','False','','Client','Enrolled','2020-10-26','','27','2','');
INSERT INTO "ProgramEngagement__c" VALUES(50,'Barbara Johnson 2020-08-09: ESL Program','2020-05-25','False','','Client','Active','2020-07-31','','28','9','');
INSERT INTO "ProgramEngagement__c" VALUES(51,'Alana Owen 2020-08-09: Mobile Middle School STEM Program','','False','','Client','Active','2020-07-31','','33','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(52,'Alana Owen 2020-11-21: School Lunch Program','2020-07-31','False','','Client','Active','2020-11-12','','33','6','');
INSERT INTO "ProgramEngagement__c" VALUES(53,'Naima Crawford 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','36','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(54,'Naima Crawford 2021-01-06: School Lunch Program','','False','','Client','Enrolled','2020-12-28','','36','6','');
INSERT INTO "ProgramEngagement__c" VALUES(55,'Adrianna Norman 2020-12-08: Job Readiness Program','','False','','Client','Enrolled','2020-11-29','','39','1','');
INSERT INTO "ProgramEngagement__c" VALUES(56,'Gary Wood 2020-09-04: Job Readiness Program','','False','','Client','Active','2020-08-26','','41','1','');
INSERT INTO "ProgramEngagement__c" VALUES(57,'Javon Rodgers 2020-09-03: After School Program, Ages 11-13','','False','','Client','Active','2020-08-25','','45','2','');
INSERT INTO "ProgramEngagement__c" VALUES(58,'Jessica Woods 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','48','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(59,'Christina Webster 2021-01-06: Remedial Reading Program','','False','','Client','Enrolled','2020-12-28','','50','10','');
INSERT INTO "ProgramEngagement__c" VALUES(60,'Emilie Costa 2020-12-08: Remedial Reading Program','','False','','Client','Enrolled','2020-11-29','','51','10','');
INSERT INTO "ProgramEngagement__c" VALUES(61,'Emilie Costa 2021-01-11: After School Program, Ages 11-13','','False','','Client','Enrolled','2021-01-02','','51','2','');
INSERT INTO "ProgramEngagement__c" VALUES(62,'Lucia Cain 2020-10-08: Financial Literacy Program','','False','','Client','Enrolled','2020-09-29','','53','7','');
INSERT INTO "ProgramEngagement__c" VALUES(63,'Alice Irwin 2020-11-04: Financial Literacy Program','','False','','Client','Enrolled','2020-10-26','','56','7','');
INSERT INTO "ProgramEngagement__c" VALUES(64,'Fabian Hughes 2020-11-21: Remedial Reading Program','2020-10-26','False','','Client','Enrolled','2020-11-12','','57','10','');
INSERT INTO "ProgramEngagement__c" VALUES(65,'Fabian Hughes 2020-08-09: After School Program, Ages 11-13','','False','','Client','Active','2020-07-31','','57','2','');
INSERT INTO "ProgramEngagement__c" VALUES(66,'Fabian Hughes 2020-08-09: School Lunch Program','','False','','Client','Active','2020-07-31','','57','6','');
INSERT INTO "ProgramEngagement__c" VALUES(67,'Josie Mcclure 2020-08-09: Financial Literacy Program','','False','','Client','Enrolled','2020-07-31','','58','7','');
INSERT INTO "ProgramEngagement__c" VALUES(68,'Joe Salinas 2021-01-09: Job Readiness Program','','False','','Client','Enrolled','2020-12-31','','6','1','');
INSERT INTO "ProgramEngagement__c" VALUES(69,'Nico Rivers 2020-08-19: Housing Assistance Program','','False','','Client','Active','2020-08-10','','64','8','');
INSERT INTO "ProgramEngagement__c" VALUES(70,'Aubrie Booker 2020-12-08: Mobile Middle School STEM Program','','False','','Client','Enrolled','2020-11-29','','85','3','');
INSERT INTO "ProgramEngagement__c" VALUES(71,'Emelia Mercer 2020-09-04: Housing Assistance Program','','False','','Client','Active','2020-08-26','','86','8','');
INSERT INTO "ProgramEngagement__c" VALUES(72,'Taniya Singleton 2020-11-04: No More Food Deserts Advocacy','','False','','Volunteer','Enrolled','2020-10-26','','87','4','');
INSERT INTO "ProgramEngagement__c" VALUES(73,'Tom Higgins 2020-08-09: Remedial Reading Program','2020-03-03','False','','Client','Active','2020-07-31','','9','10','');
INSERT INTO "ProgramEngagement__c" VALUES(74,'Tom Higgins 2020-08-03: After School Program, Ages 11-13','2020-07-20','False','','Client','Active','2020-07-25','','9','2','');
INSERT INTO "ProgramEngagement__c" VALUES(75,'Tom Higgins 2020-08-03: School Lunch Program','2020-04-29','False','','Client','Enrolled','2020-07-25','','9','6','');
INSERT INTO "ProgramEngagement__c" VALUES(76,'Neil Huerta 2019-12-10: Drug and Alcohol Recovery Management','','False','','Client','Enrolled','2019-12-01','','92','5','');
INSERT INTO "ProgramEngagement__c" VALUES(77,'Rafael Velasquez 2021-06-03: ESL Program','2021-06-20','False','','Client','Applied','','','95','9','');
INSERT INTO "ProgramEngagement__c" VALUES(78,'Casey Kline 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','99','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(79,'Tom Higgins 2020-05-01: Housing Assistance Program','2020-04-16','False','','Client','Enrolled','2020-04-22','107','9','8','');
INSERT INTO "ProgramEngagement__c" VALUES(80,'Alia Duarte 2020-08-09: Mobile Middle School STEM Program','','False','','Client','Active','2020-07-31','21','91','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(81,'Marcus Huynh 2020-12-10: No More Food Deserts Advocacy','','False','','Volunteer','Enrolled','2020-12-01','','69','4','');
INSERT INTO "ProgramEngagement__c" VALUES(82,'Olive Leach 2021-06-03: Remedial Reading Program','2021-06-21','False','','Client','Waitlisted','','','70','10','');
INSERT INTO "ProgramEngagement__c" VALUES(83,'Tatiana Lang 2020-12-08: Mobile Middle School STEM Program','','False','','Client','Enrolled','2020-11-29','','72','3','');
INSERT INTO "ProgramEngagement__c" VALUES(84,'Ayanna Gonzalez 2020-08-09: Mobile Middle School STEM Program','','False','2020-11-13','Client','Active','2020-07-31','','80','3','4');
INSERT INTO "ProgramEngagement__c" VALUES(85,'Jay Shah 2020-11-04: Mobile Middle School STEM Program','','False','','Client','Enrolled','2020-10-26','','83','3','');
CREATE TABLE "Program__c" (
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
INSERT INTO "Program__c" VALUES(1,'Job Readiness Program','This program is designed to assist adults who have experienced a prolonged absence from the workforce for a variety of reasons such as caring for a family member, protracted joblessness following a layoff or return from a short period of incarceration for a minor crime. It''s also intended to provide support for adults in the workforce who are looking to stabilize their housing or working situation.','2022-03-07','Employment','2020-03-06','Active','Assisting adults who have experienced a prolonged absence from the workforce or are  seeking to progressively stabilize their experience in the workforce.','Adults under the poverty line, seeking to  re-enter the  workforce after an absence or seeking to progressively stabilize their experience in the workforce');
INSERT INTO "Program__c" VALUES(2,'After School Program, Ages 11-13','This program''s goal is to provide  a safe and monitored after school activity for district 31 middle school children whose parents work or are otherwise unavailable weekdays when school is in session. It runs from 3:00-5:30 PM on weekdays. Children can attend in a drop-in basis if they can produce a valid student ID card. There is a nominal fee to participate in the program. This fee can be paid out of other monetary assistance program offered to qualifying families with children in district 31.','2021-04-22','Education','2020-07-23','Active','An after school program for children enrolled in district 31.','Children aged 11-13 enrolled in school district 31');
INSERT INTO "Program__c" VALUES(3,'Mobile Middle School STEM Program','The program focuses on bringing hands-on mid-level STEM courses into the classroom at least twice a week, and promotes awareness of the STEM fields and occupations. It provides standards-based structured inquiry-based and real-world problem-based learning, connecting all four of the STEM subjects, science, technology, engineering, and math. The goal is to pique students'' interest in them wanting to pursue the courses, not because they have to.','2021-04-07','Education','2020-07-31','Active','The program brings hands-on mid-level STEM courses into the classroom at least twice a week','Middle School students aged 11-14');
INSERT INTO "Program__c" VALUES(4,'No More Food Deserts Advocacy','Advocacy program calling attention to and seeking remediation for the area''s lack of affordable grocery store options. This is an awareness-building campaign intended to garner support and funding for affordable alternatives from grantmakers and to be supported by the city and county councils.','','Advocacy','2020-06-22','Active','Calling attention to and seeking remediation for the area''s lack of affordable grocery store options.','Area residents, city and county government and grantmakers funding in the region.');
INSERT INTO "Program__c" VALUES(5,'Drug and Alcohol Recovery Management','Recovery management and mental health services addressing  alcohol and drug dependency, and opioid addiction.','2020-11-23','','2019-11-24','Active','Recovery program for adults with dependency on alcohol, drugs,  or opioids.','Adult individuals, families and communities affected by addiction to alcohol and other drugs.');
INSERT INTO "Program__c" VALUES(6,'School Lunch Program','Public Schools Nutrition Services fuels over 14,600 student lunches and 5,800 breakfasts each day and adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','2021-04-21','Food and Nutrition','2020-07-25','Active','A school lunch program that adheres to the highest level of national nutrition standards and provides many locally sourced fruits, vegetables and beans daily.','Children under 18  enrolled in school district 31');
INSERT INTO "Program__c" VALUES(7,'Financial Literacy Program','The Financial Literacy program teaches students the basics of money management: budgeting, saving, debt, investing, and giving. That knowledge lays a foundation for students to build strong money habits early on and avoid many of the mistakes that lead to lifelong money struggles.','','Education','2020-07-26','Active','Teaches students the basics of money management.','Children aged 15-18 enrolled in school district 31');
INSERT INTO "Program__c" VALUES(8,'Housing Assistance Program','The Housing Assistance program provides assistance for families with children under the age of 18. The family shelters provide both short-term ( and also longer term up to 3 months) emergency shelter. Case management services are available to applicants including referrals to other non-profit needed resources, counseling, food, personal hygiene supplies and free bus tickets. The primary goal of the program is to help families find more permanent housing.','','Housing','2020-03-23','Active','Providing assistance for families with children under the age of 18.','Families with children under the age of 18');
INSERT INTO "Program__c" VALUES(9,'ESL Program','The primary objective of the ESL program is to teach the students how to read, write, speak and listen to English to be more successful in the all-English classroom setting. Spanish is the language spoken most often by our English learners. Other languages include: German, Chinese, Haitian Creole, Arabic, and some Indian Dialects from Mexico and Guatemala.','2021-04-21','','2020-07-31','Active','A language instruction educational program for students whose primary language is not English.','A practical conversational  English class for those whose primary language is not English.');
INSERT INTO "Program__c" VALUES(10,'Remedial Reading Program','A structured reading assistance program designed targeted at students who have underperformed on state reading comprehension tests.','2021-04-07','Education','2020-04-24','Active','Provides students the support they need to achieve an age appropriate reading level.','Children under 18  enrolled in school district 31');
CREATE TABLE "ServiceDelivery__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"AutonameOverride__c" VARCHAR(255), 
	"DeliveryDate__c" VARCHAR(255), 
	"Quantity__c" VARCHAR(255), 
	"AttendanceStatus__c" VARCHAR(255), 
	"Service__c" VARCHAR(255), 
	"Account__c" VARCHAR(255), 
	"Contact__c" VARCHAR(255), 
	"ProgramEngagement__c" VARCHAR(255), 
	"Service_Provider__c" VARCHAR(255), 
	"ServiceSession__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ServiceDelivery__c" VALUES(1,'Casey Kline 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(2,'Casey Kline 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(3,'Casey Kline 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(4,'Casey Kline 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(5,'Casey Kline 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(6,'Casey Kline 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(7,'Casey Kline 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(8,'Leon Clayton 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','143','14','','');
INSERT INTO "ServiceDelivery__c" VALUES(9,'Marc Richard 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','144','15','','');
INSERT INTO "ServiceDelivery__c" VALUES(10,'John Mills 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','161','28','','');
INSERT INTO "ServiceDelivery__c" VALUES(11,'Shannon Greene 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','163','29','','');
INSERT INTO "ServiceDelivery__c" VALUES(12,'Zackery Morgan 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','175','37','','');
INSERT INTO "ServiceDelivery__c" VALUES(13,'Eliezer Bray 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','181','44','','');
INSERT INTO "ServiceDelivery__c" VALUES(14,'Marcus Huynh 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','69','81','','');
INSERT INTO "ServiceDelivery__c" VALUES(15,'Taniya Singleton 2020-08-09: Town Hall Meeting, 1/8/2020','False','2020-07-31','1.0','','10','','87','72','','');
INSERT INTO "ServiceDelivery__c" VALUES(16,'Leon Clayton 2020-04-11: Letter writing campaign to Council Members','False','2020-04-02','1.0','','11','','143','14','','');
INSERT INTO "ServiceDelivery__c" VALUES(17,'Marc Richard 2020-03-13: Letter writing campaign to Council Members','False','2020-03-04','1.0','','11','','144','15','','');
INSERT INTO "ServiceDelivery__c" VALUES(18,'Jay Zimmerman 2020-06-13: Letter writing campaign to Council Members','False','2020-06-04','1.0','','11','','154','23','','');
INSERT INTO "ServiceDelivery__c" VALUES(19,'Aaron Valdez 2020-05-03: Letter writing campaign to Council Members','False','2020-04-24','1.0','','11','','160','27','','');
INSERT INTO "ServiceDelivery__c" VALUES(20,'John Mills 2020-04-03: Letter writing campaign to Council Members','False','2020-03-25','1.0','','11','','161','28','','');
INSERT INTO "ServiceDelivery__c" VALUES(21,'Shannon Greene 2020-08-09: Letter writing campaign to Council Members','False','2020-07-31','1.0','','11','','163','29','','');
INSERT INTO "ServiceDelivery__c" VALUES(22,'Zackery Morgan 2020-08-08: Letter writing campaign to Council Members','False','2020-07-30','1.0','','11','','175','37','','');
INSERT INTO "ServiceDelivery__c" VALUES(23,'Eliezer Bray 2020-08-09: Letter writing campaign to Council Members','False','2020-07-31','1.0','','11','','181','44','','');
INSERT INTO "ServiceDelivery__c" VALUES(24,'Taniya Singleton 2020-07-03: Letter writing campaign to Council Members','False','2020-06-24','1.0','','11','','87','72','','');
INSERT INTO "ServiceDelivery__c" VALUES(25,'Turner Carson 2020-07-11: 12 Step Recovery Program','False','2020-07-02','1.0','','12','','133','11','','');
INSERT INTO "ServiceDelivery__c" VALUES(26,'Turner Carson 2020-07-31: 12 Step Recovery Program','False','2020-07-22','1.0','','12','','133','11','','');
INSERT INTO "ServiceDelivery__c" VALUES(27,'Turner Carson 2020-07-18: 12 Step Recovery Program','False','2020-07-09','1.0','','12','','133','11','','');
INSERT INTO "ServiceDelivery__c" VALUES(28,'Turner Carson 2020-08-08: 12 Step Recovery Program','False','2020-07-30','1.0','','12','','133','11','','');
INSERT INTO "ServiceDelivery__c" VALUES(29,'Turner Carson 2020-07-25: 12 Step Recovery Program','False','2020-07-16','1.0','','12','','133','11','','');
INSERT INTO "ServiceDelivery__c" VALUES(30,'Zackery Morgan 2020-08-08: 12 Step Recovery Program','False','2020-07-30','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(31,'Zackery Morgan 2020-08-08: 12 Step Recovery Program','False','2020-07-30','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(32,'Zackery Morgan 2020-05-23: 12 Step Recovery Program','False','2020-05-14','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(33,'Zackery Morgan 2020-07-31: 12 Step Recovery Program','False','2020-07-22','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(34,'Zackery Morgan 2020-05-30: 12 Step Recovery Program','False','2020-05-21','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(35,'Zackery Morgan 2020-06-06: 12 Step Recovery Program','False','2020-05-28','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(36,'Zackery Morgan 2020-06-13: 12 Step Recovery Program','False','2020-06-04','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(37,'Zackery Morgan 2020-07-04: 12 Step Recovery Program','False','2020-06-25','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(38,'Zackery Morgan 2020-07-11: 12 Step Recovery Program','False','2020-07-02','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(39,'Zackery Morgan 2020-06-20: 12 Step Recovery Program','False','2020-06-11','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(40,'Zackery Morgan 2020-06-27: 12 Step Recovery Program','False','2020-06-18','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(41,'Zackery Morgan 2020-07-25: 12 Step Recovery Program','False','2020-07-16','1.0','','12','','175','38','','');
INSERT INTO "ServiceDelivery__c" VALUES(42,'Neil Huerta 2020-08-14: 12 Step Recovery Program','False','2020-08-05','1.0','','12','','92','76','','');
INSERT INTO "ServiceDelivery__c" VALUES(43,'Neil Huerta 2020-08-17: 12 Step Recovery Program','False','2020-08-08','1.0','','12','','92','76','','');
INSERT INTO "ServiceDelivery__c" VALUES(44,'Sonia Gentry 2020-07-04: Subsidized Lunch','False','2020-06-25','','','13','','148','20','','');
INSERT INTO "ServiceDelivery__c" VALUES(45,'Sonia Gentry 2020-07-03: Subsidized Lunch','False','2020-06-24','','','13','','148','20','','');
INSERT INTO "ServiceDelivery__c" VALUES(46,'Sonia Gentry 2020-07-03: Subsidized Lunch','False','2020-06-24','','','13','','148','20','','');
INSERT INTO "ServiceDelivery__c" VALUES(47,'Abraham Sims 2020-08-08: Subsidized Lunch','False','2020-07-30','','','13','','168','33','','');
INSERT INTO "ServiceDelivery__c" VALUES(48,'Abraham Sims 2020-08-11: Subsidized Lunch','False','2020-08-02','','','13','','168','33','','');
INSERT INTO "ServiceDelivery__c" VALUES(49,'Abraham Sims 2020-08-07: Subsidized Lunch','False','2020-07-29','','','13','','168','33','','');
INSERT INTO "ServiceDelivery__c" VALUES(50,'Abraham Sims 2020-08-10: Subsidized Lunch','False','2020-08-01','','','13','','168','33','','');
INSERT INTO "ServiceDelivery__c" VALUES(51,'Abraham Sims 2020-08-14: Subsidized Lunch','False','2020-08-05','','','13','','168','33','','');
INSERT INTO "ServiceDelivery__c" VALUES(52,'Abraham Sims 2020-08-09: Subsidized Lunch','False','2020-07-31','','','13','','168','33','','');
INSERT INTO "ServiceDelivery__c" VALUES(53,'Naima Crawford 2020-07-04: Subsidized Lunch','False','2020-06-25','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(54,'Naima Crawford 2020-07-03: Subsidized Lunch','False','2020-06-24','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(55,'Naima Crawford 2020-07-05: Subsidized Lunch','False','2020-06-26','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(56,'Naima Crawford 2020-07-07: Subsidized Lunch','False','2020-06-28','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(57,'Naima Crawford 2020-07-13: Subsidized Lunch','False','2020-07-04','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(58,'Naima Crawford 2020-07-11: Subsidized Lunch','False','2020-07-02','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(59,'Naima Crawford 2020-07-12: Subsidized Lunch','False','2020-07-03','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(60,'Naima Crawford 2020-07-06: Subsidized Lunch','False','2020-06-27','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(61,'Naima Crawford 2020-07-10: Subsidized Lunch','False','2020-07-01','1.0','','13','','36','54','','');
INSERT INTO "ServiceDelivery__c" VALUES(62,'Fabian Hughes 2020-04-17: Subsidized Lunch','False','2020-04-08','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(63,'Fabian Hughes 2020-04-19: Subsidized Lunch','False','2020-04-10','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(64,'Fabian Hughes 2020-04-20: Subsidized Lunch','False','2020-04-11','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(65,'Fabian Hughes 2020-04-11: Subsidized Lunch','False','2020-04-02','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(66,'Fabian Hughes 2020-04-10: Subsidized Lunch','False','2020-04-01','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(67,'Fabian Hughes 2020-04-12: Subsidized Lunch','False','2020-04-03','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(68,'Fabian Hughes 2020-04-18: Subsidized Lunch','False','2020-04-09','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(69,'Fabian Hughes 2020-04-21: Subsidized Lunch','False','2020-04-12','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(70,'Fabian Hughes 2020-04-24: Subsidized Lunch','False','2020-04-15','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(71,'Fabian Hughes 2020-04-13: Subsidized Lunch','False','2020-04-04','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(72,'Fabian Hughes 2020-04-14: Subsidized Lunch','False','2020-04-05','1.0','','13','','57','66','','');
INSERT INTO "ServiceDelivery__c" VALUES(73,'Tom Higgins 2020-06-12: Subsidized Lunch','False','2020-06-03','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(74,'Tom Higgins 2020-05-10: Subsidized Lunch','False','2020-05-01','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(75,'Tom Higgins 2020-06-14: Subsidized Lunch','False','2020-06-05','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(76,'Tom Higgins 2020-06-09: Subsidized Lunch','False','2020-05-31','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(77,'Tom Higgins 2020-05-09: Subsidized Lunch','False','2020-04-30','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(78,'Tom Higgins 2020-05-11: Subsidized Lunch','False','2020-05-02','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(79,'Tom Higgins 2020-05-12: Subsidized Lunch','False','2020-05-03','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(80,'Tom Higgins 2020-06-13: Subsidized Lunch','False','2020-06-04','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(81,'Tom Higgins 2020-06-08: Subsidized Lunch','False','2020-05-30','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(82,'Tom Higgins 2020-05-03: Subsidized Lunch','False','2020-04-24','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(83,'Tom Higgins 2020-06-07: Subsidized Lunch','False','2020-05-29','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(84,'Tom Higgins 2020-05-02: Subsidized Lunch','False','2020-04-23','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(85,'Tom Higgins 2020-06-06: Subsidized Lunch','False','2020-05-28','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(86,'Tom Higgins 2020-06-05: Subsidized Lunch','False','2020-05-27','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(87,'Tom Higgins 2020-06-02: Subsidized Lunch','False','2020-05-24','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(88,'Tom Higgins 2020-05-04: Subsidized Lunch','False','2020-04-25','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(89,'Tom Higgins 2020-06-15: Subsidized Lunch','False','2020-06-06','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(90,'Tom Higgins 2020-05-05: Subsidized Lunch','False','2020-04-26','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(91,'Tom Higgins 2020-05-08: Subsidized Lunch','False','2020-04-29','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(92,'Tom Higgins 2020-05-15: Subsidized Lunch','False','2020-05-06','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(93,'Tom Higgins 2020-06-07: Subsidized Lunch','False','2020-05-29','1.0','','13','','9','75','','');
INSERT INTO "ServiceDelivery__c" VALUES(94,'Maya Johnson 2020-07-14: After School Activities','False','2020-07-05','2.0','','7','','27','49','','');
INSERT INTO "ServiceDelivery__c" VALUES(95,'Javon Rodgers 2020-08-08: After School Activities','False','2020-07-30','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(96,'Javon Rodgers 2020-05-09: After School Activities','False','2020-04-30','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(97,'Javon Rodgers 2020-06-27: After School Activities','False','2020-06-18','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(98,'Javon Rodgers 2020-07-18: After School Activities','False','2020-07-09','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(99,'Javon Rodgers 2020-07-04: After School Activities','False','2020-06-25','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(100,'Javon Rodgers 2020-07-11: After School Activities','False','2020-07-02','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(101,'Javon Rodgers 2020-05-16: After School Activities','False','2020-05-07','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(102,'Javon Rodgers 2020-05-23: After School Activities','False','2020-05-14','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(103,'Javon Rodgers 2020-05-02: After School Activities','False','2020-04-23','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(104,'Tom Higgins 2020-05-12: Grade 1-8 Reading Tutoring','False','2020-05-03','4.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(105,'Tom Higgins 2020-05-05: Grade 1-8 Reading Tutoring','False','2020-04-26','4.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(106,'Tom Higgins 2020-06-23: Grade 1-8 Reading Tutoring','False','2020-06-14','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(107,'Tom Higgins 2020-04-14: Grade 1-8 Reading Tutoring','False','2020-04-05','4.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(108,'Tom Higgins 2020-06-30: Grade 1-8 Reading Tutoring','False','2020-06-21','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(109,'Tom Higgins 2020-06-09: Grade 1-8 Reading Tutoring','False','2020-05-31','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(110,'Tom Higgins 2020-08-11: Grade 1-8 Reading Tutoring','False','2020-08-02','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(111,'Tom Higgins 2020-06-16: Grade 1-8 Reading Tutoring','False','2020-06-07','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(112,'Tom Higgins 2020-05-19: Grade 1-8 Reading Tutoring','False','2020-05-10','1.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(113,'Tom Higgins 2020-05-26: Grade 1-8 Reading Tutoring','False','2020-05-17','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(114,'Jace Hampton 2020-08-08: After School Activities','False','2020-07-30','1.0','','7','','147','18','','');
INSERT INTO "ServiceDelivery__c" VALUES(115,'Sonia Gentry 2020-07-19: After School Activities','False','2020-07-10','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(116,'Sonia Gentry 2020-05-17: After School Activities','False','2020-05-08','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(117,'Sonia Gentry 2020-06-14: After School Activities','False','2020-06-05','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(118,'Sonia Gentry 2020-07-05: After School Activities','False','2020-06-26','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(119,'Sonia Gentry 2020-06-22: After School Activities','False','2020-06-13','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(120,'Sonia Gentry 2020-05-18: After School Activities','False','2020-05-09','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(121,'Sonia Gentry 2020-05-31: After School Activities','False','2020-05-22','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(122,'Sonia Gentry 2020-07-12: After School Activities','False','2020-07-03','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(123,'Sonia Gentry 2020-07-20: After School Activities','False','2020-07-11','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(124,'Sonia Gentry 2020-06-07: After School Activities','False','2020-05-29','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(125,'Sonia Gentry 2020-05-24: After School Activities','False','2020-05-15','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(126,'Sonia Gentry 2020-05-10: After School Activities','False','2020-05-01','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(127,'Sonia Gentry 2020-06-21: After School Activities','False','2020-06-12','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(128,'Sonia Gentry 2020-05-11: After School Activities','False','2020-05-02','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(129,'Sonia Gentry 2020-06-01: After School Activities','False','2020-05-23','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(130,'Sonia Gentry 2020-06-15: After School Activities','False','2020-06-06','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(131,'Javon Rodgers 2020-06-06: After School Activities','False','2020-05-28','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(132,'Javon Rodgers 2020-06-13: After School Activities','False','2020-06-04','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(133,'Javon Rodgers 2020-06-20: After School Activities','False','2020-06-11','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(134,'Javon Rodgers 2020-05-30: After School Activities','False','2020-05-21','1.0','','7','','45','57','','');
INSERT INTO "ServiceDelivery__c" VALUES(135,'Emilie Costa 2020-08-11: After School Activities','False','2020-08-02','2.0','','7','','51','61','','');
INSERT INTO "ServiceDelivery__c" VALUES(136,'Fabian Hughes 2020-07-14: After School Activities','False','2020-07-05','2.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(137,'Fabian Hughes 2020-04-14: After School Activities','False','2020-04-05','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(138,'Fabian Hughes 2020-05-26: After School Activities','False','2020-05-17','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(139,'Fabian Hughes 2020-06-23: After School Activities','False','2020-06-14','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(140,'Fabian Hughes 2020-05-12: After School Activities','False','2020-05-03','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(141,'Fabian Hughes 2020-08-11: After School Activities','False','2020-08-02','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(142,'Fabian Hughes 2020-06-16: After School Activities','False','2020-06-07','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(143,'Fabian Hughes 2020-04-28: After School Activities','False','2020-04-19','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(144,'Fabian Hughes 2020-05-05: After School Activities','False','2020-04-26','1.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(145,'Fabian Hughes 2020-06-02: After School Activities','False','2020-05-24','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(146,'Fabian Hughes 2020-05-19: After School Activities','False','2020-05-10','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(147,'Fabian Hughes 2020-07-21: After School Activities','False','2020-07-12','1.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(148,'Fabian Hughes 2020-06-09: After School Activities','False','2020-05-31','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(149,'Fabian Hughes 2020-04-21: After School Activities','False','2020-04-12','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(150,'Fabian Hughes 2020-07-07: After School Activities','False','2020-06-28','3.0','','7','','57','65','','');
INSERT INTO "ServiceDelivery__c" VALUES(151,'Tom Higgins 2020-08-11: After School Activities','False','2020-08-02','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(152,'Tom Higgins 2020-07-14: After School Activities','False','2020-07-05','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(153,'Tom Higgins 2020-07-21: After School Activities','False','2020-07-12','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(154,'Tom Higgins 2020-04-21: After School Activities','False','2020-04-12','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(155,'Tom Higgins 2020-05-05: After School Activities','False','2020-04-26','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(156,'Tom Higgins 2020-05-12: After School Activities','False','2020-05-03','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(157,'Tom Higgins 2020-04-14: After School Activities','False','2020-04-05','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(158,'Tom Higgins 2020-05-19: After School Activities','False','2020-05-10','2.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(159,'Tom Higgins 2020-06-09: After School Activities','False','2020-05-31','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(160,'Tom Higgins 2020-06-02: After School Activities','False','2020-05-24','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(161,'Tom Higgins 2020-06-23: After School Activities','False','2020-06-14','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(162,'Tom Higgins 2020-07-07: After School Activities','False','2020-06-28','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(163,'Tom Higgins 2020-04-28: After School Activities','False','2020-04-19','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(164,'Tom Higgins 2020-06-16: After School Activities','False','2020-06-07','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(165,'Tom Higgins 2020-05-26: After School Activities','False','2020-05-17','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(166,'Tom Higgins 2020-06-30: After School Activities','False','2020-06-21','4.0','','7','','9','74','','');
INSERT INTO "ServiceDelivery__c" VALUES(167,'Robin Brooks 2020-05-08: Financial Advisor Sessions','False','2020-04-29','0.5','','4','','136','12','','');
INSERT INTO "ServiceDelivery__c" VALUES(168,'Robin Brooks 2020-04-10: Financial Advisor Sessions','False','2020-04-01','0.5','','4','','136','12','','');
INSERT INTO "ServiceDelivery__c" VALUES(169,'Robin Brooks 2020-06-05: Financial Advisor Sessions','False','2020-05-27','0.5','','4','','136','12','','');
INSERT INTO "ServiceDelivery__c" VALUES(170,'Arlene Baker 2020-04-06: Financial Advisor Sessions','False','2020-03-28','0.5','','4','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(171,'Arlene Baker 2020-07-05: Financial Advisor Sessions','False','2020-06-26','0.5','','4','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(172,'Arlene Baker 2020-05-08: Financial Advisor Sessions','False','2020-04-29','0.5','','4','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(173,'Arlene Baker 2020-06-06: Financial Advisor Sessions','False','2020-05-28','0.5','','4','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(174,'Arlene Baker 2020-08-07: Financial Advisor Sessions','False','2020-07-29','0.5','','4','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(175,'Gary Wood 2020-06-05: Financial Advisor Sessions','False','2020-05-27','0.5','','4','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(176,'Gary Wood - Financial Advisor Sessions','True','2020-07-25','0.5','','4','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(177,'Gary Wood - Financial Advisor Sessions','True','2020-06-25','0.5','','4','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(178,'Gary Wood - Financial Advisor Sessions','True','2020-07-25','0.5','','4','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(179,'Gary Wood 2020-05-03: Financial Advisor Sessions','False','2020-04-24','0.5','','4','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(180,'Robin Brooks 2020-05-29: Job Readiness Coaching','False','2020-05-20','0.75','','5','','136','12','','');
INSERT INTO "ServiceDelivery__c" VALUES(181,'Robin Brooks 2020-04-28: Job Readiness Coaching','False','2020-04-19','0.75','','5','','136','12','','');
INSERT INTO "ServiceDelivery__c" VALUES(182,'Robin Brooks 2020-07-21: Job Readiness Coaching','False','2020-07-12','0.75','','5','','136','12','','');
INSERT INTO "ServiceDelivery__c" VALUES(183,'Arlene Baker 2020-05-31: Job Readiness Coaching','False','2020-05-22','0.75','','5','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(184,'Arlene Baker 2020-06-28: Job Readiness Coaching','False','2020-06-19','0.5','','5','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(185,'Arlene Baker 2020-06-30: Job Readiness Coaching','False','2020-06-21','0.75','','5','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(186,'Arlene Baker 2020-04-26: Job Readiness Coaching','False','2020-04-17','0.75','','5','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(187,'Sonia Gentry 2020-05-25: After School Activities','False','2020-05-16','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(188,'Sonia Gentry 2020-07-13: After School Activities','False','2020-07-04','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(189,'Sonia Gentry 2020-07-06: After School Activities','False','2020-06-27','1.0','','7','','148','19','','');
INSERT INTO "ServiceDelivery__c" VALUES(190,'Kellen Cooley 2020-07-18: After School Activities','False','2020-07-09','1.0','','7','','152','22','','');
INSERT INTO "ServiceDelivery__c" VALUES(191,'Kellen Cooley 2020-08-08: After School Activities','False','2020-07-30','1.0','','7','','152','22','','');
INSERT INTO "ServiceDelivery__c" VALUES(192,'Kellen Cooley 2020-07-11: After School Activities','False','2020-07-02','1.0','','7','','152','22','','');
INSERT INTO "ServiceDelivery__c" VALUES(193,'Kellen Cooley 2020-07-04: After School Activities','False','2020-06-25','1.0','','7','','152','22','','');
INSERT INTO "ServiceDelivery__c" VALUES(194,'Marco Escobar 2020-05-19: After School Activities','False','2020-05-10','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(195,'Marco Escobar 2020-05-12: After School Activities','False','2020-05-03','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(196,'Marco Escobar 2020-08-11: After School Activities','False','2020-08-02','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(197,'Marco Escobar 2020-06-16: After School Activities','False','2020-06-07','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(198,'Marco Escobar 2020-06-09: After School Activities','False','2020-05-31','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(199,'Marco Escobar 2020-07-07: After School Activities','False','2020-06-28','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(200,'Marco Escobar 2020-07-14: After School Activities','False','2020-07-05','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(201,'Marco Escobar 2020-07-21: After School Activities','False','2020-07-12','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(202,'Marco Escobar 2020-04-14: After School Activities','False','2020-04-05','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(203,'Marco Escobar 2020-06-02: After School Activities','False','2020-05-24','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(204,'Marco Escobar 2020-06-30: After School Activities','False','2020-06-21','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(205,'Marco Escobar 2020-06-23: After School Activities','False','2020-06-14','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(206,'Marco Escobar 2020-05-26: After School Activities','False','2020-05-17','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(207,'Marco Escobar 2020-05-05: After School Activities','False','2020-04-26','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(208,'Marco Escobar 2020-04-21: After School Activities','False','2020-04-12','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(209,'Marco Escobar 2020-04-28: After School Activities','False','2020-04-19','1.0','','7','','164','31','','');
INSERT INTO "ServiceDelivery__c" VALUES(210,'Maya Johnson 2020-07-21: After School Activities','False','2020-07-12','2.0','','7','','27','49','','');
INSERT INTO "ServiceDelivery__c" VALUES(211,'Maya Johnson 2020-07-07: After School Activities','False','2020-06-28','2.0','','7','','27','49','','');
INSERT INTO "ServiceDelivery__c" VALUES(212,'Maya Johnson 2020-08-11: After School Activities','False','2020-08-02','2.0','','7','','27','49','','');
INSERT INTO "ServiceDelivery__c" VALUES(213,'Adrianna Norman 2020-08-08: Job Readiness Coaching','False','2020-07-30','1.0','','5','','39','55','','');
INSERT INTO "ServiceDelivery__c" VALUES(214,'Gary Wood 2020-07-21: Job Readiness Coaching','False','2020-07-12','0.75','','5','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(215,'Gary Wood 2020-06-22: Job Readiness Coaching','False','2020-06-13','0.75','','5','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(216,'Gary Wood 2020-05-26: Job Readiness Coaching','False','2020-05-17','0.75','','5','','41','56','','');
INSERT INTO "ServiceDelivery__c" VALUES(217,'Taniyah Rios 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(218,'Taniyah Rios 2021-04-22: STEM Field Trips','False','2021-04-13','1.0','Present','8','','100','2','','67');
INSERT INTO "ServiceDelivery__c" VALUES(219,'Taniyah Rios 2021-04-29: STEM Field Trips','False','2021-04-20','1.0','Present','8','','100','2','','68');
INSERT INTO "ServiceDelivery__c" VALUES(220,'Taniyah Rios 2021-05-06: STEM Field Trips','False','2021-04-27','1.0','Present','8','','100','2','','69');
INSERT INTO "ServiceDelivery__c" VALUES(221,'Taniyah Rios 2021-05-13: STEM Field Trips','False','2021-05-04','1.0','Present','8','','100','2','','70');
INSERT INTO "ServiceDelivery__c" VALUES(222,'Diego Case 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(223,'Yuliana Bird 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(224,'Abraham Sims 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(225,'Abraham Sims 2021-04-20: STEM Field Trips','False','2021-04-11','1.0','Present','8','','168','32','','66');
INSERT INTO "ServiceDelivery__c" VALUES(226,'Alana Owen 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(227,'Alana Owen 2020-06-26: STEM Field Trips','False','2020-06-17','','','8','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(228,'Naima Crawford 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(229,'Naima Crawford 2021-04-22: STEM Field Trips','False','2021-04-13','1.0','Present','8','','36','53','','67');
INSERT INTO "ServiceDelivery__c" VALUES(230,'Naima Crawford 2021-04-29: STEM Field Trips','False','2021-04-20','0.0','Excused Absence','8','','36','53','','68');
INSERT INTO "ServiceDelivery__c" VALUES(231,'Naima Crawford 2021-05-06: STEM Field Trips','False','2021-04-27','1.0','Present','8','','36','53','','69');
INSERT INTO "ServiceDelivery__c" VALUES(232,'Naima Crawford 2021-05-13: STEM Field Trips','False','2021-05-04','0.0','Excused Absence','8','','36','53','','70');
INSERT INTO "ServiceDelivery__c" VALUES(233,'Jessica Woods 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(234,'Jessica Woods 2021-04-20: STEM Field Trips','False','2021-04-11','1.0','Present','8','','48','58','','66');
INSERT INTO "ServiceDelivery__c" VALUES(235,'Ayanna Gonzalez 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(236,'Ayanna Gonzalez 2021-04-22: STEM Field Trips','False','2021-04-13','1.0','Present','8','','80','84','','67');
INSERT INTO "ServiceDelivery__c" VALUES(237,'Ayanna Gonzalez 2021-04-29: STEM Field Trips','False','2021-04-20','1.0','Present','8','','80','84','','68');
INSERT INTO "ServiceDelivery__c" VALUES(238,'Ayanna Gonzalez 2021-05-06: STEM Field Trips','False','2021-04-27','1.0','Present','8','','80','84','','69');
INSERT INTO "ServiceDelivery__c" VALUES(239,'Ayanna Gonzalez 2021-05-13: STEM Field Trips','False','2021-05-04','1.0','Present','8','','80','84','','70');
INSERT INTO "ServiceDelivery__c" VALUES(240,'Alia Duarte 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(241,'Alia Duarte 2021-04-20: STEM Field Trips','False','2021-04-11','1.0','Present','8','','91','80','','66');
INSERT INTO "ServiceDelivery__c" VALUES(242,'Casey Kline 2020-06-26: STEM Field Trips','False','2020-06-17','1.0','','8','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(243,'Taniyah Rios 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(244,'Taniyah Rios 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(245,'Taniyah Rios 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(246,'Taniyah Rios 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(247,'Taniyah Rios 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(248,'Taniyah Rios 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(249,'Taniyah Rios 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(250,'Taniyah Rios 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(251,'Taniyah Rios 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(252,'Taniyah Rios 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(253,'Taniyah Rios 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(254,'Taniyah Rios 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(255,'Taniyah Rios 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(256,'Taniyah Rios 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(257,'Taniyah Rios 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','100','2','','');
INSERT INTO "ServiceDelivery__c" VALUES(258,'Taniyah Rios 2021-05-26: Middle School STEM Classroom Hours','False','2021-05-17','2.0','Present','9','','100','2','','5');
INSERT INTO "ServiceDelivery__c" VALUES(259,'Taniyah Rios 2021-06-02: Middle School STEM Classroom Hours','False','2021-05-24','2.0','Present','9','','100','2','','7');
INSERT INTO "ServiceDelivery__c" VALUES(260,'Taniyah Rios 2021-03-22: Middle School STEM Classroom Hours','False','2021-03-13','2.0','Present','9','','100','2','','46');
INSERT INTO "ServiceDelivery__c" VALUES(261,'Taniyah Rios 2021-03-24: Middle School STEM Classroom Hours','False','2021-03-15','2.0','Present','9','','100','2','','47');
INSERT INTO "ServiceDelivery__c" VALUES(262,'Taniyah Rios 2021-03-29: Middle School STEM Classroom Hours','False','2021-03-20','2.0','Present','9','','100','2','','48');
INSERT INTO "ServiceDelivery__c" VALUES(263,'Taniyah Rios 2021-03-31: Middle School STEM Classroom Hours','False','2021-03-22','2.0','Present','9','','100','2','','49');
INSERT INTO "ServiceDelivery__c" VALUES(264,'Taniyah Rios 2021-04-07: Middle School STEM Classroom Hours','False','2021-03-29','2.0','Present','9','','100','2','','50');
INSERT INTO "ServiceDelivery__c" VALUES(265,'Taniyah Rios 2021-04-12: Middle School STEM Classroom Hours','False','2021-04-03','2.0','Present','9','','100','2','','51');
INSERT INTO "ServiceDelivery__c" VALUES(266,'Taniyah Rios 2021-04-14: Middle School STEM Classroom Hours','False','2021-04-05','2.0','Present','9','','100','2','','52');
INSERT INTO "ServiceDelivery__c" VALUES(267,'Taniyah Rios 2021-04-19: Middle School STEM Classroom Hours','False','2021-04-10','2.0','Present','9','','100','2','','53');
INSERT INTO "ServiceDelivery__c" VALUES(268,'Taniyah Rios 2021-04-21: Middle School STEM Classroom Hours','False','2021-04-12','2.0','Present','9','','100','2','','54');
INSERT INTO "ServiceDelivery__c" VALUES(269,'Taniyah Rios 2021-05-12: Middle School STEM Classroom Hours','False','2021-05-03','2.0','Present','9','','100','2','','1');
INSERT INTO "ServiceDelivery__c" VALUES(270,'Taniyah Rios 2021-04-26: Middle School STEM Classroom Hours','False','2021-04-17','0.0','Unexcused Absence','9','','100','2','','55');
INSERT INTO "ServiceDelivery__c" VALUES(271,'Taniyah Rios 2021-04-28: Middle School STEM Classroom Hours','False','2021-04-19','2.0','Present','9','','100','2','','56');
INSERT INTO "ServiceDelivery__c" VALUES(272,'Taniyah Rios 2021-05-03: Middle School STEM Classroom Hours','False','2021-04-24','2.0','Present','9','','100','2','','57');
INSERT INTO "ServiceDelivery__c" VALUES(273,'Taniyah Rios 2021-05-05: Middle School STEM Classroom Hours','False','2021-04-26','2.0','Present','9','','100','2','','58');
INSERT INTO "ServiceDelivery__c" VALUES(274,'Taniyah Rios 2021-05-10: Middle School STEM Classroom Hours','False','2021-05-01','2.0','Present','9','','100','2','','59');
INSERT INTO "ServiceDelivery__c" VALUES(275,'Taniyah Rios 2021-04-05: Middle School STEM Classroom Hours','False','2021-03-27','2.0','Present','9','','100','2','','60');
INSERT INTO "ServiceDelivery__c" VALUES(276,'Taniyah Rios 2021-05-17: Middle School STEM Classroom Hours','False','2021-05-08','2.0','Present','9','','100','2','','2');
INSERT INTO "ServiceDelivery__c" VALUES(277,'Taniyah Rios 2021-05-19: Middle School STEM Classroom Hours','False','2021-05-10','2.0','Present','9','','100','2','','3');
INSERT INTO "ServiceDelivery__c" VALUES(278,'Taniyah Rios 2021-05-24: Middle School STEM Classroom Hours','False','2021-05-15','2.0','Present','9','','100','2','','4');
INSERT INTO "ServiceDelivery__c" VALUES(279,'Diego Case 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(280,'Diego Case 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(281,'Diego Case 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(282,'Diego Case 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(283,'Diego Case 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(284,'Diego Case 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(285,'Diego Case 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(286,'Diego Case 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(287,'Diego Case 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(288,'Diego Case 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(289,'Diego Case 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(290,'Diego Case 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(291,'Diego Case 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(292,'Diego Case 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(293,'Diego Case 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','110','5','','');
INSERT INTO "ServiceDelivery__c" VALUES(294,'Alana Owen 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(295,'Alana Owen 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(296,'Alana Owen 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(297,'Alana Owen 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(298,'Alana Owen 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(299,'Naima Crawford 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(300,'Naima Crawford 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(301,'Naima Crawford 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(302,'Naima Crawford 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(303,'Naima Crawford 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(304,'Naima Crawford 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(305,'Naima Crawford 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(306,'Naima Crawford 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(307,'Naima Crawford 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(308,'Naima Crawford 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(309,'Naima Crawford 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(310,'Naima Crawford 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(311,'Naima Crawford 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(312,'Naima Crawford 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(313,'Naima Crawford 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','36','53','','');
INSERT INTO "ServiceDelivery__c" VALUES(314,'Naima Crawford 2021-05-26: Middle School STEM Classroom Hours','False','2021-05-17','0.0','Unexcused Absence','9','','36','53','','5');
INSERT INTO "ServiceDelivery__c" VALUES(315,'Naima Crawford 2021-06-02: Middle School STEM Classroom Hours','False','2021-05-24','0.0','Unexcused Absence','9','','36','53','','7');
INSERT INTO "ServiceDelivery__c" VALUES(316,'Naima Crawford 2021-03-22: Middle School STEM Classroom Hours','False','2021-03-13','0.0','Unexcused Absence','9','','36','53','','46');
INSERT INTO "ServiceDelivery__c" VALUES(317,'Naima Crawford 2021-03-24: Middle School STEM Classroom Hours','False','2021-03-15','2.0','Present','9','','36','53','','47');
INSERT INTO "ServiceDelivery__c" VALUES(318,'Naima Crawford 2021-03-29: Middle School STEM Classroom Hours','False','2021-03-20','2.0','Present','9','','36','53','','48');
INSERT INTO "ServiceDelivery__c" VALUES(319,'Naima Crawford 2021-04-07: Middle School STEM Classroom Hours','False','2021-03-29','0.0','Unexcused Absence','9','','36','53','','50');
INSERT INTO "ServiceDelivery__c" VALUES(320,'Naima Crawford 2021-04-12: Middle School STEM Classroom Hours','False','2021-04-03','2.0','Present','9','','36','53','','51');
INSERT INTO "ServiceDelivery__c" VALUES(321,'Naima Crawford 2021-04-14: Middle School STEM Classroom Hours','False','2021-04-05','2.0','Present','9','','36','53','','52');
INSERT INTO "ServiceDelivery__c" VALUES(322,'Naima Crawford 2021-04-19: Middle School STEM Classroom Hours','False','2021-04-10','2.0','Present','9','','36','53','','53');
INSERT INTO "ServiceDelivery__c" VALUES(323,'Naima Crawford 2021-04-21: Middle School STEM Classroom Hours','False','2021-04-12','2.0','Present','9','','36','53','','54');
INSERT INTO "ServiceDelivery__c" VALUES(324,'Naima Crawford 2021-05-12: Middle School STEM Classroom Hours','False','2021-05-03','0.0','Unexcused Absence','9','','36','53','','1');
INSERT INTO "ServiceDelivery__c" VALUES(325,'Naima Crawford 2021-04-26: Middle School STEM Classroom Hours','False','2021-04-17','2.0','Present','9','','36','53','','55');
INSERT INTO "ServiceDelivery__c" VALUES(326,'Naima Crawford 2021-04-28: Middle School STEM Classroom Hours','False','2021-04-19','2.0','Present','9','','36','53','','56');
INSERT INTO "ServiceDelivery__c" VALUES(327,'Naima Crawford 2021-05-03: Middle School STEM Classroom Hours','False','2021-04-24','0.0','Unexcused Absence','9','','36','53','','57');
INSERT INTO "ServiceDelivery__c" VALUES(328,'Naima Crawford 2021-05-05: Middle School STEM Classroom Hours','False','2021-04-26','0.0','Unexcused Absence','9','','36','53','','58');
INSERT INTO "ServiceDelivery__c" VALUES(329,'Naima Crawford 2021-05-10: Middle School STEM Classroom Hours','False','2021-05-01','0.0','Unexcused Absence','9','','36','53','','59');
INSERT INTO "ServiceDelivery__c" VALUES(330,'Naima Crawford 2021-04-11: Middle School STEM Classroom Hours','False','2021-04-02','1.0','Present','9','','36','53','','61');
INSERT INTO "ServiceDelivery__c" VALUES(331,'Naima Crawford 2021-04-05: Middle School STEM Classroom Hours','False','2021-03-27','2.0','Present','9','','36','53','','60');
INSERT INTO "ServiceDelivery__c" VALUES(332,'Naima Crawford 2021-05-11: Middle School STEM Classroom Hours','False','2021-05-02','0.0','Excused Absence','9','','36','53','','62');
INSERT INTO "ServiceDelivery__c" VALUES(333,'Naima Crawford 2021-05-17: Middle School STEM Classroom Hours','False','2021-05-08','0.0','Unexcused Absence','9','','36','53','','2');
INSERT INTO "ServiceDelivery__c" VALUES(334,'Naima Crawford 2021-03-31: Middle School STEM Classroom Hours','False','2021-03-22','0.0','Excused Absence','9','','36','53','','49');
INSERT INTO "ServiceDelivery__c" VALUES(335,'Naima Crawford 2021-05-19: Middle School STEM Classroom Hours','False','2021-05-10','0.0','Unexcused Absence','9','','36','53','','3');
INSERT INTO "ServiceDelivery__c" VALUES(336,'Naima Crawford 2021-05-24: Middle School STEM Classroom Hours','False','2021-05-15','0.0','Unexcused Absence','9','','36','53','','4');
INSERT INTO "ServiceDelivery__c" VALUES(337,'Jessica Woods 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(338,'Jessica Woods 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(339,'Jessica Woods 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(340,'Jessica Woods 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(341,'Jessica Woods 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(342,'Jessica Woods 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(343,'Jessica Woods 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(344,'Jessica Woods 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(345,'Jessica Woods 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(346,'Jessica Woods 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(347,'Jessica Woods 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(348,'Jessica Woods 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(349,'Jessica Woods 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(350,'Jessica Woods 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(351,'Jessica Woods 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','48','58','','');
INSERT INTO "ServiceDelivery__c" VALUES(352,'Ayanna Gonzalez 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(353,'Ayanna Gonzalez 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(354,'Ayanna Gonzalez 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(355,'Ayanna Gonzalez 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(356,'Ayanna Gonzalez 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(357,'Ayanna Gonzalez 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(358,'Ayanna Gonzalez 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(359,'Ayanna Gonzalez 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(360,'Ayanna Gonzalez 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(361,'Ayanna Gonzalez 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(362,'Ayanna Gonzalez 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(363,'Ayanna Gonzalez 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(364,'Ayanna Gonzalez 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(365,'Ayanna Gonzalez 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(366,'Ayanna Gonzalez 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','80','84','','');
INSERT INTO "ServiceDelivery__c" VALUES(367,'Ayanna Gonzalez 2021-05-26: Middle School STEM Classroom Hours','False','2021-05-17','2.0','Present','9','','80','84','','5');
INSERT INTO "ServiceDelivery__c" VALUES(368,'Ayanna Gonzalez 2021-06-02: Middle School STEM Classroom Hours','False','2021-05-24','0.0','Excused Absence','9','','80','84','','7');
INSERT INTO "ServiceDelivery__c" VALUES(369,'Ayanna Gonzalez 2021-03-22: Middle School STEM Classroom Hours','False','2021-03-13','2.0','Present','9','','80','84','','46');
INSERT INTO "ServiceDelivery__c" VALUES(370,'Ayanna Gonzalez 2021-03-24: Middle School STEM Classroom Hours','False','2021-03-15','2.0','Present','9','','80','84','','47');
INSERT INTO "ServiceDelivery__c" VALUES(371,'Ayanna Gonzalez 2021-03-29: Middle School STEM Classroom Hours','False','2021-03-20','2.0','Present','9','','80','84','','48');
INSERT INTO "ServiceDelivery__c" VALUES(372,'Ayanna Gonzalez 2021-03-31: Middle School STEM Classroom Hours','False','2021-03-22','2.0','Present','9','','80','84','','49');
INSERT INTO "ServiceDelivery__c" VALUES(373,'Ayanna Gonzalez 2021-04-07: Middle School STEM Classroom Hours','False','2021-03-29','2.0','Present','9','','80','84','','50');
INSERT INTO "ServiceDelivery__c" VALUES(374,'Ayanna Gonzalez 2021-04-12: Middle School STEM Classroom Hours','False','2021-04-03','2.0','Present','9','','80','84','','51');
INSERT INTO "ServiceDelivery__c" VALUES(375,'Ayanna Gonzalez 2021-04-14: Middle School STEM Classroom Hours','False','2021-04-05','2.0','Present','9','','80','84','','52');
INSERT INTO "ServiceDelivery__c" VALUES(376,'Ayanna Gonzalez 2021-04-19: Middle School STEM Classroom Hours','False','2021-04-10','2.0','Present','9','','80','84','','53');
INSERT INTO "ServiceDelivery__c" VALUES(377,'Ayanna Gonzalez 2021-04-21: Middle School STEM Classroom Hours','False','2021-04-12','2.0','Present','9','','80','84','','54');
INSERT INTO "ServiceDelivery__c" VALUES(378,'Ayanna Gonzalez 2021-05-12: Middle School STEM Classroom Hours','False','2021-05-03','2.0','Present','9','','80','84','','1');
INSERT INTO "ServiceDelivery__c" VALUES(379,'Ayanna Gonzalez 2021-04-26: Middle School STEM Classroom Hours','False','2021-04-17','2.0','Present','9','','80','84','','55');
INSERT INTO "ServiceDelivery__c" VALUES(380,'Ayanna Gonzalez 2021-04-28: Middle School STEM Classroom Hours','False','2021-04-19','2.0','Present','9','','80','84','','56');
INSERT INTO "ServiceDelivery__c" VALUES(381,'Ayanna Gonzalez 2021-05-03: Middle School STEM Classroom Hours','False','2021-04-24','2.0','Present','9','','80','84','','57');
INSERT INTO "ServiceDelivery__c" VALUES(382,'Ayanna Gonzalez 2021-05-05: Middle School STEM Classroom Hours','False','2021-04-26','2.0','Present','9','','80','84','','58');
INSERT INTO "ServiceDelivery__c" VALUES(383,'Ayanna Gonzalez 2021-05-10: Middle School STEM Classroom Hours','False','2021-05-01','2.0','Present','9','','80','84','','59');
INSERT INTO "ServiceDelivery__c" VALUES(384,'Ayanna Gonzalez 2021-04-11: Middle School STEM Classroom Hours','False','2021-04-02','1.0','Present','9','','80','84','','61');
INSERT INTO "ServiceDelivery__c" VALUES(385,'Ayanna Gonzalez 2021-04-05: Middle School STEM Classroom Hours','False','2021-03-27','2.0','Present','9','','80','84','','60');
INSERT INTO "ServiceDelivery__c" VALUES(386,'Ayanna Gonzalez 2021-05-11: Middle School STEM Classroom Hours','False','2021-05-02','2.0','Present','9','','80','84','','62');
INSERT INTO "ServiceDelivery__c" VALUES(387,'Ayanna Gonzalez 2021-05-17: Middle School STEM Classroom Hours','False','2021-05-08','2.0','Present','9','','80','84','','2');
INSERT INTO "ServiceDelivery__c" VALUES(388,'Ayanna Gonzalez 2021-05-19: Middle School STEM Classroom Hours','False','2021-05-10','2.0','Present','9','','80','84','','3');
INSERT INTO "ServiceDelivery__c" VALUES(389,'Alia Duarte 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(390,'Alia Duarte 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(391,'Alia Duarte 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(392,'Alia Duarte 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(393,'Alia Duarte 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(394,'Alia Duarte 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(395,'Alia Duarte 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(396,'Alia Duarte 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(397,'Alia Duarte 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(398,'Alia Duarte 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(399,'Alia Duarte 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(400,'Alia Duarte 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(401,'Alia Duarte 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(402,'Alia Duarte 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(403,'Alia Duarte 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','91','80','','');
INSERT INTO "ServiceDelivery__c" VALUES(404,'Alia Duarte 2021-05-26: Middle School STEM Classroom Hours','False','2021-05-17','2.0','Present','9','','91','80','','5');
INSERT INTO "ServiceDelivery__c" VALUES(405,'Alia Duarte 2021-06-02: Middle School STEM Classroom Hours','False','2021-05-24','2.0','Present','9','','91','80','','7');
INSERT INTO "ServiceDelivery__c" VALUES(406,'Alia Duarte 2021-03-22: Middle School STEM Classroom Hours','False','2021-03-13','2.0','Present','9','','91','80','','46');
INSERT INTO "ServiceDelivery__c" VALUES(407,'Alia Duarte 2021-03-24: Middle School STEM Classroom Hours','False','2021-03-15','2.0','Present','9','','91','80','','47');
INSERT INTO "ServiceDelivery__c" VALUES(408,'Alia Duarte 2021-03-29: Middle School STEM Classroom Hours','False','2021-03-20','2.0','Present','9','','91','80','','48');
INSERT INTO "ServiceDelivery__c" VALUES(409,'Alia Duarte 2021-03-31: Middle School STEM Classroom Hours','False','2021-03-22','2.0','Present','9','','91','80','','49');
INSERT INTO "ServiceDelivery__c" VALUES(410,'Ayanna Gonzalez 2021-05-24: Middle School STEM Classroom Hours','False','2021-05-15','2.0','Present','9','','80','84','','4');
INSERT INTO "ServiceDelivery__c" VALUES(411,'Alia Duarte 2021-04-07: Middle School STEM Classroom Hours','False','2021-03-29','2.0','Present','9','','91','80','','50');
INSERT INTO "ServiceDelivery__c" VALUES(412,'Alia Duarte 2021-04-12: Middle School STEM Classroom Hours','False','2021-04-03','2.0','Present','9','','91','80','','51');
INSERT INTO "ServiceDelivery__c" VALUES(413,'Alia Duarte 2021-04-14: Middle School STEM Classroom Hours','False','2021-04-05','2.0','Present','9','','91','80','','52');
INSERT INTO "ServiceDelivery__c" VALUES(414,'Alia Duarte 2021-04-19: Middle School STEM Classroom Hours','False','2021-04-10','2.0','Present','9','','91','80','','53');
INSERT INTO "ServiceDelivery__c" VALUES(415,'Alia Duarte 2021-04-21: Middle School STEM Classroom Hours','False','2021-04-12','2.0','Present','9','','91','80','','54');
INSERT INTO "ServiceDelivery__c" VALUES(416,'Alia Duarte 2021-05-12: Middle School STEM Classroom Hours','False','2021-05-03','2.0','Present','9','','91','80','','1');
INSERT INTO "ServiceDelivery__c" VALUES(417,'Alia Duarte 2021-04-26: Middle School STEM Classroom Hours','False','2021-04-17','2.0','Present','9','','91','80','','55');
INSERT INTO "ServiceDelivery__c" VALUES(418,'Alia Duarte 2021-04-28: Middle School STEM Classroom Hours','False','2021-04-19','2.0','Present','9','','91','80','','56');
INSERT INTO "ServiceDelivery__c" VALUES(419,'Alia Duarte 2021-05-03: Middle School STEM Classroom Hours','False','2021-04-24','2.0','Present','9','','91','80','','57');
INSERT INTO "ServiceDelivery__c" VALUES(420,'Alia Duarte 2021-05-05: Middle School STEM Classroom Hours','False','2021-04-26','2.0','Present','9','','91','80','','58');
INSERT INTO "ServiceDelivery__c" VALUES(421,'Alia Duarte 2021-05-10: Middle School STEM Classroom Hours','False','2021-05-01','2.0','Present','9','','91','80','','59');
INSERT INTO "ServiceDelivery__c" VALUES(422,'Alia Duarte 2021-04-05: Middle School STEM Classroom Hours','False','2021-03-27','0.0','Unexcused Absence','9','','91','80','','60');
INSERT INTO "ServiceDelivery__c" VALUES(423,'Alia Duarte 2021-05-17: Middle School STEM Classroom Hours','False','2021-05-08','2.0','Present','9','','91','80','','2');
INSERT INTO "ServiceDelivery__c" VALUES(424,'Alia Duarte 2021-05-19: Middle School STEM Classroom Hours','False','2021-05-10','2.0','Present','9','','91','80','','3');
INSERT INTO "ServiceDelivery__c" VALUES(425,'Alia Duarte 2021-05-24: Middle School STEM Classroom Hours','False','2021-05-15','2.0','Present','9','','91','80','','4');
INSERT INTO "ServiceDelivery__c" VALUES(426,'Casey Kline 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(427,'Casey Kline 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(428,'Casey Kline 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(429,'Casey Kline 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(430,'Casey Kline 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(431,'Casey Kline 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(432,'Casey Kline 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(433,'Casey Kline 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','99','78','','');
INSERT INTO "ServiceDelivery__c" VALUES(434,'Yuliana Bird 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(435,'Yuliana Bird 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(436,'Yuliana Bird 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(437,'Yuliana Bird 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(438,'Yuliana Bird 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(439,'Yuliana Bird 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(440,'Yuliana Bird 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(441,'Yuliana Bird 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(442,'Yuliana Bird 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(443,'Yuliana Bird 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(444,'Yuliana Bird 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(445,'Yuliana Bird 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(446,'Yuliana Bird 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(447,'Yuliana Bird 2020-08-09: Middle School STEM Classroom Hours','False','2020-07-31','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(448,'Yuliana Bird 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','157','25','','');
INSERT INTO "ServiceDelivery__c" VALUES(449,'Abraham Sims 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(450,'Abraham Sims 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(451,'Abraham Sims 2020-04-19: Middle School STEM Classroom Hours','False','2020-04-10','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(452,'Abraham Sims 2020-06-21: Middle School STEM Classroom Hours','False','2020-06-12','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(453,'Abraham Sims 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(454,'Abraham Sims 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(455,'Abraham Sims 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(456,'Abraham Sims 2020-05-10: Middle School STEM Classroom Hours','False','2020-05-01','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(457,'Abraham Sims 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(458,'Abraham Sims 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(459,'Abraham Sims 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(460,'Abraham Sims 2020-05-24: Middle School STEM Classroom Hours','False','2020-05-15','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(461,'Abraham Sims 2020-04-12: Middle School STEM Classroom Hours','False','2020-04-03','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(462,'Abraham Sims 2020-06-14: Middle School STEM Classroom Hours','False','2020-06-05','2.0','','9','','168','32','','');
INSERT INTO "ServiceDelivery__c" VALUES(463,'Abraham Sims 2021-05-26: Middle School STEM Classroom Hours','False','2021-05-17','2.0','Present','9','','168','32','','5');
INSERT INTO "ServiceDelivery__c" VALUES(464,'Abraham Sims 2021-06-02: Middle School STEM Classroom Hours','False','2021-05-24','2.0','Present','9','','168','32','','7');
INSERT INTO "ServiceDelivery__c" VALUES(465,'Abraham Sims 2021-03-22: Middle School STEM Classroom Hours','False','2021-03-13','2.0','Present','9','','168','32','','46');
INSERT INTO "ServiceDelivery__c" VALUES(466,'Abraham Sims 2021-03-24: Middle School STEM Classroom Hours','False','2021-03-15','2.0','Present','9','','168','32','','47');
INSERT INTO "ServiceDelivery__c" VALUES(467,'Abraham Sims 2021-03-29: Middle School STEM Classroom Hours','False','2021-03-20','2.0','Present','9','','168','32','','48');
INSERT INTO "ServiceDelivery__c" VALUES(468,'Abraham Sims 2021-03-31: Middle School STEM Classroom Hours','False','2021-03-22','2.0','Present','9','','168','32','','49');
INSERT INTO "ServiceDelivery__c" VALUES(469,'Abraham Sims 2021-04-07: Middle School STEM Classroom Hours','False','2021-03-29','2.0','Present','9','','168','32','','50');
INSERT INTO "ServiceDelivery__c" VALUES(470,'Abraham Sims 2021-04-12: Middle School STEM Classroom Hours','False','2021-04-03','2.0','Present','9','','168','32','','51');
INSERT INTO "ServiceDelivery__c" VALUES(471,'Abraham Sims 2021-04-14: Middle School STEM Classroom Hours','False','2021-04-05','2.0','Present','9','','168','32','','52');
INSERT INTO "ServiceDelivery__c" VALUES(472,'Abraham Sims 2021-04-19: Middle School STEM Classroom Hours','False','2021-04-10','2.0','Present','9','','168','32','','53');
INSERT INTO "ServiceDelivery__c" VALUES(473,'Abraham Sims 2021-04-21: Middle School STEM Classroom Hours','False','2021-04-12','2.0','Present','9','','168','32','','54');
INSERT INTO "ServiceDelivery__c" VALUES(474,'Abraham Sims 2021-05-12: Middle School STEM Classroom Hours','False','2021-05-03','2.0','Present','9','','168','32','','1');
INSERT INTO "ServiceDelivery__c" VALUES(475,'Abraham Sims 2021-04-26: Middle School STEM Classroom Hours','False','2021-04-17','2.0','Present','9','','168','32','','55');
INSERT INTO "ServiceDelivery__c" VALUES(476,'Abraham Sims 2021-04-28: Middle School STEM Classroom Hours','False','2021-04-19','2.0','Present','9','','168','32','','56');
INSERT INTO "ServiceDelivery__c" VALUES(477,'Abraham Sims 2021-05-03: Middle School STEM Classroom Hours','False','2021-04-24','2.0','Present','9','','168','32','','57');
INSERT INTO "ServiceDelivery__c" VALUES(478,'Abraham Sims 2021-05-05: Middle School STEM Classroom Hours','False','2021-04-26','2.0','Present','9','','168','32','','58');
INSERT INTO "ServiceDelivery__c" VALUES(479,'Abraham Sims 2021-05-10: Middle School STEM Classroom Hours','False','2021-05-01','2.0','Present','9','','168','32','','59');
INSERT INTO "ServiceDelivery__c" VALUES(480,'Abraham Sims 2021-04-11: Middle School STEM Classroom Hours','False','2021-04-02','2.0','Present','9','','168','32','','61');
INSERT INTO "ServiceDelivery__c" VALUES(481,'Abraham Sims 2021-04-05: Middle School STEM Classroom Hours','False','2021-03-27','2.0','Present','9','','168','32','','60');
INSERT INTO "ServiceDelivery__c" VALUES(482,'Abraham Sims 2021-05-11: Middle School STEM Classroom Hours','False','2021-05-02','1.5','Present','9','','168','32','','62');
INSERT INTO "ServiceDelivery__c" VALUES(483,'Abraham Sims 2021-05-17: Middle School STEM Classroom Hours','False','2021-05-08','2.0','Present','9','','168','32','','2');
INSERT INTO "ServiceDelivery__c" VALUES(484,'Abraham Sims 2021-05-19: Middle School STEM Classroom Hours','False','2021-05-10','2.0','Present','9','','168','32','','3');
INSERT INTO "ServiceDelivery__c" VALUES(485,'Abraham Sims 2021-05-24: Middle School STEM Classroom Hours','False','2021-05-15','2.0','Present','9','','168','32','','4');
INSERT INTO "ServiceDelivery__c" VALUES(486,'Alana Owen 2020-04-26: Middle School STEM Classroom Hours','False','2020-04-17','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(487,'Alana Owen 2020-05-31: Middle School STEM Classroom Hours','False','2020-05-22','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(488,'Alana Owen 2020-07-19: Middle School STEM Classroom Hours','False','2020-07-10','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(489,'Alana Owen 2020-06-07: Middle School STEM Classroom Hours','False','2020-05-29','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(490,'Alana Owen 2020-05-17: Middle School STEM Classroom Hours','False','2020-05-08','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(491,'Alana Owen 2020-05-03: Middle School STEM Classroom Hours','False','2020-04-24','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(492,'Alana Owen 2020-07-05: Middle School STEM Classroom Hours','False','2020-06-26','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(493,'Alana Owen 2020-07-12: Middle School STEM Classroom Hours','False','2020-07-03','2.0','','9','','33','51','','');
INSERT INTO "ServiceDelivery__c" VALUES(494,'Arlene Baker 2020-05-16: Job Interviews completed','False','2020-05-07','2.0','','3','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(495,'Jason Barnes 2020-07-07: Financial Literacy Classroom Hours','False','2020-06-28','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(496,'Jason Barnes 2020-05-26: Financial Literacy Classroom Hours','False','2020-05-17','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(497,'Jason Barnes 2020-07-14: Financial Literacy Classroom Hours','False','2020-07-05','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(498,'Jason Barnes 2020-05-05: Financial Literacy Classroom Hours','False','2020-04-26','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(499,'Jason Barnes 2020-04-28: Financial Literacy Classroom Hours','False','2020-04-19','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(500,'Jason Barnes 2020-06-09: Financial Literacy Classroom Hours','False','2020-05-31','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(501,'Jason Barnes 2020-06-30: Financial Literacy Classroom Hours','False','2020-06-21','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(502,'Jason Barnes 2020-06-16: Financial Literacy Classroom Hours','False','2020-06-07','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(503,'Jason Barnes 2020-08-11: Financial Literacy Classroom Hours','False','2020-08-02','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(504,'Jason Barnes 2020-04-14: Financial Literacy Classroom Hours','False','2020-04-05','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(505,'Jason Barnes 2020-05-12: Financial Literacy Classroom Hours','False','2020-05-03','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(506,'Jason Barnes 2020-04-21: Financial Literacy Classroom Hours','False','2020-04-12','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(507,'Jason Barnes 2020-06-02: Financial Literacy Classroom Hours','False','2020-05-24','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(508,'Jason Barnes 2020-07-21: Financial Literacy Classroom Hours','False','2020-07-12','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(509,'Jason Barnes 2020-06-23: Financial Literacy Classroom Hours','False','2020-06-14','2.0','','14','','138','13','','');
INSERT INTO "ServiceDelivery__c" VALUES(510,'Frankie Waller 2020-08-11: Financial Literacy Classroom Hours','False','2020-08-02','2.0','','14','','146','17','','');
INSERT INTO "ServiceDelivery__c" VALUES(511,'Semaj Wall 2020-06-16: Financial Literacy Classroom Hours','False','2020-06-07','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(512,'Semaj Wall 2020-05-12: Financial Literacy Classroom Hours','False','2020-05-03','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(513,'Semaj Wall 2020-08-11: Financial Literacy Classroom Hours','False','2020-08-02','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(514,'Semaj Wall 2020-05-26: Financial Literacy Classroom Hours','False','2020-05-17','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(515,'Arlene Baker 2020-05-12: Job Interviews completed','False','2020-05-03','1.0','','3','','23','46','','');
INSERT INTO "ServiceDelivery__c" VALUES(516,'Semaj Wall 2020-04-14: Financial Literacy Classroom Hours','False','2020-04-05','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(517,'Semaj Wall 2020-07-14: Financial Literacy Classroom Hours','False','2020-07-05','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(518,'Semaj Wall 2020-04-21: Financial Literacy Classroom Hours','False','2020-04-12','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(519,'Semaj Wall 2020-06-02: Financial Literacy Classroom Hours','False','2020-05-24','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(520,'Semaj Wall 2020-04-28: Financial Literacy Classroom Hours','False','2020-04-19','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(521,'Semaj Wall 2020-06-09: Financial Literacy Classroom Hours','False','2020-05-31','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(522,'Semaj Wall 2020-06-23: Financial Literacy Classroom Hours','False','2020-06-14','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(523,'Semaj Wall 2020-07-21: Financial Literacy Classroom Hours','False','2020-07-12','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(524,'Semaj Wall 2020-05-05: Financial Literacy Classroom Hours','False','2020-04-26','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(525,'Semaj Wall 2020-05-19: Financial Literacy Classroom Hours','False','2020-05-10','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(526,'Semaj Wall 2020-07-07: Financial Literacy Classroom Hours','False','2020-06-28','2.0','','14','','180','42','','');
INSERT INTO "ServiceDelivery__c" VALUES(527,'Lucia Cain 2020-08-11: Financial Literacy Classroom Hours','False','2020-08-02','2.0','','14','','53','62','','');
INSERT INTO "ServiceDelivery__c" VALUES(528,'Lucia Cain 2020-07-07: Financial Literacy Classroom Hours','False','2020-06-28','2.0','','14','','53','62','','');
INSERT INTO "ServiceDelivery__c" VALUES(529,'Lucia Cain 2020-07-14: Financial Literacy Classroom Hours','False','2020-07-05','2.0','','14','','53','62','','');
INSERT INTO "ServiceDelivery__c" VALUES(530,'Lucia Cain 2020-07-21: Financial Literacy Classroom Hours','False','2020-07-12','2.0','','14','','53','62','','');
INSERT INTO "ServiceDelivery__c" VALUES(531,'Alice Irwin 2020-07-21: Financial Literacy Classroom Hours','False','2020-07-12','2.0','','14','','56','63','','');
INSERT INTO "ServiceDelivery__c" VALUES(532,'Alice Irwin 2020-07-07: Financial Literacy Classroom Hours','False','2020-06-28','2.0','','14','','56','63','','');
INSERT INTO "ServiceDelivery__c" VALUES(533,'Alice Irwin 2020-07-14: Financial Literacy Classroom Hours','False','2020-07-05','2.0','','14','','56','63','','');
INSERT INTO "ServiceDelivery__c" VALUES(534,'Alice Irwin 2020-08-11: Financial Literacy Classroom Hours','False','2020-08-02','2.0','','14','','56','63','','');
INSERT INTO "ServiceDelivery__c" VALUES(535,'Nico Rivers 2020-05-16: Monthly Rent Subsidy','False','2020-05-07','175.0','','1','155','64','69','','');
INSERT INTO "ServiceDelivery__c" VALUES(536,'Nico Rivers 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','175.0','','1','155','64','69','','');
INSERT INTO "ServiceDelivery__c" VALUES(537,'Nico Rivers 2020-07-14: Monthly Rent Subsidy','False','2020-07-05','175.0','','1','155','64','69','','');
INSERT INTO "ServiceDelivery__c" VALUES(538,'Nico Rivers 2020-07-20: Monthly Rent Subsidy','False','2020-07-11','175.0','','1','155','64','69','','');
INSERT INTO "ServiceDelivery__c" VALUES(539,'Nico Rivers 2020-06-16: Monthly Rent Subsidy','False','2020-06-07','175.0','','1','155','64','69','','');
INSERT INTO "ServiceDelivery__c" VALUES(540,'Emelia Mercer 2020-05-16: Monthly Rent Subsidy','False','2020-05-07','200.0','','1','175','86','71','','');
INSERT INTO "ServiceDelivery__c" VALUES(541,'Emelia Mercer 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','200.0','','1','175','86','71','','');
INSERT INTO "ServiceDelivery__c" VALUES(542,'Emelia Mercer 2020-07-14: Monthly Rent Subsidy','False','2020-07-05','200.0','','1','175','86','71','','');
INSERT INTO "ServiceDelivery__c" VALUES(543,'Emelia Mercer 2020-06-16: Monthly Rent Subsidy','False','2020-06-07','200.0','','1','175','86','71','','');
INSERT INTO "ServiceDelivery__c" VALUES(544,'Isaac Grant 2020-06-16: Monthly Rent Subsidy','False','2020-06-07','250.0','','1','41','113','6','','');
INSERT INTO "ServiceDelivery__c" VALUES(545,'Isaac Grant 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','250.0','','1','41','113','6','','');
INSERT INTO "ServiceDelivery__c" VALUES(546,'Isaac Grant 2020-07-14: Monthly Rent Subsidy','False','2020-07-05','250.0','','1','41','113','6','','');
INSERT INTO "ServiceDelivery__c" VALUES(547,'Angelo Lutz 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','250.0','','1','57','130','10','','');
INSERT INTO "ServiceDelivery__c" VALUES(548,'Angelo Lutz 2020-07-17: Monthly Rent Subsidy','False','2020-07-08','250.0','','1','57','130','10','','');
INSERT INTO "ServiceDelivery__c" VALUES(549,'James Richards 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','200.0','','1','78','159','26','','');
INSERT INTO "ServiceDelivery__c" VALUES(550,'Dalia Osborn 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','400.0','','1','9','173','36','','');
INSERT INTO "ServiceDelivery__c" VALUES(551,'Jaylin Morgan 2020-05-16: Monthly Rent Subsidy','False','2020-05-07','150.0','','1','92','176','39','','');
INSERT INTO "ServiceDelivery__c" VALUES(552,'Jaylin Morgan 2020-07-14: Monthly Rent Subsidy','False','2020-07-05','150.0','','1','92','176','39','','');
INSERT INTO "ServiceDelivery__c" VALUES(553,'Jaylin Morgan 2020-08-14: Monthly Rent Subsidy','False','2020-08-05','150.0','','1','92','176','39','','');
INSERT INTO "ServiceDelivery__c" VALUES(554,'Jaylin Morgan 2020-06-16: Monthly Rent Subsidy','False','2020-06-07','150.0','','1','92','176','39','','');
INSERT INTO "ServiceDelivery__c" VALUES(555,'Jaylin Morgan 2020-04-25: Monthly Rent Subsidy','False','2020-04-16','150.0','','1','92','176','39','','');
INSERT INTO "ServiceDelivery__c" VALUES(556,'Samir Neal 2020-04-20: ESL Classroom Hours','False','2020-04-11','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(557,'Samir Neal 2020-05-18: ESL Classroom Hours','False','2020-05-09','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(558,'Samir Neal 2020-05-25: ESL Classroom Hours','False','2020-05-16','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(559,'Samir Neal 2020-06-20: ESL Classroom Hours','False','2020-06-11','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(560,'Samir Neal 2020-05-23: ESL Classroom Hours','False','2020-05-14','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(561,'Samir Neal 2020-08-08: ESL Classroom Hours','False','2020-07-30','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(562,'Samir Neal 2020-05-11: ESL Classroom Hours','False','2020-05-02','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(563,'Samir Neal 2020-04-13: ESL Classroom Hours','False','2020-04-04','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(564,'Samir Neal 2020-07-20: ESL Classroom Hours','False','2020-07-11','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(565,'Samir Neal 2020-05-30: ESL Classroom Hours','False','2020-05-21','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(566,'Samir Neal 2020-06-01: ESL Classroom Hours','False','2020-05-23','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(567,'Samir Neal 2020-06-08: ESL Classroom Hours','False','2020-05-30','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(568,'Samir Neal 2020-06-22: ESL Classroom Hours','False','2020-06-13','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(569,'Samir Neal 2020-04-11: ESL Classroom Hours','False','2020-04-02','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(570,'Samir Neal 2020-04-25: ESL Classroom Hours','False','2020-04-16','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(571,'Samir Neal 2020-04-27: ESL Classroom Hours','False','2020-04-18','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(572,'Samir Neal 2020-07-04: ESL Classroom Hours','False','2020-06-25','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(573,'Samir Neal 2020-07-13: ESL Classroom Hours','False','2020-07-04','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(574,'Samir Neal 2020-07-18: ESL Classroom Hours','False','2020-07-09','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(575,'Samir Neal 2020-05-04: ESL Classroom Hours','False','2020-04-25','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(576,'Samir Neal 2020-06-15: ESL Classroom Hours','False','2020-06-06','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(577,'Samir Neal 2020-08-10: ESL Classroom Hours','False','2020-08-01','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(578,'Samir Neal 2020-05-16: ESL Classroom Hours','False','2020-05-07','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(579,'Samir Neal 2020-06-27: ESL Classroom Hours','False','2020-06-18','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(580,'Samir Neal 2020-07-11: ESL Classroom Hours','False','2020-07-02','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(581,'Samir Neal 2020-06-06: ESL Classroom Hours','False','2020-05-28','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(582,'Samir Neal 2020-04-18: ESL Classroom Hours','False','2020-04-09','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(583,'Samir Neal 2020-06-13: ESL Classroom Hours','False','2020-06-04','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(584,'Samir Neal 2020-07-06: ESL Classroom Hours','False','2020-06-27','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(585,'Samir Neal 2020-05-02: ESL Classroom Hours','False','2020-04-23','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(586,'Samir Neal 2020-05-09: ESL Classroom Hours','False','2020-04-30','2.0','','2','','122','9','','');
INSERT INTO "ServiceDelivery__c" VALUES(587,'Fernando Beltran 2020-07-04: ESL Classroom Hours','False','2020-06-25','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(588,'Fernando Beltran 2020-08-08: ESL Classroom Hours','False','2020-07-30','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(589,'Fernando Beltran 2020-07-18: ESL Classroom Hours','False','2020-07-09','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(590,'Fernando Beltran 2020-07-20: ESL Classroom Hours','False','2020-07-11','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(591,'Fernando Beltran 2020-08-10: ESL Classroom Hours','False','2020-08-01','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(592,'Fernando Beltran 2020-07-11: ESL Classroom Hours','False','2020-07-02','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(593,'Fernando Beltran 2020-07-13: ESL Classroom Hours','False','2020-07-04','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(594,'Fernando Beltran 2020-07-06: ESL Classroom Hours','False','2020-06-27','2.0','','2','','156','24','','');
INSERT INTO "ServiceDelivery__c" VALUES(595,'Yusef Flores 2020-08-08: ESL Classroom Hours','False','2020-07-30','2.0','','2','','179','41','','');
INSERT INTO "ServiceDelivery__c" VALUES(596,'Yusef Flores 2020-08-10: ESL Classroom Hours','False','2020-08-01','2.0','','2','','179','41','','');
INSERT INTO "ServiceDelivery__c" VALUES(597,'Semaj Wall 2020-05-23: ESL Classroom Hours','False','2020-05-14','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(598,'Semaj Wall 2020-05-18: ESL Classroom Hours','False','2020-05-09','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(599,'Semaj Wall 2020-06-08: ESL Classroom Hours','False','2020-05-30','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(600,'Semaj Wall 2020-05-02: ESL Classroom Hours','False','2020-04-23','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(601,'Semaj Wall 2020-07-11: ESL Classroom Hours','False','2020-07-02','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(602,'Semaj Wall 2020-07-18: ESL Classroom Hours','False','2020-07-09','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(603,'Semaj Wall 2020-08-08: ESL Classroom Hours','False','2020-07-30','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(604,'Semaj Wall 2020-06-27: ESL Classroom Hours','False','2020-06-18','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(605,'Semaj Wall 2020-05-04: ESL Classroom Hours','False','2020-04-25','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(606,'Semaj Wall 2020-05-11: ESL Classroom Hours','False','2020-05-02','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(607,'Semaj Wall 2020-06-15: ESL Classroom Hours','False','2020-06-06','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(608,'Semaj Wall 2020-05-25: ESL Classroom Hours','False','2020-05-16','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(609,'Semaj Wall 2020-06-20: ESL Classroom Hours','False','2020-06-11','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(610,'Semaj Wall 2020-07-06: ESL Classroom Hours','False','2020-06-27','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(611,'Semaj Wall 2020-05-09: ESL Classroom Hours','False','2020-04-30','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(612,'Semaj Wall 2020-05-16: ESL Classroom Hours','False','2020-05-07','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(613,'Semaj Wall 2020-05-30: ESL Classroom Hours','False','2020-05-21','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(614,'Semaj Wall 2020-06-01: ESL Classroom Hours','False','2020-05-23','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(615,'Semaj Wall 2020-06-06: ESL Classroom Hours','False','2020-05-28','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(616,'Semaj Wall 2020-06-13: ESL Classroom Hours','False','2020-06-04','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(617,'Semaj Wall 2020-07-13: ESL Classroom Hours','False','2020-07-04','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(618,'Semaj Wall 2020-08-10: ESL Classroom Hours','False','2020-08-01','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(619,'Semaj Wall 2020-06-22: ESL Classroom Hours','False','2020-06-13','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(620,'Semaj Wall 2020-07-20: ESL Classroom Hours','False','2020-07-11','2.0','','2','','180','43','','');
INSERT INTO "ServiceDelivery__c" VALUES(621,'Barbara Johnson 2020-06-20: ESL Classroom Hours','False','2020-06-11','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(622,'Barbara Johnson 2020-06-22: ESL Classroom Hours','False','2020-06-13','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(623,'Barbara Johnson 2020-05-30: ESL Classroom Hours','False','2020-05-21','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(624,'Barbara Johnson 2020-06-13: ESL Classroom Hours','False','2020-06-04','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(625,'Barbara Johnson 2020-05-25: ESL Classroom Hours','False','2020-05-16','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(626,'Barbara Johnson 2020-06-27: ESL Classroom Hours','False','2020-06-18','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(627,'Barbara Johnson 2020-04-25: ESL Classroom Hours','False','2020-04-16','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(628,'Barbara Johnson 2020-07-04: ESL Classroom Hours','False','2020-06-25','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(629,'Barbara Johnson 2020-08-08: ESL Classroom Hours','False','2020-07-30','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(630,'Barbara Johnson 2020-04-18: ESL Classroom Hours','False','2020-04-09','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(631,'Barbara Johnson 2020-04-20: ESL Classroom Hours','False','2020-04-11','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(632,'Barbara Johnson 2020-06-15: ESL Classroom Hours','False','2020-06-06','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(633,'Barbara Johnson 2020-06-06: ESL Classroom Hours','False','2020-05-28','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(634,'Barbara Johnson 2020-07-20: ESL Classroom Hours','False','2020-07-11','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(635,'Barbara Johnson 2020-05-11: ESL Classroom Hours','False','2020-05-02','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(636,'Barbara Johnson 2020-07-18: ESL Classroom Hours','False','2020-07-09','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(637,'Barbara Johnson 2020-08-10: ESL Classroom Hours','False','2020-08-01','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(638,'Barbara Johnson 2020-07-06: ESL Classroom Hours','False','2020-06-27','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(639,'Barbara Johnson 2020-07-13: ESL Classroom Hours','False','2020-07-04','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(640,'Barbara Johnson 2020-05-23: ESL Classroom Hours','False','2020-05-14','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(641,'Barbara Johnson 2020-05-09: ESL Classroom Hours','False','2020-04-30','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(642,'Barbara Johnson 2020-04-04: ESL Classroom Hours','False','2020-03-26','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(643,'Barbara Johnson 2020-04-27: ESL Classroom Hours','False','2020-04-18','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(644,'Barbara Johnson 2020-04-13: ESL Classroom Hours','False','2020-04-04','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(645,'Barbara Johnson 2020-05-02: ESL Classroom Hours','False','2020-04-23','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(646,'Barbara Johnson 2020-04-06: ESL Classroom Hours','False','2020-03-28','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(647,'Barbara Johnson 2020-07-11: ESL Classroom Hours','False','2020-07-02','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(648,'Barbara Johnson 2020-06-01: ESL Classroom Hours','False','2020-05-23','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(649,'Barbara Johnson 2020-06-08: ESL Classroom Hours','False','2020-05-30','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(650,'Barbara Johnson 2020-05-04: ESL Classroom Hours','False','2020-04-25','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(651,'Barbara Johnson 2020-04-11: ESL Classroom Hours','False','2020-04-02','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(652,'Barbara Johnson 2020-05-18: ESL Classroom Hours','False','2020-05-09','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(653,'Barbara Johnson 2020-05-16: ESL Classroom Hours','False','2020-05-07','2.0','','2','','28','50','','');
INSERT INTO "ServiceDelivery__c" VALUES(654,'Jordan Waller 2020-06-09: Grade 1-8 Reading Tutoring','False','2020-05-31','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(655,'Jordan Waller 2020-06-23: Grade 1-8 Reading Tutoring','False','2020-06-14','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(656,'Jordan Waller 2020-07-14: Grade 1-8 Reading Tutoring','False','2020-07-05','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(657,'Jordan Waller 2020-06-02: Grade 1-8 Reading Tutoring','False','2020-05-24','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(658,'Jordan Waller 2020-06-16: Grade 1-8 Reading Tutoring','False','2020-06-07','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(659,'Jordan Waller 2020-06-30: Grade 1-8 Reading Tutoring','False','2020-06-21','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(660,'Jordan Waller 2020-05-26: Grade 1-8 Reading Tutoring','False','2020-05-17','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(661,'Jordan Waller 2020-07-21: Grade 1-8 Reading Tutoring','False','2020-07-12','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(662,'Jordan Waller 2020-04-21: Grade 1-8 Reading Tutoring','False','2020-04-12','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(663,'Jordan Waller 2020-05-05: Grade 1-8 Reading Tutoring','False','2020-04-26','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(664,'Jordan Waller 2020-04-28: Grade 1-8 Reading Tutoring','False','2020-04-19','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(665,'Jordan Waller 2020-07-07: Grade 1-8 Reading Tutoring','False','2020-06-28','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(666,'Jordan Waller 2020-05-12: Grade 1-8 Reading Tutoring','False','2020-05-03','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(667,'Marco Escobar 2020-06-23: Grade 1-8 Reading Tutoring','False','2020-06-14','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(668,'Marco Escobar 2020-07-07: Grade 1-8 Reading Tutoring','False','2020-06-28','2.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(669,'Marco Escobar 2020-05-05: Grade 1-8 Reading Tutoring','False','2020-04-26','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(670,'Marco Escobar 2020-05-12: Grade 1-8 Reading Tutoring','False','2020-05-03','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(671,'Marco Escobar 2020-05-26: Grade 1-8 Reading Tutoring','False','2020-05-17','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(672,'Marco Escobar 2020-04-21: Grade 1-8 Reading Tutoring','False','2020-04-12','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(673,'Marco Escobar 2020-05-19: Grade 1-8 Reading Tutoring','False','2020-05-10','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(674,'Jordan Waller 2020-08-11: Grade 1-8 Reading Tutoring','False','2020-08-02','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(675,'Jordan Waller 2020-04-14: Grade 1-8 Reading Tutoring','False','2020-04-05','3.0','','6','','145','16','','');
INSERT INTO "ServiceDelivery__c" VALUES(676,'Marco Escobar 2020-06-09: Grade 1-8 Reading Tutoring','False','2020-05-31','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(677,'Marco Escobar 2020-07-21: Grade 1-8 Reading Tutoring','False','2020-07-12','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(678,'Marco Escobar 2020-04-14: Grade 1-8 Reading Tutoring','False','2020-04-05','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(679,'Marco Escobar 2020-06-30: Grade 1-8 Reading Tutoring','False','2020-06-21','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(680,'Marco Escobar 2020-06-02: Grade 1-8 Reading Tutoring','False','2020-05-24','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(681,'Marco Escobar 2020-07-14: Grade 1-8 Reading Tutoring','False','2020-07-05','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(682,'Marco Escobar 2020-08-11: Grade 1-8 Reading Tutoring','False','2020-08-02','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(683,'Marco Escobar 2020-06-16: Grade 1-8 Reading Tutoring','False','2020-06-07','3.0','','6','','164','30','','');
INSERT INTO "ServiceDelivery__c" VALUES(684,'Emilie Costa 2020-08-11: Grade 1-8 Reading Tutoring','False','2020-08-02','3.0','','6','','51','60','','');
INSERT INTO "ServiceDelivery__c" VALUES(685,'Fabian Hughes 2020-07-21: Grade 1-8 Reading Tutoring','False','2020-07-12','1.0','','6','','57','64','','');
INSERT INTO "ServiceDelivery__c" VALUES(686,'Fabian Hughes 2020-08-11: Grade 1-8 Reading Tutoring','False','2020-08-02','3.0','','6','','57','64','','');
INSERT INTO "ServiceDelivery__c" VALUES(687,'Tom Higgins 2020-07-21: Grade 1-8 Reading Tutoring','False','2020-07-12','2.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(688,'Tom Higgins 2020-04-28: Grade 1-8 Reading Tutoring','False','2020-04-19','4.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(689,'Tom Higgins 2020-06-02: Grade 1-8 Reading Tutoring','False','2020-05-24','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(690,'Tom Higgins 2020-07-07: Grade 1-8 Reading Tutoring','False','2020-06-28','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(691,'Tom Higgins 2020-04-21: Grade 1-8 Reading Tutoring','False','2020-04-12','4.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(692,'Tom Higgins 2020-07-14: Grade 1-8 Reading Tutoring','False','2020-07-05','3.0','','6','','9','73','','');
INSERT INTO "ServiceDelivery__c" VALUES(693,'Marco Escobar 2020-04-28: Grade 1-8 Reading Tutoring','False','2020-04-19','3.0','','6','','164','30','','');
CREATE TABLE "ServiceParticipant__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"SignUpDate__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Contact__c" VARCHAR(255), 
	"ProgramEngagement__c" VARCHAR(255), 
	"Service__c" VARCHAR(255), 
	"ServiceSchedule__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ServiceParticipant__c" VALUES(1,'Taniyah Rios - Ocean Exploration Series','2019-11-01','Enrolled','100','2','8','2');
INSERT INTO "ServiceParticipant__c" VALUES(2,'Taniyah Rios - STEM Enrichment','2020-02-13','Enrolled','100','2','9','3');
INSERT INTO "ServiceParticipant__c" VALUES(3,'Abraham Sims - Technology Museum Field Trip','2019-11-01','Enrolled','168','32','8','1');
INSERT INTO "ServiceParticipant__c" VALUES(4,'Abraham Sims - STEM Enrichment','2020-02-13','Enrolled','168','32','9','3');
INSERT INTO "ServiceParticipant__c" VALUES(5,'Abraham Sims - STEM Career Exploration','2019-11-01','Enrolled','168','32','9','4');
INSERT INTO "ServiceParticipant__c" VALUES(6,'Naima Crawford - Ocean Exploration Series','2019-11-01','Enrolled','36','53','8','2');
INSERT INTO "ServiceParticipant__c" VALUES(7,'Naima Crawford - STEM Enrichment','2020-02-13','Enrolled','36','53','9','3');
INSERT INTO "ServiceParticipant__c" VALUES(8,'Naima Crawford - STEM Career Exploration','2019-11-01','Enrolled','36','53','9','4');
INSERT INTO "ServiceParticipant__c" VALUES(9,'Jessica Woods - Technology Museum Field Trip','2019-11-01','Enrolled','48','58','8','1');
INSERT INTO "ServiceParticipant__c" VALUES(10,'Ayanna Gonzalez - Ocean Exploration Series','2019-11-01','Enrolled','80','84','8','2');
INSERT INTO "ServiceParticipant__c" VALUES(11,'Ayanna Gonzalez - STEM Enrichment','2020-02-13','Enrolled','80','84','9','3');
INSERT INTO "ServiceParticipant__c" VALUES(12,'Ayanna Gonzalez - STEM Career Exploration','2019-11-01','Enrolled','80','84','9','4');
INSERT INTO "ServiceParticipant__c" VALUES(13,'Alia Duarte - Technology Museum Field Trip','2019-11-01','Enrolled','91','80','8','1');
INSERT INTO "ServiceParticipant__c" VALUES(14,'Alia Duarte - STEM Enrichment','2020-02-13','Enrolled','91','80','9','3');
CREATE TABLE "ServiceSchedule__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"AllDay__c" VARCHAR(255), 
	"CreateServiceSessionRecords__c" VARCHAR(255), 
	"DaysOfWeek__c" VARCHAR(255), 
	"FirstSessionEnd__c" VARCHAR(255), 
	"FirstSessionStart__c" VARCHAR(255), 
	"Frequency__c" VARCHAR(255), 
	"Interval__c" VARCHAR(255), 
	"NumberOfServiceSessions__c" VARCHAR(255), 
	"ParticipantCapacity__c" VARCHAR(255), 
	"ServiceScheduleEndDate__c" VARCHAR(255), 
	"ServiceScheduleEnds__c" VARCHAR(255), 
	"DefaultServiceQuantity__c" VARCHAR(255), 
	"PrimaryServiceProvider__c" VARCHAR(255), 
	"OtherServiceProvider__c" VARCHAR(255), 
	"Service__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ServiceSchedule__c" VALUES(1,'Technology Museum Field Trip','False','True','2','2020-11-09T20:30:00.000+0000','2020-11-09T18:00:00.000+0000','One Time','1.0','','6.0','','After','1.0','','','8');
INSERT INTO "ServiceSchedule__c" VALUES(2,'Ocean Exploration Series','False','True','6','2020-11-11T23:00:00.000+0000','2020-11-11T22:00:00.000+0000','Weekly','1.0','4.0','10.0','','After','1.0','','','8');
INSERT INTO "ServiceSchedule__c" VALUES(3,'STEM Enrichment','False','True','3;5','2020-10-11T20:00:00.000+0000','2020-10-11T18:00:00.000+0000','Weekly','1.0','','15.0','2021-05-04','On','2.0','','','9');
INSERT INTO "ServiceSchedule__c" VALUES(4,'STEM Career Exploration','False','True','','2020-11-01T00:15:00.000+0000','2020-10-31T23:30:00.000+0000','Monthly','1.0','5.0','15.0','','After','','','','9');
CREATE TABLE "ServiceSession__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"SessionEnd__c" VARCHAR(255), 
	"SessionStart__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"PrimaryServiceProvider__c" VARCHAR(255), 
	"OtherServiceProvider__c" VARCHAR(255), 
	"ServiceSchedule__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ServiceSession__c" VALUES(1,'10/12/2021: STEM Enrichment','2021-05-03T20:00:00.000+0000','2021-05-03T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(2,'10/17/2021: STEM Enrichment','2021-05-08T20:00:00.000+0000','2021-05-08T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(3,'10/19/2021: STEM Enrichment','2021-05-10T20:00:00.000+0000','2021-05-10T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(4,'10/24/2021: STEM Enrichment','2021-05-15T20:00:00.000+0000','2021-05-15T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(5,'10/26/2021: STEM Enrichment','2021-05-17T20:00:00.000+0000','2021-05-17T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(6,'10/31/2021: STEM Enrichment','2021-05-22T20:00:00.000+0000','2021-05-22T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(7,'11/2/2021: STEM Enrichment','2021-05-24T20:00:00.000+0000','2021-05-24T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(8,'11/7/2021: STEM Enrichment','2021-05-29T20:00:00.000+0000','2021-05-29T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(9,'11/9/2021: STEM Enrichment','2021-05-31T20:00:00.000+0000','2021-05-31T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(10,'11/14/2021: STEM Enrichment','2021-06-05T20:00:00.000+0000','2021-06-05T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(11,'11/16/2021: STEM Enrichment','2021-06-07T20:00:00.000+0000','2021-06-07T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(12,'11/21/2021: STEM Enrichment','2021-06-12T20:00:00.000+0000','2021-06-12T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(13,'11/23/2021: STEM Enrichment','2021-06-14T20:00:00.000+0000','2021-06-14T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(14,'11/28/2021: STEM Enrichment','2021-06-19T20:00:00.000+0000','2021-06-19T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(15,'11/30/2021: STEM Enrichment','2021-06-21T20:00:00.000+0000','2021-06-21T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(16,'12/4/2021: STEM Enrichment','2021-06-25T20:00:00.000+0000','2021-06-25T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(17,'12/11/2021: STEM Enrichment','2021-07-02T20:00:00.000+0000','2021-07-02T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(18,'12/13/2021: STEM Enrichment','2021-07-04T20:00:00.000+0000','2021-07-04T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(19,'12/18/2021: STEM Enrichment','2021-07-09T20:00:00.000+0000','2021-07-09T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(20,'12/20/2021: STEM Enrichment','2021-07-11T20:00:00.000+0000','2021-07-11T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(21,'12/25/2021: STEM Enrichment','2021-07-16T20:00:00.000+0000','2021-07-16T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(22,'12/27/2021: STEM Enrichment','2021-07-18T20:00:00.000+0000','2021-07-18T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(23,'1/2/2022: STEM Enrichment','2021-07-24T20:00:00.000+0000','2021-07-24T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(24,'1/4/2022: STEM Enrichment','2021-07-26T20:00:00.000+0000','2021-07-26T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(25,'1/9/2022: STEM Enrichment','2021-07-31T20:00:00.000+0000','2021-07-31T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(26,'1/11/2022: STEM Enrichment','2021-08-02T20:00:00.000+0000','2021-08-02T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(27,'1/16/2022: STEM Enrichment','2021-08-07T19:00:00.000+0000','2021-08-07T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(28,'12/6/2021: STEM Enrichment','2021-06-27T20:00:00.000+0000','2021-06-27T19:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(29,'1/18/2022: STEM Enrichment','2021-08-09T19:00:00.000+0000','2021-08-09T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(30,'1/23/2022: STEM Enrichment','2021-08-14T19:00:00.000+0000','2021-08-14T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(31,'1/25/2022: STEM Enrichment','2021-08-16T19:00:00.000+0000','2021-08-16T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(32,'1/30/2022: STEM Enrichment','2021-08-21T19:00:00.000+0000','2021-08-21T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(33,'2/1/2022: STEM Enrichment','2021-08-23T19:00:00.000+0000','2021-08-23T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(34,'2/6/2022: STEM Enrichment','2021-08-28T19:00:00.000+0000','2021-08-28T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(35,'2/8/2022: STEM Enrichment','2021-08-30T19:00:00.000+0000','2021-08-30T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(36,'2/13/2022: STEM Enrichment','2021-09-04T19:00:00.000+0000','2021-09-04T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(37,'2/15/2022: STEM Enrichment','2021-09-06T19:00:00.000+0000','2021-09-06T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(38,'2/20/2022: STEM Enrichment','2021-09-11T19:00:00.000+0000','2021-09-11T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(39,'2/22/2022: STEM Enrichment','2021-09-13T19:00:00.000+0000','2021-09-13T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(40,'2/27/2022: STEM Enrichment','2021-09-18T19:00:00.000+0000','2021-09-18T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(41,'3/1/2022: STEM Enrichment','2021-09-20T19:00:00.000+0000','2021-09-20T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(42,'3/6/2022: STEM Enrichment','2021-09-25T19:00:00.000+0000','2021-09-25T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(43,'3/8/2022: STEM Enrichment','2021-09-27T19:00:00.000+0000','2021-09-27T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(44,'3/13/2022: STEM Enrichment','2021-10-02T19:00:00.000+0000','2021-10-02T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(45,'3/15/2022: STEM Enrichment','2021-10-04T19:00:00.000+0000','2021-10-04T18:00:00.000+0000','Pending','','','3');
INSERT INTO "ServiceSession__c" VALUES(46,'8/22/2021: STEM Enrichment','2021-03-13T19:00:00.000+0000','2021-03-13T18:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(47,'8/24/2021: STEM Enrichment','2021-03-15T19:00:00.000+0000','2021-03-15T18:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(48,'8/29/2021: STEM Enrichment','2021-03-20T19:00:00.000+0000','2021-03-20T18:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(49,'8/31/2021: STEM Enrichment','2021-03-22T19:00:00.000+0000','2021-03-22T18:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(50,'9/7/2021: STEM Enrichment','2021-03-29T20:00:00.000+0000','2021-03-29T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(51,'9/12/2021: STEM Enrichment','2021-04-03T20:00:00.000+0000','2021-04-03T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(52,'9/14/2021: STEM Enrichment','2021-04-05T20:00:00.000+0000','2021-04-05T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(53,'9/19/2021: STEM Enrichment','2021-04-10T20:00:00.000+0000','2021-04-10T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(54,'9/21/2021: STEM Enrichment','2021-04-12T20:00:00.000+0000','2021-04-12T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(55,'9/26/2021: STEM Enrichment','2021-04-17T20:00:00.000+0000','2021-04-17T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(56,'9/28/2021: STEM Enrichment','2021-04-19T20:00:00.000+0000','2021-04-19T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(57,'10/3/2021: STEM Enrichment','2021-04-24T20:00:00.000+0000','2021-04-24T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(58,'10/5/2021: STEM Enrichment','2021-04-26T20:00:00.000+0000','2021-04-26T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(59,'10/10/2021: STEM Enrichment','2021-05-01T20:00:00.000+0000','2021-05-01T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(60,'9/5/2021: STEM Enrichment','2021-03-27T20:00:00.000+0000','2021-03-27T19:00:00.000+0000','Complete','','','3');
INSERT INTO "ServiceSession__c" VALUES(61,'9/11/2021: STEM Career Exploration','2021-04-03T00:15:00.000+0000','2021-04-02T23:30:00.000+0000','Complete','','','4');
INSERT INTO "ServiceSession__c" VALUES(62,'10/11/2021: STEM Career Exploration','2021-05-03T00:15:00.000+0000','2021-05-02T23:30:00.000+0000','Complete','','','4');
INSERT INTO "ServiceSession__c" VALUES(63,'11/11/2021: STEM Career Exploration','2021-06-03T00:15:00.000+0000','2021-06-02T23:30:00.000+0000','Pending','','','4');
INSERT INTO "ServiceSession__c" VALUES(64,'12/11/2021: STEM Career Exploration','2021-07-03T00:15:00.000+0000','2021-07-02T23:30:00.000+0000','Pending','','','4');
INSERT INTO "ServiceSession__c" VALUES(65,'1/9/2022: STEM Career Exploration','2021-08-01T00:15:00.000+0000','2021-07-31T23:30:00.000+0000','Pending','','','4');
INSERT INTO "ServiceSession__c" VALUES(66,'9/20/2021: Technology Museum Field Trip','2021-04-11T20:30:00.000+0000','2021-04-11T18:00:00.000+0000','Complete','','','1');
INSERT INTO "ServiceSession__c" VALUES(67,'9/22/2021: Ocean Exploration Series','2021-04-13T23:00:00.000+0000','2021-04-13T22:00:00.000+0000','Complete','','','2');
INSERT INTO "ServiceSession__c" VALUES(68,'9/29/2021: Ocean Exploration Series','2021-04-20T23:00:00.000+0000','2021-04-20T22:00:00.000+0000','Complete','','','2');
INSERT INTO "ServiceSession__c" VALUES(69,'10/6/2021: Ocean Exploration Series','2021-04-27T23:00:00.000+0000','2021-04-27T22:00:00.000+0000','Complete','','','2');
INSERT INTO "ServiceSession__c" VALUES(70,'10/13/2021: Ocean Exploration Series','2021-05-04T23:00:00.000+0000','2021-05-04T22:00:00.000+0000','Complete','','','2');
CREATE TABLE "Service__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"UnitOfMeasurement__c" VARCHAR(255), 
	"Program__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Service__c" VALUES(1,'Monthly Rent Subsidy','Monthly Rent Subsidy - sliding scale','Active','Dollars','8');
INSERT INTO "Service__c" VALUES(2,'ESL Classroom Hours','ESL Classroom Hours','Active','Hours','9');
INSERT INTO "Service__c" VALUES(3,'Job Interviews completed','','Active','Completed Interviews','1');
INSERT INTO "Service__c" VALUES(4,'Financial Advisor Sessions','','Active','Hours','1');
INSERT INTO "Service__c" VALUES(5,'Job Readiness Coaching','','Active','Hours','1');
INSERT INTO "Service__c" VALUES(6,'Grade 1-8 Reading Tutoring','Grade 1-8 Reading Tutoring','Active','Hours','10');
INSERT INTO "Service__c" VALUES(7,'After School Activities','Indoor/Outdoor After-School Activities','Active','Sessions','2');
INSERT INTO "Service__c" VALUES(8,'STEM Field Trips','','Active','Field Trips','3');
INSERT INTO "Service__c" VALUES(9,'Middle School STEM Classroom Hours','','Active','Hours','3');
INSERT INTO "Service__c" VALUES(10,'Town Hall Meeting, 1/8/2020','','Active','Attendees','4');
INSERT INTO "Service__c" VALUES(11,'Letter writing campaign to Council Members','','Active','Letters','4');
INSERT INTO "Service__c" VALUES(12,'12 Step Recovery Program','12 Step Recovery Program','Active','Session','5');
INSERT INTO "Service__c" VALUES(13,'Subsidized Lunch','','Active','Lunches','6');
INSERT INTO "Service__c" VALUES(14,'Financial Literacy Classroom Hours','Financial Literacy Classroom Hours','Active','Hours','7');
COMMIT;
