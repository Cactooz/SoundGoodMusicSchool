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

--Insert views
\i 'C:\\PATH\\database\\views.sql'

--Remove the old history database
DROP DATABASE IF EXISTS sgmsh;

--Create a new history database
CREATE DATABASE sgmsh;

\c sgmsh
--Create database structure
\i 'C:\\PATH\\database\\historical.sql'

--Copy data
\i 'C:\\PATH\\database\\copydata.sql'
