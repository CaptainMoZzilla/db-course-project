CREATE TABLE IF NOT EXISTS `car_agency`.`name` (
  `id` SMALLINT(2) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `car_agency`.`patronymic` (
  `id` SMALLINT(2) NOT NULL AUTO_INCREMENT,
  `patronymic` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `car_agency`.`surname` (
  `id` MEDIUMINT(3) NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `car_agency`.`brand` (
  `id` MEDIUMINT(3) NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NULL,
  `short_brand_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `car_agency`.`model` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `model_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE IF NOT EXISTS `car_agency`.`color` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `color_name` VARCHAR(30) NULL,
  `color_code` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `color_code_UNIQUE` (`color_code` ASC),
  UNIQUE INDEX `color_name_UNIQUE` (`color_name` ASC));


CREATE TABLE IF NOT EXISTS `car_agency`.`driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_id` SMALLINT(2) NULL,
  `surname_id` MEDIUMINT(3) NULL,
  `patronymic_id` SMALLINT(2) NULL,
  `passport_number` VARCHAR(20) NULL,
  `adoption_date` DATETIME NULL,
  `phone_number` INT NULL,
  `driver_license_number` INT(11) NULL,

  PRIMARY KEY (`id`),
  INDEX `fk_name_idx` (`name_id` ASC),
  INDEX `fk_surname_idx` (`surname_id` ASC),
  INDEX `fk_patronymic_idx` (`patronymic_id` ASC),
  CONSTRAINT `fk_name`
    FOREIGN KEY (`name_id`)
    REFERENCES `car_agency`.`name` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_surname`
    FOREIGN KEY (`surname_id`)
    REFERENCES `car_agency`.`surname` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patronymic`
    FOREIGN KEY (`patronymic_id`)
    REFERENCES `car_agency`.`patronymic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `car_agency`.`car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand_id` MEDIUMINT(3) NULL,
  `model_id` MEDIUMINT(9) NULL,
  `color_id` INT NULL,
  `number` VARCHAR(20) NULL,
  `oil_type` ENUM('petrol', 'diesel', 'electro') NULL,
  PRIMARY KEY (`id`),
  INDEX fk_brand_idx (`brand_id` ASC),
  INDEX `fk_model_idx` (`model_id` ASC),
  INDEX `fk_color_idx` (`color_id` ASC),
  CONSTRAINT `fk_brand`
    FOREIGN KEY (`brand_id`)
    REFERENCES `car_agency`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model`
    FOREIGN KEY (`model_id`)
    REFERENCES `car_agency`.`model` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_color`
    FOREIGN KEY (`color_id`)
    REFERENCES `car_agency`.`color` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `car_agency`.`pinned_car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `driver_id` INT NULL,
  `car_id` MEDIUMINT NULL,
  `is_active` TINYINT NULL,
  PRIMARY KEY (`id`));