CREATE TABLE Tag
(
   IdTag INT
   AUTO_INCREMENT,
   couleur VARCHAR
   (50),
   intitule VARCHAR
   (50),
   PRIMARY KEY
   (IdTag)
);

   CREATE TABLE Groupe
   (
      code VARCHAR(10),
      nom VARCHAR(50),
      description VARCHAR(100),
      PRIMARY KEY(code)
   );

   CREATE TABLE TypeU
   (
      IdTypeU INT
      AUTO_INCREMENT,
   libelle VARCHAR
      (50),
   PRIMARY KEY
      (IdTypeU)
);

      CREATE TABLE Utilisateur
      (
         IdUtilisateur INT
         AUTO_INCREMENT,
   nom VARCHAR
         (50),
   prenom VARCHAR
         (50),
   email VARCHAR
         (255),
   password VARCHAR
         (50),
   IdTypeU INT NOT NULL,
   PRIMARY KEY
         (IdUtilisateur),
   FOREIGN KEY
         (IdTypeU) REFERENCES TypeU
         (IdTypeU)
);

         CREATE TABLE Question
         (
            IdQuestion INT
            AUTO_INCREMENT,
   intitule VARCHAR
            (100),
   description TEXT,
   points INT,
   TypeQ INT,
   IdUtilisateur INT,
   PRIMARY KEY
            (IdQuestion),
   FOREIGN KEY
            (IdUtilisateur) REFERENCES Utilisateur
            (IdUtilisateur)
);

            CREATE TABLE Reponse
            (
               NumReponse INT
               AUTO_INCREMENT,
   intitule VARCHAR
               (100),
   exactitude INT,
   ordre INT,
   IdQuestion INT NOT NULL,
   PRIMARY KEY
               (NumReponse),
   FOREIGN KEY
               (IdQuestion) REFERENCES Question
               (IdQuestion)
);

               CREATE TABLE QCM
               (
                  IdQCM INT
                  AUTO_INCREMENT,
   dateCreation DATE,
   IdUtilisateur INT NOT NULL,
   PRIMARY KEY
                  (IdQCM),
   FOREIGN KEY
                  (IdUtilisateur) REFERENCES Utilisateur
                  (IdUtilisateur)
);

                  CREATE TABLE Examen
                  (
                     IdExamen INT
                     AUTO_INCREMENT,
   dateD DATETIME,
   dateF DATETIME,
   optionJSON VARCHAR
                     (50),
   statut VARCHAR
                     (50),
   code VARCHAR
                     (10) NOT NULL,
   IdQCM INT NOT NULL,
   IdUtilisateur INT NOT NULL,
   PRIMARY KEY
                     (IdExamen),
   FOREIGN KEY
                     (code) REFERENCES Groupe
                     (code),
   FOREIGN KEY
                     (IdQCM) REFERENCES QCM
                     (IdQCM),
   FOREIGN KEY
                     (IdUtilisateur) REFERENCES Utilisateur
                     (IdUtilisateur)
);

                     CREATE TABLE QuestionTag
                     (
                        IdQuestion INT,
                        IdTag INT,
                        PRIMARY KEY(IdQuestion, IdTag),
                        FOREIGN KEY(IdQuestion) REFERENCES Question(IdQuestion),
                        FOREIGN KEY(IdTag) REFERENCES Tag(IdTag)
                     );

                     CREATE TABLE QuestionQCM
                     (
                        IdQuestion INT,
                        IdQCM INT,
                        PRIMARY KEY(IdQuestion, IdQCM),
                        FOREIGN KEY(IdQuestion) REFERENCES Question(IdQuestion),
                        FOREIGN KEY(IdQCM) REFERENCES QCM(IdQCM)
                     );

                     CREATE TABLE AuditeurGroupe
                     (
                        IdUtilisateur INT,
                        code VARCHAR(10),
                        PRIMARY KEY(IdUtilisateur, code),
                        FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
                        FOREIGN KEY(code) REFERENCES Groupe(code)
                     );

                     CREATE TABLE ReponseAuditeurExam
                     (
                        IdUtilisateur INT,
                        NumReponse INT,
                        IdExamen INT,
                        valeur VARCHAR(50),
                        PRIMARY KEY(IdUtilisateur, NumReponse, IdExamen),
                        FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
                        FOREIGN KEY(NumReponse) REFERENCES Reponse(NumReponse),
                        FOREIGN KEY(IdExamen) REFERENCES Examen(IdExamen)
                     );
