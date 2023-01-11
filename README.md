# Sound Good Music School Database
Database for Sound Good Music School in course IV1351.

### Astah Models
Models for Astah can be found in the [`models` folder](https://github.com/Cactooz/SoundGoodMusicSchool/tree/main/models) and then the specific task.

### Database
All creation files for the database, as well as the data insertion and view creation scripts are all found in the
[`database` folder](https://github.com/Cactooz/SoundGoodMusicSchool/tree/main/database) and then in the specific task folder.

### Database Creation Script
I've included a handy [reload/creation script](https://github.com/Cactooz/SoundGoodMusicSchool/blob/main/database/reloadDb_template.sql)
for the database that drops the old database and creates a new with the correct scripts.
Update the paths with the correct paths for your system and then run by querying with `\i 'C:\\PATH\\database\\reloadDb.sql'`.
Modified with the correct drive and file path.

### Task 4 - Database Interface
A console interface written in Java for task 4 is found in my other [SoundGoodMusicSchoolInterface repo](https://github.com/Cactooz/SoundGoodMusicSchoolInterface).
It includes all the needed SQL files to get the database up and running.
