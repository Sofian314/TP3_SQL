--Création de la base de données

CREATE DATABASE IF NOT EXISTS insta;

--sélectionner une base de données

USE insta;

-- Création des tables

CREATE TABLE IF NOT EXISTS UTILISATEUR(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL,
    adresse_email VARCHAR(50) NOT NULL UNIQUE,
    avatar VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS photos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nb_like INT,
    id_utilisateur INT NOT NULL,
    urll VARCHAR(50) NOT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateurs(id) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS likes(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    id_photo INT NOT NULL,
    likes_unlikes INT(1),
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateurs(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY(id_photo) REFERENCES photos(id) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS commentaire(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    id_photo INT NOT NULL,
    commentaire varchar(120),
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateurs(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY(id_photo) REFERENCES photos(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- on Ajoute les utilisateurs, photos, commentaires et likes

insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Zipsell', 'Halette', 'hzipsell0', 'hzipsell0@usnews.com', '911');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Parffrey', 'Berry', 'bparffrey1', 'bparffrey1@photobucket.com', 'HS');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Dunguy', 'Francesco', 'fdunguy2', 'fdunguy2@msn.com', 'Cougar');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Ferenczi', 'Dulcea', 'dferenczi3', 'dferenczi3@google.co.uk', 'Savana 3500');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Maysor', 'Benton', 'bmaysor4', 'bmaysor4@usatoday.com', 'Precis');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Toffanini', 'Arabele', 'atoffanini5', 'atoffanini5@mayoclinic.com', 'C70');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Huxster', 'Darell', 'dhuxster6', 'dhuxster6@creativecommons.org', 'Ram 3500');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Dicks', 'Mufinella', 'mdicks7', 'mdicks7@go.com', 'Escort');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Hattersley', 'Evelyn', 'ehattersley8', 'ehattersley8@smh.com.au', '5 Series');
insert into utilisateurs (nom, prenom, username, adresse_email, avatar) values ('Rand', 'Cacilie', 'crand9', 'crand9@histats.com', 'Sable');
insert into photos (urll, nb_like, id_utilisateur) values ('http://washi', 5, 1);
insert into photos (urll, nb_like, id_utilisateur) values ('http://referer', 10, 1);
insert into photos (urll, nb_like, id_utilisateur) values ('http://irs.gov', 0, 1);
insert into photos (urll, nb_like, id_utilisateur) values ('https://amaz', 56, 1);
insert into photos (urll, nb_like, id_utilisateur) values ('https://scr', 1, 2);
insert into photos (urll, nb_like, id_utilisateur) values ('https://u', 3, 3);
insert into photos (urll, nb_like, id_utilisateur) values ('https://pu', 1, 4);
insert into photos (urll, nb_like, id_utilisateur) values ('http://answ', 2, 4);
insert into commentaire (contenu, id_photo, id_utilisateur) values ('Lamprotornis nitens', 9, 1);
insert into commentaire (contenu, id_photo, id_utilisateur) values ('Propithecus verreauxi', 9, 2);
insert into commentaire (contenu, id_photo, id_utilisateur) values ('Taxidea taxus', 9, 3);
insert into commentaire (contenu, id_photo, id_utilisateur) values ('Francolinus coqui', 10, 4);
insert into commentaire (contenu, id_photo, id_utilisateur) values ('Pycnonotus barbatus', 15, 5);
insert into commentaire (contenu, id_photo, id_utilisateur) values ('Sauromalus obesus', 10, 6);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 9, 1);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (0, 9, 1);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 13, 1);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 13, 4);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values ( 0, 13, 5);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 16, 6);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (8, 9, 8);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (0, 14, 10);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 15, 10);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 12, 10);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 11, 10);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 12, 1);
insert into likes (likes_unlikes, id_photo, id_utilisateur) values (1, 15, 4);

-- je ne suis pas sur de la partie qui suit je l'ai faite à l'aide de mes camarades du groupes, car j'ai encore quelques lacune
--sur quelques point


ALTER TABLE photos set photos.nb_like=SUM (select likes_unlikes from likes JOIN photos ON photos.id=likes.id_photo);
-- Pour tous les commentaires, montrer le contenu et le username de l'auteur
SELECT username, contenu FROM utilisateurs 
    JOIN commentaire WHERE commentaire.id_utilisateur=utilisateurs.id;
-- Pour chaque commentaire, afficher son contenu et l'url de la photo à
--  laquelle le commentaire a été ajouté
SELECT contenu,urll FROM commentaire JOIN photos ON commentaire.id_photo=photos.id;
-- Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur 
SELECT username,urll FROM photos JOIN utilisateurs ON photo.id_utilisateur=utilisateurs.id;
-- Trouver tous les commentaires pour la photo d'id 3,
--  avec le username de l'utilisateur qui a commenté
SELECT username,contenu FROM commentaire JOIN photos ON photos.id=commentaire.id_photo 
    JOIN utilisateurs ON utilisateurs.id=commentaire.id_utilisateur;
-- Trouver tous les url des photos ainsi que tous les commentaire
--  qui ont été posté par l'auteur de la photo
-- A l'exercice précedent afficher aussi le nom de l'utilisateur qui a commenté ses propres photos
SELECT username,urll,contenu FROM photos JOIN commentaire ON photos.id=commentaire.id_photo
    JOIN utilisateurs ON utilisateurs.id=photos.id_utilisateur;
-- Le nombre de likes pour la photo d'ID 4
SELECT COUNT(*) FROM photos JOIN likes ON likes.id_photo=photos.id WHERE photos.id=9;





