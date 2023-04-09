/*
  Warnings:

  - A unique constraint covering the columns `[murd]` on the table `Crime` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ass]` on the table `Crime` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `ass` to the `Crime` table without a default value. This is not possible if the table is not empty.
  - Added the required column `murd` to the `Crime` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Crime" ADD COLUMN     "ass" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "murd" DECIMAL(65,30) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Crime_murd_key" ON "Crime"("murd");

-- CreateIndex
CREATE UNIQUE INDEX "Crime_ass_key" ON "Crime"("ass");
