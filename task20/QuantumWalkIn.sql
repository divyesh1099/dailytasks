-- MySQL Script generated by MySQL Workbench
-- Wed Jul 20 18:37:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema walk_in_schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `walk_in_schema` ;

-- -----------------------------------------------------
-- Schema walk_in_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `walk_in_schema` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `walk_in_schema` ;

-- -----------------------------------------------------
-- Table `applicant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `applicant` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `applicant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(32) NOT NULL,
  `created` DATETIME NULL,
  `updated` DATETIME NULL,
  `phone_number` BIGINT NOT NULL,
  `resume` BLOB NULL,
  `portfolio` VARCHAR(500) NULL,
  `referral` VARCHAR(45) NULL,
  `updates` TINYINT NULL,
  `picture` BLOB NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Applicant is the user that may or may not apply to any walkin.';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `application` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `application` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `applicant_id` INT NOT NULL,
  `walk_in_id` INT NOT NULL,
  `date_id` INT NOT NULL,
  `date_walk_in_id` INT NOT NULL,
  `venue` TEXT(200) NOT NULL,
  `things_to_remember` TEXT(200) NULL,
  PRIMARY KEY (`id`, `date_id`, `date_walk_in_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `college` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `college` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `educational_qualifications_id` INT NOT NULL,
  `educational_qualifications_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `educational_qualifications_id`, `educational_qualifications_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `date` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `date` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `walk_in_id` INT NOT NULL,
  PRIMARY KEY (`id`, `walk_in_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `educational_qualification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `educational_qualification` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `educational_qualification` (
  `id` INT NOT NULL,
  `aggregate_percentage` FLOAT NULL,
  `year_of_passing` INT NULL,
  `applicant_id` INT NOT NULL,
  `college_name` VARCHAR(45) NULL,
  `college_location` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `expertise_technology`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `expertise_technology` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `expertise_technology` (
  `id` INT NOT NULL,
  `professional_qualifications_id` INT NOT NULL,
  `professional_qualifications_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `professional_qualifications_id`, `professional_qualifications_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `familiar_technology`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `familiar_technology` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `familiar_technology` (
  `id` INT NOT NULL,
  `professional_qualifications_id` INT NOT NULL,
  `professional_qualifications_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `professional_qualifications_id`, `professional_qualifications_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `job_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_role` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `job_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `gross_compensation` INT NOT NULL,
  `role_description` TEXT(500) NOT NULL,
  `requirements` TEXT(500) NOT NULL,
  `walk_in_id` INT NOT NULL,
  `application_id` INT NOT NULL,
  PRIMARY KEY (`id`, `walk_in_id`, `application_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `prerequisites_application_process`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prerequisites_application_process` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `prerequisites_application_process` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `general_instructions` TEXT NOT NULL,
  `minimum_system_requirements` TEXT NOT NULL,
  `process` TEXT NOT NULL,
  `walk_in_id` INT NOT NULL,
  PRIMARY KEY (`id`, `walk_in_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `professional_qualification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `professional_qualification` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `professional_qualification` (
  `id` INT NOT NULL,
  `professional_qualificationscol` VARCHAR(45) NULL,
  `applicant_id` INT NOT NULL,
  `years_of_experience` INT NULL,
  `current_ctc` BIGINT NULL,
  `expected_ctc` BIGINT NULL,
  `expertise_technologies` VARCHAR(45) NULL,
  `notice_period` TINYINT NULL,
  `length_of_notice_period` DATE NULL,
  `past_appearances` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `qualification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qualification` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `qualification` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `educational_qualification_id` INT NOT NULL,
  `educational_qualification_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `educational_qualification_id`, `educational_qualification_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `special_opportunities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `special_opportunities` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `special_opportunities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `walk_in_id` INT NOT NULL,
  PRIMARY KEY (`id`, `walk_in_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stream`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stream` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `stream` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `educational_qualification_id` INT NOT NULL,
  `educational_qualification_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `educational_qualification_id`, `educational_qualification_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `technology`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `technology` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `technology` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `expertise_technologies_id` INT NOT NULL,
  `familiar_technologies_id` INT NOT NULL,
  `familiar_technologies_professional_qualifications_id` INT NOT NULL,
  `familiar_technologies_professional_qualifications_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `expertise_technologies_id`, `familiar_technologies_id`, `familiar_technologies_professional_qualifications_id`, `familiar_technologies_professional_qualifications_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `time_slot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `time_slot` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `time_slot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `walk_in_id` INT NOT NULL,
  PRIMARY KEY (`id`, `walk_in_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `type` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `professional_qualifications_id` INT NOT NULL,
  `professional_qualifications_applicant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `professional_qualifications_id`, `professional_qualifications_applicant_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `walk_in`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `walk_in` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `walk_in` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `upload_resume` BLOB(1) NULL,
  `expiry_date` DATE NULL,
  `date_created` DATE NULL,
  `location` VARCHAR(45) NULL,
  `guId` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `title_UNIQUE` ON `walk_in` (`title` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
