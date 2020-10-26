/*
 2020 Oct create database for operational assessments
 author: brian kramak 518-925-9030
 unlicensed and unwarranted
 create type table
*/

CREATE TABLE type(
	tid bigserial not null primary key,
	name varchar(50) not null,
	description varchar(250) not null

	);
	
INSERT INTO type(name, description) values('wind turbine', 'all wind turbines including AC out');
INSERT INTO type(name, description) values('solar inverter', 'inverters including AC out');
INSERT INTO type(name, description) values('solar pv', 'pv array');
INSERT INTO type(name, description) values('solar csp', 'concentrating solar not pv');
INSERT INTO type(name, description) values('electrical meter', 'all string, substation, revenue electrical meters');
INSERT INTO type(name, description) values('onsite resmeas', 'all wind or solar onsite measurements');
INSERT INTO type(name, description) values('modeled resmeas', 'MERRA-2, ERA-5, WRF and other modeled resource measurements');
