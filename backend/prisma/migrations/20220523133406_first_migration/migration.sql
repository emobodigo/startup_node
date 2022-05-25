-- CreateTable
CREATE TABLE `archelon_access_control` (
    `position_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_level` INTEGER NOT NULL,
    `division_id` INTEGER UNSIGNED NOT NULL,
    `level_title` VARCHAR(20) NOT NULL,

    INDEX `archelon_access_control_division_id_foreign`(`division_id`),
    PRIMARY KEY (`position_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_access_rule` (
    `rule_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `position_id` INTEGER UNSIGNED NOT NULL,
    `action_id` INTEGER UNSIGNED NOT NULL,
    `authorized_date` DATETIME(0) NOT NULL,
    `authorizing_admin_id` INTEGER UNSIGNED NOT NULL,

    INDEX `archelon_access_rule_action_id_foreign`(`action_id`),
    INDEX `archelon_access_rule_authorizing_admin_id_foreign`(`authorizing_admin_id`),
    INDEX `archelon_access_rule_position_id_foreign`(`position_id`),
    PRIMARY KEY (`rule_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_action` (
    `action_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `action_name` VARCHAR(50) NOT NULL,
    `action_code` VARCHAR(10) NOT NULL,
    `action_category_id` INTEGER UNSIGNED NOT NULL,

    INDEX `archelon_action_action_category_id_foreign`(`action_category_id`),
    PRIMARY KEY (`action_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_action_category` (
    `action_category_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `action_category` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`action_category_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_activity_log` (
    `log_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `log_date` DATETIME(0) NOT NULL,
    `admin_id` INTEGER UNSIGNED NOT NULL,
    `action_id` INTEGER UNSIGNED NOT NULL,
    `link` TEXT NULL,
    `label` TEXT NULL,
    `target` INTEGER NULL,
    `meta_data` TEXT NULL,

    INDEX `archelon_activity_log_action_id_foreign`(`action_id`),
    INDEX `archelon_activity_log_admin_id_foreign`(`admin_id`),
    PRIMARY KEY (`log_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_admin` (
    `admin_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `admin_fullname` VARCHAR(100) NOT NULL,
    `admin_phone` VARCHAR(20) NULL,
    `admin_email` VARCHAR(200) NULL,
    `last_active` DATETIME(0) NULL,
    `position_id` INTEGER UNSIGNED NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `admin_status_id` INTEGER UNSIGNED NOT NULL,
    `photo_path` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `archelon_admin_admin_status_id_foreign`(`admin_status_id`),
    INDEX `archelon_admin_position_id_foreign`(`position_id`),
    PRIMARY KEY (`admin_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_admin_blacklist` (
    `blacklist_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_id` INTEGER UNSIGNED NULL,
    `blacklist_date` DATETIME(0) NOT NULL,
    `ip` VARCHAR(50) NOT NULL,

    INDEX `archelon_admin_blacklist_admin_id_foreign`(`admin_id`),
    PRIMARY KEY (`blacklist_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_admin_status` (
    `admin_status_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_status` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`admin_status_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_config` (
    `config_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `timeout_minute` INTEGER NOT NULL DEFAULT 15,
    `session_mode` VARCHAR(255) NOT NULL DEFAULT 'EXCLUSIVE',
    `login_attempt_threshold` INTEGER NOT NULL DEFAULT 10,
    `is_maintenance` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`config_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_division` (
    `division_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `division_name` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`division_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_firebase_token` (
    `token` VARCHAR(255) NOT NULL,
    `admin_id` INTEGER UNSIGNED NOT NULL,
    `added_date` DATETIME(0) NOT NULL,

    INDEX `archelon_firebase_token_admin_id_foreign`(`admin_id`),
    PRIMARY KEY (`token`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_language` (
    `lang_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `lang_code` VARCHAR(10) NOT NULL,
    `language` VARCHAR(50) NOT NULL,
    `currency` VARCHAR(3) NOT NULL,

    PRIMARY KEY (`lang_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_login_failed_attempt` (
    `attempt_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_id` INTEGER UNSIGNED NULL,
    `ip_address` VARCHAR(255) NOT NULL,
    `user_agent` TEXT NOT NULL,
    `attempt_time` DATETIME(0) NOT NULL,

    INDEX `archelon_login_failed_attempt_admin_id_foreign`(`admin_id`),
    PRIMARY KEY (`attempt_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_preferences` (
    `preferences_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_id` INTEGER UNSIGNED NULL,
    `item_per_page` INTEGER NOT NULL DEFAULT 15,
    `color_theme` VARCHAR(255) NOT NULL,
    `email_notification` BOOLEAN NOT NULL DEFAULT false,
    `default_language` INTEGER UNSIGNED NOT NULL DEFAULT 1,

    INDEX `archelon_preferences_admin_id_foreign`(`admin_id`),
    INDEX `archelon_preferences_default_language_foreign`(`default_language`),
    PRIMARY KEY (`preferences_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_rel_admin_shift` (
    `rel_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_id` INTEGER UNSIGNED NOT NULL,
    `shift_id` INTEGER UNSIGNED NOT NULL,

    INDEX `archelon_rel_admin_shift_admin_id_foreign`(`admin_id`),
    INDEX `archelon_rel_admin_shift_shift_id_foreign`(`shift_id`),
    PRIMARY KEY (`rel_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_session_token` (
    `session_token` VARCHAR(26) NOT NULL,
    `admin_id` INTEGER UNSIGNED NOT NULL,
    `user_os` VARCHAR(50) NOT NULL,
    `user_browser` VARCHAR(50) NOT NULL,
    `user_browser_version` VARCHAR(50) NOT NULL,
    `user_device` VARCHAR(50) NOT NULL,
    `access_ip` VARCHAR(50) NOT NULL,
    `session_start` DATETIME(0) NOT NULL,
    `last_active` DATETIME(0) NOT NULL,
    `session_expired` DATETIME(0) NOT NULL,

    INDEX `archelon_session_token_admin_id_foreign`(`admin_id`),
    PRIMARY KEY (`session_token`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `archelon_shift` (
    `shift_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shift_name` VARCHAR(255) NOT NULL,
    `working_hour_start` TIME(0) NOT NULL,
    `working_hour_end` TIME(0) NOT NULL,
    `monday` TINYINT NOT NULL DEFAULT 1,
    `tuesday` TINYINT NOT NULL DEFAULT 1,
    `wednesday` TINYINT NOT NULL DEFAULT 1,
    `thursday` TINYINT NOT NULL DEFAULT 1,
    `friday` TINYINT NOT NULL DEFAULT 1,
    `saturday` TINYINT NOT NULL DEFAULT 0,
    `sunday` TINYINT NOT NULL DEFAULT 0,

    PRIMARY KEY (`shift_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `archelon_access_control` ADD CONSTRAINT `archelon_access_control_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `archelon_division`(`division_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_access_rule` ADD CONSTRAINT `archelon_access_rule_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `archelon_access_control`(`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_access_rule` ADD CONSTRAINT `archelon_access_rule_action_id_foreign` FOREIGN KEY (`action_id`) REFERENCES `archelon_action`(`action_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_access_rule` ADD CONSTRAINT `archelon_access_rule_authorizing_admin_id_foreign` FOREIGN KEY (`authorizing_admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_action` ADD CONSTRAINT `archelon_action_action_category_id_foreign` FOREIGN KEY (`action_category_id`) REFERENCES `archelon_action_category`(`action_category_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `archelon_activity_log` ADD CONSTRAINT `archelon_activity_log_action_id_foreign` FOREIGN KEY (`action_id`) REFERENCES `archelon_action`(`action_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_activity_log` ADD CONSTRAINT `archelon_activity_log_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_admin` ADD CONSTRAINT `archelon_admin_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `archelon_access_control`(`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_admin` ADD CONSTRAINT `archelon_admin_admin_status_id_foreign` FOREIGN KEY (`admin_status_id`) REFERENCES `archelon_admin_status`(`admin_status_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_admin_blacklist` ADD CONSTRAINT `archelon_admin_blacklist_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_firebase_token` ADD CONSTRAINT `archelon_firebase_token_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_login_failed_attempt` ADD CONSTRAINT `archelon_login_failed_attempt_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_preferences` ADD CONSTRAINT `archelon_preferences_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_preferences` ADD CONSTRAINT `archelon_preferences_default_language_foreign` FOREIGN KEY (`default_language`) REFERENCES `archelon_language`(`lang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_rel_admin_shift` ADD CONSTRAINT `archelon_rel_admin_shift_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_rel_admin_shift` ADD CONSTRAINT `archelon_rel_admin_shift_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `archelon_shift`(`shift_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `archelon_session_token` ADD CONSTRAINT `archelon_session_token_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `archelon_admin`(`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;
