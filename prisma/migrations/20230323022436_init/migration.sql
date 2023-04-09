-- CreateTable
CREATE TABLE "HoodID" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "borough" TEXT NOT NULL,

    CONSTRAINT "HoodID_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "crimeID" (
    "crimid" INTEGER NOT NULL,
    "propCrime" INTEGER NOT NULL,
    "brug" INTEGER NOT NULL,
    "larceny" INTEGER NOT NULL,
    "rob" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "rentID" (
    "hid" INTEGER NOT NULL,
    "medRent" INTEGER NOT NULL,
    "medHousePrice" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "IncomeID" (
    "iid" INTEGER NOT NULL,
    "medSal" INTEGER NOT NULL,
    "medHHinc" INTEGER NOT NULL,
    "povertyRate" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "HoodID_name_key" ON "HoodID"("name");

-- CreateIndex
CREATE UNIQUE INDEX "HoodID_borough_key" ON "HoodID"("borough");

-- CreateIndex
CREATE UNIQUE INDEX "crimeID_crimid_key" ON "crimeID"("crimid");

-- CreateIndex
CREATE UNIQUE INDEX "crimeID_propCrime_key" ON "crimeID"("propCrime");

-- CreateIndex
CREATE UNIQUE INDEX "crimeID_brug_key" ON "crimeID"("brug");

-- CreateIndex
CREATE UNIQUE INDEX "crimeID_larceny_key" ON "crimeID"("larceny");

-- CreateIndex
--CREATE UNIQUE INDEX "crimeID_batt_key" ON "crimeID"("batt");

-- CreateIndex
CREATE UNIQUE INDEX "crimeID_rob_key" ON "crimeID"("rob");

-- CreateIndex
CREATE UNIQUE INDEX "rentID_hid_key" ON "rentID"("hid");

-- CreateIndex
CREATE UNIQUE INDEX "rentID_medRent_key" ON "rentID"("medRent");

-- CreateIndex
CREATE UNIQUE INDEX "rentID_medHousePrice_key" ON "rentID"("medHousePrice");

-- CreateIndex
CREATE UNIQUE INDEX "IncomeID_iid_key" ON "IncomeID"("iid");

-- CreateIndex
CREATE UNIQUE INDEX "IncomeID_medSal_key" ON "IncomeID"("medSal");

-- CreateIndex
CREATE UNIQUE INDEX "IncomeID_medHHinc_key" ON "IncomeID"("medHHinc");

-- CreateIndex
CREATE UNIQUE INDEX "IncomeID_povertyRate_key" ON "IncomeID"("povertyRate");

-- AddForeignKey
ALTER TABLE "crimeID" ADD CONSTRAINT "crimeID_crimid_fkey" FOREIGN KEY ("crimid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rentID" ADD CONSTRAINT "rentID_hid_fkey" FOREIGN KEY ("hid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncomeID" ADD CONSTRAINT "IncomeID_iid_fkey" FOREIGN KEY ("iid") REFERENCES "HoodID"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
