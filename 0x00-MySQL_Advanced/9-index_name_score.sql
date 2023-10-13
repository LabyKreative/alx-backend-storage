-- This SQL script creates an index idx_name_first_score on the
-- first letter of the name and score in the table names.
CREATE INDEX idx_name_first_score
ON names (name(1), score);
