-- When entering existing department, location updated
EXECUTE update_dept_location('LEGAL', 'NJ');
-- Invalid department name (numeric)
EXECUTE update_dept_location('123', 'IL');
-- Invalid department name (NULL value)
EXECUTE update_dept_location(NULL, 'CA');
--department name inserted in camelcase
EXECUTE update_dept_location('PROJECT', 'RH'); 
--Unique constraint on dept_name violated when try to enter same values as above
EXECUTE update_dept_location('PROJECT', 'RH');
-- When entering existing department name, convert to camelcase- testcase 11
EXECUTE update_dept_location('OPS AND COMMS','NY');
