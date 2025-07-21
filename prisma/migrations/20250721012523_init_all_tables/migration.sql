-- CreateTable
CREATE TABLE "course" (
    "crse_code" VARCHAR(5) NOT NULL,
    "crse_name" VARCHAR(100) NOT NULL,
    "offered_by" VARCHAR(5) NOT NULL,
    "crse_fee" DECIMAL(7,2) NOT NULL,
    "lab_fee" DECIMAL(7,2),

    CONSTRAINT "course_pkey" PRIMARY KEY ("crse_code")
);

-- CreateTable
CREATE TABLE "department" (
    "dept_code" VARCHAR(5) NOT NULL,
    "dept_name" VARCHAR(100) NOT NULL,
    "hod" CHAR(4) NOT NULL,
    "no_of_staff" INTEGER,
    "max_staff_strength" INTEGER,
    "budget" DECIMAL(9,2),
    "expenditure" DECIMAL(9,2),
    "hod_appt_date" DATE,

    CONSTRAINT "department_pkey" PRIMARY KEY ("dept_code")
);

-- CreateTable
CREATE TABLE "staff" (
    "staff_no" CHAR(4) NOT NULL,
    "staff_name" VARCHAR(100) NOT NULL,
    "supervisor_staff_no" CHAR(4),
    "dob" DATE NOT NULL,
    "grade" VARCHAR(5) NOT NULL,
    "marital_status" VARCHAR(1) NOT NULL,
    "pay" DECIMAL(7,2),
    "allowance" DECIMAL(7,2),
    "hourly_rate" DECIMAL(7,2),
    "gender" CHAR(1) NOT NULL,
    "citizenship" VARCHAR(10) NOT NULL,
    "join_yr" INTEGER NOT NULL,
    "dept_code" VARCHAR(5) NOT NULL,
    "type_of_employment" VARCHAR(2) NOT NULL,
    "highest_qln" VARCHAR(10) NOT NULL,
    "designation" VARCHAR(20) NOT NULL,

    CONSTRAINT "staff_pkey" PRIMARY KEY ("staff_no")
);

-- CreateTable
CREATE TABLE "staff_backup" (
    "staff_no" CHAR(4) NOT NULL,
    "staff_name" VARCHAR(100) NOT NULL,
    "supervisor" CHAR(4),
    "dob" DATE NOT NULL,
    "grade" VARCHAR(5) NOT NULL,
    "marital_status" VARCHAR(1) NOT NULL,
    "pay" DECIMAL(7,2),
    "allowance" DECIMAL(7,2),
    "hourly_rate" DECIMAL(7,2),
    "gender" CHAR(1) NOT NULL,
    "citizenship" VARCHAR(10) NOT NULL,
    "join_yr" INTEGER NOT NULL,
    "dept_code" VARCHAR(5) NOT NULL,
    "type_of_employment" VARCHAR(2) NOT NULL,
    "highest_qln" VARCHAR(10) NOT NULL,
    "designation" VARCHAR(20) NOT NULL,

    CONSTRAINT "staff_backup_pkey" PRIMARY KEY ("staff_no")
);

-- CreateTable
CREATE TABLE "user_account" (
    "id" INTEGER NOT NULL,
    "account_no" VARCHAR(6) NOT NULL,
    "role" INTEGER NOT NULL,
    "password" VARCHAR(255) NOT NULL,

    CONSTRAINT "user_account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_role" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(25) NOT NULL,

    CONSTRAINT "user_role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "module" (
    "mod_code" VARCHAR(10) NOT NULL,
    "mod_name" VARCHAR(100) NOT NULL,
    "credit_unit" INTEGER NOT NULL,
    "mod_coord" CHAR(4),

    CONSTRAINT "module_pkey" PRIMARY KEY ("mod_code")
);

-- CreateTable
CREATE TABLE "staff_dependent" (
    "staff_no" CHAR(4) NOT NULL,
    "dep_name" VARCHAR(100) NOT NULL,
    "relationship" VARCHAR(20) NOT NULL,
    "birth_date" DATE NOT NULL,

    CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no","dep_name")
);

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

-- CreateTable
CREATE TABLE "country" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "country_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "fk_course_offered_by" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_dept_code_fkey" FOREIGN KEY ("dept_code") REFERENCES "department"("dept_code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_course_code_fkey" FOREIGN KEY ("course_code") REFERENCES "course"("crse_code") ON DELETE RESTRICT ON UPDATE CASCADE;
