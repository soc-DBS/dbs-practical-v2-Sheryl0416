-- CreateTable
CREATE TABLE "staff_dependent" (
    "staff_no" CHAR(4) NOT NULL,
    "dep_name" VARCHAR(100) NOT NULL,
    "relationship" VARCHAR(20) NOT NULL,
    "birth_date" DATE NOT NULL,

    CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no","dep_name")
);
