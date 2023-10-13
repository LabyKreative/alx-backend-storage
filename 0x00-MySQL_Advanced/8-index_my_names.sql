-- This SQL script creates an index idx_name_first on the
-- first letter of the name in the table names.
CREATE INDEX idx_name_first
ON names (name(1));
