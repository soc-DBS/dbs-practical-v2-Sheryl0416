-- CreateTable
CREATE TABLE "student" (
    "student_no" CHAR(6) NOT NULL,
    "student_name" VARCHAR(100) NOT NULL,
    "gender" CHAR(1) NOT NULL,
    "dob" DATE NOT NULL,
    "country_id" INTEGER NOT NULL,
    "course_code" VARCHAR(5) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("student_no")
);
