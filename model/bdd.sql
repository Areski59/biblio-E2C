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

SELECT pseudo, mail, avatar FROM user;                            /* afficher info users*/

SELECT pseudo, mail FROM user WHERE pseudo = "kindersurprise93"; /* recherche par pseudo */

SELECT pseudo, mail, mdp FROM user WHERE pseudo LIKE "%k%"; /* chercher par ressemblence*/

SELECT pseudo, mail, avatar FROM user ORDER BY mail ASC;
/* ASC DESC */

DELETE FROM user WHERE pseudo = "motdepasse";                /*suppr données*/

/* MODIFICATION DE TABLE*/
ALTER TABLE user                                                  
DROP COLUMN avatar; /* DROP --> supprimer une colonne mais aussi peut-être autre chose*/

ALTER TABLE user                                                  
ADD COLUMN is_admin BOOLEAN NOT NULL DEFAULT 0; /* ADD --> ajouter une colonne ou autre , il faut définir les élémens de la colonne, comme quand on crée une table*/

ALTER TABLE user MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY; /* change propriété colonne*/

ALTER TABLE user CHANGE pseudo user_name VARCHAR(120) NOT NULL UNIQUE; /* change nom et propriétés colonne*/

/* modifier données */
UPDATE user
SET is_admin = 1
WHERE id = 2;

CREATE TABLE IF NOT EXISTS site (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(50) NOT NULL UNIQUE
)ENGINE=InnODB;

INSERT INTO site (city)
    VALUES ("Roubaix"),("Lille"),("Armentières"),("Saint-Omer");

ALTER TABLE user
ADD COLUMN site_id TINYINT UNSIGNED NOT NULL DEFAULT 1;

ALTER TABLE user
ADD CONSTRAINT fk_user_site
FOREIGN KEY (site_id)
REFERENCES site(id);

UPDATE user
SET site_id = 2
WHERE id = 3;

SELECT user.pseudo, user.mail, site.city FROM user INNER JOIN site ON user.site_id = site.id;

/*jointure et sauvegarde*/
CREATE VIEW user.vw AS (
SELECT user.pseudo As utilisateur, user.mail, site.city AS ville
FROM user
INNER JOIN site
ON user.site_id = site.id
);

CREATE TABLE IF NOT EXISTS genre(
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
)ENGINE=InnoDB;

INSERT INTO genre (name)
VALUES ("Roman"),("Manga"),("Fantasy"),("Science-Fiction"),("Horreur"),("Romance"),("Policier"),("Magazine"),("BD"),("Histoire"),("Politique"),("Scolaire");

CREATE TABLE IF NOT EXISTS book (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL DEFAULT "Inconnu",
    auteur VARCHAR(100) NOT NULL DEFAULT "Inconnu",
    synopsis TEXT,
    page SMALLINT NOT NULL,
    year SMALLINT NOT NULL DEFAULT "0",
    genre_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
    site_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
    user_id SMALLINT UNSIGNED,
    CONSTRAINT fk_book_genre
        FOREIGN KEY (genre_id)
        REFERENCES genre(id),
    CONSTRAINT fk_book_site
        FOREIGN KEY (site_id)
        REFERENCES site(id),
    CONSTRAINT fk_book_user
        FOREIGN KEY (user_id)
        REFERENCES user(id)
)ENGINE=InnoDB;

CREATE VIEW book_vw AS (
    SELECT book.id, book.titre, book.auteur, genre.name AS genre, site.city AS site, book.year AS "année", book.page
    FROM book
    INNER JOIN genre ON book.genre_id = genre.id
    INNER JOIN site ON book.site_id = site.id
);

SELECT titre, auteur, genre FROM book_vw WHERE site = "Roubaix";

SELECT , Count(id) AS "nombre" FROM book_vw GROUP BY site;

UPDATE book
SET user_id = 5
WHERE id = 72;

SELECT user.user_name, user.mail, book.titre
FROM user
INNER JOIN book ON book.user_id = user.id;

SELECT user.user_name, user.mail, book.titre
FROM user
LEFT JOIN book ON book.user_id = user.id;

SELECT user.user_name, user.mail, book.titre
FROM user
INNER JOIN book ON book.user_id = user.id;

SELECT user.user_name, user.mail, book.titre
FROM user
INNER JOIN book ON book.user_id = user.id;

/*commentaires*/

CREATE TABLE IF NOT EXISTS comment (
    comment_content TEXT not NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    book_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, book_id),
    CONSTRAINT fk_comment_user
        FOREIGN KEY (user_id)
        REFERENCES user(id),
    CONSTRAINT fk_comment_book
        FOREIGN KEY (book_id)
        REFERENCES book(id)
)ENGINE=InnoDB;

INSERT INTO comment (user_id, book_id, comment)
VALUES (4, 276, "C'est nul à chier, quelle perte de temps"),
       (4, 289, "J'ai jamais lu un truc aussi merdique")
       (5, 252, "Masterclass tié un tigre");

CREATE VIEW comment_vw AS (
    SELECT comment.book_id, book.titre, user.user_name AS utilisateur, comment.comment_content AS commentaire
    FROM book
    INNER JOIN comment ON comment.book_id = book.id
    INNER JOIN user ON comment.user_id = user.id
);