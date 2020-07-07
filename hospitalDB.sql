-- CREATE TABLE `user` (
--   `userID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `firstName` varchar(45) NOT NULL,
--   `lastName` varchar(45) NOT NULL,
--   `phoneNumber` int DEFAULT NULL,
--   `address` varchar(45) DEFAULT NULL,
--   `email` varchar(45) DEFAULT NULL,
-- `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (`userID`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;



-- CREATE TABLE `patient` (
--  `patientID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `dateOfBirth` VARCHAR(45) NOT NULL,
--   `diagnosis` VARCHAR(45) DEFAULT NULL,
--   `room` INT UNSIGNED NOT NULL,
--   `userID` int UNSIGNED DEFAULT NULL,
--  `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (patientID),
--   FOREIGN KEY (`userID`) REFERENCES `user`(`userID`) ON DELETE RESTRICT ON 
-- UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;




-- CREATE TABLE `employee` (
--  `employeeID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `salary` INT  DEFAULT NULL,
--   `position` varchar(45) DEFAULT NULL,
--   `userID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (`employeeID`),
--   FOREIGN KEY (`userID`) REFERENCES `user`(`userID`) ON DELETE RESTRICT ON 
-- UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;


--  CREATE TABLE `patientMedicalHistory` (
--   `patientMedicalHistoryID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `patientID` int UNSIGNED NOT NULL,
--   `medications` varchar(100) DEFAULT NULL,
--   `allergies` varchar(100) DEFAULT NULL,
--   `diseases` varchar(100) DEFAULT NULL,
--   `symptoms` varchar(100) DEFAULT NULL,
--   `familyHistory` varchar(100) DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (`patientMedicalHistoryID`),
--   FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE

-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;





-- CREATE TABLE `prescription` (
--   `prescriptionID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `medicationName` varchar(45) DEFAULT NULL,
--   `totalAmount` varchar(45) DEFAULT NULL,
--   `receivedByPatient` boolean DEFAULT FALSE,
--   `prescribedAmount` varchar(45) DEFAULT NULL,
--   `frequency` varchar(45) DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (`prescriptionID`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;

-- CREATE TABLE `note` (
--   `noteID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `detail` VARCHAR(21844)  DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (`noteID`)
--  ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;

-- CREATE TABLE `appointment` (
--   `appointmentID` int UNSIGNED NOT NULL AUTO_INCREMENT,
--   `start_time` varchar(10) DEFAULT NULL,
--   `end_time` varchar(10) DEFAULT NULL,
--   `date`      varchar(10)  DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   PRIMARY KEY (`appointmentID`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;



-- CREATE TABLE `EmployeeOrdersPrescription` (
--   `prescriptionID` INT UNSIGNED DEFAULT NULL,
--   `employeeID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`employeeID`) REFERENCES `employee`(`employeeID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`prescriptionID`) REFERENCES `prescription`(`prescriptionID`) ON DELETE   RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;



-- CREATE TABLE `EmployeeCreateAppointment` (
--   `appointmentID` INT UNSIGNED DEFAULT NULL,
--   `employeeID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`employeeID`) REFERENCES `employee`(`employeeID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`appointmentID`) REFERENCES `appointment`(`appointmentID`) ON DELETE   RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;

-- CREATE TABLE `PatientHasAppointment` (
--   `patientID` INT UNSIGNED DEFAULT NULL,
--   `appointmentID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`appointmentID`) REFERENCES `appointment`(`appointmentID`) ON DELETE   RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;







-- CREATE TABLE `employeeHasPatients` (
--   `patientID`int UNSIGNED DEFAULT NULL,
--   `userID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`userID`) REFERENCES `user`(`userID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;




-- CREATE TABLE `patientsHasNote` (
--   `patientID` int UNSIGNED DEFAULT NULL,
--   `noteID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`noteID`) REFERENCES `note`(`noteID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;


-- CREATE TABLE `employeeWritesNote` (
--   `employeeID` int UNSIGNED DEFAULT NULL,
--   `noteID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`noteID`) REFERENCES `note`(`noteID`) ON DELETE RESTRICT ON
--   UPDATE CASCADE,
--   FOREIGN KEY (`employeeID`) REFERENCES `employee`(`employeeID`) ON DELETE RESTRICT ON UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;


-- CREATE TABLE `PatientHasPrescription` (
--   `patientID` INT UNSIGNED DEFAULT NULL,
--   `prescriptionID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`prescriptionID`) REFERENCES `prescription`(`prescriptionID`) ON DELETE   RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;



-- CREATE TABLE `EmployeeViewsMedicalHistory` (
--   `patientMedicalHistoryID` INT UNSIGNED DEFAULT NULL,
--   `employeeID` int UNSIGNED DEFAULT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`patientMedicalHistoryID`) REFERENCES `patientMedicalHistory`(`patientMedicalHistoryID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`employeeID`) REFERENCES `employee`(`employeeID`) ON DELETE   RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;

-- CREATE TABLE `PatientHasMedicalHistory` (
--   `patientMedicalHistoryID` INT UNSIGNED NOT NULL,
--   `patientID` int UNSIGNED NOT NULL,
--   `CREATED_DATE` date NOT NULL,
--   FOREIGN KEY (`patientMedicalHistoryID`) REFERENCES `patientMedicalHistory`(`patientMedicalHistoryID`) ON DELETE RESTRICT ON 
--   UPDATE CASCADE,
--   FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`) ON DELETE   RESTRICT ON 
--   UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;




