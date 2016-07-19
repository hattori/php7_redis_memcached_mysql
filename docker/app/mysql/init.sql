-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sample
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sample` ;

-- -----------------------------------------------------
-- Schema sample
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sample` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sample` ;

-- -----------------------------------------------------
-- Table `sample`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sample`.`users` ;

CREATE TABLE IF NOT EXISTS `sample`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `sample`.`users` (`name` ASC);


LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES (1,'tony',now(),now());
INSERT INTO `users` VALUES (2,'john',now(),now());
INSERT INTO `users` VALUES (3,'chris',now(),now());

UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
