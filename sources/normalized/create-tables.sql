CREATE TABLE Utilisateur(
   IdUtilisateur INT AUTO_INCREMENT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   email VARCHAR(255),
   password VARCHAR(50),
   PRIMARY KEY(IdUtilisateur)
);

CREATE TABLE Concepteur(
   IdUtilisateur INT,
   PRIMARY KEY(IdUtilisateur),
   FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur)
);

CREATE TABLE Auditeur(
   IdUtilisateur INT,
   PRIMARY KEY(IdUtilisateur),
   FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur)
);

CREATE TABLE TypeQuestion(
   IdTypeQuestion INT AUTO_INCREMENT,
   intitule VARCHAR(50),
   PRIMARY KEY(IdTypeQuestion)
);

CREATE TABLE Tag(
   IdTag INT AUTO_INCREMENT,
   couleur VARCHAR(50),
   intitule VARCHAR(50),
   PRIMARY KEY(IdTag)
);

CREATE TABLE QCM(
   IdQCM INT AUTO_INCREMENT,
   dateCreation DATE,
   IdUtilisateur INT NOT NULL,
   PRIMARY KEY(IdQCM),
   FOREIGN KEY(IdUtilisateur) REFERENCES Concepteur(IdUtilisateur)
);

CREATE TABLE Groupe(
   code VARCHAR(10),
   nom VARCHAR(50),
   description VARCHAR(100),
   PRIMARY KEY(code)
);

CREATE TABLE Statut(
   IdStatut INT AUTO_INCREMENT,
   libelle VARCHAR(50),
   PRIMARY KEY(IdStatut)
);

CREATE TABLE Option_element(
   IdOption INT AUTO_INCREMENT,
   intitule VARCHAR(50),
   PRIMARY KEY(IdOption)
);

CREATE TABLE Question(
   IdQuestion INT AUTO_INCREMENT,
   intitule VARCHAR(100),
   description TEXT,
   points INT,
   IdTypeQuestion INT NOT NULL,
   IdUtilisateur INT,
   PRIMARY KEY(IdQuestion),
   FOREIGN KEY(IdTypeQuestion) REFERENCES TypeQuestion(IdTypeQuestion),
   FOREIGN KEY(IdUtilisateur) REFERENCES Concepteur(IdUtilisateur)
);

CREATE TABLE Reponse(
   IdQuestion INT,
   NumReponse INT,
   intitule VARCHAR(100),
   exactitude INT,
   PRIMARY KEY(IdQuestion, NumReponse),
   FOREIGN KEY(IdQuestion) REFERENCES Question(IdQuestion)
);

CREATE TABLE Examen(
   IdExamen INT AUTO_INCREMENT,
   dateD DATETIME,
   dateF DATETIME,
   code VARCHAR(10) NOT NULL,
   IdStatut INT NOT NULL,
   IdQCM INT NOT NULL,
   IdUtilisateur INT NOT NULL,
   PRIMARY KEY(IdExamen),
   FOREIGN KEY(code) REFERENCES Groupe(code),
   FOREIGN KEY(IdStatut) REFERENCES Statut(IdStatut),
   FOREIGN KEY(IdQCM) REFERENCES QCM(IdQCM),
   FOREIGN KEY(IdUtilisateur) REFERENCES Concepteur(IdUtilisateur)
);

CREATE TABLE QuestionTag(
   IdQuestion INT,
   IdTag INT,
   PRIMARY KEY(IdQuestion, IdTag),
   FOREIGN KEY(IdQuestion) REFERENCES Question(IdQuestion),
   FOREIGN KEY(IdTag) REFERENCES Tag(IdTag)
);

CREATE TABLE QuestionQCM(
   IdQuestion INT,
   IdQCM INT,
   PRIMARY KEY(IdQuestion, IdQCM),
   FOREIGN KEY(IdQuestion) REFERENCES Question(IdQuestion),
   FOREIGN KEY(IdQCM) REFERENCES QCM(IdQCM)
);

CREATE TABLE AuditeurGroupe(
   IdUtilisateur INT,
   code VARCHAR(10),
   PRIMARY KEY(IdUtilisateur, code),
   FOREIGN KEY(IdUtilisateur) REFERENCES Auditeur(IdUtilisateur),
   FOREIGN KEY(code) REFERENCES Groupe(code)
);

CREATE TABLE OptionExamen(
   IdExamen INT,
   IdOption INT,
   val VARCHAR(50),
   PRIMARY KEY(IdExamen, IdOption),
   FOREIGN KEY(IdExamen) REFERENCES Examen(IdExamen),
   FOREIGN KEY(IdOption) REFERENCES Option_element(IdOption)
);

CREATE TABLE ReponseAuditeurExam(
   IdUtilisateur INT,
   IdQuestion INT,
   NumReponse INT,
   IdExamen INT,
   valeur VARCHAR(50),
   PRIMARY KEY(IdUtilisateur, IdQuestion, NumReponse, IdExamen),
   FOREIGN KEY(IdUtilisateur) REFERENCES Auditeur(IdUtilisateur),
   FOREIGN KEY(IdQuestion, NumReponse) REFERENCES Reponse(IdQuestion, NumReponse),
   FOREIGN KEY(IdExamen) REFERENCES Examen(IdExamen)
);
