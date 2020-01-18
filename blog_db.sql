-- MySQL Script generated by MySQL Workbench
-- Fri Jan 17 12:24:11 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog_db` DEFAULT CHARACTER SET utf8 ;
USE `blog_db` ;

-- -----------------------------------------------------
-- Table `blog_db`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`role` (
  `id` INT NOT NULL,
  `attribute` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `attribute_UNIQUE` (`attribute` ASC))
ENGINE = InnoDB;

insert into blog_db.role values (0,'Blogger'), (1,'Visitor');

-- -----------------------------------------------------
-- Table `blog_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_user_role_idx` (`role_id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`username` ASC),
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `blog_db`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_db`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`article` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `release_date` DATETIME NOT NULL,
  `content` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_article_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_article_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_db`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`comment` (
  `id` INT NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `blog_db`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_db`.`reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`reply` (
  `id` INT NOT NULL,
  `reply_id` INT NOT NULL,
  `reply_type` TINYINT(1) NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_reply_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_reply_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_db`.`collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`collection` (
  `user_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `article_id`),
  INDEX `fk_user_has_article_article1_idx` (`article_id` ASC),
  INDEX `fk_user_has_article_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_article_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_article_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `blog_db`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `blog_db`.`blogger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`blogger` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `qq` VARCHAR(15) NOT NULL,
  `job` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;

insert into blog_db.blogger values (0,'赖宝光','1205199886','待业','广西-玉林','laibaoguang@outlook.com');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
