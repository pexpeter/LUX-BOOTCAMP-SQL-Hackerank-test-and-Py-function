
SELECT 
submission_date ,  ---- we select the submisiion date

    ( 
        SELECT COUNT(DISTINCT hacker_id)  ---- we select the unigue hacker rid
        FROM Submissions b  
        WHERE b.submission_date = a.submission_date AND  
                    (
                        SELECT COUNT(DISTINCT c.submission_date) 
                        FROM Submissions c 
                        WHERE c.hacker_id = b.hacker_id AND 
                        c.submission_date < a.submission_date
                    ) = dateDIFF(a.submission_date , '2016-03-01') 
    ),
    (
        SELECT hacker_id  
        FROM submissions b 
        WHERE b.submission_date = a.submission_date 
        GROUP BY hacker_id 
        ORDER BY count(submission_id) DESC , hacker_id limit 1
    ) AS new,
    (
        SELECT name 
        FROM hackers 
        WHERE hacker_id = new
    )
FROM 
(
    SELECT DISTINCT submission_date 
    FROM submissions
) a
GROUP BY submission_date;