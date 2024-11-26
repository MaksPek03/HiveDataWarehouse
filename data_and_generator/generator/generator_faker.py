from faker import Faker
import pandas as pd
from faker.config import AVAILABLE_LOCALES
import pycountry
import random
import csv


from faker import Faker
from faker.config import AVAILABLE_LOCALES
import pycountry
import random
import csv


def generate_location():
    locations = []
    for i in range(100):
        locale = random.choice(AVAILABLE_LOCALES)
        try:
            country = locale.split('_')[1]
        except IndexError:
            continue
        fake = Faker(locale)
        location_type = fake.random_element(['home', 'outdoor', 'gym'])
        try:
            country_full_name = pycountry.countries.get(alpha_2=country).name
        except AttributeError:
            continue
        locations.append([len(locations), fake.city(), country_full_name, location_type])
    return locations


def generate_workout_type():
    workout_types = []
    workout_data = ["Cardio", "Strength Training", "Yoga", "HIIT", "Pilates", "CrossFit", "Endurance Training", "Bodyweight",
                    "Functional Training", "Zumba", "Swimming", "Martial Arts", "Stretching", "Spin Class", "Rowing", "Outdoor Hiking"]
    equipment_list = ["Dumbbells", "Kettlebells", "Resistance Bands", "Medicine Ball", "Barbell", "Exercise Mat",
                      "Treadmill", "Stationary Bike", "Rowing Machine", "Jump Rope", "Pull-up Bar", "Battle Ropes",
                      "TRX Suspension Trainer", "Exercise Ball", "Foam Roller"]

    for i in range(100):
        workout_name = workout_data[random.randint(0, len(workout_data) - 1)]
        if workout_name in ["Strength Training", "Functional Training", "Bodyweight", "HIIT"]:
            reps = random.randint(8, 12)
            sets = random.randint(3, 5)
            workout_details = {"reps": reps, "sets": sets, "distance_km": None}
        elif workout_name == "Running":
            distance_km = round(random.uniform(5, 20), 2)
            workout_details = {"reps": None, "sets": None, "distance_km": distance_km}
        elif workout_name in ["Cardio", "Zumba", "Swimming", "Crossfit", "Rowing", "Outdoor Hiking"]:
            distance_km = random.uniform(1, 10)
            workout_details = {"reps": None, "sets": None, "distance_km": distance_km}
        else:
            workout_details = {"reps": None, "sets": None, "distance_km": None}
        workout_details_map = '|'.join([f"{key}:{value}" for key, value in workout_details.items() if value is not None])

        num_of_equipment = random.randint(1, 4)
        equipment_used = '|'.join(random.sample(equipment_list, num_of_equipment))

        workout_types.append([i, workout_name, str(equipment_used), workout_details_map])

    return workout_types



def generate_workouts():
    workouts = []
    for i in range(100):
        workout_date_id = random.randint(1, 500)
        workout_type_id = random.randint(1, 100)
        workout_intensity_id = random.randint(1, 100)
        location_id = random.randint(1, 100)
        user_id = random.randint(1, 100)
        duration = random.randint(10, 90)
        calories_burned = random.randint(100, 700)
        workouts.append([i+1, workout_date_id, workout_type_id, workout_intensity_id, location_id, user_id, duration, calories_burned])

    return workouts


locations = generate_location()
workout_types = generate_workout_type()
workouts = generate_workouts()

with open('workout_types.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(workout_types)

with open('locations.csv', 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(locations)

with open('workouts.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(workouts)

def generate_users(number_of_users):
  fake = Faker()
  data = []
  for i in range(1, number_of_users + 1):
    data.append([
        i,
        fake.first_name_female(),
        fake.last_name(),
        fake.random_int(min=15, max=60),
        fake.random_int(min=160, max=190),
        round(fake.pyfloat(min_value=60, max_value=100, right_digits=1), 1),
        round(fake.pyfloat(min_value=10, max_value=30, right_digits=1), 1),
        fake.email(),
        fake.random_element(['basic', 'premium', 'elite']),
        fake.random_element(['female'])
    ])
  return data

user_data = generate_users(50)  

with open('user_data_female.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(user_data)

def generate_users(number_of_users):
  fake = Faker()
  data = []
  for i in range(51, number_of_users + 51):
    data.append([
        i,
        fake.first_name_male(),
        fake.last_name(),
        fake.random_int(min=15, max=60),
        fake.random_int(min=160, max=190),
        round(fake.pyfloat(min_value=60, max_value=100, right_digits=1), 1),
        round(fake.pyfloat(min_value=10, max_value=30, right_digits=1), 1),
        fake.email(),
        fake.random_element(['basic', 'premium', 'elite']),
        fake.random_element(['male'])
    ])
  return data

user_data = generate_users(50)  

with open('user_data_male.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(user_data)


def generate_date_data(number_of_records):
    fake = Faker()
    data = []
    for i in range(1, number_of_records + 1):
        year_no = fake.random_int(min=2019, max=2023)
        month_no = fake.random_int(min=1, max=12)
        day_no = fake.day_of_month()
        data.append([
            i,
            year_no,
            month_no,
            day_no
        ])
    return data

date_data = generate_date_data(500)
with open('date_data.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(date_data)

def generate_intensity(number_of_intensity_records):
    fake = Faker()
    data = []
    for i in range(1, number_of_intensity_records + 1):
        level = fake.random_element(['low', 'medium', 'high'])
        heart_rate_zone = fake.random_element(['fat_burn', 'cardio', 'peak'])
        difficulty_rating = fake.random_int(min=1, max=10)

        data.append([
            i,  
            level, 
            heart_rate_zone, 
            difficulty_rating, 
        ])
    return data

intensity_data = generate_intensity(100)
with open('intensity.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(intensity_data)