

use SSIS

-- Create the ForestSensors table
CREATE TABLE ForestSensors (
    SensorID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for the sensor
    SensorName VARCHAR(100) NOT NULL,        -- Name of the sensor
    SensorType VARCHAR(50) NOT NULL,         -- Type of sensor (e.g., Temperature, Humidity, Motion)
    Location VARCHAR(255),                   -- Location of the sensor in the forest
    InstallationDate DATE,                   -- Date when the sensor was installed
    Status VARCHAR(50) DEFAULT 'Active'      -- Current status of the sensor (e.g., Active, Inactive)
);

-- Insert example data into the ForestSensors table
INSERT INTO ForestSensors (SensorName, SensorType, Location, InstallationDate, Status)
VALUES
('Temperature Sensor 1', 'Temperature', 'Zone A - North', '2024-08-01', 'Active'),
('Humidity Sensor 1', 'Humidity', 'Zone A - South', '2024-08-01', 'Active'),
('Motion Sensor 1', 'Motion', 'Zone B - East', '2024-08-10', 'Active'),
('Wildlife Tracking Sensor 1', 'Tracking', 'Zone C - West', '2024-08-15', 'Inactive');


-- Create the ForestSensorReadings table
CREATE TABLE ForestSensorReadings (
    ReadingID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each reading
    SensorID INT,                             -- Foreign key referencing the ForestSensors table
    ReadingTimestamp DATETIME DEFAULT GETDATE(), -- Timestamp of the sensor reading
    ReadingValue FLOAT,                       -- The actual sensor reading value (e.g., temperature in Celsius)
    ReadingUnit VARCHAR(20),                  -- Unit of measurement (e.g., Celsius, Percentage)
    FOREIGN KEY (SensorID) REFERENCES ForestSensors(SensorID)  -- Foreign key constraint
);

-- Insert example data into the ForestSensorReadings table
INSERT INTO ForestSensorReadings (SensorID, ReadingTimestamp, ReadingValue, ReadingUnit)
VALUES
(1, GETDATE(), 22.5, 'Celsius'),
(2, GETDATE(), 65.4, 'Percentage'),
(3, GETDATE(), NULL, NULL),  -- No reading available for this sensor
(4, GETDATE(), 1, 'Presence');  -- Wildlife presence detected

-- Create the ForestSensorMaintenance table
CREATE TABLE ForestSensorMaintenance (
    MaintenanceID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for the maintenance record
    SensorID INT,                                -- Foreign key referencing the ForestSensors table
    MaintenanceDate DATE,                        -- Date when the maintenance was performed
    MaintenanceType VARCHAR(100),                -- Type of maintenance (e.g., Calibration, Replacement)
    PerformedBy VARCHAR(100),                    -- Person or team who performed the maintenance
    Comments VARCHAR(255),                       -- Additional notes on the maintenance
    FOREIGN KEY (SensorID) REFERENCES ForestSensors(SensorID)  -- Foreign key constraint
);

-- No data is inserted initially, table is empty
