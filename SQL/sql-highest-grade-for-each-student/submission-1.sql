-- Write your query below
SELECT student_id, exam_id, score FROM
(   SELECT student_id, exam_id, score,
    ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id ASC) AS RN 
    FROM exam_results
    ) sub WHERE RN = 1 ORDER BY student_id ASC;