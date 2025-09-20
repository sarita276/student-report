use student_report;
CREATE OR REPLACE VIEW vw_student_subject_performance AS
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    ROUND(AVG(m.marks_obtained / m.max_marks * 100), 2) AS avg_percentage_per_subject
FROM 
    students s
JOIN 
    marks m ON s.student_id = m.student_id
JOIN 
    subjects sub ON m.subject_id = sub.subject_id
GROUP BY 
    s.student_id, sub.subject_id;
    
  -- overall performace  
CREATE OR REPLACE VIEW vw_student_overall_performance AS
SELECT 
    s.student_id,
    s.student_name,
    ROUND(AVG(m.marks_obtained / m.max_marks * 100), 2) AS overall_avg_percentage
FROM 
    students s
JOIN 
    marks m ON s.student_id = m.student_id
GROUP BY 
    s.student_id;
    
    
-- Attendance Statistics
CREATE OR REPLACE VIEW vw_student_attendance_stats AS
SELECT 
    s.student_id,
    s.student_name,
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) AS days_present,
    COUNT(CASE WHEN a.status = 'Absent' THEN 1 END) AS days_absent,
    ROUND(
        COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0 / COUNT(*), 2
    ) AS attendance_percentage
FROM 
    students s
JOIN 
    attendance a ON s.student_id = a.student_id
GROUP BY 
    s.student_id;