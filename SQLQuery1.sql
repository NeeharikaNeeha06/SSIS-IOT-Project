create database SSIS

use SSIS

-- Create the Sensors table
CREATE TABLE Sensors (
    SensorID INT PRIMARY KEY IDENTITY(1,1),  -- Auto-incremented Sensor ID
    SensorName VARCHAR(50) NOT NULL,         -- Name of the sensor
    SensorType VARCHAR(50) NOT NULL,         -- Type of the sensor (e.g., Temperature, Humidity)
    Location VARCHAR(100),                   -- Location of the sensor
    InstallationDate DATETIME,               -- Date of installation
    Status VARCHAR(20) DEFAULT 'Active'      -- Status of the sensor (e.g., Active, Inactive)
);

-- Insert sample data into Sensors table
INSERT INTO Sensors (SensorName, SensorType, Location, InstallationDate, Status)
VALUES 
('Temperature Sensor A', 'Temperature', 'Warehouse 1', '2024-01-15 09:00:00', 'Active'),
('Humidity Sensor B', 'Humidity', 'Warehouse 2', '2024-02-20 10:30:00', 'Active'),
('Temperature Sensor C', 'Temperature', 'Warehouse 3', '2024-03-05 11:00:00', 'Inactive'),
('Pressure Sensor D', 'Pressure', 'Warehouse 4', '2024-04-10 14:15:00', 'Active');

-- Create the SensorReadings table
CREATE TABLE SensorReadings (
    ReadingID INT PRIMARY KEY IDENTITY(1,1), -- Auto-incremented Reading ID
    SensorID INT,                            -- Foreign key referencing the SensorID in the Sensors table
    ReadingDate DATETIME NOT NULL,           -- Date and time of the reading
    ReadingValue FLOAT NOT NULL,             -- Value of the reading (e.g., temperature in °C)
    Unit VARCHAR(10) NOT NULL,               -- Unit of the reading (e.g., °C, % for humidity)
    FOREIGN KEY (SensorID) REFERENCES Sensors(SensorID) -- Define foreign key relationship
);

-- Insert sample data into SensorReadings table
INSERT INTO SensorReadings (SensorID, ReadingDate, ReadingValue, Unit)
VALUES
(1, '2024-09-01 08:00:00', 22.5, '°C'),
(1, '2024-09-01 09:00:00', 23.0, '°C'),
(2, '2024-09-01 08:00:00', 55.0, '%'),
(2, '2024-09-01 09:00:00', 54.8, '%'),
(3, '2024-09-01 08:00:00', 21.2, '°C'),
(3, '2024-09-01 09:00:00', 22.1, '°C'),
(4, '2024-09-01 08:00:00', 1013.0, 'hPa'),
(4, '2024-09-01 09:00:00', 1012.5, 'hPa');
