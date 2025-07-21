-- CreateTable
CREATE TABLE "stud_mod_performance" (
    "stud_id" CHAR(6) NOT NULL,
    "mod_code" VARCHAR(10) NOT NULL,
    "grade" CHAR(1),

    CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("stud_id","mod_code")
);

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "smp_stud_id_fk" FOREIGN KEY ("stud_id") REFERENCES "student"("student_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "smp_mod_code_fk" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
