```
Tag = (IdTag INT AUTO_INCREMENT, couleur VARCHAR(50), intitule VARCHAR(50));
Groupe = (code VARCHAR(10), nom VARCHAR(50), description VARCHAR(100));
TypeU = (IdTypeU INT AUTO_INCREMENT, libellé INT);
Utilisateur = (IdUtilisateur INT AUTO_INCREMENT, nom VARCHAR(50), prenom VARCHAR(50), email VARCHAR(255), password VARCHAR(50), #IdTypeU);
Question = (IdQuestion INT AUTO_INCREMENT, intitule VARCHAR(100), description TEXT, points INT, TypeQ INT, #IdUtilisateur*);
Reponse = (NumReponse INT AUTO_INCREMENT, intitule VARCHAR(100), exactitude INT, ordre INT, #IdQuestion);
QCM = (IdQCM INT AUTO_INCREMENT, dateCreation DATE, #IdUtilisateur);
Examen = (IdExamen INT AUTO_INCREMENT, dateD DATETIME, dateF DATETIME, optionJSON VARCHAR(50), statut VARCHAR(50), #code, #IdQCM, #IdUtilisateur);
QuestionTag = (#IdQuestion, #IdTag);
QuestionQCM = (#IdQuestion, #IdQCM);
AuditeurGroupe = (#IdUtilisateur, #code);
ReponseAuditeurExam = (#IdUtilisateur, #NumReponse, #IdExamen, valeur VARCHAR(50));
```