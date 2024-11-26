-- looking at how different types of workouts are rated on the difficulty level by the users 
SELECT wt.type AS workout_type, AVG(i.difficulty_rating) AS avg_difficulty_rating
FROM WORKOUT w
JOIN Workout_type wt ON w.workout_type_id = wt.ID
JOIN intensity i ON w.workout_intesity_id = i.intensity_id
GROUP BY wt.type
ORDER BY avg_difficulty_rating DESC;

-- looking for the most active month of the year  
SELECT d.year, d.month_no, COUNT(w.workout_id) AS workout_count
FROM WORKOUT w
JOIN date_data d ON w.workout_date_id = d.date_id
GROUP BY d.year, d.month_no
ORDER BY workout_count DESC
LIMIT 1;


-- searching locations to do a given workout 
SELECT l.city, l.location_type, COUNT(w.workout_id) AS workout_count
FROM WORKOUT w
JOIN LOCATION l ON w.location_id = l.ID
JOIN Workout_type wt ON w.workout_type_id = wt.ID
WHERE wt.type = 'Cardio'  
GROUP BY l.city, l.location_type
ORDER BY workout_count DESC;

-- looking to see if higher membership level is correlated with more activities 
SELECT u.membership_level, COUNT(w.workout_id) AS total_workouts
FROM WORKOUT w
JOIN USERS u ON w.user_id = u.ID
GROUP BY u.membership_level
ORDER BY total_workouts DESC;

-- Seeking what is the average duration of workouts by intensity level 
SELECT i.level AS intensity_level, AVG(w.duration) AS avg_duration
FROM WORKOUT w
JOIN intensity i ON w.workout_intesity_id = i.intensity_id
GROUP BY i.level;


-- tracking total calories burned by users across all workouts 
SELECT u.name, u.surname, SUM(w.calories_burned) AS total_calories_burned
FROM WORKOUT w
JOIN USERS u ON w.user_id = u.ID
GROUP BY u.name, u.surname
ORDER BY total_calories_burned DESC;


-- identifying the most popular workout location 
SELECT l.city, l.location_type, COUNT(w.workout_id) AS total_workouts
FROM WORKOUT w
JOIN LOCATION l ON w.location_id = l.ID
GROUP BY l.city, l.location_type
ORDER BY total_workouts DESC
LIMIT 1;

-- exploring monthly trends in workout participation 
SELECT d.year, d.month_no, COUNT(w.workout_id) AS workout_count
FROM WORKOUT w
JOIN date_data d ON w.workout_date_id = d.date_id
GROUP BY d.year, d.month_no
ORDER BY d.year, d.month_no;

-- comparing workout participation across gender 
SELECT u.gender, COUNT(w.workout_id) AS workout_count
FROM WORKOUT w
JOIN USERS u ON w.user_id = u.ID
GROUP BY u.gender;


-- highlighting users with the most calories burned in high-intensity workouts 
SELECT u.name, u.surname, SUM(w.calories_burned) AS total_calories
FROM WORKOUT w
JOIN USERS u ON w.user_id = u.ID
JOIN intensity i ON w.workout_intesity_id = i.intensity_id
WHERE i.level = 'high'
GROUP BY u.name, u.surname
ORDER BY total_calories DESC
LIMIT 5;


--  categorizing workouts by type to understand user preferences
SELECT wt.type AS workout_type, COUNT(w.workout_id) AS total_workouts
FROM WORKOUT w
JOIN Workout_type wt ON w.workout_type_id = wt.ID
GROUP BY wt.type
ORDER BY total_workouts DESC;
