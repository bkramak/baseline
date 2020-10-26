/*
 2020 Oct create database for operational assessments
 author: brian kramak 518-925-9030
 unlicensed and unwarranted
 create asset type table
*/

CREATE TABLE asset_type(
	atid bigserial not null primary key,
	tid bigint not null,
	name varchar(50) not null,
	description varchar(250) not null,
	CONSTRAINT 
		fk_tid FOREIGN KEY(tid) REFERENCES type(tid)

	);
	
	
INSERT INTO asset_type(tid,name,description) values(1,'Repower MM82', '2000kW turbine with 82m rotor, Repower is now Senvion');