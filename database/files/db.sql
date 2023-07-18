-- MySQL Script generated by MySQL Workbench
-- Tue Jul 18 16:39:27 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
    'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ax_blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ax_blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ax_blog` DEFAULT CHARACTER SET utf8;
USE `ax_blog`;

-- -----------------------------------------------------
-- Table `ax_blog`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`user`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`user`
(
    `id`                   INT UNSIGNED     NOT NULL AUTO_INCREMENT,
    `first_name`           VARCHAR(255)     NOT NULL DEFAULT 'Undefined',
    `last_name`            VARCHAR(255)     NOT NULL DEFAULT 'Undefined',
    `patronymic`           VARCHAR(255)     NULL     DEFAULT NULL,
    `phone`                VARCHAR(255)     NULL     DEFAULT NULL,
    `email`                VARCHAR(255)     NULL     DEFAULT NULL,
    `is_email`             TINYINT UNSIGNED NULL     DEFAULT 0,
    `is_phone`             TINYINT UNSIGNED NULL     DEFAULT 0,
    `status`               SMALLINT         NOT NULL DEFAULT 0,
    `avatar`               VARCHAR(255)     NULL     DEFAULT NULL,
    `password_hash`        VARCHAR(255)     NOT NULL,
    `remember_token`       VARCHAR(500)     NULL     DEFAULT NULL,
    `auth_key`             VARCHAR(32)      NULL     DEFAULT NULL,
    `password_reset_token` VARCHAR(255)     NULL     DEFAULT NULL,
    `created_at`           INT UNSIGNED     NULL     DEFAULT NULL,
    `updated_at`           INT UNSIGNED     NULL     DEFAULT NULL,
    `deleted_at`           INT UNSIGNED     NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `email` (`email` ASC),
    UNIQUE INDEX `password_reset_token` (`password_reset_token` ASC),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
    INDEX `first_name` (`first_name` ASC),
    INDEX `last_name` (`last_name` ASC)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`render`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`render`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`render`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title`      VARCHAR(255) NOT NULL,
    `name`       VARCHAR(45)  NOT NULL,
    `resource`   VARCHAR(255) NULL DEFAULT NULL,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`post_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`post_category`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`post_category`
(
    `id`                  INT UNSIGNED     NOT NULL AUTO_INCREMENT,
    `render_id`           INT UNSIGNED     NULL,
    `post_category_id`    INT UNSIGNED     NULL,
    `is_published`        TINYINT UNSIGNED NULL DEFAULT 1,
    `is_favourites`       TINYINT UNSIGNED NULL DEFAULT 0,
    `is_watermark`        TINYINT          NULL DEFAULT 1,
    `image`               VARCHAR(255)     NULL DEFAULT NULL,
    `show_image`          TINYINT          NULL DEFAULT 1,
    `title`               VARCHAR(255)     NOT NULL,
    `title_short`         VARCHAR(150)     NULL DEFAULT NULL,
    `description`         TEXT             NULL DEFAULT NULL,
    `preview_description` TEXT             NULL DEFAULT NULL,
    `sort`                TINYINT UNSIGNED NULL DEFAULT 0,
    `created_at`          INT UNSIGNED     NULL DEFAULT NULL,
    `updated_at`          INT UNSIGNED     NULL DEFAULT NULL,
    `deleted_at`          INT UNSIGNED     NULL DEFAULT NULL,
    `alias`               VARCHAR(255)     NULL DEFAULT NULL,
    `url`                 VARCHAR(255)     NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `title` (`title` ASC),
    INDEX `fk_post_category_render1_idx` (`render_id` ASC),
    INDEX `fk_post_category_post_category1_idx` (`post_category_id` ASC),
    CONSTRAINT `fk_post_category_render1`
        FOREIGN KEY (`render_id`)
            REFERENCES `ax_blog`.`render` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_post_category_post_category1`
        FOREIGN KEY (`post_category_id`)
            REFERENCES `ax_blog`.`post_category` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`post`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`post`
(
    `id`                  INT UNSIGNED         NOT NULL AUTO_INCREMENT,
    `render_id`           INT UNSIGNED         NULL,
    `post_category_id`    INT UNSIGNED         NULL,
    `is_published`        TINYINT UNSIGNED     NULL DEFAULT 1,
    `is_favourites`       TINYINT UNSIGNED     NULL DEFAULT 0,
    `is_comments`         TINYINT UNSIGNED     NULL DEFAULT 0,
    `is_image_post`       TINYINT UNSIGNED     NULL DEFAULT 1,
    `is_image_category`   TINYINT UNSIGNED     NULL DEFAULT 1,
    `is_watermark`        TINYINT UNSIGNED     NULL DEFAULT 1,
    `media`               VARCHAR(255)         NULL DEFAULT NULL,
    `title`               VARCHAR(255)         NOT NULL,
    `title_short`         VARCHAR(155)         NULL DEFAULT NULL,
    `preview_description` TEXT                 NULL DEFAULT NULL,
    `description`         TEXT                 NULL DEFAULT NULL,
    `show_date`           TINYINT              NULL DEFAULT 1,
    `date_pub`            INT                  NULL DEFAULT 0,
    `date_end`            INT                  NULL DEFAULT 0,
    `control_date_pub`    TINYINT              NULL DEFAULT 0,
    `control_date_end`    TINYINT              NULL DEFAULT 0,
    `image`               VARCHAR(255)         NULL DEFAULT NULL,
    `hits`                INT UNSIGNED         NULL DEFAULT 0,
    `sort`                INT                  NULL DEFAULT 0,
    `stars`               FLOAT(1, 1) UNSIGNED NULL DEFAULT 0.0,
    `created_at`          INT UNSIGNED         NULL DEFAULT NULL,
    `updated_at`          INT UNSIGNED         NULL DEFAULT NULL,
    `deleted_at`          INT UNSIGNED         NULL DEFAULT NULL,
    `alias`               VARCHAR(255)         NULL DEFAULT NULL,
    `url`                 VARCHAR(255)         NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `title` (`title` ASC),
    INDEX `fk_post_render1_idx` (`render_id` ASC),
    INDEX `fk_post_post_category1_idx` (`post_category_id` ASC),
    CONSTRAINT `fk_post_render1`
        FOREIGN KEY (`render_id`)
            REFERENCES `ax_blog`.`render` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_post_post_category1`
        FOREIGN KEY (`post_category_id`)
            REFERENCES `ax_blog`.`post_category` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`comment`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`comment`
(
    `id`          INT UNSIGNED      NOT NULL AUTO_INCREMENT,
    `comment_id`  INT UNSIGNED      NULL,
    `resource`    VARCHAR(255)      NOT NULL,
    `resource_id` INT UNSIGNED      NOT NULL,
    `person`      VARCHAR(255)      NOT NULL,
    `person_id`   INT               NOT NULL,
    `status`      TINYINT UNSIGNED  NULL     DEFAULT 0,
    `is_viewed`   TINYINT           NULL     DEFAULT 0,
    `level`       SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    `path`        VARCHAR(500)      NULL     DEFAULT NULL,
    `text`        TEXT              NOT NULL,
    `created_at`  INT UNSIGNED      NULL     DEFAULT NULL,
    `updated_at`  INT UNSIGNED      NULL     DEFAULT NULL,
    `deleted_at`  INT UNSIGNED      NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `resource` (`resource` ASC),
    INDEX `resource_id` (`resource_id` ASC),
    INDEX `person` (`person` ASC),
    INDEX `person_id` (`person_id` ASC),
    INDEX `path` (`path` ASC),
    INDEX `fk_comment_comment1_idx` (`comment_id` ASC),
    CONSTRAINT `fk_comment_comment1`
        FOREIGN KEY (`comment_id`)
            REFERENCES `ax_blog`.`comment` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`tag`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`tag`
(
    `id`              INT UNSIGNED     NOT NULL AUTO_INCREMENT,
    `is_sitemap`      TINYINT          NULL DEFAULT 1,
    `is_published`    TINYINT UNSIGNED NULL DEFAULT 1,
    `is_favourites`   TINYINT UNSIGNED NULL DEFAULT 0,
    `is_watermark`    TINYINT          NULL DEFAULT 1,
    `image`           VARCHAR(255)     NULL DEFAULT NULL,
    `show_image`      TINYINT          NULL DEFAULT 1,
    `title`           VARCHAR(255)     NOT NULL,
    `title_short`     VARCHAR(150)     NULL DEFAULT NULL,
    `description`     TEXT             NULL DEFAULT NULL,
    `title_seo`       VARCHAR(255)     NULL DEFAULT NULL,
    `description_seo` VARCHAR(255)     NULL DEFAULT NULL,
    `sort`            TINYINT UNSIGNED NULL DEFAULT 0,
    `created_at`      INT UNSIGNED     NULL DEFAULT NULL,
    `updated_at`      INT UNSIGNED     NULL DEFAULT NULL,
    `deleted_at`      INT UNSIGNED     NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `title_UNIQUE` (`title` ASC)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`gallery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`gallery`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`gallery`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title`       VARCHAR(255) NULL DEFAULT NULL,
    `description` TEXT         NULL DEFAULT NULL,
    `sort`        INT          NULL DEFAULT 0,
    `image`       VARCHAR(500) NULL DEFAULT NULL,
    `url`         VARCHAR(255) NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`gallery_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`gallery_image`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`gallery_image`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `gallery_id`  INT UNSIGNED NULL,
    `image`       VARCHAR(255) NOT NULL,
    `title`       VARCHAR(255) NULL DEFAULT NULL,
    `description` TEXT         NULL DEFAULT NULL,
    `sort`        INT          NULL DEFAULT 0,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `href_UNIQUE` (`image` ASC),
    INDEX `fk_gallery_image_gallery1_idx` (`gallery_id` ASC),
    CONSTRAINT `fk_gallery_image_gallery1`
        FOREIGN KEY (`gallery_id`)
            REFERENCES `ax_blog`.`gallery` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`tag_has_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`tag_has_resource`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`tag_has_resource`
(
    `tag_id`      INT UNSIGNED NOT NULL,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`tag_id`),
    CONSTRAINT `fk_tag_has_resource_tag1`
        FOREIGN KEY (`tag_id`)
            REFERENCES `ax_blog`.`tag` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`menu`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`menu`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title`       VARCHAR(255) NOT NULL,
    `name`        VARCHAR(45)  NOT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `title_UNIQUE` (`title` ASC),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`menu_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`menu_item`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`menu_item`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `menu_id`      INT UNSIGNED NOT NULL,
    `menu_item_id` INT UNSIGNED NOT NULL,
    `resource`     VARCHAR(255) NULL DEFAULT NULL,
    `resource_id`  INT UNSIGNED NULL DEFAULT NULL,
    `title`        VARCHAR(255) NOT NULL,
    `sort`         INT          NULL DEFAULT 0,
    `url`          VARCHAR(255) NOT NULL,
    `created_at`   INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`   INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`   INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `fk_menu_item_menu1_idx` (`menu_id` ASC),
    INDEX `fk_menu_item_menu_item1_idx` (`menu_item_id` ASC),
    CONSTRAINT `fk_menu_item_menu1`
        FOREIGN KEY (`menu_id`)
            REFERENCES `ax_blog`.`menu` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_menu_item_menu_item1`
        FOREIGN KEY (`menu_item_id`)
            REFERENCES `ax_blog`.`menu_item` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`setting`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`setting`
(
    `id`           INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    `key`          VARCHAR(45)   NOT NULL,
    `title`        VARCHAR(100)  NOT NULL,
    `description`  TEXT          NULL DEFAULT NULL,
    `value_string` VARCHAR(1000) NULL DEFAULT NULL,
    `value_text`   LONGTEXT      NULL DEFAULT NULL,
    `value_json`   TEXT          NULL DEFAULT NULL,
    `value_bool`   SMALLINT      NULL DEFAULT 0,
    `created_at`   INT UNSIGNED  NOT NULL,
    `updated_at`   INT UNSIGNED  NOT NULL,
    `deleted_at`   INT UNSIGNED  NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `key_UNIQUE` (`key` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`user_guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`user_guest`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`user_guest`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email`      VARCHAR(255) NOT NULL,
    `name`       VARCHAR(255) NULL DEFAULT NULL,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`letter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`letter`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`letter`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `person`      VARCHAR(255) NOT NULL,
    `person_id`   INT          NOT NULL,
    `subject`     VARCHAR(255) NULL DEFAULT NULL,
    `text`        TEXT         NULL DEFAULT NULL,
    `is_viewed`   TINYINT      NULL DEFAULT 0,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`ips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`ips`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`ips`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ip`         VARCHAR(255) NOT NULL,
    `status`     TINYINT      NULL DEFAULT 1,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `ip_UNIQUE` (`ip` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`history`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`history`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ips_id`      INT UNSIGNED NULL,
    `user_id`     INT UNSIGNED NULL,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `event`       VARCHAR(255) NOT NULL DEFAULT 'created',
    `body`        TEXT         NULL     DEFAULT NULL,
    `description` TEXT         NULL     DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL     DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL     DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL     DEFAULT NULL,
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    PRIMARY KEY (`id`),
    INDEX `fk_history_ips1_idx` (`ips_id` ASC),
    INDEX `fk_history_user1_idx` (`user_id` ASC),
    CONSTRAINT `fk_history_ips1`
        FOREIGN KEY (`ips_id`)
            REFERENCES `ax_blog`.`ips` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_history_user1`
        FOREIGN KEY (`user_id`)
            REFERENCES `ax_blog`.`user` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`redirect`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`redirect`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`redirect`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `url`        VARCHAR(500) NOT NULL,
    `url_old`    VARCHAR(500) NOT NULL,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`menu_has_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`menu_has_resource`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`menu_has_resource`
(
    `menu_id`     INT UNSIGNED NOT NULL,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    INDEX `fk_menu_has_resource_menu1_idx` (`menu_id` ASC),
    CONSTRAINT `fk_menu_has_resource_menu1`
        FOREIGN KEY (`menu_id`)
            REFERENCES `ax_blog`.`menu` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`user_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`user_token`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`user_token`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id`    INT UNSIGNED NULL,
    `type`       VARCHAR(45)  NOT NULL,
    `token`      VARCHAR(300) NOT NULL,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    `expired_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `value_UNIQUE` (`token` ASC),
    INDEX `fk_user_token_user1_idx` (`user_id` ASC),
    CONSTRAINT `fk_user_token_user1`
        FOREIGN KEY (`user_id`)
            REFERENCES `ax_blog`.`user` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`gallery_has_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`gallery_has_resource`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`gallery_has_resource`
(
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `gallery_id`  INT UNSIGNED NOT NULL,
    PRIMARY KEY (`resource`, `resource_id`, `gallery_id`),
    INDEX `fk_gallery_has_resource_gallery1_idx` (`gallery_id` ASC),
    CONSTRAINT `fk_gallery_has_resource_gallery1`
        FOREIGN KEY (`gallery_id`)
            REFERENCES `ax_blog`.`gallery` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`phone`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`phone`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `number`     VARCHAR(45)  NOT NULL,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `number_UNIQUE` (`number` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`phone_has_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`phone_has_resource`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`phone_has_resource`
(
    `phone_id`    INT UNSIGNED NOT NULL,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`phone_id`),
    INDEX `fk_phone_has_resource_phone1_idx` (`phone_id` ASC),
    CONSTRAINT `fk_phone_has_resource_phone1`
        FOREIGN KEY (`phone_id`)
            REFERENCES `ax_blog`.`phone` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`migrations`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`migrations`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(255) NOT NULL,
    `batch`     INT          NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`currency`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`currency`
(
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `global_id`  VARCHAR(50)  NOT NULL,
    `num_code`   INT          NOT NULL,
    `char_code`  VARCHAR(45)  NOT NULL,
    `title`      VARCHAR(500) NOT NULL,
    `created_at` INT UNSIGNED NULL DEFAULT NULL,
    `updated_at` INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at` INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `num_code_UNIQUE` (`num_code` ASC),
    UNIQUE INDEX `char_code_UNIQUE` (`char_code` ASC),
    UNIQUE INDEX `global_id_UNIQUE` (`global_id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`currency_exchange_rate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`currency_exchange_rate`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`currency_exchange_rate`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `currency_id` INT UNSIGNED NOT NULL,
    `value`       DECIMAL      NOT NULL,
    `date_rate`   INT UNSIGNED NOT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`, `currency_id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `fk_currency_exchange_rate_currency1_idx` (`currency_id` ASC),
    CONSTRAINT `fk_currency_exchange_rate_currency1`
        FOREIGN KEY (`currency_id`)
            REFERENCES `ax_blog`.`currency` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`page`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`page`
(
    `id`            INT UNSIGNED     NOT NULL AUTO_INCREMENT,
    `render_id`     INT UNSIGNED     NULL,
    `is_published`  TINYINT UNSIGNED NULL DEFAULT 1,
    `is_favourites` TINYINT UNSIGNED NULL DEFAULT 0,
    `is_comments`   TINYINT UNSIGNED NULL DEFAULT 0,
    `is_watermark`  TINYINT UNSIGNED NULL DEFAULT 1,
    `title`         VARCHAR(255)     NOT NULL,
    `title_short`   VARCHAR(155)     NULL DEFAULT NULL,
    `description`   TEXT             NULL DEFAULT NULL,
    `image`         VARCHAR(255)     NULL DEFAULT NULL,
    `media`         VARCHAR(255)     NULL DEFAULT NULL,
    `hits`          INT UNSIGNED     NULL DEFAULT 0,
    `sort`          INT              NULL DEFAULT 0,
    `created_at`    INT UNSIGNED     NULL DEFAULT NULL,
    `updated_at`    INT UNSIGNED     NULL DEFAULT NULL,
    `deleted_at`    INT UNSIGNED     NULL DEFAULT NULL,
    `alias`         VARCHAR(255)     NOT NULL,
    `url`           VARCHAR(255)     NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `title` (`title` ASC),
    INDEX `fk_page_render1_idx` (`render_id` ASC),
    CONSTRAINT `fk_page_render1`
        FOREIGN KEY (`render_id`)
            REFERENCES `ax_blog`.`render` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ax_blog`.`user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`user_profile`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`user_profile`
(
    `id`                       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `catalog_delivery_type_id` INT UNSIGNED NULL DEFAULT NULL,
    `catalog_payment_type_id`  INT UNSIGNED NULL DEFAULT NULL,
    `title`                    VARCHAR(255) NOT NULL,
    `description`              TEXT         NULL DEFAULT NULL,
    `image`                    VARCHAR(255) NULL DEFAULT NULL,
    `created_at`               INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`               INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`               INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`address`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`address`
(
    `id`          INT UNSIGNED      NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255)      NOT NULL,
    `resource_id` INT UNSIGNED      NOT NULL,
    `type`        SMALLINT UNSIGNED NOT NULL,
    `is_delivery` TINYINT UNSIGNED  NULL DEFAULT 0,
    `address`     VARCHAR(1000)     NULL DEFAULT NULL,
    `index`       INT               NULL DEFAULT NULL,
    `country`     VARCHAR(255)      NULL DEFAULT NULL,
    `region`      VARCHAR(255)      NULL DEFAULT NULL,
    `city`        VARCHAR(255)      NULL DEFAULT NULL,
    `street`      VARCHAR(255)      NULL DEFAULT NULL,
    `house`       VARCHAR(255)      NULL DEFAULT NULL,
    `apartment`   VARCHAR(255)      NULL DEFAULT NULL,
    `description` TEXT              NULL DEFAULT NULL,
    `image`       VARCHAR(255)      NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED      NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED      NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED      NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`favorites`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`favorites`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `description` TEXT         NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`seo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`seo`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`seo`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `title`       VARCHAR(255) NULL DEFAULT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`page_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`page_setting`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`page_setting`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `script`      LONGTEXT     NULL DEFAULT NULL,
    `css`         LONGTEXT     NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`logger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`logger`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`logger`
(
    `id`           INT UNSIGNED     NOT NULL AUTO_INCREMENT,
    `user_id`      INT UNSIGNED     NULL,
    `ips_id`       INT UNSIGNED     NULL,
    `uuid`         VARCHAR(50)      NOT NULL,
    `channel`      VARCHAR(50)      NOT NULL,
    `level`        VARCHAR(50)      NOT NULL,
    `title`        VARCHAR(500)     NOT NULL,
    `body`         TEXT             NULL DEFAULT NULL,
    `created_at`   DECIMAL UNSIGNED NOT NULL,
    `created_date` VARCHAR(45)      NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `fk_logger_user1_idx` (`user_id` ASC),
    INDEX `fk_logger_ips1_idx` (`ips_id` ASC),
    CONSTRAINT `fk_logger_user1`
        FOREIGN KEY (`user_id`)
            REFERENCES `ax_blog`.`user` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_logger_ips1`
        FOREIGN KEY (`ips_id`)
            REFERENCES `ax_blog`.`ips` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`telegram_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`telegram_user`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`telegram_user`
(
    `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id`       INT UNSIGNED NULL,
    `first_name`    VARCHAR(500) NULL DEFAULT NULL,
    `last_name`     VARCHAR(500) NULL DEFAULT NULL,
    `username`      VARCHAR(500) NULL DEFAULT NULL,
    `type`          VARCHAR(500) NULL DEFAULT NULL,
    `language_code` VARCHAR(10)  NULL DEFAULT NULL,
    `created_at`    INT UNSIGNED NOT NULL,
    `updated_at`    INT UNSIGNED NOT NULL,
    `deleted_at`    INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `fk_telegram_user_user1_idx` (`user_id` ASC),
    CONSTRAINT `fk_telegram_user_user1`
        FOREIGN KEY (`user_id`)
            REFERENCES `ax_blog`.`user` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`telegram_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`telegram_message`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`telegram_message`
(
    `id`                  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `telegram_message_id` INT UNSIGNED NULL,
    `telegram_user_id`    INT UNSIGNED NULL,
    `message_id`          INT UNSIGNED NOT NULL,
    `update_id`           INT UNSIGNED NULL DEFAULT NULL,
    `text`                TEXT         NULL DEFAULT NULL,
    `search`              TEXT         NULL DEFAULT NULL,
    `date`                INT UNSIGNED NULL DEFAULT NULL,
    `created_at`          INT UNSIGNED NOT NULL,
    `updated_at`          INT UNSIGNED NOT NULL,
    `deleted_at`          INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    FULLTEXT INDEX `search` (`search`),
    INDEX `fk_telegram_message_telegram_message1_idx` (`telegram_message_id` ASC),
    INDEX `fk_telegram_message_telegram_user1_idx` (`telegram_user_id` ASC),
    CONSTRAINT `fk_telegram_message_telegram_message1`
        FOREIGN KEY (`telegram_message_id`)
            REFERENCES `ax_blog`.`telegram_message` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_telegram_message_telegram_user1`
        FOREIGN KEY (`telegram_user_id`)
            REFERENCES `ax_blog`.`telegram_user` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`url`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`url`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`url`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `alias`       VARCHAR(255) NOT NULL,
    `url`         VARCHAR(255) NOT NULL,
    `url_old`     VARCHAR(255) NULL DEFAULT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `alias_UNIQUE` (`alias` ASC),
    UNIQUE INDEX `url_UNIQUE` (`url` ASC),
    INDEX `url_old` (`url_old` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ax_blog`.`search`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ax_blog`.`search`;

CREATE TABLE IF NOT EXISTS `ax_blog`.`search`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `resource`    VARCHAR(255) NOT NULL,
    `resource_id` INT UNSIGNED NOT NULL,
    `search`      TEXT         NOT NULL,
    `created_at`  INT UNSIGNED NULL DEFAULT NULL,
    `updated_at`  INT UNSIGNED NULL DEFAULT NULL,
    `deleted_at`  INT UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `resource` (`resource` ASC),
    INDEX `resource_id` (`resource_id` ASC),
    FULLTEXT INDEX `search` (`search`)
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ax_blog`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ax_blog`;
INSERT INTO `ax_blog`.`user` (`id`, `first_name`, `last_name`, `patronymic`, `phone`, `email`, `is_email`, `is_phone`,
                              `status`, `avatar`, `password_hash`, `remember_token`, `auth_key`, `password_reset_token`,
                              `created_at`, `updated_at`, `deleted_at`)
VALUES (6, 'Aleksei', 'Alekseev', NULL, '79621829550', 'axlle@mail.ru', NULL, NULL, 10, NULL,
        '$2y$13$DMqEjJJL9gjftb80gCt5n.fOTyoTfAEv/HsQPh2IEQa42bfNsfF5S', 'kyyBBbb80b3ZflMDdsynKC0B4s',
        'kyyBBbb80b3ZflMDdsynKC0B4s', 'kyyBBbb80b3ZflMDdsynKC0B4s', UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), NULL);

COMMIT;
