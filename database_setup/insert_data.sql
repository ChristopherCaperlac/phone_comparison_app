/*
Ctrl+F and Replace 
WORKING_DIRECTORY
with the directory that contains your .tbl files
*/
COPY company FROM 'WORKING_DIRECTORY/company.tbl' WITH (delimiter '|', NULL '');
COPY cellphonecompany FROM 'WORKING_DIRECTORY/cellphonecompany.tbl' WITH (delimiter '|', NULL '');
COPY chipmanufacturer FROM 'WORKING_DIRECTORY/chipmanufacturer.tbl' WITH (delimiter '|', NULL '');
COPY phonemodel FROM 'WORKING_DIRECTORY/phonemodel.tbl' WITH (delimiter '|', NULL '');
COPY chip FROM 'WORKING_DIRECTORY/chip.tbl' WITH (delimiter '|', NULL '');
COPY contains FROM 'WORKING_DIRECTORY/contains.tbl' WITH (delimiter '|', NULL '');