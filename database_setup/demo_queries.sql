-- Insert Query
-- Add an additional company into the company table:
INSERT INTO company (name,ceo,website) VALUES ('Acme Corporation', 'Marvin Acme', 'https://www.warnerbros.com');

-- Update Query
-- Change the core count of chips with clock speed < 5GHz to 1
UPDATE chip SET corecount=1 WHERE clockspeed < 5;

-- Delete Query
-- Delete company oMgDQNhbWVNifGzesy and all associated records (in company subclasses as well as phones and chips)
DELETE FROM company WHERE name='iKtcGitfBZUGEven';

-- Select Query 1
-- Select phones that cost at least $1000, sorted in ascending order
 SELECT companyname, modelname FROM phonemodel WHERE price >= 1000::money ORDER BY price;
 
-- Select Query 2
-- Get phones that contain chips for which the company that produced the phone was the same as the company that produced the chip	
SELECT p_companyname, p_modelname FROM contains WHERE p_companyname=c_companyname;
