/*
 2020 Oct create database for operational assessments
 author: brian kramak 518-925-9030
 unlicensed and unwarranted
 create OADB tables
*/

CREATE SCHEMA IF NOT EXISTS sandbox;  -- for importing raw data
CREATE SCHEMA IF NOT EXISTS bl;       -- baseline for the main tables
CREATE SCHEMA IF NOT EXISTS ats;      -- for time series asset data - event logs, 10min, hr data
CREATE SCHEMA IF NOT EXISTS rts;      -- for resource time series data - met mast, merra2, era5
CREATE SCHEMA IF NOT EXISTS maint;    -- for maintenance record type data
CREATE SCHEMA IF NOT EXISTS inv;      -- for inventory management
CREATE SCHEMA IF NOT EXISTS mgmt;      -- monthly/annual summary data for reports


DROP TABLE IF EXISTS bl.type;
DROP TABLE IF EXISTS bl.asset_type CASCADE;
DROP TABLE IF EXISTS bl.asset CASCADE;
DROP TABLE IF EXISTS bl.facility CASCADE;

CREATE TABLE bl.type(
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




CREATE TABLE bl.asset_type(
	atid bigserial not null primary key,
	tid bigint not null,
	name varchar(50) not null,
	description varchar(250) not null,
	CONSTRAINT fk_tid FOREIGN KEY(tid) REFERENCES type(tid)
	);
		
INSERT INTO asset_type(tid,name,description) values(1,'Repower MM82', '2000kW turbine with 82m rotor, Repower is now Senvion');




CREATE TABLE bl.facility (
	fid bigserial not null primary key,
	parent_fid bigint,
	shortname varchar(20) not null,
	longname varchar(100) not null,
	akaname varchar(250),
	capacity_mw_ac real not null,
	description varchar(250) not null,
	latitude real not null,
	longitude real not null,
	country varchar(100) not null,
	state_prov varchar(100) not null,
	cod timestamp not null,
	mailing_addr varchar(250),
	owner_id int,
	operator_id int,
	eia_id int,
	usgs_id int
	);

INSERT INTO facility(shortname,longname,akaname,capacity_mw_ac,description,latitude,longitude,country,state_prov,cod)
			values('LHB','La Haute Borne','La Haute Borne-Vaudeville-le-Haut',8.0,'Engie on-shore wind plant with opensource data',48.451194,5.589603,'France','Champagne Ardenne',date '2009-01-01');




CREATE TABLE bl.asset(
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


			
			
			