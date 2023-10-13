-- This SQL script creates a stored procedure ComputeAverageScoreForUser
-- to compute and store the average score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER //
CREATE PROCEDURE ComputeAverageScoreForUser(user_id INT)
BEGIN
    DECLARE total_score INT DEFAULT 0;
    DECLARE projects_count INT DEFAULT 0;

    -- Compute the total score for the user
    SELECT SUM(score)
    INTO total_score
    FROM corrections
    WHERE corrections.user_id = user_id;

    SELECT COUNT(*)
    INTO projects_count
    FROM corrections
    WHERE corrections.user_id = user_id;

    -- Compute the average score and store it
    IF projects_count > 0 THEN
        UPDATE users
        SET average_score = total_score / projetcts_count
        WHERE id = user_id;
    ELSE
        UPDATE users
        SET average_score = NULL
        WHERE id = user_id;
    END IF;
END //
DELIMITER ;
