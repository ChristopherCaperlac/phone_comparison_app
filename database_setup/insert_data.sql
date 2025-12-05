/*
Ctrl+F and Replace 
CSVs
with the directory that contains your .tbl files
*/
COPY company FROM 'CSVs/company.csv' WITH (delimiter ',', NULL '');
COPY cellphonecompany FROM 'CSVs/phonecomp.csv' WITH (delimiter ',', NULL '');
COPY chipmanufacturer FROM 'CSVs/chipcomp.csv' WITH (delimiter ',', NULL '');
COPY phonemodel FROM 'CSVs/phone.csv' WITH (delimiter ',', NULL '');
COPY chip FROM 'CSVs/chip.csv' WITH (delimiter ',', NULL '');
COPY contains FROM 'CSVs/contains.csv' WITH (delimiter ',', NULL '');
