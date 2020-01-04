-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Fatalities" (
    "fatality_ID" int   NOT NULL,
    "city_code" int   NOT NULL,
    "crash_time" time   NOT NULL,
    "atmospheric_conditions_name" varchar   NOT NULL,
    "atmospheric_conditions_1_name" varchar   NOT NULL,
    "atmospheric_conditions_2_name" varchar   NOT NULL,
    "number_of_fatalities" varchar   NOT NULL,
    CONSTRAINT "pk_Fatalities" PRIMARY KEY (
        "fatality_ID"
     )
);

CREATE TABLE "Weather" (
    "waether_ID" int   NOT NULL,
    "city_code" int   NOT NULL,
    "crash_time" time   NOT NULL,
    "weather_description" varchar   NOT NULL,
    "temperature" int   NOT NULL,
    "humidity" int   NOT NULL,
    "pressure" int   NOT NULL,
    "wind_speed" int   NOT NULL,
    CONSTRAINT "pk_Weather" PRIMARY KEY (
        "waether_ID"
     )
);

CREATE TABLE "Location" (
    "location_ID" int   NOT NULL,
    "state" varchar   NOT NULL,
    "city_name" varchar   NOT NULL,
    "city_code" varchar   NOT NULL,
    CONSTRAINT "pk_Location" PRIMARY KEY (
        "location_ID"
     )
);

ALTER TABLE "Weather" ADD CONSTRAINT "fk_Weather_crash_time" FOREIGN KEY("crash_time")
REFERENCES "Fatalities" ("crash_time");

ALTER TABLE "Location" ADD CONSTRAINT "fk_Location_city_code" FOREIGN KEY("city_code")
REFERENCES "Fatalities" ("city_code");

