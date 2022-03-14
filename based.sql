drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists Roles;

drop table if exists Utilisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table: Achat                                                 */
/*==============================================================*/
create table Achat
(
   idAchat              int not null,
   idArt                int,
   idFour               int,
   idUtil               int,
   date                 datetime,
   quantite             int,
   prixUnitaire         int,
   prixTotal            int,
   primary key (idAchat),
   key AK_Identifier_1 (prixTotal),
   key AK_Identifier_2 (idAchat)
);

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   idArt                int not null,
   idCat                int not null,
   libelle              int,
   marque               int,
   prixUnitaire         int,
   quantite             int,
   model                int,
   primary key (idArt),
   key AK_Identifier_1 (model),
   key AK_Identifier_2 (idArt)
);

/*==============================================================*/
/* Table: Categorie                                             */
/*==============================================================*/
create table Categorie
(
   idCat                int not null,
   nom                  varchar(254),
   primary key (idCat),
   key AK_Identifier_1 (nom),
   key AK_Identifier_2 (idCat)
);

/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client
(
   idClient             int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              int,
   tel                  int,
   email                int,
   primary key (idClient),
   key AK_Identifier_1 (prenom)
);

/*==============================================================*/
/* Table: Fournisseur                                           */
/*==============================================================*/
create table Fournisseur
(
   idFour               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              int,
   tel                  int,
   email                int,
   primary key (idFour),
   key AK_Identifier_1 (email),
   key AK_Identifier_2 (idFour)
);

/*==============================================================*/
/* Table: Roles                                                 */
/*==============================================================*/
create table Roles
(
   idRole               int not null,
   nom                  varchar(254),
   primary key (idRole),
   key AK_Identifier_1 (nom),
   key AK_Identifier_2 (idRole)
);

/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur
(
   idUtil               int not null,
   idRole               int not null,
   nom                  varchar(254),
   email                int,
   motDePasse           int,
   primary key (idUtil),
   key AK_Identifier_1 (motDePasse),
   key AK_Identifier_2 (idUtil)
);

/*==============================================================*/
/* Table: Vente                                                 */
/*==============================================================*/
create table Vente
(
   idVente              int not null,
   idUtil               int,
   idClient             int not null,
   idArt                int,
   date                 datetime,
   quantite             int,
   prixUnitaire         int,
   prixTotal            int,
   primary key (idVente),
   key AK_Identifier_1 (prixTotal),
   key AK_Identifier_2 (idVente)
);
INSERT INTO Achat (idAchat,idArt, idFour, idUtil, Date, Quantite, PrixUnitaire, prixTotal)
VALUES (71,1011, 41, 007, '2022-05-29', 10, 10000, 100000),
       (72, 1012, 42, 008, '2022-06-10', 30, 10000, 300000),
       (73, 1013, 43,009, '2022-02-12', 50, 10000, 500000);

INSERT INTO Article (idArt, idCat, libelle, marque, prixUnitaire, quantite, model)
VALUES (1011, 30, 'ordinateur', 'hp', 250000, 10, 'slim5'),
       (1012, 31, 'sourie', 'dell', 300000, 14, 'slim3'),
       (1013, 32, 'USB', 'lenovo', 350000, 20, 'slim1'),
       (1014, 33, 'cable', 'acer', 20000, 13, 'slim8');

INSERT INTO Categorie (idCat, Nom)
VALUES (30, 'Manager'),
       (31, 'Design'),
       (32, 'New'),
       (33, 'XXL');

INSERT INTO Client (idClient, Nom, prenom, adresse, tel, email)
VALUES (21, 'DEVO', 'Alison', 'Samandin', 63897703, 'robinsondepot@gmail.com'),
       (22, 'ILBOUDO', 'Aline', 'Gounghin', 62638977, 'robinndepot@gmail.com'),
       (23, 'Sawadogo', 'Fabrice', 'Nonsin', 62638977, 'robinson@gmail.com');

INSERT INTO Fournisseur (idFour, Nom, prenom, adresse, tel, email)
VALUES (41, 'DEVO', 'Robinson', 'Samandin', 67355684, 'robinsondepot@gmail.com'),
       (42, 'KY', 'Edmond', 'Saaba', 67355684, 'robinsondept@gmail.com'),
       (43, 'KABRE', 'Fiacre', 'Tanghin', 77024512, 'robinsondpot@gmail.com');

INSERT INTO Roles (idRole, Nom)
VALUES (51, 'Vendeur'),
       (52, 'Grossiste'),
       (53, 'Revendeur'),
       (54, 'Detaillant');

INSERT INTO Utilisateur (idUtil,idRole, Nom, email, motDePasse)
VALUES (007, 51, 'Ilboudo','robinsondepot@gmail.com', 'alison' ),
       (008, 52, 'Ouedraogo','binsondepot@gmail.com', 'kelly' ),
       (009, 53, 'Dabre','robsondepot@gmail.com', 'robin');

 INSERT INTO Vente (idVente, idUtil, idClient, idArt, date, quantite, prixUnitaire, prixTotal)
VALUES (61, 007, 21, 1011, '2022-07-29', 10, 10000, 100000),
       (62, 008, 22, 1012, '2022-07-22', 10, 10000, 100000),
       (63, 009, 23, 1013, '2022-07-21', 10, 10000, 100000);

alter table Achat add constraint FK_association12 foreign key (idUtil)
      references Utilisateur (idUtil) on delete restrict on update restrict;

alter table Achat add constraint FK_association14 foreign key (idArt)
      references Article (idArt) on delete restrict on update restrict;

alter table Achat add constraint FK_association9 foreign key (idFour)
      references Fournisseur (idFour) on delete restrict on update restrict;

alter table Article add constraint FK_association11 foreign key (idCat)
      references Categorie (idCat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_association15 foreign key (idRole)
      references Roles (idRole) on delete restrict on update restrict;

alter table Vente add constraint FK_association10 foreign key (idClient)
      references Client (idClient) on delete restrict on update restrict;

alter table Vente add constraint FK_association13 foreign key (idArt)
      references Article (idArt) on delete restrict on update restrict;

alter table Vente add constraint FK_association8 foreign key (idUtil)
      references Utilisateur (idUtil) on delete restrict on update restrict;
