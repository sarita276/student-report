use student_report;
-- Get average marks per subject for all students
SELECT * FROM vw_student_subject_performance ORDER BY student_id, subject_name;

-- Get overall average marks per student
SELECT * FROM vw_student_overall_performance ORDER BY student_name;

-- Get attendance statistics per student
SELECT * FROM vw_student_attendance_stats ORDER BY student_name;