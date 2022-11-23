--RUN WITH \i 'C:\\PATH\\database\\reloadDb.sql'

--Remove the old database
\c postgres;
DROP DATABASE IF EXISTS sgms;

--Create a new database
CREATE DATABASE sgms;
\c sgms;

--Create database structure
\i 'C:\\PATH\\database\\structure.sql'

--Insert data
\i 'C:\\PATH\\database\\data.sql'
