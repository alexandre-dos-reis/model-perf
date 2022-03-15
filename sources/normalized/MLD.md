```
Utilisateur = (IdUtilisateur INT AUTO_INCREMENT, nom VARCHAR(50), prenom VARCHAR(50), email VARCHAR(255), password VARCHAR(50));
Concepteur = (#IdUtilisateur);
Auditeur = (#IdUtilisateur);
TypeQuestion = (IdTypeQuestion INT AUTO_INCREMENT, intitule VARCHAR(50));
Tag = (IdTag INT AUTO_INCREMENT, couleur VARCHAR(50), intitule VARCHAR(50));
QCM = (IdQCM INT AUTO_INCREMENT, dateCreation DATE, #(#IdUtilisateur));
Groupe = (code VARCHAR(10), nom VARCHAR(50), description VARCHAR(100));
Statut = (IdStatut INT AUTO_INCREMENT, libelle VARCHAR(50));
Option = (IdOption INT AUTO_INCREMENT, intitule VARCHAR(50));
Question = (IdQuestion INT AUTO_INCREMENT, intitule VARCHAR(100), description TEXT, points INT, #IdTypeQuestion, #(#IdUtilisateur)*);
Reponse = (#IdQuestion, NumReponse INT, intitule VARCHAR(100), exactitude INT);
Examen = (IdExamen INT AUTO_INCREMENT, dateD DATETIME, dateF DATETIME, #code, #IdStatut, #IdQCM, #(#IdUtilisateur));
QuestionTag = (#IdQuestion, #IdTag);
QuestionQCM = (#IdQuestion, #IdQCM);
AuditeurGroupe = (#(#IdUtilisateur), #code);
OptionExamen = (#IdExamen, #IdOption, val VARCHAR(50));
ReponseAuditeurExam = (#(#IdUtilisateur), #(#IdQuestion, NumReponse), #IdExamen, valeur VARCHAR(50);
```