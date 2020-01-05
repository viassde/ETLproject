-- clear tables 
DROP TABLE IF EXISTS fatalities CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS weather CASCADE;
--
CREATE TABLE fatalities (
    id int   NOT NULL,
    city_code int   NOT NULL,
    crash_time timestamp  NOT NULL,
    atmospheric_conditions_name varchar(100)   NOT NULL,
    atmospheric_conditions_1_name varchar(100)   NOT NULL,
    atmospheric_conditions_2_name varchar(100)   NOT NULL,
    number_of_fatalities int   NOT NULL,
    CONSTRAINT pk_fatalities PRIMARY KEY (
        id
     )
);

CREATE TABLE location (
    city_code int   NOT NULL,
    city varchar(30)   NOT NULL,
    state varchar(30)   NOT NULL,
    CONSTRAINT pk_location PRIMARY KEY (
        city_code
     )
);

CREATE TABLE weather (
    city_code int   NOT NULL,
    datetime timestamp NOT NULL,
    description varchar(100)   NOT NULL,
    temperature float,
    humidity int,
    pressure int,
    wind_speed int
);

ALTER TABLE fatalities ADD CONSTRAINT fk_fatalities_city_code FOREIGN KEY(city_code)
REFERENCES location (city_code);

ALTER TABLE weather ADD CONSTRAINT fk_weather_city_code FOREIGN KEY(city_code)
REFERENCES location (city_code);