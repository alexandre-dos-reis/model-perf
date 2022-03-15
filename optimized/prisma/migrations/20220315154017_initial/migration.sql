-- CreateTable
CREATE TABLE `AuditeurGroupe` (
    `IdUtilisateur` INTEGER NOT NULL,
    `code` VARCHAR(10) NOT NULL,

    INDEX `code`(`code`),
    PRIMARY KEY (`IdUtilisateur`, `code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Examen` (
    `IdExamen` INTEGER NOT NULL AUTO_INCREMENT,
    `dateD` DATETIME(0) NULL,
    `dateF` DATETIME(0) NULL,
    `optionJSON` VARCHAR(50) NULL,
    `statut` VARCHAR(50) NULL,
    `code` VARCHAR(10) NOT NULL,
    `IdQCM` INTEGER NOT NULL,
    `IdUtilisateur` INTEGER NOT NULL,

    INDEX `IdQCM`(`IdQCM`),
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
    `TypeQ` INTEGER NULL,
    `IdUtilisateur` INTEGER NULL,

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
    `NumReponse` INTEGER NOT NULL AUTO_INCREMENT,
    `intitule` VARCHAR(100) NULL,
    `exactitude` INTEGER NULL,
    `ordre` INTEGER NULL,
    `IdQuestion` INTEGER NOT NULL,

    INDEX `IdQuestion`(`IdQuestion`),
    PRIMARY KEY (`NumReponse`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReponseAuditeurExam` (
    `IdUtilisateur` INTEGER NOT NULL,
    `NumReponse` INTEGER NOT NULL,
    `IdExamen` INTEGER NOT NULL,
    `valeur` VARCHAR(50) NULL,

    INDEX `IdExamen`(`IdExamen`),
    INDEX `NumReponse`(`NumReponse`),
    PRIMARY KEY (`IdUtilisateur`, `NumReponse`, `IdExamen`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tag` (
    `IdTag` INTEGER NOT NULL AUTO_INCREMENT,
    `couleur` VARCHAR(50) NULL,
    `intitule` VARCHAR(50) NULL,

    PRIMARY KEY (`IdTag`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TypeU` (
    `IdTypeU` INTEGER NOT NULL AUTO_INCREMENT,
    `libellé` INTEGER NULL,

    PRIMARY KEY (`IdTypeU`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Utilisateur` (
    `IdUtilisateur` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NULL,
    `prenom` VARCHAR(50) NULL,
    `email` VARCHAR(255) NULL,
    `password` VARCHAR(50) NULL,
    `IdTypeU` INTEGER NOT NULL,

    INDEX `IdTypeU`(`IdTypeU`),
    PRIMARY KEY (`IdUtilisateur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `AuditeurGroupe` ADD CONSTRAINT `auditeurgroupe_ibfk_2` FOREIGN KEY (`code`) REFERENCES `Groupe`(`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `AuditeurGroupe` ADD CONSTRAINT `auditeurgroupe_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`code`) REFERENCES `Groupe`(`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_2` FOREIGN KEY (`IdQCM`) REFERENCES `QCM`(`IdQCM`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Examen` ADD CONSTRAINT `examen_ibfk_3` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `QCM` ADD CONSTRAINT `qcm_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Question` ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
ALTER TABLE `ReponseAuditeurExam` ADD CONSTRAINT `reponseauditeurexam_ibfk_3` FOREIGN KEY (`IdExamen`) REFERENCES `Examen`(`IdExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ReponseAuditeurExam` ADD CONSTRAINT `reponseauditeurexam_ibfk_2` FOREIGN KEY (`NumReponse`) REFERENCES `Reponse`(`NumReponse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ReponseAuditeurExam` ADD CONSTRAINT `reponseauditeurexam_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur`(`IdUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Utilisateur` ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`IdTypeU`) REFERENCES `TypeU`(`IdTypeU`) ON DELETE NO ACTION ON UPDATE NO ACTION;
