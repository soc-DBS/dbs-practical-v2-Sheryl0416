-- CreateTable
CREATE TABLE "country" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "country_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
