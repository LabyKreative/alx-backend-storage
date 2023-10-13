-- This SQL script creates a view need_meeting that lists students who need a meeting.
DROP VIEW IF EXISTS need_meeting;
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80 AND (last_meeting IS NULL OR last_meeting < NOW() - INTERVAL 1 MONTH);
