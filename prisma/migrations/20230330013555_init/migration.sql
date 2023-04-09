/*
  Warnings:

  - You are about to drop the column `ass` on the `Crime` table. All the data in the column will be lost.
  - You are about to drop the column `brug` on the `Crime` table. All the data in the column will be lost.
  - You are about to drop the column `larceny` on the `Crime` table. All the data in the column will be lost.
  - You are about to drop the column `murd` on the `Crime` table. All the data in the column will be lost.
  - You are about to drop the column `propCrime` on the `Crime` table. All the data in the column will be lost.
  - You are about to drop the column `rob` on the `Crime` table. All the data in the column will be lost.
  - You are about to drop the column `medHHinc` on the `Income` table. All the data in the column will be lost.
  - You are about to drop the column `medSal` on the `Income` table. All the data in the column will be lost.
  - You are about to drop the column `povertyRate` on the `Income` table. All the data in the column will be lost.
  - You are about to drop the column `medHousePrice` on the `Rent` table. All the data in the column will be lost.
  - You are about to drop the column `medRent` on the `Rent` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Crime_ass_key";

-- DropIndex
DROP INDEX "Crime_brug_key";

-- DropIndex
DROP INDEX "Crime_larceny_key";

-- DropIndex
DROP INDEX "Crime_murd_key";

-- DropIndex
DROP INDEX "Crime_propCrime_key";

-- DropIndex
DROP INDEX "Crime_rob_key";

-- DropIndex
DROP INDEX "Income_medHHinc_key";

-- DropIndex
DROP INDEX "Income_medSal_key";

-- DropIndex
DROP INDEX "Income_povertyRate_key";

-- DropIndex
DROP INDEX "Rent_medHousePrice_key";

-- DropIndex
DROP INDEX "Rent_medRent_key";

-- AlterTable
ALTER TABLE "Crime" DROP COLUMN "ass",
DROP COLUMN "brug",
DROP COLUMN "larceny",
DROP COLUMN "murd",
DROP COLUMN "propCrime",
DROP COLUMN "rob",
ADD COLUMN     "assault_rate" DECIMAL(65,30),
ADD COLUMN     "burglary_rate" DECIMAL(65,30),
ADD COLUMN     "murder_rate" DECIMAL(65,30),
ADD COLUMN     "property_crime" DECIMAL(65,30),
ADD COLUMN     "robbery_rate" DECIMAL(65,30);

-- AlterTable
ALTER TABLE "Income" DROP COLUMN "medHHinc",
DROP COLUMN "medSal",
DROP COLUMN "povertyRate",
ADD COLUMN     "median_HouseHoldIncome" DECIMAL(65,30),
ADD COLUMN     "median_income" DECIMAL(65,30),
ADD COLUMN     "poverty_rate" DECIMAL(65,30);

-- AlterTable
ALTER TABLE "Rent" DROP COLUMN "medHousePrice",
DROP COLUMN "medRent",
ADD COLUMN     "median_HousePrice" DECIMAL(65,30),
ADD COLUMN     "median_Rent" DECIMAL(65,30);
