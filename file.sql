CREATE TABLE Utilisateurs(
    id_utilisateur  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur VARCHAR(30) NOT NULL,
    mot_de_passe VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL
    );

CREATE TABLE Categories(
    id_categorie INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(80) NOT NULL
    );
    
CREATE TABLE Sous_Categories(
    id_sous_categorie INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_sous_categorie VARCHAR(80) NOT NULL,
    id_categorie INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categories (id_categorie)
    );
    
CREATE TABLE Projets(
    id_projet INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titre_projet VARCHAR(50) NOT NULL,
    description TEXT,
    id_categorie INT NOT NULL,
    id_sous_categorie INT,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categories (id_categorie),
    FOREIGN KEY (id_sous_categorie) REFERENCES Sous_Categories (id_sous_categorie),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur)
    );

CREATE TABLE Freelances(
    id_freelance INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_freelance VARCHAR(30) NOT NULL,
    competences TEXT,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur)
    );
    
CREATE TABLE Offres(
    id_offre INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    montant FLOAT NOT NULL,
    delai DATE NOT NULL,
    id_freelance INT NOT NULL,
    id_projet INT NOT NULL,
    FOREIGN KEY (id_freelance) REFERENCES Freelances (id_freelance),
    FOREIGN KEY (id_projet) REFERENCES Projets (id_projet)
    );
    
CREATE TABLE Temoignages(
    id_temoignage INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    commentaire TEXT NOT NULL,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur)
    );

ALTER TABLE Projets
ADD date_creation DATE;

INSERT INTO `utilisateurs`(`nom_utilisateur`, `mot_de_passe`, `email`) VALUES ('ali_said','1234@abcd', 'ali@gmail.com');
INSERT INTO `categories`( `nom_categorie`) VALUES ('developement web');
INSERT INTO `freelances`(`nom_freelance`, `competences`, `id_utilisateur`) VALUES ('mohamed_morad','javascript, html, css',1);
INSERT INTO `projets`(`titre_projet`, `description`, `id_categorie`, `id_sous_categorie`, `id_utilisateur`, `date_creation`) 
VALUES ('creation application', 'to do liste',1, NULL,1,CURDATE());
INSERT INTO `offres`(`montant`, `delai`, `id_freelance`, `id_projet`) VALUES (5000,'2024-12-30',1,1);
UPDATE projets SET titre_projet='design todo list app',`description`='todo list' WHERE id_projet=1;