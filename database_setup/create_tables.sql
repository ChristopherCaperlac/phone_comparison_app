CREATE TABLE company (
  name TEXT PRIMARY KEY,
  ceo TEXT,
  website TEXT
);

CREATE TABLE cellphonecompany (
  name TEXT references company(name) ON DELETE CASCADE PRIMARY KEY 
);

CREATE TABLE chipmanufacturer (
  name TEXT references company(name) ON DELETE CASCADE PRIMARY KEY
);

CREATE TABLE phonemodel (
  companyname TEXT references cellphonecompany(name) ON DELETE CASCADE , 
  modelname TEXT,
  rating numeric(3,1),
  displaysize NUMERIC,
  price money,
  weight numeric,
  batterycapacity INTEGER,
  releaseyear INTEGER,
  iprating INTEGER[2] CHECK (cardinality(iprating)=2),
  source TEXT,
  PRIMARY KEY (companyname,modelname)
);

CREATE TABLE chip (
  companyname TEXT references chipmanufacturer(name) ON DELETE CASCADE,
  modelname TEXT,
  rating numeric(3,1),
  corecount INTEGER,
  clockspeed numeric,
  source TEXT,
  PRIMARY KEY (companyname,modelname)
);

CREATE TABLE contains (
  p_companyname TEXT,
  p_modelname TEXT,
  c_companyname TEXT,
  c_modelname TEXT,
  FOREIGN KEY (p_companyname,p_modelname) references phonemodel(companyname,modelname) ON DELETE CASCADE,
  FOREIGN KEY (c_companyname,c_modelname) references chip(companyname,modelname) ON DELETE CASCADE,
  PRIMARY KEY (p_companyname,p_modelname,c_companyname,c_modelname)
);