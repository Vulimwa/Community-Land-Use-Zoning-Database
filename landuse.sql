-- Creating a database
CREATE DATABASE LANDUSE_ZONING;
-- Initializing the database
USE LANDUSE_ZONING;

-- owners table
CREATE TABLE owners(
owners_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
name VARCHAR(100) NOT NULL,
contact INT NOT NULL,
id_number VARCHAR(50) NOT NULL UNIQUE
);

-- parcels table
CREATE TABLE parcels(
parcel_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
parcel_number INT UNIQUE NOT NULL,
location VARCHAR (100) NOT NULL,
size INT NOT NULL,
owner_id INT,
status VARCHAR (100)NOT NULL,
FOREIGN KEY (owner_id) REFERENCES owners(owners_id)
);

-- zoning table
CREATE TABLE zoning(
zone_id INT PRIMARY KEY AUTO_INCREMENT,
zone_type VARCHAR (100) NOT NULL,
description TEXT,
restrictions TEXT
);

-- landuse table
CREATE TABLE landuse(
use_id INT PRIMARY KEY AUTO_INCREMENT,
use_type VARCHAR(100) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
parcel_id INT,
zone_id INT,
FOREIGN KEY (parcel_id) REFERENCES parcels(parcel_id),
FOREIGN KEY (zone_id) REFERENCES zoning(zone_id)
);

--  Development applications table
CREATE TABLE DevelopmentApplications(
app_id INT PRIMARY KEY AUTO_INCREMENT,
parcel_id INT,
applicant_id INT,
proposed_use VARCHAR(100),
status VARCHAR(100),
application_date DATE NOT NULL,
approval_date DATE NOT NULL,
FOREIGN KEY(parcel_id)  REFERENCES parcels(parcel_id),
FOREIGN KEY (applicant_id) REFERENCES owners(owners_id)
);

-- permits table
CREATE TABLE permits(
permit_id INT PRIMARY KEY AUTO_INCREMENT,
app_id INT,
issue_date DATE NOT NULL,
expiry_date DATE NOT NULL,
conditions TEXT,
FOREIGN KEY (app_id) REFERENCES DevelopmentApplications(app_id)
);

-- Landuse changes table
CREATE TABLE LandUseChanges(
change_id INT PRIMARY KEY AUTO_INCREMENT,
previous_use VARCHAR(200) NOT NULL,
parcel_id INT,
new_use TEXT,
change_date DATE,
approved_by VARCHAR(100),
FOREIGN KEY (parcel_id) REFERENCES parcels(parcel_id)
);

-- Disputes table
CREATE TABLE Disputes(
dispute_id INT PRIMARY KEY AUTO_INCREMENT,
parcel_id INT,
complaint TEXT,
issue TEXT,
status VARCHAR(200),
resolution_date DATE,
FOREIGN KEY (parcel_id) REFERENCES parcels(parcel_id)
);

-- Community feedback table
CREATE TABLE CommunityFeedback(
feedback_id INT PRIMARY KEY AUTO_INCREMENT,
parcel_id INT,
community_member VARCHAR(200),
feedback TEXT,
date_submitted DATE,
FOREIGN KEY (parcel_id) REFERENCES parcels(parcel_id)
);

-- agencies table
CREATE TABLE agencies(
agency_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(150),
mandate VARCHAR(200),
contact  INT NOT NULL
);

