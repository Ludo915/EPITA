CREATE DATABASE Parc;
USE Parc;

CREATE TABLE Segment(indIP VARCHAR(11) PRIMARY KEY, 
					 nomSegment VARCHAR(20) NOT NULL,
                     etage NUMERIC(2));
                     
CREATE TABLE Salle(nSalle VARCHAR(7) PRIMARY KEY, 
					 nomSalle VARCHAR(20) NOT NULL,
                     nbPoste NUMERIC(2),
                     indIP VARCHAR(11));
                     
CREATE TABLE Poste(nPoste VARCHAR(7) PRIMARY KEY,
				   nomPoste VARCHAR(20) NOT NULL,
                   indIP VARCHAR(11),
                   ad VARCHAR(3) CHECK(ad BETWEEN '000' AND '255'),
                   typePoste VARCHAR(9),
                   nSalle VARCHAR(7));
                   
CREATE TABLE Logiciel(nLog VARCHAR(5) PRIMARY KEY,
					  nomLog VARCHAR(20),
                      dateAch DATE,
                      versionL VARCHAR(7),
                      typeLog VARCHAR(9),
                      prix NUMERIC(6,2) CHECK (prix >=0));

CREATE TABLE Installer(nPoste VARCHAR(7),
					   nLog VARCHAR(5),
                       numIns NUMERIC(5),
                       dateIns DATETIME DEFAULT NOW(),
                       delai INT,
                       CONSTRAINT pk_Installer PRIMARY KEY (nPoste, nLog));
                       
CREATE TABLE Type_(typeLP varchar(9) PRIMARY KEY,
				   nomType varchar(20));
                     
DESC Installer;
DESC Logiciel;
DESC Poste;

DROP TABLE Installer;
DROP TABLE Logiciel;
DROP TABLE Poste;
DROP TABLE Salle;
DROP TABLE Segment;
DROP TABLE Type_;

CREATE DATABASE Chantier;
USE Chantier;
CREATE TABLE Employe (n_emp VARCHAR(4), 
					  nom_ch VARCHAR(20), 
                      qualif_emp VARCHAR(12), 
                      CONSTRAINT pk_emp PRIMARY KEY (n_emp));

CREATE TABLE Chantier (n_chantier VARCHAR(10), 
					   nom_ch VARCHAR(10), 
                       adresse_ch VARCHAR(15), 
                       CONSTRAINT pk_chan PRIMARY KEY(n_chantier));

CREATE TABLE Vehicule (n_vehicule VARCHAR(10), 
				       type_vehicule VARCHAR(1), 
					   kilometrage NUMERIC, 
                       CONSTRAINT pk_vehi PRIMARY KEY(n_vehicule));

CREATE TABLE visite(
						n_chantier VARCHAR(10), 
						n_vehicule VARCHAR(10), date_jour DATE, 
						kilometres NUMERIC, n_conducteur VARCHAR(4),
						CONSTRAINT pk_visite PRIMARY KEY(n_chantier,n_vehicule,date_jour),
						CONSTRAINT fk_depl_chantier  FOREIGN KEY(n_chantier) REFERENCES chantier(n_chantier),
						CONSTRAINT fk_depl_vehicule  FOREIGN KEY(n_vehicule) REFERENCES vehicule(n_vehicule),
						CONSTRAINT fk_depl_employe   FOREIGN KEY(n_conducteur) REFERENCES employe(n_emp));

CREATE TABLE Transporter (n_chantier VARCHAR(10),
						  n_vehicule VARCHAR(10),
                          n_transporte VARCHAR(4),
                          date_jour DATE,
                          CONSTRAINT pk_transporter PRIMARY KEY(n_chantier, n_vehicule, n_transporte, date_jour),
						  CONSTRAINT fk_transp_visite FOREIGN KEY(n_chantier, n_vehicule, date_jour)
							REFERENCES Visite(n_chantier,n_vehicule, date_jour),
						  CONSTRAINT fk_transp_employe FOREIGN KEY(n_transporte)
							REFERENCES Employe(n_emp));


INSERT INTO Parc.Segment(INDIP,NOMSEGMENT)
VALUES ('130.120.80','Brin RDC'),
	   ('130.120.81', 'Brin 1er etage'),
       ('130.120.82', 'Brin 2eme etage');
       
SELECT * FROM Parc.Segment;    
USE Parc ; 

INSERT INTO Salle(NSALLE,NOMSALLE,NBPOSTE,INDIP)
VALUES ('s01','Salle 1', 3, '130.120.80'),
	   ('s02','Salle 2', 2, '130.120.80'),
       ('s03','Salle 3', 2, '130.120.80'),
       ('s11','Salle 11', 2, '130.120.81'),
       ('s12','Salle 12', 1, '130.120.81'),
       ('s21','Salle 21', 2, '130.120.82'),
       ('s22','Salle 22', 0, '130.120.82'),
       ('s23','Salle 23', 0, '130.120.82');

INSERT INTO Poste(NPOSTE, NOMPOSTE, INDIP, AD, TYPEPOSTE, nSALLE)
VALUES ('p1','Poste 1', '130.120.80','001','TX','s01'),
	   ('p2','Poste 2', '130.120.80','002','UNIX','s01'),
       ('p3','Poste 3', '130.120.80','003','TX','s01'),
       ('p4','Poste 4', '130.120.80','004','PCWS','s02'),
       ('p5','Poste 5', '130.120.80','005','PCWS','s02'),
       ('p6','Poste 6', '130.120.80','006','UNIX','s03'),
       ('p7','Poste 7', '130.120.80','007','TX','s03'),
	   ('p8','Poste 8', '130.120.81','001', 'UNIX','s11'),
	   ('p9','Poste 9', '130.120.81','002', 'TX','s11'),
	   ('p10','Poste 10', '130.120.81','003','UNIX','s12'),
	   ('p11','Poste 11', '130.120.82','001','PCNT','s21'),
       ('p12','Poste 12', '130.120.82','002','PCWS','s21');

INSERT INTO Logiciel(NLOG,NOMLOG,DATEACH,VERSIONL,TYPELOG,PRIX)
VALUES ('log1','Oracle 6',STR_TO_DATE('13/05/95','%d/%m/%y'),'6.2','UNIX',3000),
	   ('log2','Oracle 8',STR_TO_DATE('15/09/99','%d/%m/%y'),'8i','UNIX',5600),
       ('log3','SQL Server',STR_TO_DATE('12/04/98','%d/%m/%y'),'7','PCNT',2700),
       ('log4','Front Page',STR_TO_DATE('03/06/97','%d/%m/%y'),'5','PCWS',500),
       ('log5','WinDev',STR_TO_DATE('12/05/97','%d/%m/%y'),'5','PCWS',750),
       ('log6','SQL*Net',NULL,'2.0','UNIX',500),
       ('log7','I.I.S.',STR_TO_DATE('12/04/02','%d/%m/%y'),'2','PCNT',810),
       ('log8','DreamWeaver',STR_TO_DATE('21/09/03','%d/%m/%y'),'2.0','BeOs',1400);

INSERT INTO Type_(TYPELP,NOMTYPE)
VALUES ('TX','Terminal X-Window'),
	   ('UNIX','Système Unix'),
       ('PCWS','PC Windows'),
       ('NC','Network Computer');
INSERT INTO Type_(TYPELP,NOMTYPE)
VALUES ('PCNT','PC Windows NT');
ALTER TABLE Installer
modify numIns INT unique auto_increment;

INSERT INTO Installer (NPOSTE, NLOG, DATEINS, DELAI) VALUES
('p2', 'log1', '2003-05-15', NULL),
('p2', 'log2', '2003-09-17', NULL),
('p4', 'log5', NULL, NULL),
('p6', 'log6', '2003-05-20', NULL),
('p6', 'log1', '2003-05-20', NULL),
('p8', 'log2', '2003-05-19', NULL),
('p8', 'log6', '2003-05-20', NULL),
('p11', 'log3', '2003-04-20', NULL),
('p12', 'log4', '2003-04-20', NULL),
('p11', 'log7', '2003-04-20', NULL),
('p7', 'log7', '2002-04-01', NULL);

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM logiciel;
USE parc;
UPDATE segment
SET etage = CASE 
	WHEN indIP = '130.120.80' THEN 0
	WHEN indIP = '130.120.81' THEN 1
	WHEN indIP = '130.120.82' THEN 2
END;

UPDATE segment SET etage = substr(indip, -1);

UPDATE logiciel SET prix = prix * 0.9 WHERE typelog = 'PCNT';

-- Pour la table Segment
ALTER TABLE Segment
ADD COLUMN nbSalle TINYINT(2) DEFAULT 0,
ADD COLUMN nbPoste TINYINT(2) DEFAULT 0;

-- Pour la table Logiciel
ALTER TABLE Logiciel
ADD COLUMN nbInstall TINYINT(2) DEFAULT 0;

-- Pour la table Poste
ALTER TABLE Poste
MODIFY COLUMN nbLog TINYINT(2) DEFAULT NULL;

-- Pour la table Salle
ALTER TABLE Salle
MODIFY COLUMN nomSalle VARCHAR(30);

-- Pour la table Segment
ALTER TABLE Segment
MODIFY COLUMN nomSegment VARCHAR(15);

-- Vérification de la structure de la table Salle
DESCRIBE Salle;

-- Vérification du contenu de la table Salle
SELECT * FROM Salle;

-- Vérification de la structure de la table Segment
DESCRIBE Segment;

-- Vérification du contenu de la table Segment
SELECT * FROM Segment;

ALTER TABLE Segment RENAME TO NewSegment;
RENAME TABLE NewSegment TO Segment;

DESC Salle;
ALTER TABLE Salle
CHANGE COLUMN nbPoste nombrePoste TINYINT(2) AFTER nSalle;

ALTER TABLE Salle
CHANGE COLUMN nombrePoste nbPoste TINYINT(2) AFTER nomSalle;

ALTER TABLE Installer
ADD CONSTRAINT UNIQUE (nPoste, nLog);


ALTER TABLE Poste
ADD CONSTRAINT fk_Segment_Poste FOREIGN KEY (indIP) REFERENCES Segment(indIP);
ALTER TABLE Poste
ADD CONSTRAINT fk_Salle_Poste FOREIGN KEY (nSalle) REFERENCES Salle(nSalle);
ALTER TABLE Installer
ADD CONSTRAINT fk_Poste_Installer FOREIGN KEY (nPoste) REFERENCES Poste(nPoste);
ALTER TABLE Installer
ADD CONSTRAINT fk_Logiciel_Installer FOREIGN KEY (nLog) REFERENCES Logiciel(nLog);
ALTER TABLE Poste
ADD CONSTRAINT fk_Types_Poste FOREIGN KEY (typePoste) REFERENCES Type_(typeLP);

SELECT * FROM Type_;
SELECT * FROM Poste;

DESC Poste;



SELECT * FROM Softs;

-- Création de la table Softs basée sur la table Logiciel
CREATE TABLE Softs AS
SELECT nLog AS nomSoft, versionl, prix
FROM Logiciel;
DESC TYPE_;
DESC POSTE;
-- Création de la table PCSeuls basée sur la table Poste avec des enregistrements de type 'PCWS' ou 'PCNT'
SELECT * FROM Logiciel;
SELECT * FROM Poste;
DESC POste;
SELECT * FROM Softs;

CREATE TABLE PCSeuls AS
SELECT nPoste AS NP, nomPoste AS nomP,indIP AS seg,ad,typePoste AS typeP, nSalle AS salle
FROM Poste
WHERE typePoste IN ('PCWS', 'PCNT');

ALTER TABLE PCSeuls ADD CONSTRAINT PRIMARY KEY(np);

SELECT typePoste
FROM Poste
WHERE lower(nPoste) = 'p8';

SELECT nomLog, typeLog
FROM Logiciel
WHERE upper(typeLog) = 'UNIX';

SELECT nomPoste, CONCAT(indIP, '.', ad) AS "Adresse IP", nSalle, typePoste
FROM Poste
WHERE upper(typePoste) IN ('UNIX','PCWS')
AND indIP = '130.120.80'
ORDER BY nSalle DESC;

SELECT nPoste FROM Installer
WHERE lower(nLog) = 'log1';

SELECT nomPoste, CONCAT(indIP,'.',ad) as 'Adresse IP', typePoste
FROM Poste
WHERE lower(typePoste) = 'tx';

SELECT nPoste, COUNT(*) AS nombre_logiciels_installes 
FROM Installer 
GROUP BY nPoste;


