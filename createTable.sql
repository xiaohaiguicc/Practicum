-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema title
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema title
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `title` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `title` ;

-- -----------------------------------------------------
-- Table `title`.`name_basic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`name_basic` ;

CREATE TABLE IF NOT EXISTS `title`.`name_basic` (
  `nconst` VARCHAR(45) NOT NULL,
  `primaryName` VARCHAR(45) NULL DEFAULT NULL,
  `birthYear` SMALLINT NULL DEFAULT NULL,
  `deadYear` SMALLINT NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  `numMovies` INT NULL DEFAULT NULL,
  PRIMARY KEY (`nconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`director` ;

CREATE TABLE IF NOT EXISTS `title`.`director` (
  `nconst` VARCHAR(45) NOT NULL,
  `primaryName` VARCHAR(200) NULL DEFAULT NULL,
  `birthYear` SMALLINT NULL DEFAULT NULL,
  `deathYear` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`nconst`),
  CONSTRAINT `name_d_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`name_basic` (`nconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`genre` ;

CREATE TABLE IF NOT EXISTS `title`.`genre` (
  `genreId` INT NOT NULL,
  `genre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`genreId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`primaryProfession`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`primaryProfession` ;

CREATE TABLE IF NOT EXISTS `title`.`primaryProfession` (
  `primaryProfessionId` INT NOT NULL,
  `primaryProfession` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`primaryProfessionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`name_basic_primaryProfession`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`name_basic_primaryProfession` ;

CREATE TABLE IF NOT EXISTS `title`.`name_basic_primaryProfession` (
  `namePrimaryProfessionId` INT NOT NULL,
  `nconst` VARCHAR(45) NULL DEFAULT NULL,
  `primaryProfessionId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`namePrimaryProfessionId`),
  INDEX `name_pri_pk_idx` (`nconst` ASC) VISIBLE,
  INDEX `pri_pk_idx` (`primaryProfessionId` ASC) VISIBLE,
  CONSTRAINT `name_pri_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`name_basic` (`nconst`),
  CONSTRAINT `pri_pk`
    FOREIGN KEY (`primaryProfessionId`)
    REFERENCES `title`.`primaryProfession` (`primaryProfessionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_basic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_basic` ;

CREATE TABLE IF NOT EXISTS `title`.`title_basic` (
  `tconst` VARCHAR(45) NOT NULL,
  `titleType` VARCHAR(45) NULL DEFAULT NULL,
  `primaryTitle` VARCHAR(200) NULL DEFAULT NULL,
  `originalTitle` VARCHAR(200) NULL DEFAULT NULL,
  `isAdult` TINYINT NULL DEFAULT NULL,
  `startYear` SMALLINT NULL DEFAULT NULL,
  `endYear` SMALLINT NULL DEFAULT NULL,
  `runTimeMinutes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_akas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_akas` ;

CREATE TABLE IF NOT EXISTS `title`.`title_akas` (
  `titleId` VARCHAR(45) NOT NULL,
  `ordering` INT NOT NULL,
  `title` VARCHAR(200) NULL DEFAULT NULL,
  `region` VARCHAR(45) NULL DEFAULT NULL,
  `language` VARCHAR(45) NULL DEFAULT NULL,
  `types` VARCHAR(200) NULL DEFAULT NULL,
  `attributes` VARCHAR(200) NULL DEFAULT NULL,
  `isOriginalTitle` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`titleId`, `ordering`),
  CONSTRAINT `akas_pk`
    FOREIGN KEY (`titleId`)
    REFERENCES `title`.`title_basic` (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`principal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`principal` ;

CREATE TABLE IF NOT EXISTS `title`.`principal` (
  `tconst` VARCHAR(45) NOT NULL,
  `ordering` INT NOT NULL,
  `nconst` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(200) NULL DEFAULT NULL,
  `job` VARCHAR(200) NULL DEFAULT NULL,
  `characters` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`tconst`, `ordering`),
  INDEX `principal_name_pk_idx` (`nconst` ASC) VISIBLE,
  CONSTRAINT `akas_principal_pk`
    FOREIGN KEY (`tconst` , `ordering`)
    REFERENCES `title`.`title_akas` (`titleId` , `ordering`),
  CONSTRAINT `principal_name_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`name_basic` (`nconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_crew`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_crew` ;

CREATE TABLE IF NOT EXISTS `title`.`title_crew` (
  `tconst` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_director` ;

CREATE TABLE IF NOT EXISTS `title`.`title_director` (
  `directorId` INT NOT NULL,
  `tconst` VARCHAR(45) NULL DEFAULT NULL,
  `nconst` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`directorId`),
  INDEX `director_pk_idx` (`nconst` ASC) VISIBLE,
  INDEX `title_director_pk_idx` (`tconst` ASC) VISIBLE,
  CONSTRAINT `director_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`director` (`nconst`),
  CONSTRAINT `title_director_pk`
    FOREIGN KEY (`tconst`)
    REFERENCES `title`.`title_crew` (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_rating` ;

CREATE TABLE IF NOT EXISTS `title`.`title_rating` (
  `tconst` VARCHAR(45) NOT NULL,
  `averageRating` DOUBLE NULL DEFAULT NULL,
  `numVotes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_episode` ;

CREATE TABLE IF NOT EXISTS `title`.`title_episode` (
  `tconst` VARCHAR(45) NOT NULL,
  `parentTconst` VARCHAR(45) NULL DEFAULT NULL,
  `seasonNumber` INT NULL DEFAULT NULL,
  `episodeNumber` INT NULL DEFAULT NULL,
  PRIMARY KEY (`tconst`),
  CONSTRAINT `episode_basic_pk`
    FOREIGN KEY (`tconst`)
    REFERENCES `title`.`title_basic` (`tconst`),
  CONSTRAINT `episode_rating+pk`
    FOREIGN KEY (`tconst`)
    REFERENCES `title`.`title_rating` (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_genre` ;

CREATE TABLE IF NOT EXISTS `title`.`title_genre` (
  `titleGenreId` INT NOT NULL,
  `tconst` VARCHAR(45) NULL DEFAULT NULL,
  `genreId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`titleGenreId`),
  INDEX `title_genre_pk_idx` (`tconst` ASC) VISIBLE,
  INDEX `genre_pk_idx` (`genreId` ASC) VISIBLE,
  CONSTRAINT `genre_pk`
    FOREIGN KEY (`genreId`)
    REFERENCES `title`.`genre` (`genreId`),
  CONSTRAINT `title_genre_pk`
    FOREIGN KEY (`tconst`)
    REFERENCES `title`.`title_basic` (`tconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_name`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_name` ;

CREATE TABLE IF NOT EXISTS `title`.`title_name` (
  `titleNameId` INT NOT NULL,
  `tconst` VARCHAR(45) NULL DEFAULT NULL,
  `nconst` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`titleNameId`),
  INDEX `basic_pk_idx` (`tconst` ASC) VISIBLE,
  INDEX `name_pk_idx` (`nconst` ASC) VISIBLE,
  CONSTRAINT `basic_pk`
    FOREIGN KEY (`tconst`)
    REFERENCES `title`.`title_basic` (`tconst`),
  CONSTRAINT `name_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`name_basic` (`nconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`writer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`writer` ;

CREATE TABLE IF NOT EXISTS `title`.`writer` (
  `nconst` VARCHAR(45) NOT NULL,
  `primaryName` VARCHAR(45) NULL DEFAULT NULL,
  `birthYear` SMALLINT NULL DEFAULT NULL,
  `endYear` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`nconst`),
  CONSTRAINT `name_w_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`name_basic` (`nconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `title`.`title_writer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `title`.`title_writer` ;

CREATE TABLE IF NOT EXISTS `title`.`title_writer` (
  `writerId` INT NOT NULL,
  `tconst` VARCHAR(45) NULL DEFAULT NULL,
  `nconst` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`writerId`),
  INDEX `join_writer_pk_idx` (`nconst` ASC) VISIBLE,
  INDEX `join_writer_idx` (`nconst` ASC) VISIBLE,
  INDEX `title_writer_pk_idx` (`tconst` ASC) VISIBLE,
  CONSTRAINT `title_writer_pk`
    FOREIGN KEY (`tconst`)
    REFERENCES `title`.`title_crew` (`tconst`),
  CONSTRAINT `writer_pk`
    FOREIGN KEY (`nconst`)
    REFERENCES `title`.`writer` (`nconst`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
