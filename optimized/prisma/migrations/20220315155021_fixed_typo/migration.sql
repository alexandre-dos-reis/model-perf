/*
  Warnings:

  - You are about to drop the column `libell_` on the `TypeU` table. All the data in the column will be lost.
  - Added the required column `libelle` to the `TypeU` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `TypeU` DROP COLUMN `libell_`,
    ADD COLUMN `libelle` VARCHAR(50) NOT NULL;
