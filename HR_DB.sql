CREATE DATABASE IF NOT EXISTS `HR_DB` DEFAULT CHARACTER SET utf8;


Use HR_DB;
-- ---
-- Globals
-- ---


-- ---
-- Table 'Employee'
-- 
-- ---

DROP TABLE IF EXISTS `Employee`;
		
CREATE TABLE `Employee` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `Gender` bit NOT NULL DEFAULT 1,
  `DateOfBirth` DATE NOT NULL,
  `JoinedDate` DATE NULL,
  `Address` VARCHAR(1000),
  `Phone` VARCHAR(20),
  `Email` VARCHAR(50),
  `User_Id` INT NOT NULL,
  `Department_Id` INT NOT NULL,
  `JobTitle_Id` INT NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'Department'
-- 
-- ---

DROP TABLE IF EXISTS `Department`;
		
CREATE TABLE `Department` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(1000),
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'JobTitle'
-- 
-- ---

DROP TABLE IF EXISTS `JobTitle`;
		
CREATE TABLE `JobTitle` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(1000),
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'Salary'
-- 
-- ---

-- DROP TABLE IF EXISTS `Salary`;
		
-- CREATE TABLE `Salary` (
--  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
--  PRIMARY KEY (`id`)
-- );

-- ---
-- Table 'Contract'
-- 
-- ---

DROP TABLE IF EXISTS `Contract`;
		
CREATE TABLE `Contract` (
  `Id` INT AUTO_INCREMENT,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE,
  `Salary` DOUBLE NOT NULL,
  `Employee_Id` INT NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'Review'
-- 
-- ---

DROP TABLE IF EXISTS `Review`;
		
CREATE TABLE `Review` (
  `Id` INT AUTO_INCREMENT,
  `FromDate` DATE NOT NULL,
  `ToDate` DATE NOT NULL,
  `DueDate` DATE NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `Employee_Id` INT NOT NULL,
  `Reviewer_Id` INT NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'KPI'
-- 
-- ---

DROP TABLE IF EXISTS `KPI`;
		
CREATE TABLE `KPI` (
  `Id` INT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `MinRating` INT NOT NULL DEFAULT 0,
  `MaxRating` INT NOT NULL,
  `JobTitle_Id` INT NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'Leave'
-- 
-- ---

DROP TABLE IF EXISTS `Leave`;
		
CREATE TABLE `Leave` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `FromDate` DATE NOT NULL,
  `ToDate` DATE NOT NULL,
  `Comment` VARCHAR(1000),
  `Status` VARCHAR(100) NOT NULL,
  `LeaveType_Id` INT NOT NULL,
  `Employee_Id` INT NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'LeaveType'
-- 
-- ---

DROP TABLE IF EXISTS `LeaveType`;
		
CREATE TABLE `LeaveType` (
  `Id` INT AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'User'
-- 
-- ---

DROP TABLE IF EXISTS `User`;
		
CREATE TABLE `User` (
  `Id` INT AUTO_INCREMENT,
  `Username` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `Role_Id` INT NOT NULL,
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'Role'
-- 
-- ---

DROP TABLE IF EXISTS `Role`;
		
CREATE TABLE `Role` (
  `Id` INT AUTO_INCREMENT,
  `RoleName` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(1000),
  PRIMARY KEY (`Id`)
);

-- ---
-- Table 'UserRole'
-- 
-- ---

-- DROP TABLE IF EXISTS `UserRole`;
		
-- CREATE TABLE `UserRole` (
--   `User_id` INT NOT NULL,
--   `Role_Id` INT NOT NULL,
--  PRIMARY KEY (`User_Id`, `Role_Id`)
-- );

-- ---
-- Table 'Review_Rating'
-- 
-- ---

DROP TABLE IF EXISTS `Review_Rating`;
		
CREATE TABLE `Review_Rating` (
  `Id` INT AUTO_INCREMENT,
  `Review_Id` INT NOT NULL,
  `KPI_Id` INT NOT NULL,
  `Rating` INT NOT NULL DEFAULT 0,
  `Reviewer_Comment` VARCHAR(1000),
  PRIMARY KEY (`Id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Employee` ADD FOREIGN KEY (User_Id) REFERENCES `User` (`Id`);
ALTER TABLE `Employee` ADD FOREIGN KEY (Department_Id) REFERENCES `Department` (`Id`);
ALTER TABLE `Employee` ADD FOREIGN KEY (JobTitle_Id) REFERENCES `JobTitle` (`Id`);
ALTER TABLE `Contract` ADD FOREIGN KEY (Employee_Id) REFERENCES `Employee` (`Id`);
ALTER TABLE `Review` ADD FOREIGN KEY (Employee_Id) REFERENCES `Employee` (`Id`);
ALTER TABLE `Review` ADD FOREIGN KEY (Reviewer_Id) REFERENCES `Employee` (`Id`);
ALTER TABLE `KPI` ADD FOREIGN KEY (JobTitle_Id) REFERENCES `JobTitle` (`Id`);
ALTER TABLE `Leave` ADD FOREIGN KEY (LeaveType_Id) REFERENCES `LeaveType` (`Id`);
ALTER TABLE `Leave` ADD FOREIGN KEY (Employee_Id) REFERENCES `Employee` (`Id`);
ALTER TABLE `User` ADD FOREIGN KEY (Role_Id) REFERENCES `Role` (`Id`);
ALTER TABLE `Review_Rating` ADD FOREIGN KEY (Review_Id) REFERENCES `Review` (`Id`);
ALTER TABLE `Review_Rating` ADD FOREIGN KEY (KPI_Id) REFERENCES `KPI` (`Id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Employee` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Department` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `JobTitle` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Salary` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Contract` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Review` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `KPI` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Leave` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `LeaveType` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Role` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `UserRole` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Review_Rating` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Employee` (`id`,`FirstName`,`LastName`,`Gender`,`DateOfBirth`,`JoinedDate`,`Address`,`Phone`,`Email`,`User_Id`,`Department_Id`,`JobTitle_Id`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `Department` (`id`,`Name`,`Description`) VALUES
-- ('','','');
-- INSERT INTO `JobTitle` (`id`,`Name`,`Description`) VALUES
-- ('','','');
-- INSERT INTO `Salary` (`id`) VALUES
-- ('');
-- INSERT INTO `Contract` (`id`,`StartDate`,`EndDate`) VALUES
-- ('','','');
-- INSERT INTO `Review` (`id`,`FromDate`,`ToDate`,`DueDate`,`Status`,`Employee_Id`,`Reviewer_Id`) VALUES
-- ('','','','','','','');
-- INSERT INTO `KPI` (`id`,`Name`,`MinRating`,`MaxRating`,`JobTitle_Id`) VALUES
-- ('','','','','');
-- INSERT INTO `Leave` (`id`,`FromDate`,`ToDate`,`Comment`,`Status`,`LeaveType_Id`,`Employee_Id`) VALUES
-- ('','','','','','','');
-- INSERT INTO `LeaveType` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `User` (`id`,`username`,`password`) VALUES
-- ('','','');
-- INSERT INTO `Role` (`id`,`RoleName`,`Description`) VALUES
-- ('','','');
-- INSERT INTO `UserRole` (`user_id`,`Role_Id`) VALUES
-- ('','');
-- INSERT INTO `Review_Rating` (`id`,`Review_Id`,`KPI_Id`,`Rating`,`Reviewer_Comment`) VALUES
-- ('','','','','');

