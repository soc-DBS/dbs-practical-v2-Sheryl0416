/*
  Warnings:

  - The primary key for the `country` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `country` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `country` table. All the data in the column will be lost.
  - The primary key for the `staff_dependent` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `birth_date` on the `staff_dependent` table. All the data in the column will be lost.
  - You are about to drop the column `dep_name` on the `staff_dependent` table. All the data in the column will be lost.
  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `mod_code` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to drop the column `stud_id` on the `stud_mod_performance` table. All the data in the column will be lost.
  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `country_id` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `course_code` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `student_name` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `student_no` on the `student` table. All the data in the column will be lost.
  - Added the required column `country_name` to the `country` table without a default value. This is not possible if the table is not empty.
  - Added the required column `language` to the `country` table without a default value. This is not possible if the table is not empty.
  - Added the required column `region` to the `country` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dependent_name` to the `staff_dependent` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mod_registered` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `address` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `crse_code` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nationality` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stud_name` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "staff" DROP CONSTRAINT "staff_dept_code_fkey";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "smp_mod_code_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "smp_stud_id_fk";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_country_id_fkey";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_course_code_fkey";

-- AlterTable
ALTER TABLE "country" DROP CONSTRAINT "country_pkey",
DROP COLUMN "id",
DROP COLUMN "name",
ADD COLUMN     "country_name" VARCHAR(30) NOT NULL,
ADD COLUMN     "language" VARCHAR(30) NOT NULL,
ADD COLUMN     "region" VARCHAR(30) NOT NULL,
ADD CONSTRAINT "country_pkey" PRIMARY KEY ("country_name");

-- AlterTable
ALTER TABLE "staff_dependent" DROP CONSTRAINT "staff_dependent_pkey",
DROP COLUMN "birth_date",
DROP COLUMN "dep_name",
ADD COLUMN     "dependent_name" VARCHAR(30) NOT NULL,
ADD CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no", "dependent_name");

-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
DROP COLUMN "mod_code",
DROP COLUMN "stud_id",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ADD COLUMN     "mark" INTEGER,
ADD COLUMN     "mod_registered" VARCHAR(10) NOT NULL,
ALTER COLUMN "grade" SET DATA TYPE CHAR(2),
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no", "mod_registered");

-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
DROP COLUMN "country_id",
DROP COLUMN "course_code",
DROP COLUMN "student_name",
DROP COLUMN "student_no",
ADD COLUMN     "address" VARCHAR(100) NOT NULL,
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ADD COLUMN     "crse_code" VARCHAR(5) NOT NULL,
ADD COLUMN     "home_phone" CHAR(8),
ADD COLUMN     "mobile_phone" CHAR(8),
ADD COLUMN     "nationality" VARCHAR(30) NOT NULL,
ADD COLUMN     "stud_name" VARCHAR(30) NOT NULL,
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no");

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "fk_course_offered_by" TO "course_offered_by_fk";

-- AddForeignKey
ALTER TABLE "department" ADD CONSTRAINT "dept_hod_fk" FOREIGN KEY ("hod") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_dept_code_fk" FOREIGN KEY ("dept_code") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fk" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;
