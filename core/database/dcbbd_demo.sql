-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2023 at 02:54 PM
-- Server version: 10.3.38-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dcbbd_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@admin.com', 'superadmin', NULL, '63aaa2c5f15ee1672127173.png', '$2y$10$Sb2mhP9Uz9f6FHKir30u6eIN.XmwumW/gjAso7lBbsuowJPFFTNxu', 'yZi5aDdO43dyPbNVXTjBEHrrul8LlzUTYwXe6Pa6faMaKwzVhCjHigrjEM9s', NULL, '2023-04-03 09:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 0, '/admin/users/detail/1', '2023-04-03 08:24:20', '2023-04-03 08:24:20'),
(2, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2023-04-03 09:34:13', '2023-04-03 09:34:13'),
(3, 0, 'A new support ticket has opened ', 0, '/admin/ticket/view/1', '2023-04-03 14:49:12', '2023-04-03 14:49:12'),
(4, 2, 'New member registered', 0, '/admin/users/detail/2', '2023-04-10 06:38:37', '2023-04-10 06:38:37'),
(5, 3, 'New member registered', 0, '/admin/users/detail/3', '2023-04-10 06:51:55', '2023-04-10 06:51:55'),
(6, 4, 'New member registered', 0, '/admin/users/detail/4', '2023-04-10 07:45:06', '2023-04-10 07:45:06'),
(7, 5, 'New member registered', 0, '/admin/users/detail/5', '2023-04-10 08:01:11', '2023-04-10 08:01:11'),
(8, 6, 'New member registered', 0, '/admin/users/detail/6', '2023-04-10 08:05:46', '2023-04-10 08:05:46'),
(9, 7, 'New member registered', 0, '/admin/users/detail/7', '2023-04-11 10:49:12', '2023-04-11 10:49:12'),
(10, 8, 'New member registered', 0, '/admin/users/detail/8', '2023-04-11 15:53:03', '2023-04-11 15:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gender` varchar(40) DEFAULT NULL,
  `profession` varchar(40) DEFAULT NULL,
  `financial_condition` varchar(40) DEFAULT NULL,
  `religion` varchar(40) DEFAULT NULL,
  `smoking_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `drinking_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `birth_date` date DEFAULT NULL,
  `language` varchar(40) NOT NULL DEFAULT '[]',
  `marital_status` varchar(40) DEFAULT NULL,
  `present_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_infos`
--

INSERT INTO `basic_infos` (`id`, `user_id`, `gender`, `profession`, `financial_condition`, `religion`, `smoking_status`, `drinking_status`, `birth_date`, `language`, `marital_status`, `present_address`, `permanent_address`, `created_at`, `updated_at`) VALUES
(1, 1, 'm', 'Engineer', 'Avarage', 'Muslim', 1, 1, '2001-10-28', '[\"bangladesh\"]', 'single', '{\"country\":\"Singapore\",\"state\":\"mirpur\",\"zip\":\"2440\",\"city\":\"Bashundhara\"}', '{\"country\":\"Afghanistan\",\"state\":\"Beluchistan\",\"zip\":\"2440\",\"city\":\"TAleban\"}', '2023-04-03 10:00:11', '2023-04-03 10:00:11'),
(2, 5, 'f', 'Esse consequat Quo', 'Et maxime velit moll', 'Muslim', 1, 0, '2000-02-02', '[\"Iure\"]', 'Widowed', '{\"country\":\"Papua New Guinea\",\"state\":\"Laborum omnis commod\",\"zip\":\"19552\",\"city\":\"Consequatur et ad do\"}', '{\"country\":\"Italy\",\"state\":\"Ipsum blanditiis se\",\"zip\":\"24476\",\"city\":\"Voluptate qui nobis\"}', '2023-04-10 08:02:07', '2023-04-10 08:02:07'),
(3, 8, 'f', 'Ratione ut a.', 'Tempora ipsa aut inventore ut architecto', 'Muslim', 1, 0, '2001-05-02', '[\"Velit ut et sed sapiente consequatur a', 'Divorced', '{\"country\":\"Bangladesh\",\"state\":\"Connecticut\",\"zip\":\"53556-3696\",\"city\":\"Tyreefort\"}', '{\"country\":\"Bangladesh\",\"state\":\"Iowa\",\"zip\":\"41552\",\"city\":\"Jaimeshire\"}', '2023-04-11 15:54:02', '2023-04-11 15:54:02'),
(4, 7, 'm', 'Job', 'Stable', 'Muslim', 0, 0, '1985-12-31', '[\"Bengali\"]', 'single', '{\"country\":\"Bangladesh\",\"state\":\"DHK\",\"zip\":\"1212\",\"city\":\"Dhaka\"}', '{\"country\":\"Bangladesh\",\"state\":\"DHK\",\"zip\":\"1212\",\"city\":\"Dhaka\"}', '2023-04-11 16:01:53', '2023-04-11 16:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `blood_groups`
--

CREATE TABLE `blood_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_groups`
--

INSERT INTO `blood_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'O+', '2023-04-03 09:57:35', '2023-04-03 09:57:35'),
(2, 'B+', '2023-04-03 09:57:42', '2023-04-03 09:57:42'),
(3, 'A+', '2023-04-03 16:13:33', '2023-04-03 16:13:33'),
(4, 'A-', '2023-04-03 16:13:38', '2023-04-03 16:13:38'),
(5, 'B-', '2023-04-03 16:13:44', '2023-04-03 16:13:44'),
(6, 'O-', '2023-04-03 16:13:56', '2023-04-03 16:13:56'),
(7, 'AB+', '2023-04-03 16:14:02', '2023-04-03 16:14:02'),
(8, 'AB-', '2023-04-03 16:14:09', '2023-04-03 16:14:09');

-- --------------------------------------------------------

--
-- Table structure for table `career_infos`
--

CREATE TABLE `career_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `company` varchar(255) DEFAULT NULL,
  `designation` varchar(40) DEFAULT NULL,
  `start` year(4) DEFAULT NULL,
  `end` year(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `career_infos`
--

INSERT INTO `career_infos` (`id`, `user_id`, `company`, `designation`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monoputo', 'Coder', 2022, 2023, '2023-04-03 10:02:48', '2023-04-03 10:02:48'),
(2, 1, 'Monoputo', 'Coder', 2022, 2023, '2023-04-03 10:02:49', '2023-04-03 10:02:49'),
(3, 1, 'Monoputo', 'Coder', 2022, 2023, '2023-04-03 10:02:51', '2023-04-03 10:02:51'),
(4, 5, 'Hood and Schwartz Traders', 'Qui sequi iure rerum', 2020, 2022, '2023-04-10 08:03:24', '2023-04-10 08:03:24'),
(5, 6, 'Stanley Gillespie Plc', 'Non similique distin', 2020, 2023, '2023-04-10 08:07:18', '2023-04-10 08:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `contact_views`
--

CREATE TABLE `contact_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contact_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interest_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `receiver_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `interest_id`, `sender_id`, `receiver_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, '2023-04-10 07:02:07', '2023-04-10 07:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `purchase_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `payment_try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `purchase_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `payment_try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 101, '5000.00000000', 'USD', '51.00000000', '1.00000000', '5051.00000000', NULL, '0', '', '2CETFJMZ4K5D', 0, 0, 0, NULL, '2023-04-04 09:17:03', '2023-04-04 09:17:03'),
(2, 1, 2, 113, '20000.00000000', 'USD', '201.00000000', '1.00000000', '20201.00000000', NULL, '0', '', 'BA2BQ5RU9OC7', 0, 0, 0, NULL, '2023-04-04 09:17:41', '2023-04-04 09:17:41'),
(3, 1, 3, 104, '3000.00000000', 'USD', '31.00000000', '2.00000000', '6062.00000000', NULL, '0', '', 'TFZ6HARSYG2Q', 0, 0, 0, NULL, '2023-04-04 09:18:35', '2023-04-04 09:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `education_infos`
--

CREATE TABLE `education_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `degree` varchar(255) DEFAULT NULL,
  `field_of_study` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `reg_no` int(11) NOT NULL DEFAULT 0,
  `roll_no` int(11) NOT NULL DEFAULT 0,
  `out_of` decimal(8,2) DEFAULT 0.00,
  `result` decimal(8,2) DEFAULT 0.00,
  `start` year(4) DEFAULT NULL,
  `end` year(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education_infos`
--

INSERT INTO `education_infos` (`id`, `user_id`, `degree`, `field_of_study`, `institute`, `reg_no`, `roll_no`, `out_of`, `result`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1, 1, 'Social Science', 'Farming', 'Havard University', 26262626, 35, '5.00', '6.68', 2007, 2021, '2023-04-03 10:02:11', '2023-04-03 10:02:11'),
(2, 5, 'Ratione obcaecati ma', 'Do aut adipisicing d', 'Nisi quaerat nihil i', 48, 91, '96.00', '74.00', 2017, 2021, '2023-04-10 08:03:01', '2023-04-10 08:03:01'),
(3, 6, 'Vel animi fugit do', 'Id ipsam occaecat as', 'Porro eligendi venia', 34, 79, '69.00', '39.00', 2022, 2023, '2023-04-10 08:07:02', '2023-04-10 08:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2022-12-26 15:13:45'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-12-27 07:44:41'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `family_infos`
--

CREATE TABLE `family_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `father_name` varchar(255) DEFAULT NULL,
  `father_profession` varchar(40) DEFAULT NULL,
  `father_contact` varchar(40) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_profession` varchar(40) DEFAULT NULL,
  `mother_contact` varchar(40) DEFAULT NULL,
  `total_brother` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `total_sister` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_infos`
--

INSERT INTO `family_infos` (`id`, `user_id`, `father_name`, `father_profession`, `father_contact`, `mother_name`, `mother_profession`, `mother_contact`, `total_brother`, `total_sister`, `created_at`, `updated_at`) VALUES
(1, 1, 'My Father', 'Proffession', '01643675060', 'My Mother', 'Proffession', '01643675060', 2, 25, '2023-04-03 10:01:10', '2023-04-03 10:01:10'),
(2, 5, 'Keaton Ewing', 'Assumenda aspernatur', '27', 'William Conway', 'Ducimus tempora ali', '64', 10, 17, '2023-04-10 08:02:13', '2023-04-10 08:02:13'),
(3, 6, 'Hunter Gill', 'Minima velit ex dolo', '91', 'Camden Holden', 'Odio voluptatem Dol', '12', 62, 38, '2023-04-10 08:06:29', '2023-04-10 08:06:29'),
(4, 7, 'N/A', 'Business', '654646', 'jsdagjaskc', 'sacasc', '5446', 2, 3, '2023-04-11 16:02:28', '2023-04-11 16:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"optional\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"birth_registration_certificate\":{\"name\":\"Birth Registration Certificate\",\"label\":\"birth_registration_certificate\",\"is_required\":\"optional\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-16 20:56:14', '2022-05-28 04:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"matrilab\",\"bridegroom\",\"marriage\",\"plans\",\"package\",\"smart\",\"image\",\"gallery\",\"profile\",\"ignore\",\"people\",\"option\",\"member\",\"partner\",\"life partner\",\"script\",\"php\"],\"description\":\"Divorced Community was founded by a group of experienced professionals who recognized the need for a safe and supportive online community for divorced singles. We understand that divorce can be a challenging and life-changing experience, and we\'re committed to helping our users find love, happiness, and companionship after divorce.\",\"social_title\":\"Divorced Community-Find a partner from your own community\",\"social_description\":\"Welcome to Divorced Community, the premier online destination for divorced singles who are looking for meaningful relationships. Our site is designed to connect divorced individuals with like-minded individuals who share similar values and interests\",\"image\":\"642fe407ccbea1680860167.jpg\"}', '2020-07-04 23:42:52', '2023-04-11 18:22:28'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Why Divorced Community?\",\"description\":\"Welcome to Divorced Community, the premier online destination for divorced singles who are looking for meaningful relationships. Our site is designed to connect divorced individuals with like-minded individuals who share similar values and interests.\\n\\nDivorced Community was founded by a group of experienced professionals who recognized the need for a safe and supportive online community for divorced singles. We understand that divorce can be a challenging and life-changing experience, and we\'re committed to helping our users find love, happiness, and companionship after divorce.\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=VAgdbT889wk\",\"button_text\":\"See More\",\"button_url\":\"\\/packages\",\"image\":\"642afce9c74741680538857.jpg\"}', '2020-10-28 00:51:20', '2023-04-03 16:21:51'),
(25, 'stories.content', '{\"heading\":\"Success Stories\",\"subheading\":\"Our successfull stories are too verse. These are awesome, romantic, like a dream.\"}', '2020-10-28 00:51:34', '2022-12-11 06:08:59'),
(27, 'contact_us.content', '{\"has_image\":\"1\",\"title\":\"Get In Touch With Us\",\"office_address_title\":\"Office Address\",\"office\":\"Confidence Tower, Shahjadpur Bus-Stand, Gulshan, Dhaka-1212\",\"email_address_title\":\"Email Address\",\"email\":\"info@divorcedcommunity.com\",\"contact_number_title\":\"Contact Number\",\"contact_number\":\"+8801756043120\",\"button_text\":\"Send Message\",\"image\":\"642ae719568bd1680533273.jpg\"}', '2020-10-28 00:59:19', '2023-04-11 18:25:00'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\"}', '2020-10-28 01:04:02', '2020-10-28 01:04:02'),
(39, 'banner.content', '{\"subheading\":\"Find Your Perfect Life partner With Us\",\"button_text\":\"Success Stories\",\"button_url\":\"\\/stories\"}', '2021-05-02 06:09:30', '2022-12-22 13:49:13'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; color: rgb(54, 54, 54); text-align: center; font-family: Exo, sans-serif;\\\"><font size=\\\"6\\\">Cookie Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', '2020-07-04 23:42:52', '2022-12-25 10:07:49'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align:center;font-weight:600;line-height:1.3;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><font size=\\\"6\\\">Privacy Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What Information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-06-09 08:50:42', '2022-12-11 07:19:04'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<blockquote style=\\\"margin:0 0 0 40px;border:none;padding:0px;\\\"><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h1 style=\\\"text-align:center;margin-right:0px;margin-left:0px;\\\"><font size=\\\"5\\\">Terms Of Service<\\/font><\\/h1><\\/div><\\/blockquote><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><span>We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/span><br \\/><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', '2021-06-09 08:51:18', '2022-12-11 07:20:49'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17'),
(52, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2022-06-06 09:26:22', '2022-06-06 09:39:35'),
(53, 'social_icon.element', '{\"title\":\"Twitter\",\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2022-06-06 09:26:52', '2022-06-06 09:40:30'),
(54, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', '2022-06-06 09:27:18', '2022-06-06 09:40:19'),
(55, 'social_icon.element', '{\"title\":\"Linkedin\",\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', '2022-06-06 09:27:44', '2022-06-06 09:40:03'),
(56, 'about.element', '{\"item\":\"Contact verified divorced profiles\",\"icon\":\"<i class=\\\"fas fa-id-card-alt\\\"><\\/i>\"}', '2022-06-06 10:28:26', '2023-04-03 16:22:27'),
(57, 'about.element', '{\"item\":\"Find perfect match quite easily\",\"icon\":\"<i class=\\\"fas fa-comments\\\"><\\/i>\"}', '2022-06-06 10:29:48', '2022-12-11 05:38:42'),
(58, 'about.element', '{\"item\":\"100% security for data and Profile\",\"icon\":\"<i class=\\\"fas fa-box-open\\\"><\\/i>\"}', '2022-06-06 10:30:14', '2022-12-11 05:39:03'),
(59, 'about.element', '{\"item\":\"First &amp; Trusted Divorced Matrimony in Bangladesh\",\"icon\":\"<i class=\\\"fas fa-shield-alt\\\"><\\/i>\"}', '2022-06-06 10:30:42', '2023-04-03 16:23:26'),
(60, 'package.content', '{\"heading\":\"Matrimonial Package\",\"subheading\":\"Every user have their own package. Anyone can upgrade package or buy package through online payment system.\"}', '2022-06-06 10:56:05', '2022-06-07 02:22:33'),
(69, 'how_it_work.content', '{\"has_image\":\"1\",\"heading\":\"How It Work\",\"subheading\":\"This site facilitate to find your dream partner.  There are some step to finding your best partner. If you wanna be a partner, or want to find your best partner, please follow the process as we suggested here.\",\"background_image\":\"63a690c6f24c61671860422.png\"}', '2022-06-07 03:22:39', '2022-12-24 05:40:23'),
(70, 'how_it_work.element', '{\"title\":\"Create Account\",\"description\":\"Create your own story by creating your account with us.\",\"icon\":\"<i class=\\\"fas fa-user\\\"><\\/i>\"}', '2022-06-07 03:23:13', '2023-04-11 18:27:52'),
(71, 'how_it_work.element', '{\"title\":\"Search Your Partner\",\"description\":\"Search your dreaming partner and move on !\",\"icon\":\"<i class=\\\"fas fa-search\\\"><\\/i>\"}', '2022-06-07 03:23:54', '2023-04-11 18:28:39'),
(72, 'how_it_work.element', '{\"title\":\"Start Communication\",\"description\":\"Start communication with verified profiles. You have to be a premium member to grab this option.\",\"icon\":\"<i class=\\\"fas fa-comments\\\"><\\/i>\"}', '2022-06-07 03:25:22', '2023-04-11 18:29:36'),
(73, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Odette Talley\",\"designation\":\"Et aliquid deleniti\",\"speech\":\"Contrary to popular belief, Lorem Ipsum is not simply random text.\",\"star\":\"5\",\"profile_picture\":\"629eea35a0ebd1654581813.jpg\"}', '2022-06-07 04:05:04', '2022-06-07 04:33:33'),
(74, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Jackson Guerrero\",\"designation\":\"Business Man\",\"speech\":\"Here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.\",\"star\":\"5\",\"profile_picture\":\"629eea45948561654581829.jpg\"}', '2022-06-07 04:05:40', '2022-06-07 04:33:49'),
(75, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Ursula Crane\",\"designation\":\"Software Engineer\",\"speech\":\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.\",\"star\":\"4\",\"profile_picture\":\"629eea57d1e2d1654581847.png\"}', '2022-06-07 04:06:16', '2022-06-07 04:34:07'),
(76, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Caleb Delaney\",\"designation\":\"Scientist\",\"speech\":\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms.\",\"star\":\"5\",\"profile_picture\":\"629eea654f1861654581861.png\"}', '2022-06-07 04:07:38', '2022-06-07 04:34:21'),
(77, 'testimonial.content', '{\"heading\":\"Testimonials\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.\"}', '2022-06-07 04:11:41', '2022-06-07 04:11:41'),
(78, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"Ken and Berbie\",\"total_view\":\"10\",\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa80fb28da1672128527.png\"}', '2022-06-07 04:44:13', '2022-12-27 08:08:49'),
(79, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"Libero consequuntur\",\"total_view\":\"29\",\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa8197b1941672128537.png\"}', '2022-06-07 04:46:02', '2022-12-27 08:08:58'),
(80, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"Doloribus debitis\",\"total_view\":18,\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa821432b01672128545.png\"}', '2022-06-07 04:46:35', '2022-12-27 13:32:39'),
(81, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"Exercitation in id m\",\"total_view\":\"12\",\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa82929e9d1672128553.png\"}', '2022-06-07 05:17:43', '2022-12-27 08:09:17'),
(82, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"Esse laboriosam fu\",\"total_view\":\"40\",\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa835eaa581672128565.png\"}', '2022-06-07 05:18:27', '2022-12-27 08:09:30'),
(83, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"David and Jonnas\",\"total_view\":\"22\",\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa8491258e1672128585.png\"}', '2022-06-07 05:19:01', '2022-12-27 08:09:46'),
(84, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"William and Sofia\",\"total_view\":\"25\",\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa852703aa1672128594.png\"}', '2022-06-07 05:19:49', '2022-12-27 08:09:58'),
(85, 'stories.element', '{\"has_image\":[\"1\"],\"title\":\"Elina and Torrens\",\"total_view\":42,\"description\":\"<div><span style=\\\"font-size:1rem;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, cupiditate earum expedita odio libero recusandae officiis vitae, nam qui similique cum placeat enim facilis excepturi! Atque beatae repudiandae, eligendi soluta sequi corrupti ullam culpa facilis iure quae? Perferendis excepturi provident itaque asperiores molestias tempora, ipsam magnam quo est eum eius dolores nisi suscipit sapiente voluptas dicta, quos illum deleniti iste. Laudantium enim deserunt illum sint veritatis iusto dolorum suscipit fuga magnam labore,<\\/span><br \\/><\\/div><div><br \\/><\\/div><div>alias eius ab quidem ad quibusdam placeat blanditiis rem quo vero illo debitis soluta reiciendis inventore excepturi. Error velit suscipit accusamus mollitia odit perferendis iusto quisquam in, deserunt veritatis, at sequi cumque eveniet dolorem iure perspiciatis libero ad reiciendis veniam repellendus,<\\/div><div>nihil adipisci laboriosam dolor provident. Consectetur numquam cum, at dolores et recusandae fuga quos distinctio accusantium itaque facere, magnam deserunt illo. Aspernatur minus obcaecati ab voluptates error laboriosam animi deserunt omnis consectetur pariatur, magnam fugit quos esse, reiciendis at veniam expedita impedit. Rem dolor incidunt, repudiandae velit officiis dolore voluptate error enim facilis debitis obcaecati quod eum minima quae culpa eius explicabo animi esse. Dolore harum dolores, cupiditate, voluptatum suscipit magni eligendi nobis non consectetur, adipisci in ratione culpa similique assumenda laborum quasi sed! Quam, saepe temporibus.<\\/div><div><br \\/><\\/div>\",\"image\":\"63aaa8be6ab9a1672128702.png\"}', '2022-06-07 05:20:50', '2022-12-27 08:11:52'),
(86, 'footer.content', '{\"title\":\"About Us\",\"description\":\"Welcome to Divorced Community, the premier online destination for divorced singles who are looking for meaningful relationships. Our site is designed to connect divorced individuals with like-minded individuals who share similar values and interests.\"}', '2022-06-07 06:58:11', '2023-04-11 18:26:54'),
(87, 'mobile_app.content', '{\"has_image\":\"1\",\"heading\":\"Download Mobile App\",\"subheading\":\"Maecenas nec odio et ante tincidunt tempus. Donec vitae apitlibero venenatis faucibus. Nullam quis ante.\",\"description\":\"posuere cubilia Curae In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor suscipit eget imperdiet nec imperdiet ialisn ipsum. Sed aliquam ultrices mauris. Integer ante arcu consectetuer.\",\"right_side_image\":\"63aacbff2bc9d1672137727.png\"}', '2022-06-07 09:36:25', '2022-12-27 10:42:07'),
(88, 'counter.element', '{\"title\":\"Latest Profile\",\"digits\":\"150\",\"icon\":\"<i class=\\\"fas fa-user-alt\\\"><\\/i>\"}', '2022-06-07 09:54:30', '2023-04-11 18:26:11'),
(89, 'counter.element', '{\"title\":\"Successful Stories\",\"digits\":\"20\",\"icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\"}', '2022-06-07 09:55:47', '2023-04-11 18:26:03'),
(90, 'counter.element', '{\"title\":\"Happy Users\",\"digits\":\"200\",\"icon\":\"<i class=\\\"fas fa-smile-beam\\\"><\\/i>\"}', '2022-06-07 09:56:39', '2023-04-11 18:25:50'),
(91, 'counter.element', '{\"title\":\"Our Achievement\",\"digits\":\"10\",\"icon\":\"<i class=\\\"fas fa-user-friends\\\"><\\/i>\"}', '2022-06-07 09:57:17', '2023-04-11 18:26:18'),
(92, 'faq.element', '{\"question\":\"Is this for Only Divorced People?\",\"answer\":\"No. People from the world can visit our website. Only verified divorced profile are shown in our site. Any single Men or Women can find their partner from our Divorced Community Of Bangladesh. All profiles are 100% genuine and checked by our pro team.\"}', '2022-06-08 05:02:13', '2023-04-03 16:36:57'),
(93, 'faq.element', '{\"question\":\"What is a Premium Service Plan?\",\"answer\":\"When you become a paying member, the plan you subscribe to is called a Premium Service Plan. There are three premium service plans: Basic, Standard, Silver, Gold Plan. They allow you to view the Private Profiles of other candidates, and contact them.\"}', '2022-06-08 05:02:22', '2023-04-03 16:39:27'),
(94, 'faq.element', '{\"question\":\"I am single, Can i marry a divorced woman?\",\"answer\":\"Yes, You can find from our verified profiles.\"}', '2022-06-08 05:02:30', '2023-04-03 16:42:25');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(95, 'faq.element', '{\"question\":\"How do I pay DCB?\",\"answer\":\"You can pay DCB online using bKash, Nagad, a credit\\/Master card or paypal. If you are unable to pay online, you can stop by at one of our offices to pay in person. When you try to make payment on our site, you will be asked how you want to pay. If you indicate that you want to pay in person, one of our customer support representatives will call you to notify you where to go to make the payment. All fees and payments are calculated in US dollars. However, when you make a payment in person, we will accept the payment in equivalent amount in local currency.\"}', '2022-06-08 05:02:39', '2023-04-03 16:45:07'),
(96, 'faq.element', '{\"question\":\"What\'s about package ?\",\"answer\":\"N\\/A\"}', '2022-06-08 05:02:46', '2023-04-03 16:46:43'),
(98, 'faq.element', '{\"question\":\"How to purchase package?\",\"answer\":\"N\\/A\"}', '2022-06-08 05:03:06', '2023-04-03 16:46:54'),
(100, 'faq.element', '{\"question\":\"Is it age restricted?\",\"answer\":\"YES, You have to follow your country\'s Law and regulations about Marriage Policy.\"}', '2022-06-08 05:03:22', '2023-04-03 16:47:45'),
(101, 'faq.element', '{\"question\":\"What about our services?\",\"answer\":\"We are trying our level best to serve the accurate information to the general users\\/visitors of our matrimonial portal.\"}', '2022-06-08 05:03:29', '2023-04-03 16:49:03'),
(114, 'login.content', '{\"heading\":\"Login to your account\",\"subheading\":\"Please input your username and password and login to your account to get access to your dashboard.\"}', '2022-06-08 05:41:09', '2022-12-11 08:46:43'),
(115, 'register.content', '{\"heading\":\"Create an account\",\"subheading\":\"Please Provide your valid informations to register!\"}', '2022-06-08 05:58:39', '2022-12-11 08:49:28'),
(116, 'forgot_password.content', '{\"heading\":\"Account Recovery\",\"subheading\":\"To recover your account please provide your email or username to find your account.\",\"button_text\":\"Submit\"}', '2022-06-08 09:28:36', '2022-06-08 09:28:36'),
(117, 'reset_password.content', '{\"heading\":\"Reset Password\",\"subheading\":\"Your account is verified successfully. Now you can change your password. Please enter a strong password and don\'t share it with anyone.\",\"button_text\":\"Submit\"}', '2022-06-08 10:24:59', '2022-06-08 10:24:59'),
(118, 'code_verify.content', '{\"heading\":\"Verify Email Address\",\"subheading\":\"A 6 digit verification code sent to your email address : u***@site.com\",\"button_text\":\"Submit\"}', '2022-06-08 10:38:51', '2022-06-08 10:38:51'),
(119, 'email_verify.content', '{\"heading\":\"Verify Email Address\",\"subheading\":\"A 6 digit verification code sent to your email address\",\"button_text\":\"Submit\"}', '2022-06-09 04:55:54', '2022-06-09 04:55:54'),
(120, 'mobile_app.element', '{\"has_image\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store\\/games\",\"link_image\":\"639580215695c1670742049.png\"}', '2022-12-11 07:00:49', '2022-12-11 07:00:49'),
(121, 'mobile_app.element', '{\"has_image\":\"1\",\"link\":\"https:\\/\\/www.apple.com\\/store\",\"link_image\":\"63958040e43a31670742080.png\"}', '2022-12-11 07:01:20', '2022-12-11 07:01:20'),
(122, 'faq.content', '{\"heading\":\"Frequently Asked Question\",\"subheading\":\"Randomly asked the questions from the Users.\"}', '2022-12-11 08:28:15', '2023-04-03 16:34:20'),
(127, 'policy_pages.element', '{\"title\":\"Purchase Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;color:rgb(54,54,54);text-align:center;font-family:Exo, sans-serif;\\\"><font size=\\\"6\\\">Package Purchase Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What Information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2022-12-24 05:54:16', '2022-12-24 05:54:16'),
(159, 'kyc_instruction.content', '{\"verification_instruction\":\"KYC is a mandatory process for identifying and verifying the identity of the client when viewing partner contact using our site. After providing all of the information requested by the administrator, one of our administrators will verify it and declare you as KYC verified.\",\"pending_instruction\":\"Please be patient. Your KYC data has been accepted, one of our administrators will verify the authenticity and declare you as KYC verified.\"}', '2022-11-12 21:28:03', '2022-12-26 15:35:00'),
(160, 'banner.element', '{\"has_image\":\"1\",\"slider_image\":\"642ba14a2cf631680580938.jpg\"}', '2023-04-04 04:02:18', '2023-04-04 04:02:18'),
(161, 'banner.element', '{\"has_image\":\"1\",\"slider_image\":\"642ba151abc9c1680580945.jpg\"}', '2023-04-04 04:02:25', '2023-04-04 04:02:25'),
(162, 'banner.element', '{\"has_image\":\"1\",\"slider_image\":\"642ba17945bfd1680580985.jpeg\"}', '2023-04-04 04:03:05', '2023-04-04 04:03:05'),
(163, 'member.content', '{\"heading\":\"premium divorced members\",\"subheading\":\"they are special\"}', '2023-04-11 10:34:31', '2023-04-11 10:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, '6433b5d90f5781681110489.jpg', '2023-04-10 07:08:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"----------------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-12-27 07:41:30'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"----------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-12-27 07:41:18'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"----------------------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"----------------------------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-12-27 07:41:24'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"----------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-12-27 07:41:13'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"----------------------------\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"----------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2022-12-27 07:41:08'),
(27, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(44, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"3Vee5S2F\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(45, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:12:37'),
(46, 0, 122, 'Two Checkout', 'TwoCheckout', 1, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"----\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----\"}}', '{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GBP\":\"GBP\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MMK\":\"MMK\",\"MOP\":\"MOP\",\"MRU\":\"MRU\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"UAH\":\"UAH\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XCD\":\"XCD\",\"XOF\":\"XOF\",\"YER\":\"YER\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:32:31'),
(47, 0, 123, 'Advance Cash', 'AdvCash', 1, '{\"account_email\":{\"title\":\"Account Email\",\"global\":true,\"value\":\"----\"},\"api_name\":{\"title\":\"API Name\",\"global\":true,\"value\":\"----\"},\"api_password\":{\"title\":\"API Password\",\"global\":true,\"value\":\"----\"}}', '{\"USD\":\"USD\", \"EUR\":\"EUR\", \"GBP\":\"GBP\", \"RUB\":\"RUB\", \"BRL\":\"BRL\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"KZT\":\"KZT\", \"VND\":\"VND\"}', 0, '', NULL, NULL, '2022-08-31 06:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(42, 'VoguePay - USD', 'USD', '$', 108, 'Voguepay', '1.00000000', '1000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"merchant_id\":\"demo\"}', '2020-09-26 04:52:09', '2020-09-26 04:52:09'),
(75, 'Skrill - AED', 'AED', '$', 104, 'Skrill', '1.00000000', '10000.00000000', '1.00', '1.00000000', '10.00000000', NULL, '{\"pay_to_email\":\"merchant@skrill.com\",\"secret_key\":\"---\"}', '2021-05-19 12:04:56', '2021-05-19 12:04:56'),
(76, 'Skrill - USD', 'USD', '$', 104, 'Skrill', '1.00000000', '10000.00000000', '1.00', '1.00000000', '2.00000000', NULL, '{\"pay_to_email\":\"merchant@skrill.com\",\"secret_key\":\"---\"}', '2021-05-19 12:04:56', '2021-05-19 12:04:56'),
(82, 'Paypal Express - USD', 'USD', '$', 113, 'PaypalSdk', '1.00000000', '1000000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"clientId\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\",\"clientSecret\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}', '2021-05-21 00:00:14', '2021-05-21 00:00:14'),
(83, 'Paypal - USD', 'USD', '$', 101, 'Paypal', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"paypal_email\":\"sb-owud61543012@business.example.com\"}', '2021-05-21 00:04:38', '2021-05-21 00:04:38'),
(96, 'PayStack - NGN', 'NGN', '₦', 107, 'Paystack', '1.00000000', '10000.00000000', '1.00', '1.00000000', '420.00000000', NULL, '{\"public_key\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\",\"secret_key\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}', '2021-05-21 01:52:11', '2021-05-21 01:52:11'),
(97, 'CoinPayments - BTC', 'BTC', '$', 503, 'Coinpayments', '1.00000000', '10000.00000000', '10.00', '1.00000000', '10.00000000', NULL, '{\"public_key\":\"---------------\",\"private_key\":\"------------\",\"merchant_id\":\"93a1e014c4ad60a7980b4a7239673cb4\"}', '2021-05-21 02:07:14', '2021-05-21 02:07:14'),
(109, 'Mollie - USD', 'USD', '$', 115, 'Mollie', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"mollie_email\":\"vi@gmail.com\",\"api_key\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}', '2021-05-21 02:44:45', '2021-05-21 02:44:45'),
(113, 'Instamojo - INR', 'INR', '₹', 112, 'Instamojo', '1.00000000', '10000.00000000', '1.00', '1.00000000', '75.00000000', NULL, '{\"api_key\":\"test_2241633c3bc44a3de84a3b33969\",\"auth_token\":\"test_279f083f7bebefd35217feef22d\",\"salt\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}', '2021-05-21 02:57:00', '2021-05-21 02:57:00'),
(115, 'Flutterwave - USD', 'USD', 'USD', 109, 'Flutterwave', '1.00000000', '2000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"public_key\":\"----------------\",\"secret_key\":\"-----------------------\",\"encryption_key\":\"------------------\"}', '2021-06-05 11:37:45', '2021-06-05 11:37:45'),
(116, 'PayTM - AUD', 'AUD', '$', 105, 'Paytm', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"MID\":\"DIY12386817555501617\",\"merchant_key\":\"bKMfNxPPf_QdZppa\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"transaction_url\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\",\"transaction_status_url\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}', '2021-06-14 12:16:39', '2021-06-14 12:16:39'),
(117, 'PayTM - USD', 'USD', '$', 105, 'Paytm', '1.00000000', '10000.00000000', '1.00', '1.00000000', '2.00000000', NULL, '{\"MID\":\"DIY12386817555501617\",\"merchant_key\":\"bKMfNxPPf_QdZppa\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"transaction_url\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\",\"transaction_status_url\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}', '2021-06-14 12:16:39', '2021-06-14 12:16:39'),
(121, 'Cashmaal - PKR', 'PKR', 'pkr', 116, 'Cashmaal', '1.00000000', '10000.00000000', '10.00', '1.00000000', '100.00000000', NULL, '{\"web_id\":\"3748\",\"ipn_key\":\"546254628759524554647987\"}', '2021-06-22 08:05:04', '2021-06-22 08:05:04'),
(136, 'CoinPayments Fiat - USD', 'USD', '$', 504, 'CoinpaymentsFiat', '1.00000000', '10000.00000000', '10.00', '1.00000000', '10.00000000', NULL, '{\"merchant_id\":\"6515561\"}', '2022-03-10 03:55:32', '2022-03-10 03:55:32'),
(137, 'CoinPayments Fiat - AUD', 'AUD', '$', 504, 'CoinpaymentsFiat', '1.00000000', '10000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"merchant_id\":\"6515561\"}', '2022-03-10 03:55:32', '2022-03-10 03:55:32'),
(140, 'Payeer - USD', 'USD', '$', 106, 'Payeer', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"merchant_id\":\"866989763\",\"secret_key\":\"7575\"}', '2022-03-21 02:54:29', '2022-03-21 02:54:29'),
(142, 'Blockchain - BTC', 'BTC', '$', 501, 'Blockchain', '1.00000000', '1.11000000', '1.00', '11.00000000', '1.00000000', NULL, '{\"api_key\":\"55529946-05ca-48ff-8710-f279d86b1cc5\",\"xpub_code\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}', '2022-03-21 03:53:18', '2022-03-21 03:53:18'),
(144, 'Coinbase Commerce - USD', 'USD', '$', 506, 'CoinbaseCommerce', '1.00000000', '10000.00000000', '10.00', '1.00000000', '10.00000000', NULL, '{\"api_key\":\"c47cd7df-d8e8-424b-a20a\",\"secret\":\"55871878-2c32-4f64-ab66\"}', '2022-03-30 07:48:19', '2022-03-30 07:48:19'),
(145, 'CoinPayments - ETH', 'JPY', '111', 506, 'CoinbaseCommerce', '1.00000000', '11.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"api_key\":\"c47cd7df-d8e8-424b-a20a\",\"secret\":\"55871878-2c32-4f64-ab66\"}', '2022-03-30 07:48:19', '2022-03-30 07:48:19'),
(151, 'Coingate - USD', 'USD', '$', 505, 'Coingate', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"api_key\":\"6354mwVCEw5kHzRJ6thbGo-N\"}', '2022-03-30 09:24:57', '2022-03-30 09:24:57'),
(152, 'Stripe Checkout - USD', 'USD', 'USD', 114, 'StripeV3', '10.00000000', '1000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"secret_key\":\"----------------------------\",\"publishable_key\":\"----------------------------\",\"end_point\":\"----------------------------\"}', '2022-12-27 07:41:08', '2022-12-27 07:41:08'),
(153, 'Stripe Storefront - USD', 'USD', '$', 111, 'StripeJs', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"secret_key\":\"----------------------------\",\"publishable_key\":\"----------------------------\"}', '2022-12-27 07:41:13', '2022-12-27 07:41:13'),
(154, 'Stripe Hosted - USD', 'USD', '$', 103, 'Stripe', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"secret_key\":\"----------------------------\",\"publishable_key\":\"----------------------------\"}', '2022-12-27 07:41:18', '2022-12-27 07:41:18'),
(155, 'RazorPay - INR', 'INR', '$', 110, 'Razorpay', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"key_id\":\"----------------------------\",\"key_secret\":\"----------------------------\"}', '2022-12-27 07:41:25', '2022-12-27 07:41:25'),
(156, 'Perfect Money - USD', 'USD', '$', 102, 'PerfectMoney', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"passphrase\":\"----------------------------\",\"wallet_id\":\"U30603391\"}', '2022-12-27 07:41:30', '2022-12-27 07:41:30');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `secondary_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `socialite_credentials` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `language_status` tinyint(1) NOT NULL DEFAULT 1,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `multi_language` tinyint(1) NOT NULL DEFAULT 1,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `system_info` text DEFAULT NULL,
  `default_package_id` int(11) NOT NULL DEFAULT 0,
  `chat_attachment` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `socialite_credentials`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `language_status`, `secure_password`, `agree`, `multi_language`, `registration`, `active_template`, `system_info`, `default_package_id`, `chat_attachment`, `created_at`, `updated_at`) VALUES
(1, 'Divorced Community', 'BDT', '৳', 'info@divorcedcommunity.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td></tr></tbody></table></td></tr></tbody></table><table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\"><table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\"><br>Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', 'info@divorcedcommunity.com', '1072b9', '2aa9e0', '{\"name\":\"smtp\",\"host\":\"mail.divorcedcommunity.com\",\"port\":\"465\",\"enc\":\"ssl\",\"username\":\"info@divorcedcommunity.com\",\"password\":\".&z#HL4xCKc@\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', '{\"google\":{\"client_id\":\"458455189107-pbmu02bnrueauidkkbjsvb8fpmj1bui8.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":1},\"facebook\":{\"client_id\":\"5800446726644276\",\"client_secret\":\"4b5f3a276e9ffa821a2d1045d725cc87\",\"status\":1},\"linkedin\":{\"client_id\":\"86dqvuedhgeh0f\",\"client_secret\":\"4cvyD84touHhxAwn\",\"status\":1}}', 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'basic', '[]', 1, 1, NULL, '2023-04-12 08:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `ignored_profiles`
--

CREATE TABLE `ignored_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ignored_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55'),
(11, 'Spanish', 'es', 0, '2022-12-26 15:46:13', '2022-12-26 15:46:13');

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Divorced', '2023-04-03 09:58:13', '2023-04-03 16:14:22'),
(2, 'Never Married', '2023-04-03 09:58:36', '2023-04-11 18:07:31'),
(3, 'Widowed', '2023-04-03 16:14:32', '2023-04-03 16:14:32'),
(4, 'Married', '2023-04-11 18:03:36', '2023-04-11 18:03:36'),
(5, 'Awaiting to be divorced', '2023-04-11 18:06:42', '2023-04-11 18:06:42'),
(6, 'Separated', '2023-04-11 18:07:21', '2023-04-11 18:07:21');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `receiver_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `file` varchar(40) DEFAULT NULL,
  `read_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `receiver_id`, `message`, `file`, `read_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'hlw', NULL, 1, '2023-04-10 07:02:16', '2023-04-10 07:02:43'),
(2, 1, 3, 1, 'HI', NULL, 1, '2023-04-10 07:02:47', '2023-04-10 07:03:47'),
(3, 1, 1, 3, 'KMN ACEN?', NULL, 1, '2023-04-10 07:02:59', '2023-04-10 07:03:11'),
(4, 1, 3, 1, 'ALHAMDULILLAH,,,,, APNI KMN ACEN?', NULL, 1, '2023-04-10 07:03:28', '2023-04-10 07:03:47'),
(5, 1, 3, 1, NULL, '6433b4c7aac371681110215.jpg', 1, '2023-04-10 07:03:35', '2023-04-10 07:03:47'),
(6, 1, 1, 3, 'NICE', NULL, 1, '2023-04-10 07:03:42', '2023-04-10 07:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'smtp', 'info@divorcedcommunity.com', 'reafatul@gmail.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td></tr></tbody></table></td></tr></tbody></table><table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\"><table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\"><br>Hello Anik Rifat (anikrifat)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">Your email verification code is:</span><font size=\"6\" style=\"color: var(--bs-body-color); text-align: var(--bs-body-text-align);\"><span style=\"font-weight: bolder;\">&nbsp;334765</span></font><br></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Divorced Community</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-04-03 09:55:18', '2023-04-03 09:55:18'),
(2, 2, 'smtp', 'info@divorcedcommunity.com', 'rezahasan1183@gmail.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td></tr></tbody></table></td></tr></tbody></table><table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\"><table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\"><br>Hello MD Reza Hasan (md_reza_11)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">Your email verification code is:</span><font size=\"6\" style=\"color: var(--bs-body-color); text-align: var(--bs-body-text-align);\"><span style=\"font-weight: bolder;\">&nbsp;781502</span></font><br></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Divorced Community of Bangladesh</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-04-10 06:38:39', '2023-04-10 06:38:39'),
(3, 3, 'smtp', 'info@divorcedcommunity.com', 'faria@gmail.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td></tr></tbody></table></td></tr></tbody></table><table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\"><table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\"><br>Hello mahfuza faria (mahfuza)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">Your email verification code is:</span><font size=\"6\" style=\"color: var(--bs-body-color); text-align: var(--bs-body-text-align);\"><span style=\"font-weight: bolder;\">&nbsp;683471</span></font><br></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Divorced Community of Bangladesh</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-04-10 06:51:57', '2023-04-10 06:51:57'),
(4, 4, 'smtp', 'info@divorcedcommunity.com', 'telitokbangla@gmail.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td></tr></tbody></table></td></tr></tbody></table><table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\"><table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\"><br>Hello Zihad Sikder (zihad46)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">Your email verification code is:</span><font size=\"6\" style=\"color: var(--bs-body-color); text-align: var(--bs-body-text-align);\"><span style=\"font-weight: bolder;\">&nbsp;960355</span></font><br></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Divorced Community of Bangladesh</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-04-10 07:45:08', '2023-04-10 07:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 06:00:00', '2022-04-02 20:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 06:00:00', '2022-04-02 20:24:11'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 06:00:00', '2022-03-20 14:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 06:00:00', '2022-04-04 21:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 06:00:00', '2022-03-20 14:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">Your email verification code is:</span><font size=\"6\" style=\"color: var(--bs-body-color); text-align: var(--bs-body-text-align);\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font><br></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 06:00:00', '2023-04-03 09:52:15'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 06:00:00', '2022-03-20 13:24:37'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 07:14:22', '2021-11-04 03:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, '[]', 1, 1, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', NULL, NULL, '[]', 1, 1, NULL, NULL),
(18, 'PAYMENT_COMPLETE', 'Payment Complete', 'Your payment has been completed', '<div style=\"font-family: Montserrat, sans-serif;\">Your payment has been completed.</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your payment:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Package : {{package}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your payment has been completed.\r\n\r\nDetails of your payment:\r\n\r\nAmount : {{amount}} {{site_currency}}\r\nCharge: {{charge}} {{site_currency}}\r\n\r\nPaid via :  {{method_name}}\r\nPackage : {{package}}', '{\r\n    \"method_name\":\"Name of the deposit method\",\r\n    \"package\":\"package name\",\r\n    \"method_currency\":\"Currency of the deposit method\",\r\n    \"method_amount\":\"Amount after conversion between base currency and method currency\",\r\n    \"amount\":\"Amount inserted by the user\",\r\n    \"charge\":\"Gateway charge set by the admin\"\r\n}', 1, 0, '2021-11-03 06:00:00', '2022-12-26 09:34:30'),
(19, 'PAYMENT_REQUEST', 'Payment- Manual - Requested', 'Payment Request Submitted Successfully', '<div>Your payment request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your payment:<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Package : {{package}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} payment requested by {{method_name}}. Charge: {{charge}} . package: {{package}}', '{\"package\":\"package name\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 06:00:00', '2022-08-24 06:39:58'),
(20, 'PAYMENT_REJECT', 'Payment- Manual - Rejected', 'Your Payment Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Package was : {{pacage}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"package\":\"package\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 0, '2021-11-03 06:00:00', '2022-08-24 07:09:18'),
(21, 'PAYMENT_APPROVE', 'Payment Approve', 'Your payment has been approve', '<div style=\"font-family: Montserrat, sans-serif;\">Your payment has been approved.</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your payment:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Package : {{package}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your payment has been approved.\r\n\r\nDetails of your payment:\r\n\r\nAmount : {{amount}} {{site_currency}}\r\nCharge: {{charge}} {{site_currency}}\r\n\r\nPaid via :  {{method_name}}\r\nPackage : {{package}}', '{\r\n    \"method_name\":\"Name of the deposit method\",\r\n    \"package\":\"package name\",\r\n    \"method_currency\":\"Currency of the deposit method\",\r\n    \"method_amount\":\"Amount after conversion between base currency and method currency\",\r\n    \"amount\":\"Amount inserted by the user\",\r\n    \"charge\":\"Gateway charge set by the admin\"\r\n}', 1, 0, '2021-11-03 06:00:00', '2022-12-26 09:34:16');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `interest_express_limit` int(10) NOT NULL DEFAULT 0,
  `contact_view_limit` int(10) NOT NULL DEFAULT 0,
  `image_upload_limit` int(10) NOT NULL DEFAULT 0,
  `validity_period` int(10) NOT NULL DEFAULT 0,
  `price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `interest_express_limit`, `contact_view_limit`, `image_upload_limit`, `validity_period`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Free Package', 1, 1, 1, 3, '0.00000000', 1, '2023-04-03 09:09:32', '2023-04-03 16:06:50'),
(2, 'Basic', 10, 10, 10, 30, '3000.00000000', 1, '2023-04-03 16:08:58', '2023-04-03 16:08:58'),
(3, 'Standard', 30, 30, 30, 45, '5000.00000000', 1, '2023-04-03 16:09:31', '2023-04-03 16:09:31'),
(4, 'Silver', 45, 45, 45, 60, '7000.00000000', 1, '2023-04-03 16:10:02', '2023-04-03 16:10:02'),
(5, 'Gold', 60, 60, 60, 90, '10000.00000000', 1, '2023-04-03 16:10:31', '2023-04-03 16:10:31'),
(6, 'Diamond', 100, 100, 100, 365, '20000.00000000', 1, '2023-04-03 16:11:14', '2023-04-03 16:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"about\",\"member\",\"package\",\"how_it_work\",\"stories\",\"testimonial\",\"faq\",\"counter\"]', 1, '2020-07-11 06:23:58', '2023-04-11 10:24:42'),
(4, 'Story', 'stories', 'templates.basic.', '[\"about\",\"counter\"]', 1, '2020-10-22 01:14:43', '2022-12-11 07:31:33'),
(5, 'Contact', 'contact', 'templates.basic.', '[\"about\"]', 1, '2020-10-22 01:14:53', '2022-12-11 08:43:57'),
(19, 'Packages', 'packages', 'templates.basic.', '[\"about\"]', 1, '2022-06-08 10:53:44', '2022-12-04 09:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `partner_expectations`
--

CREATE TABLE `partner_expectations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `general_requirement` varchar(255) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `min_age` int(10) UNSIGNED DEFAULT 0,
  `max_age` int(10) UNSIGNED DEFAULT 0,
  `min_height` decimal(8,2) DEFAULT 0.00,
  `max_weight` decimal(8,2) DEFAULT 0.00,
  `marital_status` varchar(40) DEFAULT NULL,
  `religion` varchar(40) DEFAULT NULL,
  `complexion` varchar(255) DEFAULT NULL,
  `smoking_status` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '3 = doesn''t matter, 1= smoker, 2= non-smoker',
  `drinking_status` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '3=doesn''t matter, 1=drunker, 2=restrained/non-drunker',
  `language` varchar(255) NOT NULL DEFAULT '[]',
  `min_degree` varchar(40) DEFAULT NULL,
  `profession` varchar(40) DEFAULT NULL,
  `personality` varchar(40) DEFAULT NULL,
  `financial_condition` varchar(40) DEFAULT NULL,
  `family_position` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partner_expectations`
--

INSERT INTO `partner_expectations` (`id`, `user_id`, `general_requirement`, `country`, `min_age`, `max_age`, `min_height`, `max_weight`, `marital_status`, `religion`, `complexion`, `smoking_status`, `drinking_status`, `language`, `min_degree`, `profession`, `personality`, `financial_condition`, `family_position`, `created_at`, `updated_at`) VALUES
(1, 1, 'height should be like a lilliput, long hair like amazon forest', 'Haiti', 20, 24, '5.50', '90.00', 'Divvorced', 'Muslim', 'cxzxcvbnm,k', 1, 1, '[\"somalian\"]', 'PSC', 'Doctor', 'Arabian', 'poor', 'billionier', '2023-04-03 10:05:47', '2023-04-03 10:05:47'),
(2, 5, 'Fuga Rerum aut ea m', 'Turks and Caicos Islands', 63, 77, '41.00', '26.00', 'single', 'Muslim', 'Velit dignissimos sa', 2, 1, '[\"Saepe\"]', 'Quis ipsa pariatur', 'Officiis consectetur', 'Est et quam dolore q', 'Vel doloremque aut e', 'Omnis magnam reprehe', '2023-04-10 08:03:44', '2023-04-10 08:03:44'),
(3, 6, 'Vel quibusdam autem', 'Saint Barthelemy', 99, 59, '18.00', '77.00', 'Divorced', 'Buddhist', 'Voluptates et fugiat', 1, 1, '[]', 'Similique ducimus e', 'Placeat corrupti q', 'Quo aliqua Saepe qu', 'Proident molestiae', 'In mollitia voluptat', '2023-04-10 08:07:41', '2023-04-10 08:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physical_attributes`
--

CREATE TABLE `physical_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `height` decimal(8,2) NOT NULL DEFAULT 0.00,
  `weight` decimal(8,2) NOT NULL DEFAULT 0.00,
  `blood_group` varchar(40) DEFAULT NULL,
  `eye_color` varchar(40) DEFAULT NULL,
  `hair_color` varchar(40) DEFAULT NULL,
  `complexion` varchar(255) DEFAULT NULL,
  `disability` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `physical_attributes`
--

INSERT INTO `physical_attributes` (`id`, `user_id`, `height`, `weight`, `blood_group`, `eye_color`, `hair_color`, `complexion`, `disability`, `created_at`, `updated_at`) VALUES
(1, 1, '62.00', '85.00', 'O+', 'cyan', 'Megenda', 'gfgfhgfhfh', 'fully Disabled', '2023-04-03 10:03:27', '2023-04-03 10:03:27'),
(2, 5, '70.00', '97.00', 'AB-', 'Ut voluptatibus quis', 'Ex magni sed dolor d', 'Dolor libero ipsum a', 'Molestiae sunt aut', '2023-04-10 08:03:29', '2023-04-10 08:03:29'),
(3, 6, '19.00', '73.00', 'O-', 'Molestiae non proide', 'Sunt aliquam eius ei', 'Et amet sunt deseru', 'Consequatur incidun', '2023-04-10 08:07:23', '2023-04-10 08:07:23'),
(4, 7, '52.00', '58.00', 'B+', 'asccac', 'acsac', 'ascasc', 'ascc', '2023-04-11 16:02:58', '2023-04-11 16:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_histories`
--

CREATE TABLE `purchase_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `package_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `package_details` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = payment initiate; 1 = purchased ; 2 = payment pending 3 = payment rejected\r\n\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_histories`
--

INSERT INTO `purchase_histories` (`id`, `user_id`, `package_id`, `package_details`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '{\"name\":\"Standard\",\"interest_express_limit\":30,\"contact_view_limit\":30,\"image_upload_limit\":30,\"validity_period\":45,\"price\":\"5000.00000000\"}', 0, '2023-04-04 09:17:03', '2023-04-04 09:17:03'),
(2, 1, 6, '{\"name\":\"Diamond\",\"interest_express_limit\":100,\"contact_view_limit\":100,\"image_upload_limit\":100,\"validity_period\":365,\"price\":\"20000.00000000\"}', 0, '2023-04-04 09:17:41', '2023-04-04 09:17:41'),
(3, 1, 2, '{\"name\":\"Basic\",\"interest_express_limit\":10,\"contact_view_limit\":10,\"image_upload_limit\":10,\"validity_period\":30,\"price\":\"3000.00000000\"}', 0, '2023-04-04 09:18:35', '2023-04-04 09:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `religion_infos`
--

CREATE TABLE `religion_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religion_infos`
--

INSERT INTO `religion_infos` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Muslim', '2023-04-03 09:57:04', '2023-04-03 09:57:04'),
(2, 'Hindu', '2023-04-03 09:57:10', '2023-04-03 09:57:10'),
(3, 'Buddhist', '2023-04-03 09:57:23', '2023-04-03 09:57:23'),
(4, 'Christian', '2023-04-03 16:13:18', '2023-04-03 16:13:18'),
(5, 'Atheist', '2023-04-11 18:10:15', '2023-04-11 18:10:15'),
(6, 'Parsi', '2023-04-11 18:11:43', '2023-04-11 18:11:43'),
(7, 'Jain', '2023-04-11 18:11:52', '2023-04-11 18:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `complaint_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(40) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `short_listed_profiles`
--

CREATE TABLE `short_listed_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_listed_profiles`
--

INSERT INTO `short_listed_profiles` (`id`, `user_id`, `profile_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2023-04-10 07:49:12', '2023-04-10 07:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'sdvsdv', '2023-04-03 14:49:12', '2023-04-03 14:49:12'),
(2, 1, 1, 'Thanks for your patience.', '2023-04-03 14:50:16', '2023-04-03 14:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 0, 'svsdvsdv', 'palak.mining@yahoo.com', '76499392', 'dsdv', 3, 2, '2023-04-03 20:50:16', '2023-04-03 14:49:12', '2023-04-03 14:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `looking_for` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Bridegroom; 2 = Bride\r\n',
  `username` varchar(40) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `skipped_step` varchar(40) NOT NULL DEFAULT '[]',
  `completed_step` varchar(40) NOT NULL DEFAULT '[]',
  `total_step` int(11) NOT NULL DEFAULT 6 COMMENT '1 = basic info, 2 = family info; 3 = education info; 4 = career info; 5 = physical attributes; 6 = partner expectation ',
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `tsc` varchar(255) DEFAULT NULL,
  `login_by` varchar(40) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `profile_id`, `firstname`, `lastname`, `looking_for`, `username`, `address`, `email`, `country_code`, `mobile`, `balance`, `password`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `profile_complete`, `skipped_step`, `completed_step`, `total_step`, `ver_code`, `ver_code_send_at`, `tsc`, `login_by`, `ban_reason`, `remember_token`, `image`, `created_at`, `updated_at`) VALUES
(1, 50419712, 'Anik', 'Rifat', 2, 'anikrifat', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Singapore\",\"city\":\"\"}', 'reafatul@gmail.com', 'SG', '651643675060', '0.00000000', '$2y$10$Hky/b0kdNuNKF013o6wNU.94pICfg5lpDahwbXOA5VrLtSXZzO8D6', 1, NULL, 1, 1, 1, 1, '[]', '[1,2,3,4,5,6]', 6, NULL, NULL, NULL, NULL, NULL, NULL, '6433befa5da971681112826.jpg', '2023-04-03 08:24:20', '2023-04-10 07:47:06'),
(2, 33569032, 'MD Reza', 'Hasan', 2, 'md_reza_11', '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Bangladesh\"}', 'rezahasan1183@gmail.com', 'BD', '8801863735355', '0.00000000', '$2y$10$77KzEOmPWHMT7XWOT7Iz6uzdPjrSEa.p4fuo2KSrz2o9n9NnXJt42', 1, NULL, 1, 1, 1, 1, '[1,2,3,4,5,6]', '[]', 6, '781502', '2023-04-10 12:38:37', NULL, NULL, NULL, NULL, '6435364b524111681208907.jpg', '2023-04-10 06:38:37', '2023-04-11 10:28:27'),
(3, 22467300, 'mahfuza', 'faria', 1, 'mahfuza', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 'faria@gmail.com', 'BD', '88001643675060', '0.00000000', '$2y$10$O463OOqdCCiVjea1bSfIb.30wEuOexUbvQJSj856.gW5oWFpeZNBG', 1, NULL, 1, 1, 1, 1, '[1,2,3,4,5,6]', '[]', 6, NULL, NULL, NULL, NULL, NULL, NULL, '643536172c3dd1681208855.jpg', '2023-04-10 06:51:55', '2023-04-11 10:27:35'),
(4, 78737785, 'Zihad', 'Sikder', 1, 'zihad46', '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Bangladesh\"}', 'telitokbangla@gmail.com', 'BD', '88001854823849', '0.00000000', '$2y$10$ZbQa0oCOLlSHB55Jr0uJcOV/EbCbGrdE.B79EL6twZPLV3gXK0qXG', 1, NULL, 1, 1, 1, 1, '[1,2,3,4,5,6]', '[]', 6, '960355', '2023-04-10 13:45:07', NULL, NULL, NULL, NULL, '643535efc78911681208815.jpg', '2023-04-10 07:45:06', '2023-04-11 10:26:55'),
(5, 46645286, 'Joshua', 'Navarro', 2, 'vigityvunu', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Papua New Guinea\",\"city\":\"\"}', 'gehulit@mailinator.com', 'PG', '67577', '0.00000000', '$2y$10$hJLmcIaHdCGS2ENt9OZ/murlHwL9SsSZlHe4qWOK7QQ9P2ORllfJW', 0, NULL, 1, 1, 1, 1, '[]', '[1,2,3,4,5,6]', 6, NULL, NULL, NULL, NULL, 'idk', NULL, NULL, '2023-04-10 08:01:11', '2023-04-11 10:25:41'),
(6, 36248015, 'Colorado', 'Mcleod', 1, 'rasozimavi', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Andorra\",\"city\":\"\"}', 'quwi@mailinator.com', 'AD', '37649', '0.00000000', '$2y$10$7Oo4KpGH/FI37R/b/jjFMu5rukrVBVhuyqSeTMzcDii3p/ozNr6Cq', 1, NULL, 1, 1, 1, 1, '[1]', '[2,3,4,5,6]', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-10 08:05:46', '2023-04-10 08:07:41'),
(7, 77297935, 'Hadiuzzaman', 'Palak', 2, 'hpalak', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 'ceo@monoputo.com', 'BD', '8801717134606', '0.00000000', '$2y$10$hTi2gZoInEVVIeSylGYupOdIsOpb5ksbz51zQ4inP2m2.K/4PHAqy', 1, NULL, 1, 1, 1, 1, '[3,4,6]', '[1,2,5]', 6, NULL, NULL, NULL, NULL, NULL, NULL, '643584d4774121681229012.jpg', '2023-04-11 10:49:12', '2023-04-11 16:03:32'),
(8, 96519806, 'anik', 'rifat', 2, 'anikrifat2011', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 'fakedata81913@gmail.com', 'BD', '8800170756865', '0.00000000', '$2y$10$WsmHtg3rI7IsdAncT1S2h.HeWQYI/NNGT01EkwnJIFMsMEYpA1Qb2', 1, NULL, 1, 1, 1, 0, '[]', '[]', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 15:53:03', '2023-04-11 15:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contact_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `interesting_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`id`, `user_id`, `interesting_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2023-04-10 07:01:18', '2023-04-10 07:02:07'),
(2, 1, 2, 0, '2023-04-11 10:35:54', '2023-04-11 10:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_limitations`
--

CREATE TABLE `user_limitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `package_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `interest_express_limit` int(10) NOT NULL DEFAULT 0 COMMENT '-1 = unlimited',
  `contact_view_limit` int(10) NOT NULL DEFAULT 0 COMMENT '-1 = unlimited',
  `image_upload_limit` int(11) NOT NULL DEFAULT 0 COMMENT '-1= unlimited',
  `validity_period` int(10) NOT NULL DEFAULT 0 COMMENT '-1 = unlimited',
  `expire_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_limitations`
--

INSERT INTO `user_limitations` (`id`, `user_id`, `package_id`, `interest_express_limit`, `contact_view_limit`, `image_upload_limit`, `validity_period`, `expire_date`, `created_at`, `updated_at`) VALUES
(1, 1, 3, -1, -1, -1, -1, '2023-04-03', '2023-04-03 08:24:20', '2023-04-03 08:24:20'),
(2, 2, 1, 1, 1, 1, 3, '2023-04-13', '2023-04-10 06:38:37', '2023-04-10 06:38:37'),
(3, 3, 6, -1, -1, -1, -1, '2023-04-13', '2023-04-10 06:51:55', '2023-04-10 06:51:55'),
(4, 4, 1, 1, 1, 1, 3, '2023-04-13', '2023-04-10 07:45:06', '2023-04-10 07:45:06'),
(5, 5, 1, 1, 1, 1, 3, '2023-04-13', '2023-04-10 08:01:11', '2023-04-10 08:01:11'),
(6, 6, 1, 1, 1, 1, 3, '2023-04-13', '2023-04-10 08:05:46', '2023-04-10 08:05:46'),
(7, 7, 1, 1, 1, 1, 3, '2023-04-14', '2023-04-11 10:49:12', '2023-04-11 10:49:12'),
(8, 8, 1, 1, 1, 1, 3, '2023-04-14', '2023-04-11 15:53:03', '2023-04-11 15:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-03 08:24:20', '2023-04-03 08:24:20'),
(2, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-03 09:55:17', '2023-04-03 09:55:17'),
(3, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-04 06:18:24', '2023-04-04 06:18:24'),
(4, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-04 09:16:06', '2023-04-04 09:16:06'),
(5, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-04 09:38:18', '2023-04-04 09:38:18'),
(6, 2, '103.141.64.7', 'Chittagong', 'Bangladesh', 'BD', '91.8292', '22.3396', 'Chrome', 'Windows 10', '2023-04-10 06:38:37', '2023-04-10 06:38:37'),
(7, 3, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-10 06:51:55', '2023-04-10 06:51:55'),
(8, 3, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-10 06:59:38', '2023-04-10 06:59:38'),
(9, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-10 07:01:54', '2023-04-10 07:01:54'),
(10, 4, '103.205.134.83', 'Dhaka', 'Bangladesh', 'BD', '90.4093', '23.7272', 'Handheld Browser', 'Android', '2023-04-10 07:45:06', '2023-04-10 07:45:06'),
(11, 5, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-10 08:01:11', '2023-04-10 08:01:11'),
(12, 6, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-10 08:05:46', '2023-04-10 08:05:46'),
(13, 1, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-11 10:35:38', '2023-04-11 10:35:38'),
(14, 7, '103.218.24.57', '', 'Singapore', 'SG', '103.8014', '1.3673', 'Chrome', 'Windows 10', '2023-04-11 10:49:12', '2023-04-11 10:49:12'),
(15, 8, '103.205.134.85', 'Dhaka', 'Bangladesh', 'BD', '90.4093', '23.7272', 'Chrome', 'Windows 10', '2023-04-11 15:53:04', '2023-04-11 15:53:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_infos`
--
ALTER TABLE `basic_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_groups`
--
ALTER TABLE `blood_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_infos`
--
ALTER TABLE `career_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_views`
--
ALTER TABLE `contact_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education_infos`
--
ALTER TABLE `education_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_infos`
--
ALTER TABLE `family_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ignored_profiles`
--
ALTER TABLE `ignored_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_expectations`
--
ALTER TABLE `partner_expectations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `physical_attributes`
--
ALTER TABLE `physical_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_histories`
--
ALTER TABLE `purchase_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religion_infos`
--
ALTER TABLE `religion_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `short_listed_profiles`
--
ALTER TABLE `short_listed_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_limitations`
--
ALTER TABLE `user_limitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blood_groups`
--
ALTER TABLE `blood_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `career_infos`
--
ALTER TABLE `career_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_views`
--
ALTER TABLE `contact_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `education_infos`
--
ALTER TABLE `education_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `family_infos`
--
ALTER TABLE `family_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ignored_profiles`
--
ALTER TABLE `ignored_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `partner_expectations`
--
ALTER TABLE `partner_expectations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physical_attributes`
--
ALTER TABLE `physical_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_histories`
--
ALTER TABLE `purchase_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `religion_infos`
--
ALTER TABLE `religion_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `short_listed_profiles`
--
ALTER TABLE `short_listed_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_limitations`
--
ALTER TABLE `user_limitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
