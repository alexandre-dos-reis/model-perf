-- CreateTable
CREATE TABLE `Auditeur` (
    `IdUtilisateur` INTEGER NOT NULL,

    PRIMARY KEY (`IdUtilisateur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AuditeurGroupe` (
    `IdUtilisateur` INTEGER NOT NULL,
    `code` VARCHAR(10) NOT NULL,

    INDEX `code`(`code`),
    PRIMARY KEY (`IdUtilisateur`, `code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Concepteur` (
    `IdUtilisateur` INTEGER NOT NULL,

    PRIMARY KEY (`IdUtilisateur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Examen` (
    `IdExamen` INTEGER NOT NULL AUTO_INCREMENT,
    `dateD` DATETIME(0) NULL,
    `dateF` DATETIME(0) NULL,
    `code` VARCHAR(10) NOT NULL,
    `IdStatut` INTEGER NOT NULL,
    `IdQCM` INTEGER NOT NULL,
    `IdUtilisateur` INTEGER NOT NULL,

    INDEX `IdQCM`(`IdQCM`),
    INDEX `IdStatut`(`IdStatut`),
    INDEX `IdUtilisateur`(`IdUtilisateur`),
    INDEX `code`(`code`),
    PRIMARY KEY (`IdExamen`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Groupe` (
    `code` VARCHAR(10) NOT NULL,
    `nom` VARCHAR(50) NULL,
    `description` VARCHAR(100) NULL,

    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OptionExamen` (
    `IdExamen` INTEGER NOT NULL,
    `IdOption` INTEGER NOT NULL,
    `val` VARCHAR(50) NULL,

    INDEX `IdOption`(`IdOption`),
    PRIMARY KEY (`IdExamen`, `IdOption`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Option_element` (
    `IdOption` INTEGER NOT NULL AUTO_INCREMENT,
    `intitule` VARCHAR(50) NULL,

    PRIMARY KEY (`IdOption`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QCM` (
    `IdQCM` INTEGER NOT NULL AUTO_INCREMENT,
    `dateCreation` DATE NULL,
    `IdUtilisateur` INTEGER NOT NULL,

    INDEX `IdUtilisateur`(`IdUtilisateur`),
    PRIMARY KEY (`IdQCM`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Question` (
    `IdQuestion` INTEGER NOT NULL AUTO_INCREMENT,
    `intitule` VARCHAR(100) NULL,
    `description` TEXT NULL,
    `points` INTEGER NULL,
    `IdTypeQuestion` INTEGER NOT NULL,
    `IdUtilisateur` INTEGER NULL,

    INDEX `IdTypeQuestion`(`IdTypeQuestion`),
    INDEX `IdUtilisateur`(`IdUtilisateur`),
    PRIMARY KEY (`IdQuestion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QuestionQCM` (
    `IdQuestion` INTEGER NOT NULL,
    `IdQCM` INTEGER NOT NULL,

    INDEX `IdQCM`(`IdQCM`),
    PRIMARY KEY (`IdQuestion`, `IdQCM`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QuestionTag` (
    `IdQuestion` INTEGER NOT NULL,
    `IdTag` INTEGER NOT NULL,

    INDEX `IdTag`(`IdTag`),
    PRIMARY KEY (`IdQuestion`, `IdTag`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reponse` (
    `IdQuestion` INTEGER NOT NULL,
    `NumReponse` INTEGER NOT NULL,
    `intitule` VARCHAR(100) NULL,
    `exactitude` INTEGER NULL,

    PRIMARY KEY (`IdQuestion`, `NumReponse`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReponseAuditeurExam` (
    `IdUtilisateur` INTEGER NOT NULL,
    `IdQuestion` INTEGER NOT NULL,
    `NumReponse` INTEGER NOT NULL,
    `IdExamen` INTEGER NOT NULL,
    `valeur` VARCHAR(50) NULL,

    INDEX `IdExamen`(`IdExamen`),
    INDEX `IdQuestion`(`IdQuestion`, `NumReponse`),
    PRIMARY KEY (`IdUtilisateur`, `IdQuestion`, `NumReponse`, `IdExamen`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Statut` (
    `IdStatut` INTEGER NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(50) NULL,

    PRIMARY KEY (`IdStatut`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tag` (
    `IdTag` INTEGER NOT NULL AUTO_INCREMENT,
    `couleur` VARCHAR(50) NULL,
    `intitule` VARCHAR(50) NULL,

    PRIMARY KEY (`IdTag`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TypeQuestion` (
    `IdTypeQuestion` INTEGER NOT NULL AUTO_INCREMENT,
    `intitule` VARCHAR(50) NULL,

    PRIMARY KEY (`IdTypeQuestion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Utilisateur` (
    `IdUtilisateur` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NULL,
    `prenom` VARCHAR(50) NULL,
    `email` VARCHAR(255) NULL,
    `password` VARCHAR(50) NULL,

    PRIMARY KEY (`IdUtilisateur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Auditeur` ADD CONSTRAINT `auditeur_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `AuditeurGroupe` ADD CONSTRAINT `auditeurgroupe_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Auditeur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `AuditeurGroupe` ADD CONSTRAINT `auditeurgroupe_ibfk_2` FOREIGN KEY (`code`) REFERENCES `Groupe`(`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Concepteur` ADD CONSTRAINT `concepteur_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_4` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Concepteur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`code`) REFERENCES `Groupe`(`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_3` FOREIGN KEY (`IdQCM`) REFERENCES `QCM`(`IdQCM`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_2` FOREIGN KEY (`IdStatut`) REFERENCES `Statut`(`IdStatut`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `OptionExamen` ADD CONSTRAINT `optionexamen_ibfk_1` FOREIGN KEY (`IdExamen`) REFERENCES `Examen`(`IdExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `OptionExamen` ADD CONSTRAINT `optionexamen_ibfk_2` FOREIGN KEY (`IdOption`) REFERENCES `Option_element`(`IdOption`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `QCM` ADD CONSTRAINT `qcm_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Concepteur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Question` ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Concepteur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Question` ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`IdTypeQuestion`) REFERENCES `TypeQuestion`(`IdTypeQuestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `QuestionQCM` ADD CONSTRAINT `questionqcm_ibfk_2` FOREIGN KEY (`IdQCM`) REFERENCES `QCM`(`IdQCM`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `QuestionQCM` ADD CONSTRAINT `questionqcm_ibfk_1` FOREIGN KEY (`IdQuestion`) REFERENCES `Question`(`IdQuestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `QuestionTag` ADD CONSTRAINT `questiontag_ibfk_1` FOREIGN KEY (`IdQuestion`) REFERENCES `Question`(`IdQuestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `QuestionTag` ADD CONSTRAINT `questiontag_ibfk_2` FOREIGN KEY (`IdTag`) REFERENCES `Tag`(`IdTag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Reponse` ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`IdQuestion`) REFERENCES `Question`(`IdQuestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ReponseAuditeurExam` ADD CONSTRAINT `reponseauditeurexam_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Auditeur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ReponseAuditeurExam` ADD CONSTRAINT `reponseauditeurexam_ibfk_3` FOREIGN KEY (`IdExamen`) REFERENCES `Examen`(`IdExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ReponseAuditeurExam` ADD CONSTRAINT `reponseauditeurexam_ibfk_2` FOREIGN KEY (`IdQuestion`, `NumReponse`) REFERENCES `Reponse`(`IdQuestion`, `NumReponse`) ON DELETE NO ACTION ON UPDATE NO ACTION;
