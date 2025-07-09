/* 
 DANS LE TERMINAL

se connecter en root windows 
    mysql -h localhost -u root -p

    en root linux
    sudo mysql 

    SHOW DATABASES;                               montrer bdd
    CREATE DATABASE nom_bdd;                      créer bdd
    DROP DATABASE nom_bdd;                        suppr bdd

    
    CREATE USER _____@______
    CREATE USER "zongoledozo@localhost" IDENTIFIED BY "Ijhgfdrfgh656562_";       créer idenifiant

    GRANT ALL PRIVILEGES ON pn_livres.* TO "zongoledozo@localhost";                attribuer droits à identifiants

    exit;                                           déconnexion

    SHOW TABLES;                                   voir les tables



    */

    CREATE TABLE IF NOT EXISTS user  (
    id SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(24) NOT NULL UNIQUE,
    mdp VARCHAR(27) NOT NULL,
    avatar VARCHAR(255),
    mail VARCHAR(255) NOT NULL UNIQUE
)ENGINE=InnoDB;

INSERT INTO user (mdp, pseudo, mail)
VALUES("azerty", "motdepasse", "noreply@nowhere.fr");

INSERT INTO user (mdp, pseudo, mail)
VALUES("carambar", "haribo", "fgyghj@kjghkj.fr");
VALUES("nutella", "kindersurprise93", "fjklnkl@mmjhgf.fr");
VALUES("adidas", "puma", "fj5643@ehhgfg.fr");

/* SELECT * FROM user; */

SELECT pseudo, mail, avatar FROM user; /* afficher info users*/

SELECT pseudo, mail FROM user WHERE pseudo = "kindersurprise93"; /* recherche par pseudo */

SELECT pseudo, mail, mdp FROM user WHERE pseudo LIKE "%k%"; /* chercher par ressemblence*/

SELECT pseudo, mail, avatar FROM user ORDER BY mail ASC;
/* ASC DESC /*



