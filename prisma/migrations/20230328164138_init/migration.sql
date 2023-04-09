/*
  Warnings:

  - You are about to drop the column `hoodid` on the `Income` table. All the data in the column will be lost.
  - You are about to drop the column `hoodid` on the `Rent` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[inid]` on the table `Income` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rentid]` on the table `Rent` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `inid` to the `Income` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rentid` to the `Rent` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Income" DROP CONSTRAINT "Income_hoodid_fkey";

-- DropForeignKey
ALTER TABLE "Rent" DROP CONSTRAINT "Rent_hoodid_fkey";

-- DropIndex
DROP INDEX "Income_hoodid_key";

-- DropIndex
DROP INDEX "Rent_hoodid_key";

-- AlterTable
ALTER TABLE "Income" DROP COLUMN "hoodid",
ADD COLUMN     "inid" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Rent" DROP COLUMN "hoodid",
ADD COLUMN     "rentid" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Income_inid_key" ON "Income"("inid");

-- CreateIndex
CREATE UNIQUE INDEX "Rent_rentid_key" ON "Rent"("rentid");

-- AddForeignKey
ALTER TABLE "Rent" ADD CONSTRAINT "Rent_rentid_fkey" FOREIGN KEY ("rentid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Income" ADD CONSTRAINT "Income_inid_fkey" FOREIGN KEY ("inid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "Crime_hoodid_fkey" RENAME TO "Crime_hoodid_key";
