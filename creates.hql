CREATE TABLE WORKOUT_TEXTFILE (
    workout_id INT,
    workout_date_id INT,
    workout_type_id INT,
    workout_intesity_id INT,
    location_id INT,
    user_id INT,
    duration INT,
    calories_burned INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE WORKOUT (
    workout_id INT,
    workout_date_id INT,
    workout_type_id INT,
    workout_intesity_id INT,
    location_id INT,
    user_id INT,
    duration INT,
    calories_burned INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC;

CREATE TABLE date_data_textfile(
    date_id INT,
    year INT,
    month_no INT,
    day_no INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE date_data(
    date_id INT,
    year INT,
    month_no INT,
    day_no INT
)
CLUSTERED BY (year) INTO 5 buckets
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS PARQUET;



CREATE TABLE intensity_textfile_temp (
    intensity_id INT,
    heart_rate_zone STRING,
    difficulty_rating INT
)
PARTITIONED BY (level string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE intensity (
    intensity_id INT,
    heart_rate_zone STRING,
    difficulty_rating INT
)
PARTITIONED BY (level string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS PARQUET;




CREATE TABLE USERS(
    ID INT, 
    name STRING,
    surname STRING,
    age INT,
    height INT,
    weight FLOAT,
    body_fat_percentage FLOAT,
    email STRING,
    membership_level STRING
)
PARTITIONED BY (gender STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;




CREATE EXTERNAL TABLE Workout_type(
    ID INT,
    type STRING,
    equipment_used ARRAY<STRING>,
    workout_details MAP<STRING, STRING>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '|'
MAP KEYS TERMINATED BY ':'
STORED AS TEXTFILE
LOCATION 'hdfs:///user/andb32_34_projekt/database/workout_types_2';

CREATE TABLE LOCATION_TEXTFILE(
    ID INT, 
    country STRING,
    city STRING,
    location_type STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE LOCATION(
    ID INT, 
    country STRING,
    city STRING,
    location_type STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS PARQUET;






