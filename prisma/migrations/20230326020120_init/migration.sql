-- DropForeignKey
ALTER TABLE "IncomeID" DROP CONSTRAINT "IncomeID_iid_fkey";

-- DropForeignKey
ALTER TABLE "crimeID" DROP CONSTRAINT "crimeID_crimid_fkey";

-- DropForeignKey
ALTER TABLE "rentID" DROP CONSTRAINT "rentID_hid_fkey";

-- DropIndex
DROP INDEX "IncomeID_iid_key";

-- DropIndex
DROP INDEX "crimeID_crimid_key";

-- DropIndex
DROP INDEX "rentID_hid_key";

-- AlterTable
ALTER TABLE "IncomeID" ALTER COLUMN "iid" DROP NOT NULL,
ALTER COLUMN "povertyRate" SET DATA TYPE DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "crimeID" ALTER COLUMN "crimid" DROP NOT NULL;

-- AlterTable
ALTER TABLE "rentID" ALTER COLUMN "hid" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "crimeID" ADD CONSTRAINT "crimeID_crimid_fkey" FOREIGN KEY ("crimid") REFERENCES "HoodID"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rentID" ADD CONSTRAINT "rentID_hid_fkey" FOREIGN KEY ("hid") REFERENCES "HoodID"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncomeID" ADD CONSTRAINT "IncomeID_iid_fkey" FOREIGN KEY ("iid") REFERENCES "HoodID"("id") ON DELETE SET NULL ON UPDATE CASCADE;
