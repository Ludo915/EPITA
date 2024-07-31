-- Vérification des rôles attribués aux utilisateurs
SHOW GRANTS FOR 'gestion'@'localhost' USING 'gestionnaire';
SHOW GRANTS FOR 'ens'@'localhost';
SHOW GRANTS FOR "etu"@"localhost";

SHOW GRANTS FOR 'gestionnaire';

-- Activation des roles
SELECT CURRENT_ROLE();

SET DEFAULT ROLE ALL TO
    'gestion'@'localhost',
    'ens'@'localhost',
    'etu'@'localhost';

-- Remplissage des tables avec des données
INSERT INTO etudiant (nom, prenom, date_naissance) VALUES ('Dupont', 'Jean', '1998-05-10'), ('Martin', 'Sophie', '1999-08-20'), ('Dubois', 'Pierre', '2000-01-15'), ('Lefevre', 'Marie', '1997-11-25'), ('Moreau', 'Luc', '1996-07-03'), ('Leroy', 'Emma', '1999-03-18'), ('Roux', 'Thomas', '1998-09-12'), ('Garcia', 'Julia', '2001-02-28'), ('Fournier', 'Hugo', '2002-06-09'), ('Caron', 'Laura', '1995-12-30');

INSERT INTO matiere (nom, credit) VALUES ('Mathematiques', 6), ('Physique', 5), ('Informatique', 4), ('Chimie', 3), ('Biologie', 3), ('Francais', 2), ('Anglais', 2), ('Histoire', 2), ('Geographie', 2), ('Arts', 1);

INSERT INTO enseignant (nom, prenom, specialite) VALUES ('Durand', 'Paul', 'Mathematiques'), ('Lefebvre', 'Sophie', 'Physique'), ('Girard', 'Jean', 'Informatique'), ('Leroux', 'Marie', 'Chimie'), ('Bernard', 'Luc', 'Biologie'), ('Robert', 'Emma', 'Francais'), ('Petit', 'Thomas', 'Anglais'), ('Morel', 'Julia', 'Histoire'), ('Dubois', 'Hugo', 'Geographie'), ('Martin', 'Laura', 'Arts');

INSERT INTO salle (numero, capacite) VALUES ('A101', 50), ('B201', 40), ('C301', 30), ('D401', 25), ('E501', 20), ('F601', 15), ('G701', 10), ('H801', 5), ('I901', 3), ('J1001', 2);


REVOKE gestionnaire FROM 'gestion'@'localhost';