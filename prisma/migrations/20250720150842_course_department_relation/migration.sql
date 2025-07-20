-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "fk_course_offered_by" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_dept_code_fkey" FOREIGN KEY ("dept_code") REFERENCES "department"("dept_code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_course_code_fkey" FOREIGN KEY ("course_code") REFERENCES "course"("crse_code") ON DELETE RESTRICT ON UPDATE CASCADE;
