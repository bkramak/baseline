/*
 2020 Oct create database for operational assessments
 author: brian kramak 518-925-9030
 unlicensed and unwarranted
 create facility table
*/

CREATE TABLE facility (
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