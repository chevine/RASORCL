-- Port numbers mapped to the containers
Port 5500 --> root container
Port 5501 --> RAS_STAGING
Port 5502 --> RAS

-- Save the current state of the PDB
ALTER PLUGGABLE DATABASE RAS_STAGING SAVE STATE;

-- Set the port number for a pluggable database
show con_name;
alter session set container = ras_staging;;;;;
select dbms_xdb_config.gethttpsport from dual;
execute dbms_xdb_config.sethttpsport(5501);






https://oracle-base.com/articles/12c/multitenant-startup-and-shutdown-cdb-and-pdb-12cr1
