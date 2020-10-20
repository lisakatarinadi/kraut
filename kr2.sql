-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für krautundrueben
CREATE DATABASE IF NOT EXISTS `krautundrueben` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `krautundrueben`;

-- Exportiere Struktur von Tabelle krautundrueben.allergene
CREATE TABLE IF NOT EXISTS `allergene` (
  `ALLERG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALLERG_NAME` mediumtext DEFAULT '0',
  PRIMARY KEY (`ALLERG_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.allergene: ~17 rows (ungefähr)
/*!40000 ALTER TABLE `allergene` DISABLE KEYS */;
REPLACE INTO `allergene` (`ALLERG_ID`, `ALLERG_NAME`) VALUES
	(1, 'Laktose'),
	(2, 'Gluten'),
	(3, 'Ei'),
	(4, 'Erdnuss'),
	(5, 'Fisch'),
	(6, 'Schalentiere'),
	(7, 'Lupinen'),
	(8, 'Schalenfrüchte'),
	(9, 'Schwefeldioxid'),
	(10, 'Sellerie'),
	(11, 'Senf'),
	(12, 'Soja'),
	(13, 'Weichtiere'),
	(14, 'Sesam'),
	(15, 'Weizen'),
	(16, 'Stärke'),
	(17, 'Karotte');
/*!40000 ALTER TABLE `allergene` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellung
CREATE TABLE IF NOT EXISTS `bestellung` (
  `BESTELLNR` int(11) NOT NULL AUTO_INCREMENT,
  `KUNDENNR` int(11) DEFAULT NULL,
  `BESTELLDATUM` date DEFAULT NULL,
  `RECHNUNGSBETRAG` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`),
  KEY `KUNDENNR` (`KUNDENNR`),
  CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`KUNDENNR`) REFERENCES `kunde` (`KUNDENNR`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellung: ~12 rows (ungefähr)
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
REPLACE INTO `bestellung` (`BESTELLNR`, `KUNDENNR`, `BESTELLDATUM`, `RECHNUNGSBETRAG`) VALUES
	(1, 2001, '2020-07-01', 6.21),
	(2, 2002, '2020-07-08', 32.96),
	(3, 2003, '2020-08-01', 24.08),
	(4, 2004, '2020-08-02', 19.90),
	(5, 2005, '2020-08-02', 6.47),
	(6, 2006, '2020-08-10', 6.96),
	(7, 2007, '2020-08-10', 2.41),
	(8, 2008, '2020-08-10', 13.80),
	(9, 2009, '2020-08-10', 8.67),
	(10, 2007, '2020-08-15', 17.98),
	(11, 2005, '2020-08-12', 8.67),
	(12, 2003, '2020-08-13', 20.87);
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellungzutat
CREATE TABLE IF NOT EXISTS `bestellungzutat` (
  `BESTELLNR` int(11) NOT NULL,
  `ZUTATENNR` int(11) NOT NULL,
  `MENGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`,`ZUTATENNR`),
  KEY `ZUTATENNR` (`ZUTATENNR`),
  CONSTRAINT `bestellungzutat_ibfk_1` FOREIGN KEY (`BESTELLNR`) REFERENCES `bestellung` (`BESTELLNR`),
  CONSTRAINT `bestellungzutat_ibfk_2` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellungzutat: ~26 rows (ungefähr)
/*!40000 ALTER TABLE `bestellungzutat` DISABLE KEYS */;
REPLACE INTO `bestellungzutat` (`BESTELLNR`, `ZUTATENNR`, `MENGE`) VALUES
	(1, 1001, 5),
	(1, 1002, 3),
	(1, 1004, 3),
	(1, 1006, 2),
	(2, 1003, 4),
	(2, 1005, 5),
	(2, 6408, 5),
	(2, 9001, 10),
	(3, 3001, 5),
	(3, 6300, 15),
	(4, 3003, 2),
	(4, 5001, 7),
	(5, 1001, 5),
	(5, 1002, 4),
	(5, 1004, 5),
	(6, 1010, 5),
	(7, 1009, 9),
	(8, 1008, 7),
	(8, 1012, 5),
	(9, 1007, 4),
	(9, 1012, 5),
	(10, 1011, 7),
	(10, 4001, 7),
	(11, 1012, 5),
	(11, 5001, 2),
	(12, 1010, 15);
/*!40000 ALTER TABLE `bestellungzutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.kategorie
CREATE TABLE IF NOT EXISTS `kategorie` (
  `KAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `KAT_NAME` mediumtext NOT NULL DEFAULT '0',
  PRIMARY KEY (`KAT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.kategorie: ~6 rows (ungefähr)
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
REPLACE INTO `kategorie` (`KAT_ID`, `KAT_NAME`) VALUES
	(1, 'Vegetarisch'),
	(2, 'Vegan'),
	(3, 'Frutarisch'),
	(4, 'Laktosefrei'),
	(5, 'Glutenfrei'),
	(6, 'Ketonisch');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.kunde
CREATE TABLE IF NOT EXISTS `kunde` (
  `KUNDENNR` int(11) NOT NULL,
  `NACHNAME` varchar(50) DEFAULT NULL,
  `VORNAME` varchar(50) DEFAULT NULL,
  `GEBURTSDATUM` date DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `HAUSNR` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KUNDENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.kunde: ~9 rows (ungefähr)
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
REPLACE INTO `kunde` (`KUNDENNR`, `NACHNAME`, `VORNAME`, `GEBURTSDATUM`, `STRASSE`, `HAUSNR`, `PLZ`, `ORT`, `TELEFON`, `EMAIL`) VALUES
	(2001, 'Wellensteyn', 'Kira', '1990-05-05', 'Eppendorfer Landstrasse', '104', '20249', 'Hamburg', '040/443322', 'k.wellensteyn@yahoo.de'),
	(2002, 'Foede', 'Dorothea', '2000-03-24', 'Ohmstraße', '23', '22765', 'Hamburg', '040/543822', 'd.foede@web.de'),
	(2003, 'Leberer', 'Sigrid', '1989-09-21', 'Bilser Berg', '6', '20459', 'Hamburg', '0175/1234588', 'sigrid@leberer.de'),
	(2004, 'Soerensen', 'Hanna', '1974-04-03', 'Alter Teichweg', '95', '22049', 'Hamburg', '040/634578', 'h.soerensen@yahoo.de'),
	(2005, 'Schnitter', 'Marten', '1964-04-17', 'Stübels', '10', '22835', 'Barsbüttel', '0176/447587', 'schni_mart@gmail.com'),
	(2006, 'Maurer', 'Belinda', '1978-09-09', 'Grotelertwiete', '4a', '21075', 'Hamburg', '040/332189', 'belinda1978@yahoo.de'),
	(2007, 'Gessert', 'Armin', '1978-01-29', 'Küstersweg', '3', '21079', 'Hamburg', '040/67890', 'armin@gessert.de'),
	(2008, 'Haessig', 'Jean-Marc', '1982-08-30', 'Neugrabener Bahnhofstraße', '30', '21149', 'Hamburg', '0178-67013390', 'jm@haessig.de'),
	(2009, 'Urocki', 'Eric', '1999-12-04', 'Elbchaussee', '228', '22605', 'Hamburg', '0152-96701390', 'urocki@outlook.de');
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.lieferant
CREATE TABLE IF NOT EXISTS `lieferant` (
  `LIEFERANTENNR` int(11) NOT NULL,
  `LIEFERANTENNAME` varchar(50) DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `HAUSNR` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LIEFERANTENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.lieferant: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `lieferant` DISABLE KEYS */;
REPLACE INTO `lieferant` (`LIEFERANTENNR`, `LIEFERANTENNAME`, `STRASSE`, `HAUSNR`, `PLZ`, `ORT`, `TELEFON`, `EMAIL`) VALUES
	(101, 'Bio-Hof Müller', 'Dorfstraße', '74', '24354', 'Weseby', '04354-9080', 'mueller@biohof.de'),
	(102, 'Obst-Hof Altes Land', 'Westerjork 74', '76', '21635', 'Jork', '04162-4523', 'info@biohof-altesland.de'),
	(103, 'Molkerei Henning', 'Molkereiwegkundekunde', '13', '19217', 'Dechow', '038873-8976', 'info@molkerei-henning.de'),
	(104, 'Bode Naturkost', 'Havighorster Weg', '6f', '21031', 'Hamburg', '040-7397035', 'info@bode.bio');
/*!40000 ALTER TABLE `lieferant` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezept
CREATE TABLE IF NOT EXISTS `rezept` (
  `r_id` int(11) NOT NULL,
  `NAME` text DEFAULT NULL,
  `DESCR` text DEFAULT NULL,
  `TIME` time DEFAULT NULL,
  `r_kcal` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezept: ~5 rows (ungefähr)
/*!40000 ALTER TABLE `rezept` DISABLE KEYS */;
REPLACE INTO `rezept` (`r_id`, `NAME`, `DESCR`, `TIME`, `r_kcal`) VALUES
	(1, 'Lachslasagne', 'Den Spinat 5 min vorgaren, auspressen bis er ganz trocken ist und\r\nwürzen.\r\nDen Lachs etwas auftauen lassen, in kleine Stücke schneiden und\r\nmit Zitrone, Salz und Pfeffer würzen.\r\nFür die Bechamel-Soße wird die Butter im Topf erhitzt, das Mehl\r\nverrührt und mit der Milch aufgegossen. Die Brühe dazugeben und\r\n5 min. kochen lassen. Danach die Sahne dazurühren und nochmals\r\naufkochen lassen.\r\nSchließlich den Parmesan hinzufügen und mit Pfeffer und Muskat\r\nabschmecken. Jetzt alles abwechselnd in eine feuerfeste Form\r\nschichten, zuerst die Soße, dann Lasagneblätter, Soße, Spinat,\r\nLachs, Käse, Lasagneblätter, usw. Letzte Schicht ist Soße.\r\nDie Lasagne anschließend bei 200 Grad 45 min. in den Backofen.', '01:00:00', NULL),
	(2, 'Thaicurry mit Hähnchen', 'Die Hühnerbrust in Streifen schneiden und in einer Marinade aus\r\nSojasauce, Pfeffer und Zucker ca. 1 Stunde marinieren.\r\nIm Wok oder in der Pfanne gut anbraten. Herausnehmen.\r\nGemischtes Gemüse und Bambussprossen waschen und sehr fein\r\nschneiden, ebenfalls anbraten, dann herausnehmen.\r\nDie Currypaste und die Kokosmilch im Wok verrühren und kurz (!)\r\ndurchköcheln lassen. Dann Fleisch und Gemüse wieder zugeben\r\nund noch kurz köcheln lassen.\r\nMit Sojasauce abschmecken.\r\nIn der Zwischenzeit den Reis kochen und abtropfen lassen.', '02:00:00', NULL),
	(3, 'Kartoffelsuppe', 'Kartoffeln und Karotte schälen und in grobe Würfel schneiden.\r\nZwiebel würfeln. Lauch in Ringe schneiden.\r\nZwiebeln in etwas Olivenöl glasig dünsten, Lauch dazugeben. Mit\r\nder Gemüsebrühe ablöschen.\r\nDie gewürfelten Kartoffeln und Karotte in die Brühe geben. Alles\r\nfür ca. 20 min köcheln lassen.\r\nAnschließend alles mit dem Pürierstab zu einer Suppe pürieren, mit\r\nPfeffer und Muskat abschmecken.\r\nDie in Scheiben geschnittenen Würstchen in den Suppenteller\r\ngeben und die heiße Kartoffelsuppe darüber gießen.', '00:40:00', NULL),
	(4, 'Milchreis mit Apfelmuß', 'In einem großen Topf die Butter schmelzen, anschließend den\r\nRundkornreis kurz in der Butter anschwitzen. Nun die\r\nzimmerwarme Vollmilch sowie 4 EL Zucker hinzugeben.\r\nVanillezucker hinzugeben. Alles unter vorsichtigem Rühren mit dem\r\nHolzkochlöffel einmal aufkochen lassen und dabei aufpassen, dass\r\nsich nichts am Topfboden ansetzt.\r\nNun den Topf auf eine Herdplatte stellen, die auf kleinster Stufe\r\nheizt. Den Milchreis im geschlossenen Topf exakt 30 Minuten\r\nziehen lassen. Nach der Hälfte der Zeit einmal umrühren.\r\nNach 30 Minuten ist der Milchreis servierfertig, er kann warm oder\r\nkalt gegessen werden.\r\nNach Geschmack Apfelmus dazu reichen.', '01:00:00', NULL),
	(5, 'Sommerlicher Couscous-Salat', 'Couscous in eine Schale geben und mit kochender Gemüsebrühe\r\nübergießen. Kurz umrühren, quellen lassen und evtl. Wasser\r\nnachgeben.\r\nInzwischen das Gemüse waschen und anschließend würfeln. Die\r\nKräuter waschen und kleinhacken. Diese Zutaten mit dem\r\nCouscous vermischen. Nun Öl hinzugeben und zum Schluss mit\r\nSalz und Pfeffer abschmecken.', '00:30:00', NULL),
	(6, 'Kartoffelsuppe (vegan)', 'Kartoffeln und Karotte schälen und in grobe Würfel schneiden.\r\nZwiebel würfeln. Lauch in Ringe schneiden.\r\nZwiebeln in etwas Olivenöl glasig dünsten, Lauch dazugeben. Mit\r\nder Gemüsebrühe ablöschen.\r\nDie gewürfelten Kartoffeln und Karotte in die Brühe geben. Alles\r\nfür ca. 20 min köcheln lassen.\r\nAnschließend alles mit dem Pürierstab zu einer Suppe pürieren, mit\r\nPfeffer und Muskat abschmecken.\r\nDie in Scheiben geschnittenen Würstchen in den Suppenteller\r\ngeben und die heiße Kartoffelsuppe darüber gießen.', '00:40:00', NULL);
/*!40000 ALTER TABLE `rezept` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezeptkat
CREATE TABLE IF NOT EXISTS `rezeptkat` (
  `rezept` int(11) DEFAULT NULL,
  `kategorie` int(11) DEFAULT NULL,
  KEY `FK_R` (`rezept`),
  KEY `FK_K` (`kategorie`),
  CONSTRAINT `FK_K` FOREIGN KEY (`kategorie`) REFERENCES `kategorie` (`KAT_ID`),
  CONSTRAINT `FK_R` FOREIGN KEY (`rezept`) REFERENCES `rezept` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezeptkat: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rezeptkat` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezeptkat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezeptzutat
CREATE TABLE IF NOT EXISTS `rezeptzutat` (
  `r_id` int(11) NOT NULL,
  `z_id` int(11) NOT NULL,
  `DISPLAY_MENGE` text DEFAULT NULL,
  `ORDER_MENGE` int(11) DEFAULT NULL,
  KEY `rezept` (`r_id`),
  KEY `zutat` (`z_id`),
  CONSTRAINT `rezept` FOREIGN KEY (`r_id`) REFERENCES `rezept` (`r_id`),
  CONSTRAINT `zutat` FOREIGN KEY (`z_id`) REFERENCES `zutat` (`ZUTATENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezeptzutat: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rezeptzutat` DISABLE KEYS */;
REPLACE INTO `rezeptzutat` (`r_id`, `z_id`, `DISPLAY_MENGE`, `ORDER_MENGE`) VALUES
	(1, 8001, '300g', 1),
	(1, 1013, '800g', 3),
	(1, 5002, '500g', 2),
	(1, 3004, '150g', 1),
	(1, 3003, '50g', 1),
	(1, 6501, '2 EL', 1),
	(1, 3001, '250ml', 1),
	(1, 7043, '125ml', 1),
	(1, 3005, '200g', 1),
	(1, 3006, '75g', 1),
	(1, 1014, 'eine', 1),
	(1, 9051, 'eine Priese', 1),
	(1, 9052, 'eine Priese', 1),
	(2, 5003, '500g', 2),
	(2, 6601, '250g', 1),
	(2, 9071, '2 EL', 1),
	(2, 6502, '1 EL', 1),
	(2, 1009, 'eine Zehe', 1),
	(2, 1101, '800g', 2),
	(2, 1201, 'ein Glas', 1),
	(2, 9061, '125ml', 1),
	(2, 9062, '1 EL', 1),
	(2, 9051, 'eine Priese', 1),
	(3, 1006, '5', 5),
	(3, 1005, '1', 1),
	(3, 1008, 'eine Stange', 1),
	(3, 1002, '1', 1),
	(3, 7043, '1000ml', 2),
	(3, 5001, '2', 1),
	(3, 1016, 'etwas', 1),
	(3, 9053, 'etwas', 1),
	(3, 9052, 'eine Priese', 1),
	(4, 3001, '1l', 1),
	(4, 6502, '4 EL', 1),
	(4, 6602, '250g', 1),
	(4, 3003, '1 EL', 1),
	(4, 9054, '1 Päckchen', 1),
	(4, 1301, '1 Glas', 1),
	(5, 6408, '200g', 1),
	(5, 7043, '300ml', 1),
	(5, 1003, '3', 3),
	(5, 1001, '1', 1),
	(5, 1017, '1', 1),
	(5, 9055, '3 EL', 1),
	(5, 9081, '2 EL', 1),
	(6, 1006, '5', 5),
	(6, 1005, '1', 1),
	(6, 1008, 'eine Stange', 1),
	(6, 1002, '1', 1),
	(6, 7043, '100ml', 2),
	(6, 1016, 'etwas', 1),
	(6, 9053, 'etwas', 1),
	(6, 9052, 'eine Priese', 1),
	(6, 9001, '2', 1);
/*!40000 ALTER TABLE `rezeptzutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.zutat
CREATE TABLE IF NOT EXISTS `zutat` (
  `ZUTATENNR` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(50) DEFAULT NULL,
  `EINHEIT` varchar(25) DEFAULT NULL,
  `VPE` mediumtext DEFAULT NULL,
  `NETTOPREIS` decimal(10,2) DEFAULT NULL,
  `BESTAND` int(11) DEFAULT NULL,
  `LIEFERANT` int(11) DEFAULT NULL,
  `KALORIEN` int(11) DEFAULT NULL,
  `KOHLENHYDRATE` float DEFAULT NULL,
  `PROTEIN` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ZUTATENNR`),
  KEY `LIEFERANT` (`LIEFERANT`),
  CONSTRAINT `zutat_ibfk_1` FOREIGN KEY (`LIEFERANT`) REFERENCES `lieferant` (`LIEFERANTENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.zutat: ~47 rows (ungefähr)
/*!40000 ALTER TABLE `zutat` DISABLE KEYS */;
REPLACE INTO `zutat` (`ZUTATENNR`, `BEZEICHNUNG`, `EINHEIT`, `VPE`, `NETTOPREIS`, `BESTAND`, `LIEFERANT`, `KALORIEN`, `KOHLENHYDRATE`, `PROTEIN`) VALUES
	(1001, 'Zucchini', 'Stück', '1 Stk', 0.89, 100, 101, 19, 2, 1.60),
	(1002, 'Zwiebel', 'Stück', '1 Stk', 0.15, 50, 101, 28, 5, 1.20),
	(1003, 'Tomate', 'Stück', '1 Stk', 0.45, 50, 101, 18, 3, 1.00),
	(1004, 'Schalotte', 'Stück', '1 Stk', 0.20, 500, 101, 25, 3, 1.50),
	(1005, 'Karotte', 'Stück', '1 Stk', 0.30, 500, 101, 41, 10, 0.90),
	(1006, 'Kartoffel', 'Stück', '1 Stk', 0.15, 1500, 101, 71, 15, 2.00),
	(1007, 'Rucola', 'Bund', '125g', 0.90, 10, 101, 27, 2, 2.60),
	(1008, 'Lauch', 'Bund', '200g', 1.20, 35, 101, 29, 3, 2.10),
	(1009, 'Knoblauch', 'Stück', '1 Stk', 0.25, 250, 101, 141, 28, 6.10),
	(1010, 'Basilikum', 'Bund', '4 Stängel', 1.30, 10, 101, 41, 5, 3.10),
	(1011, 'Süßkartoffel', 'Stück', '1 Stk', 2.00, 200, 101, 86, 20, 1.60),
	(1012, 'Schnittlauch', 'Bund', 'ca 10 Stängel', 0.90, 10, 101, 28, 1, 3.00),
	(1013, 'Spinat', 'Packung', '300g', 4.00, 15, 101, 210, 12, 28.00),
	(1014, 'Zitrone', 'Stück', '1 Stk', 0.00, 20, 102, NULL, NULL, NULL),
	(1016, 'Petersilie', 'Bund', 'ca 10 Stängel', 1.00, 62, 102, 53, 7.4, 4.40),
	(1017, 'Paprikaschote', 'Stück', '1 Stk', 0.00, 15, 102, 43, 6.4, 1.30),
	(1101, 'gemischtes Gemüse (TK)', 'Packung', '400g', 2.00, 17, 101, 106, 6, 2.00),
	(1201, 'Bambussprossen', 'Glas', '250g', 3.00, 7, 104, 22, 0.9, 2.60),
	(1301, 'Apfelmus', 'Glas', '400g', 1.50, 10, 102, 84, 18, 0.50),
	(2001, 'Apfel', 'Stück', '1 Stk', 1.20, 750, 102, 54, 14, 0.30),
	(3001, 'Vollmilch. 3.5%', 'Packung', '1L', 1.50, 50, 103, 65, 5, 3.40),
	(3002, 'Mozzarella', 'Packung', '1 Stk', 3.50, 20, 103, 241, 1, 18.10),
	(3003, 'Butter', 'Stück', '250g', 3.00, 50, 103, 741, 1, 0.70),
	(3004, 'Käse (gerieben)', 'Packung ', '150g', 1.00, 30, 103, 0, 0, 0.00),
	(3005, 'Sahne', 'Packung', '200ml', 0.00, 15, 103, NULL, NULL, NULL),
	(3006, 'Parmesan (gerieben)', 'Packung', '75g', 0.00, 10, 103, NULL, NULL, NULL),
	(4001, 'Ei', 'Stück', '1 Stk', 0.40, 300, 102, 137, 2, 11.90),
	(5001, 'Wiener Würstchen', 'Glas', '250g', 1.80, 40, 101, 331, 1, 9.90),
	(5002, 'Lachs (TK)', 'Packung', '250g', 4.00, 6, 104, 250, 0, 23.00),
	(5003, 'Hähnchenbrustfilet', 'Packung', '250g', 5.00, 23, 101, NULL, NULL, NULL),
	(6300, 'Kichererbsen', 'Dose', '265g', 1.00, 400, 103, 150, 21, 9.00),
	(6408, 'Couscous', 'Packung', '250g', 1.90, 15, 102, 351, 67, 12.00),
	(6501, 'Mehl', 'Packung', '250g', 0.00, 25, 101, NULL, NULL, NULL),
	(6502, 'Zucker', 'Packung', '500g', 0.00, 33, 101, 400, 100, 0.00),
	(6601, 'Reis', 'Packung', '250g', 1.00, 33, 104, NULL, NULL, NULL),
	(6602, 'Milchreis', 'Packung', '250g', 1.00, 6, 104, 357, 80, 5.80),
	(7043, 'Gemüsebrühe', 'Würfel', '500ml', 0.20, 4000, 101, 1, 1, 0.50),
	(8001, 'Lasagneplatten', 'Packung', '500g', 5.00, 10, 104, 362, 71, 12.00),
	(9001, 'Tofu-Würstchen', 'Packung', '150g', 1.80, 20, 103, 252, 7, 17.00),
	(9051, 'Pfeffer (gemahlen)', 'Packung', '10g', 0.00, 100, NULL, NULL, NULL, NULL),
	(9052, 'Muskat (gerieben)', 'Packung', '10g', 0.00, 30, NULL, NULL, NULL, NULL),
	(9053, 'Majoran (gerbelt)', 'Packung', '25g', 3.00, 15, 101, 1, 1, 0.00),
	(9054, 'Vanillezucker', 'Packung', '1 Pack', 0.30, 50, 104, 394, 98.5, 0.00),
	(9055, 'Kräutermischung (getrocknet)', 'Packung', '25g', 0.00, 100, 101, 1, 1, 1.00),
	(9061, 'Kokosmilch', 'Dose', '400ml', 2.00, 3, 104, 222, 4, 2.00),
	(9062, 'Currypaste (grün)', 'Dose', '20g', 1.00, 5, 104, 140, 16, 3.20),
	(9071, 'Sojasauße', 'Flasche', '150ml', 3.00, 14, 104, 41, 5, 5.00),
	(9081, 'Rapsöl', 'Flasche', '100ml', 1.00, 32, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `zutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.zutatallergen
CREATE TABLE IF NOT EXISTS `zutatallergen` (
  `ZUTAT` int(11) NOT NULL,
  `ALLERGENE` int(11) NOT NULL,
  KEY `FK_Zutat` (`ZUTAT`),
  KEY `FK_Allergy` (`ALLERGENE`),
  CONSTRAINT `FK_Allergy` FOREIGN KEY (`ALLERGENE`) REFERENCES `allergene` (`ALLERG_ID`),
  CONSTRAINT `FK_Zutat` FOREIGN KEY (`ZUTAT`) REFERENCES `zutat` (`ZUTATENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.zutatallergen: ~11 rows (ungefähr)
/*!40000 ALTER TABLE `zutatallergen` DISABLE KEYS */;
REPLACE INTO `zutatallergen` (`ZUTAT`, `ALLERGENE`) VALUES
	(3001, 1),
	(9001, 12),
	(9001, 2),
	(9001, 10),
	(1005, 16),
	(1011, 16),
	(3002, 1),
	(4001, 3),
	(5001, 10),
	(6408, 2),
	(6408, 15),
	(8001, 2);
/*!40000 ALTER TABLE `zutatallergen` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
