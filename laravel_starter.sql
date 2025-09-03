-- -------------------------------------------------------------
-- TablePlus 6.6.8(632)
--
-- https://tableplus.com/
--
-- Database: laravel_starter
-- Generation Time: 2025-09-02 16:02:32.2820
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_main_menu` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `blog_sub_categories`;
CREATE TABLE `blog_sub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_main_menu` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_sub_categories_blog_category_id_foreign` (`blog_category_id`),
  CONSTRAINT `blog_sub_categories_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_tags_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` bigint unsigned NOT NULL,
  `blog_sub_category_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `cover_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_blog_category_id_foreign` (`blog_category_id`),
  KEY `contents_user_id_foreign` (`user_id`),
  CONSTRAINT `contents_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`),
  CONSTRAINT `contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `gallery_details`;
CREATE TABLE `gallery_details` (
  `gallery_id` bigint unsigned NOT NULL,
  `media_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`gallery_id`,`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_external` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `newsletter_subscriptions`;
CREATE TABLE `newsletter_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `page_details`;
CREATE TABLE `page_details` (
  `page_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_id` bigint unsigned NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`,`type`,`block_id`),
  KEY `page_details_user_id_foreign` (`user_id`),
  CONSTRAINT `page_details_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  CONSTRAINT `page_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_main_menu` tinyint(1) NOT NULL DEFAULT '0',
  `access_by_id` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `people_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `publications`;
CREATE TABLE `publications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gps_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `person_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `1` (`person_id`),
  CONSTRAINT `1` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users_permissions`;
CREATE TABLE `users_permissions` (
  `user_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `show_main_menu`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'My First Category', 'my-first-category', 0, 1, '2024-01-15 21:01:25', '2024-02-10 06:11:01', NULL),
(2, 'My Second Category', 'my-second-category', 0, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25', NULL),
(3, 'Blogs', 'newsletter', 1, 1, '2024-02-05 17:43:27', '2024-02-10 06:11:38', NULL);

INSERT INTO `blog_sub_categories` (`id`, `blog_category_id`, `name`, `slug`, `show_main_menu`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'My First Sub Category 1', 'my-first-sub-category-1', 1, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25', NULL),
(2, 1, 'My First Sub Category 2', 'my-first-sub-category-2', 0, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25', NULL),
(3, 2, 'My Second Sub Category 1', 'my-second-sub-category-1', 1, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25', NULL),
(4, 2, 'My Second Sub Category 2', 'my-second-sub-category-2', 0, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25', NULL);

INSERT INTO `contents` (`id`, `slug`, `blog_category_id`, `blog_sub_category_id`, `user_id`, `cover_id`, `name`, `intro`, `body`, `is_active`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'my-first-block', 1, 1, 1, NULL, 'My First Block', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra accumsan in nisl nisi scelerisque eu ultrices. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus. Ornare arcu odio ut sem nulla pharetra.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra accumsan in nisl nisi scelerisque eu ultrices. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus. Ornare arcu odio ut sem nulla pharetra. Interdum varius sit amet mattis vulputate enim nulla aliquet. Pulvinar elementum integer enim neque volutpat. Aliquet nibh praesent tristique magna. Convallis tellus id interdum velit laoreet id. Sit amet aliquam id diam maecenas ultricies mi eget mauris. Eget dolor morbi non arcu. Nec sagittis aliquam malesuada bibendum. Elementum tempus egestas sed sed risus pretium. Et magnis dis parturient montes nascetur ridiculus mus. Sed cras ornare arcu dui vivamus arcu felis bibendum ut.', 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(2, 'about-us', 2, 3, 1, 2, 'About Us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra accumsan in nisl nisi scelerisque eu ultrices. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus. Ornare arcu odio ut sem nulla pharetra.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra accumsan in nisl nisi scelerisque eu ultrices.&nbsp;</p><p>Et sollicitudin ac orci phasellus egestas tellus rutrum tellus. Ornare arcu odio ut sem nulla pharetra. Interdum varius sit amet mattis vulputate enim nulla aliquet.</p><p>Pulvinar elementum integer enim neque volutpat. Aliquet nibh praesent tristique magna. Convallis tellus id interdum velit laoreet id. Sit amet aliquam id diam maecenas ultricies mi eget mauris. Eget dolor morbi non arcu.</p><p>Nec sagittis aliquam malesuada bibendum. Elementum tempus egestas sed sed risus pretium. Et magnis dis parturient montes nascetur ridiculus mus. Sed cras ornare arcu dui vivamus arcu felis bibendum ut.</p>', 1, '2024-01-15 21:01:25', '2024-01-15 21:01:26', '2024-01-26 18:59:24'),
(3, 'newsletter-1', 3, NULL, 1, 1, 'Newsletter 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget aliquet nibh praesent tristique. Accumsan tortor posuere ac ut consequat semper. Enim diam vulputate ut pharetra. Nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget aliquet nibh praesent tristique. Accumsan tortor posuere ac ut consequat semper. Enim diam vulputate ut pharetra. Nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi. Eget duis at tellus at urna condimentum mattis pellentesque id. Vitae justo eget magna fermentum iaculis eu non diam. Egestas diam in arcu cursus euismod quis viverra. Tristique et egestas quis ipsum suspendisse ultrices gravida. Feugiat vivamus at augue eget arcu dictum varius duis. Porttitor leo a diam sollicitudin tempor id eu nisl. Semper viverra nam libero justo laoreet sit amet cursus sit. Dui nunc mattis enim ut tellus. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque. Id velit ut tortor pretium viverra. Tortor id aliquet lectus proin nibh nisl condimentum id venenatis. Eget egestas purus viverra accumsan in nisl nisi. Lorem ipsum dolor sit amet consectetur adipiscing elit. Varius vel pharetra vel turpis nunc eget lorem.</p>', 1, '2024-02-10 00:00:00', '2024-02-05 17:45:33', '2024-02-10 06:32:13'),
(4, 'newsletter-2', 3, NULL, 1, 2, 'Newsletter 2', '<p>Senectus et netus et malesuada fames ac turpis egestas integer. Sagittis orci a scelerisque purus semper. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Augue ut lectus arcu bibendum at varius vel pharetra vel. Orci porta non pulvinar neque. Pellentesque habitant morbi tristique senectus et netus et malesuada.</p>', '<p>Senectus et netus et malesuada fames ac turpis egestas integer. Sagittis orci a scelerisque purus semper. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Augue ut lectus arcu bibendum at varius vel pharetra vel. Orci porta non pulvinar neque. Pellentesque habitant morbi tristique senectus et netus et malesuada. Volutpat est velit egestas dui id. Lectus proin nibh nisl condimentum id venenatis a condimentum. Ut lectus arcu bibendum at varius vel. Leo vel fringilla est ullamcorper eget nulla facilisi. Vulputate enim nulla aliquet porttitor lacus. Libero volutpat sed cras ornare. Elementum curabitur vitae nunc sed velit. Vel fringilla est ullamcorper eget. Ultricies mi eget mauris pharetra. Eu volutpat odio facilisis mauris sit amet massa vitae tortor. Viverra suspendisse potenti nullam ac tortor.</p>', 1, '2024-02-10 00:00:00', '2024-02-05 17:46:20', '2024-02-10 06:31:53'),
(5, 'newsletter-3', 3, NULL, 1, 3, 'Newsletter 3', '<p>Arcu dictum varius duis at consectetur lorem donec. Risus sed vulputate odio ut enim blandit volutpat maecenas. Nec ultrices dui sapien eget mi. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper.</p>', '<p>Arcu dictum varius duis at consectetur lorem donec. Risus sed vulputate odio ut enim blandit volutpat maecenas. Nec ultrices dui sapien eget mi. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper. Eget dolor morbi non arcu risus quis. Nibh cras pulvinar mattis nunc sed blandit libero. Elementum eu facilisis sed odio morbi quis commodo odio. Ante metus dictum at tempor commodo ullamcorper a. Adipiscing elit ut aliquam purus sit amet luctus venenatis. Bibendum at varius vel pharetra vel turpis nunc eget lorem. Diam maecenas sed enim ut sem viverra aliquet. Neque aliquam vestibulum morbi blandit cursus. Donec enim diam vulputate ut. Eget velit aliquet sagittis id. Est ullamcorper eget nulla facilisi etiam dignissim diam. Blandit massa enim nec dui nunc mattis enim ut tellus. In arcu cursus euismod quis viverra.</p>', 1, '2024-02-10 00:00:00', '2024-02-05 17:47:07', '2024-02-10 06:31:40'),
(6, 'newsletter-4', 3, NULL, 1, 4, 'Newsletter 4', '<p>Ut placerat orci nulla pellentesque dignissim enim sit amet. Nibh venenatis cras sed felis eget velit aliquet sagittis. Magna fermentum iaculis eu non diam phasellus vestibulum lorem. Nibh nisl condimentum id venenatis. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam.</p>', '<p>Ut placerat orci nulla pellentesque dignissim enim sit amet. Nibh venenatis cras sed felis eget velit aliquet sagittis. Magna fermentum iaculis eu non diam phasellus vestibulum lorem. Nibh nisl condimentum id venenatis. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam. Quis varius quam quisque id diam vel quam elementum. Volutpat odio facilisis mauris sit amet massa vitae tortor condimentum. Lectus quam id leo in vitae turpis massa. Ut etiam sit amet nisl purus in. Volutpat sed cras ornare arcu dui. Felis eget velit aliquet sagittis. Mauris cursus mattis molestie a iaculis. Vitae suscipit tellus mauris a diam maecenas sed. Integer malesuada nunc vel risus commodo viverra maecenas. Non nisi est sit amet facilisis. Pharetra et ultrices neque ornare aenean. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Consectetur adipiscing elit pellentesque habitant morbi tristique. Commodo nulla facilisi nullam vehicula ipsum a arcu cursus. Magna eget est lorem ipsum dolor sit.</p>', 1, '2024-02-10 00:00:00', '2024-02-05 17:48:05', '2024-02-10 06:31:15'),
(7, 'we-are-hiring', 3, NULL, 1, 0, 'Account Executive', '<p>Vin jere lajan djaz la</p>', '<h2><strong>ENPAK INTERNSHIP PROGRAM</strong></h2><p>&nbsp;</p><ol><li><strong>Marketing Intern</strong></li></ol><p>We are seeking a dynamic and creative Marketing Intern to join our team. The ideal candidate will be a current student majoring in Marketing, Business, or a related field. Responsibilities include assisting in the development and execution of marketing campaigns, conducting market research, analyzing data, and contributing to social media strategies. This internship provides valuable hands-on experience in a fast-paced marketing environment.</p><p>&nbsp;</p><ol><li><strong>Sales Intern</strong></li></ol><p>We are looking for a motivated Sales Intern to support our sales team. The successful candidate should be pursuing a degree in Business, Marketing, or a related field. Responsibilities include prospecting potential clients, assisting with sales presentations, and maintaining client relationships. This internship offers the opportunity to gain practical sales experience and develop valuable interpersonal skills.</p>', 1, NULL, '2024-02-13 21:02:29', '2024-02-13 21:49:47');

INSERT INTO `galleries` (`id`, `name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'App Features', 'my-first-gallery', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 1, '2024-01-17 19:17:13', '2024-01-29 01:46:30');

INSERT INTO `gallery_details` (`gallery_id`, `media_id`) VALUES
(1, 2),
(1, 3),
(1, 4);

INSERT INTO `media` (`id`, `slug`, `name`, `url`, `type`, `mime_type`, `description`, `is_external`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'yon-foto-konsa-konsa', 'Yon Foto konsa konsa', 'DNMEGx8P9zCoFaZ28QodonYqTE08FMlJmpLEfBdJ.png', 'Image', 'image/png', 'Mezanmi sa k gen laaaaa', 0, 1, '2024-01-17 18:04:22', '2024-01-17 18:04:22'),
(2, 'yon-lot', 'Yon Lòt', 'Tmdspg1Z85ilnXQ8wTce5aCy86Ect6LfOSBPQFKb.jpg', 'Video', 'image/jpeg', 'Men li papa !Men li papa ! Men li papa ! Men li papa ! Men li papa !', 0, 1, '2024-01-17 19:08:10', '2024-01-17 19:08:10'),
(3, 'mayou-lavalas', 'Mayou lavalas', 'ca9yekSH1zU0K9DsvAmUxZ7B3jsTrZsTTprNRUxR.png', 'Image', 'image/png', 'K ap fè lòbèy. K ap fè lòbèy K ap fè lòbèy K ap fè lòbèy K ap fè lòbèy', 0, 1, '2024-01-17 19:11:55', '2024-01-17 19:11:55'),
(4, 'yon-kote-nou-jwenn-li', 'Yon Kote nou jwenn li', 'https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image.jpg', 'Image', 'file/Image', 'Se konsa wi papa', 1, 1, '2024-01-17 23:22:57', '2024-01-17 23:22:57'),
(5, 'enpak-mascot', 'Enpak Mascot', 'juPmMpYfNI96qI0Mh8Qmb5udSdzPnerma8NQZtUT.jpg', 'Image', 'image/jpeg', 'The Mascot of Enpak Journalism. Wepa !', 0, 1, '2024-01-28 15:58:37', '2024-02-12 23:55:40');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2011_09_15_024109_create_people_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_09_19_193359_create_permissions_table', 1),
(7, '2023_09_19_193407_create_roles_table', 1),
(8, '2023_09_19_193741_create_users_permissions_table', 1),
(9, '2023_09_19_194039_create_users_roles_table', 1),
(10, '2023_09_19_194157_create_roles_permissions_table', 1),
(11, '2023_09_29_050931_create_sessions_table', 1),
(12, '2023_11_19_201537_create_pages_table', 1),
(13, '2023_11_21_235237_create_blog_categories_table', 1),
(14, '2023_11_22_234802_create_blog_sub_categories_table', 1),
(15, '2023_11_26_002336_create_blog_tags_table', 1),
(16, '2023_11_26_023905_create_media_table', 1),
(17, '2023_12_12_223800_create_contents_table', 1),
(18, '2023_12_22_043034_create_galleries_table', 1),
(19, '2023_12_22_043222_create_gallery_details_table', 1),
(20, '2024_01_08_191635_create_page_details_table', 1),
(21, '2024_01_11_022712_create_settings_table', 1),
(22, '2024_01_23_222013_create_publications_table', 2),
(23, '2024_02_05_195629_create_newsletter_subscriptions_table', 3);

INSERT INTO `newsletter_subscriptions` (`id`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'dirjos2014@gmail.com', '2024-02-05 21:58:41', '2024-02-05 21:58:41', NULL);

INSERT INTO `page_details` (`page_id`, `user_id`, `type`, `block_id`, `order`, `is_active`) VALUES
(1, 1, 'Content', 2, 2, 0),
(1, 1, 'Gallery', 1, 1, 0),
(2, 1, 'Content', 2, 1, 1),
(4, 1, 'Content', 7, 1, 0);

INSERT INTO `pages` (`id`, `slug`, `name`, `show_main_menu`, `access_by_id`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'home', 'Home', 1, 0, 1, '2024-01-15 21:01:26', '2024-01-15 21:01:26', NULL),
(2, 'about-us', 'About Us', 1, 1, 1, '2024-01-15 21:01:26', '2024-01-15 21:01:26', NULL),
(3, 'terms-of-use', 'Terms of Use', 0, 0, 1, '2024-02-13 20:09:58', '2024-02-13 20:09:58', NULL),
(4, 'we-are-hiring', 'We are hiring', 0, 0, 1, '2024-02-13 21:02:56', '2024-02-13 21:02:56', NULL);

INSERT INTO `people` (`id`, `code`, `firstname`, `lastname`, `dob`, `bio`, `address`, `phone`, `profile_url`, `is_active`, `is_banned`, `created_at`, `updated_at`) VALUES
(1, '0000', 'Josny J', 'Severe', NULL, NULL, NULL, NULL, NULL, 1, 0, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(2, '0001', 'Adminis', 'Trator', NULL, NULL, NULL, NULL, NULL, 1, 0, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(3, '0002', 'Caden', 'Morar', '2018-01-20', 'Excepturi ut dolores quia dolor. Atque ut nisi nobis non. Itaque repellat et dolor alias sit qui. Sapiente doloribus deserunt rerum quis.', '6075 Joseph Ways Suite 362\nGerdamouth, TX 78063', '763-200-4847', NULL, 0, 1, '2024-01-15 21:01:26', '2024-01-15 21:01:26'),
(4, '0003', 'Lila', 'Hane', '2001-05-13', 'Voluptas id suscipit aspernatur sit. Velit occaecati sunt recusandae sit quia. Magni ut quasi eius recusandae voluptatem. Et in maiores harum ullam doloribus.', '713 Laron Wall\nHermistonhaven, WA 37425', '+1 (743) 438-9429', NULL, 1, 1, '2024-01-15 21:01:26', '2024-01-15 21:01:26'),
(5, '0004', 'Asha', 'Ward', '2006-01-05', 'Nihil consequatur et suscipit recusandae. Ut architecto voluptas impedit quasi exercitationem consequatur voluptas. Quia repellat veritatis veniam nulla deserunt aspernatur.', '5705 Ursula Ferry Suite 028\nKozeyport, AL 27227', '+1.734.759.7201', NULL, 0, 1, '2024-01-15 21:01:26', '2024-01-15 21:01:26'),
(6, '0005', 'Roel', 'Hegmann', '1988-08-11', 'Rerum voluptatem alias similique sint. Tenetur facere vero fugiat optio. Velit velit asperiores distinctio voluptatem ex.', '28434 Collins Crest Apt. 765\nTerryport, GA 85249', '646-437-5243', NULL, 0, 0, '2024-01-15 21:01:26', '2024-01-15 21:01:26'),
(7, '0006', 'Dolly', 'Ernser', '1980-01-07', 'Ab officia ut sit id in ut. Natus quas deserunt quis dolorum cum aut explicabo dicta. Omnis iste iste aut quibusdam et eius. Animi molestiae voluptate quidem aut voluptas nemo iure temporibus. Quia aut saepe non odio.', '5604 Peyton Oval Suite 007\nEunaville, FL 89564-5798', '1-234-719-8136', NULL, 0, 0, '2024-01-15 21:01:26', '2024-01-15 21:01:26');

INSERT INTO `permissions` (`id`, `display_name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin Access', 'admin-access', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(2, 'Create Permission', 'create-permission', NULL, 0, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(3, 'Read Permission', 'read-permission', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(4, 'Update Permission', 'update-permission', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(5, 'Delete Permission', 'delete-permission', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(6, 'Create Role', 'create-role', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(7, 'Read Role', 'read-role', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(8, 'Update Role', 'update-role', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(9, 'Delete Role', 'delete-role', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(10, 'Update User', 'update-user', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(11, 'Change User Password', 'change-user-password', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(12, 'Assign Permission to Role', 'assign-permission-to-role', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(13, 'Assign Permission to User', 'assign-permission-to-user', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(14, 'Assign Role to User', 'assign-role-to-user', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(15, 'Create Page', 'create-page', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(16, 'Read Page', 'read-page', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(17, 'Update Page', 'update-page', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(18, 'Delete Page', 'delete-page', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(19, 'Create Blog Category', 'create-blog-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(20, 'Read Blog Category', 'read-blog-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(21, 'Update Blog Category', 'update-blog-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(22, 'Delete Blog Category', 'delete-blog-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(23, 'Create Blog Sub Category', 'create-blog-sub-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(24, 'Read Blog Sub Category', 'read-blog-sub-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(25, 'Update Blog Sub Category', 'update-blog-sub-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(26, 'Delete Blog Sub Category', 'delete-blog-sub-category', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(27, 'Create Blog Tag', 'create-blog-tag', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(28, 'Read Blog Tag', 'read-blog-tag', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(29, 'Update Blog Tag', 'update-blog-tag', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(30, 'Delete Blog Tag', 'delete-blog-tag', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(31, 'Create Media', 'create-media', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(32, 'Read Media', 'read-media', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(33, 'Update Media', 'update-media', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(34, 'Delete Media', 'delete-media', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(35, 'Create Blog Content', 'create-blog-content', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(36, 'Read Blog Content', 'read-blog-content', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(37, 'Update Blog Content', 'update-blog-content', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(38, 'Delete Blog Content', 'delete-blog-content', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(39, 'Create Gallery', 'create-gallery', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(40, 'Read Gallery', 'read-gallery', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(41, 'Update Gallery', 'update-gallery', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(42, 'Delete Gallery', 'delete-gallery', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(43, 'Manage Page Content', 'manage-page-content', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25');

INSERT INTO `publications` (`id`, `name`, `website`, `address_one`, `address_two`, `city`, `state`, `country`, `zipcode`, `gps_location`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Maten Karayibs', 'http://matenkarayib.com', '2075 Golden Crest Dr', '', 'Birmingham', 'Alabama', 'United States', '35209', '33.4836353, -86.8054067', 1, '2024-01-24 00:54:27', '2024-02-13 07:02:16'),
(2, 'El Punto', 'http://elpunto.com', '1732 Valley View Dr.', '', 'Birmingham', 'Alabama', 'United States', '35209', '33.489896, -86.797148', 1, '2024-01-25 03:35:52', '2024-02-13 07:02:17');

INSERT INTO `roles` (`id`, `display_name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Super User', 'super-user', NULL, 0, '2024-01-15 21:01:25', '2024-01-15 21:01:25'),
(2, 'Admin', 'admin', NULL, 1, '2024-01-15 21:01:25', '2024-01-15 21:01:25');

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43);

INSERT INTO `settings` (`id`, `name`, `logo`, `slogan`, `description`, `email`, `phone`, `address`, `socials`, `created_at`, `updated_at`) VALUES
(1, 'Enpak Social', 'yw1Ej6myMHUhv90qnvhx0wzLuOlMTKSyKjcqDApP.png', 'The App For Local News', '<p>Enpak showcases the work of local news reporter who prioritize truth, accuracy, fairness, impartiality and humanity.</p>', 'my@website.com', '', '6000 Lakay Korali', '[{\"name\": \"Twitter\", \"value\": \"https://twitter.com/enpaksocial\"}, {\"name\": \"Facebook\", \"value\": \"https://www.facebook.com/profile.php?id=100093565624010\"}, {\"name\": \"Instagram\", \"value\": \"https://twitter.com/home\"}, {\"name\": \"TikTok\", \"value\": \"https://twitter.com/home\"}, {\"name\": \"YouTube\", \"value\": \"https://twitter.com/home\"}, {\"name\": \"LinkedIn\", \"value\": \"https://twitter.com/enpaksocial\"}, {\"name\": \"Enpak\", \"value\": \"https://twitter.com/enpaksocial\"}]', '2024-01-15 21:01:25', '2024-02-07 00:47:45');

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `is_suspended`, `is_banned`, `remember_token`, `created_at`, `updated_at`, `person_id`) VALUES
(1, 'josnys', 'dirjos2014@gmail.com', '2024-01-15 21:03:20', '$2y$10$SuccS1AwLETWXJlFe1XtyeSC4lRxh2sJ92tcXErTN56rzSJ1ZSEWi', 0, 0, 'fkEiWnY2GgHr6ZC54WSFeuanVzJMNi4EguQKkCBvf34H5CyPGpqnIvZUI2Is', '2024-01-15 21:01:25', '2024-01-15 21:03:20', 1),
(2, 'admin', 'admin@app.com', NULL, '$2y$10$8h/FhqXNL4hox5ZbJLkF.eTcxl5DCXz9JGg6.ihfk0H9HhvCt7ehm', 0, 0, NULL, '2024-01-15 21:01:25', '2024-01-15 21:01:25', 2),
(3, 'lowell72', 'carter.golden@example.net', '2024-01-15 21:01:26', '$2y$10$MwBWU3.sulkUzZN9i/bF8eTAzVDp7ACsXMUlM91t8GbMAiYHIX2bG', 0, 0, 'Pr1de3pMJt', '2024-01-15 21:01:26', '2024-01-15 21:01:26', 3),
(4, 'elinorestamm', 'lskiles@example.net', '2024-01-15 21:01:26', '$2y$10$2NRh6bsXXwiisrMqqyqBm.gN7byOQAfjC/l3JvYT6pC24gaEKL.k6', 0, 0, 'ZGVHMLhXVA', '2024-01-15 21:01:26', '2024-01-15 21:01:26', 4),
(5, 'bbogan', 'mbahringer@example.net', '2024-01-15 21:01:26', '$2y$10$tA2owzSPV9xNvN3P8vZw5eu4WZKNVA9sE9rVXFxgTfZEvAhR.Ux8.', 0, 0, '5QxPTZm7BG', '2024-01-15 21:01:26', '2024-01-15 21:01:26', 5),
(6, 'donaldeichmann', 'holly.wisozk@example.net', '2024-01-15 21:01:26', '$2y$10$KieVvhrFx3DWHYJsjasjBO100LxyR367q5laoXoFBsLTiE/JxBoXu', 0, 0, 'rLuohYbz9e', '2024-01-15 21:01:26', '2024-01-15 21:01:26', 6),
(7, 'earline17', 'udaniel@example.com', '2024-01-15 21:01:26', '$2y$10$KL8JMt0evhP/t0SEGeARt.MdzsKjx6GquENczmKBcKls8J8wF/sAO', 0, 0, 'inR1DjiBLL', '2024-01-15 21:01:26', '2024-01-15 21:01:26', 7);

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;