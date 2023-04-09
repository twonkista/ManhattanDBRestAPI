/*
  Warnings:

  - The primary key for the `HoodID` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `IncomeID` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `crimeID` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `rentID` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "IncomeID" DROP CONSTRAINT "IncomeID_iid_fkey";

-- DropForeignKey
ALTER TABLE "crimeID" DROP CONSTRAINT "crimeID_crimid_fkey";

-- DropForeignKey
ALTER TABLE "rentID" DROP CONSTRAINT "rentID_hid_fkey";

-- AlterTable
ALTER TABLE "HoodID" DROP CONSTRAINT "HoodID_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "HoodID_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "HoodID_id_seq";

-- DropTable
DROP TABLE "IncomeID";

-- DropTable
DROP TABLE "crimeID";

-- DropTable
DROP TABLE "rentID";

-- CreateTable
CREATE TABLE "Crime" (
    "propCrime" DECIMAL(65,30) NOT NULL,
    "brug" DECIMAL(65,30) NOT NULL,
    "larceny" DECIMAL(65,30) NOT NULL,
    "rob" DECIMAL(65,30) NOT NULL,
    "hoodid" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Rent" (
    "medRent" DECIMAL(65,30) NOT NULL,
    "medHousePrice" DECIMAL(65,30) NOT NULL,
    "hoodid" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Income" (
    "medSal" DECIMAL(65,30) NOT NULL,
    "medHHinc" DECIMAL(65,30) NOT NULL,
    "povertyRate" DECIMAL(65,30) NOT NULL,
    "hoodid" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Crime_propCrime_key" ON "Crime"("propCrime");

-- CreateIndex
CREATE UNIQUE INDEX "Crime_brug_key" ON "Crime"("brug");

-- CreateIndex
CREATE UNIQUE INDEX "Crime_larceny_key" ON "Crime"("larceny");

-- CreateIndex
CREATE UNIQUE INDEX "Crime_rob_key" ON "Crime"("rob");

-- CreateIndex
CREATE UNIQUE INDEX "Crime_hoodid_fkey" ON "Crime"("hoodid");

-- CreateIndex
CREATE UNIQUE INDEX "Rent_medRent_key" ON "Rent"("medRent");

-- CreateIndex
CREATE UNIQUE INDEX "Rent_medHousePrice_key" ON "Rent"("medHousePrice");

-- CreateIndex
CREATE UNIQUE INDEX "Rent_hoodid_key" ON "Rent"("hoodid");

-- CreateIndex
CREATE UNIQUE INDEX "Income_medSal_key" ON "Income"("medSal");

-- CreateIndex
CREATE UNIQUE INDEX "Income_medHHinc_key" ON "Income"("medHHinc");

-- CreateIndex
CREATE UNIQUE INDEX "Income_povertyRate_key" ON "Income"("povertyRate");

-- CreateIndex
CREATE UNIQUE INDEX "Income_hoodid_key" ON "Income"("hoodid");

-- AddForeignKey
ALTER TABLE "Crime" ADD CONSTRAINT "Crime_hoodid_fkey" FOREIGN KEY ("hoodid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rent" ADD CONSTRAINT "Rent_hoodid_fkey" FOREIGN KEY ("hoodid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Income" ADD CONSTRAINT "Income_hoodid_fkey" FOREIGN KEY ("hoodid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
