load data inpath 'hdfs:///user/andb32_34_projekt/database/workouts_2/workouts.csv' overwrite into table WORKOUT_TEXTFILE;
insert into table WORKOUT select * from WORKOUT_TEXTFILE;

load data inpath 'hdfs:///user/andb32_34_projekt/database/date_data_2/date_data.csv' overwrite into table date_data_textfile;
insert into table date_data select * from date_data_textfile;

load data inpath 'hdfs:///user/andb32_34_projekt/database/intensity_2/intensity.csv' overwrite into table intensity_textfile;
insert overwrite table intensity partition(level)
select intensity_id, heart_rate_zone, difficulty_rating, level from intensity_textfile;

load data inpath 'hdfs:///user/andb32_34_projekt/database/user_data_2/user_data_male.csv' overwrite into table 
USERS PARTITION (gender='male');
load data inpath 'hdfs:///user/andb32_34_projekt/database/user_data_2/user_data_female.csv' overwrite into table 
USERS PARTITION (gender='female');

load data inpath 'hdfs:///user/andb32_34_projekt/database/workout_types_2/workout_types.csv' overwrite into table workout_type;

load data inpath 'hdfs:///user/andb32_34_projekt/database/locations_2/locations.csv' overwrite into table LOCATION_TEXTFILE;
insert into table LOCATION select * from LOCATION_TEXTFILE;