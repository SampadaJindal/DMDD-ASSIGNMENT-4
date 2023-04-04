--insert new department- testcase 1
EXECUTE update_dept_location('ACCOUNTING', 'IL');
-- Update existing department's location to 'MA'- testcase 2
EXECUTE update_dept_location('IT', 'MA'); 
-- Invalid department name (empty string)- testcase 3
EXECUTE update_dept_location('', 'TX'); 
 -- Invalid department name (NULL value)- testcase 4
EXECUTE update_dept_location(NULL, 'CA');
 -- Invalid department name (numeric) - testcase 5
EXECUTE update_dept_location('123', 'IL');
-- Invalid department name (too long)- testcase 6
EXECUTE update_dept_location('SALES AND MARKETING AND FINANCE', 'NY'); 
 -- Invalid department location- testcase 7
EXECUTE update_dept_location('SALES', 'FL');
-- Update existing department with accepted location- testcase 8
EXECUTE update_dept_location('LEGAL', 'RH'); 
--department name inserted in camelcase- testcase 9
EXECUTE update_dept_location('PRODUCT', 'RH'); 
-- When entering existing department, location updated- testcase 10
EXECUTE update_dept_location('LEGAL', 'NY');
-- When entering existing department name, convert to camelcase- testcase 11
EXECUTE update_dept_location('SALES AND FINANCE ', 'NY');
