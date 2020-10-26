/*
 2020 Oct create database for operational assessments
 author: brian kramak 518-925-9030
 unlicensed and unwarranted
 create asset table
*/

CREATE TABLE asset(
	aid bigserial not null primary key,
	fid bigint not null,
	atid bigint not null,
	shortname varchar(25) not null,
	akaname varchar(150),
	latitude real not null,
	longitude real not null,
	elevation real,
	cod timestamp not null,
	CONSTRAINT fk_fid FOREIGN KEY(fid) REFERENCES facility(fid) ,
	CONSTRAINT fk_atid FOREIGN KEY(atid) REFERENCES asset_type(atid)

	);


INSERT INTO asset(fid,atid,shortname,akaname,latitude,longitude,elevation,cod) 
	VALUES(1,1,'R80736','WT001', 48.4510653, 5.5930283, 439,date '2009-01-01');
INSERT INTO asset(fid,atid,shortname,akaname,latitude,longitude,elevation,cod) 
	VALUES(1,1,'R80721','WT002', 48.453557, 5.587520, 427.0,date '2009-01-01');
INSERT INTO asset(fid,atid,shortname,akaname,latitude,longitude,elevation,cod) 
	VALUES(1,1,'R80790','WT003', 48.449718, 5.586903, 412.0,date '2009-01-01');
INSERT INTO asset(fid,atid,shortname,akaname,latitude,longitude,elevation,cod) 
	VALUES(1,1,'R80711','WT004', 48.446035, 5.592451, 405.0,date '2009-01-01');


