-- This SQL script creates a stored procedure ComputeAverageWeightedScoreForUser
-- to compute and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (user_id INT)
BEGIN
    DECLARE total_weighted_score INT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;

    -- Compute the total weighted score for the user
    SELECT SUM(corrections.score * projects.weight)
    INTO total_weighted_score
    FROM corrections
    INNER JOIN projects
    ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    SELECT SUM(projects.weight)
    INTO total_weight
    FROM corrections
    INNER JOIN projects
    ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    -- Compute the average weighted score and store it
    IF total_weight = 0 THEN
        UPDATE users
        SET users.average_score = 0
        WHERE users.id = user_id;
    ELSE
        UPDATE users
        SET users.average_score = total_weighted_score / total_weight
        WHERE users.id = user_id;
    END IF;
END //
DELIMITER ;
