/*
  Warnings:

  - You are about to drop the column `libellé` on the `TypeU` table. All the data in the column will be lost.
  - Added the required column `libell_` to the `TypeU` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `TypeU` DROP COLUMN `libellé`,
    ADD COLUMN `libell_` VARCHAR(50) NOT NULL;
