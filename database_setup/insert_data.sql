/*
Ctrl+F and Replace 
WORKING_DIRECTORY
with the directory that contains your .csv files
*/
COPY company FROM 'WORKING_DIRECTORY/CSVs/company.csv' WITH (delimiter ',', NULL '', FORMAT CSV, HEADER, ESCAPE '"');
COPY cellphonecompany FROM 'WORKING_DIRECTORY/CSVs/phonecomp.csv' WITH (delimiter ',', NULL '', FORMAT CSV, HEADER, ESCAPE '"');
COPY chipmanufacturer FROM 'WORKING_DIRECTORY/CSVs/chipcomp.csv' WITH (delimiter ',', NULL '', FORMAT CSV, HEADER, ESCAPE '"');
COPY phonemodel FROM 'WORKING_DIRECTORY/CSVs/phone.csv' WITH (delimiter ',', NULL '', FORMAT CSV, HEADER, ESCAPE '"');
COPY chip FROM 'WORKING_DIRECTORY/CSVs/chip.csv' WITH (delimiter ',', NULL '', FORMAT CSV, HEADER, ESCAPE '"');
COPY contains FROM 'WORKING_DIRECTORY/CSVs/contains.csv' WITH (delimiter ',', NULL '', FORMAT CSV, HEADER, ESCAPE '"');
