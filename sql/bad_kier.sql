-- phpMyAdmin SQL Dump
-- version 4.4.14.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2016 at 11:35 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bad.kier`
--

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_akeeba_common`
--

CREATE TABLE IF NOT EXISTS `yp5e2_akeeba_common` (
  `key` varchar(255) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_akeeba_common`
--

INSERT INTO `yp5e2_akeeba_common` (`key`, `value`) VALUES
('stats_lastrun', '1465500570'),
('stats_siteid', '6d05cae4e0616daedfa909e689747b58bc19ce44'),
('stats_siteurl', '5b95cd8d36ebd8facbce9c11e8bc66f4');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_ak_profiles`
--

CREATE TABLE IF NOT EXISTS `yp5e2_ak_profiles` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci,
  `filters` longtext COLLATE utf8mb4_unicode_ci,
  `quickicon` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_ak_profiles`
--

INSERT INTO `yp5e2_ak_profiles` (`id`, `description`, `configuration`, `filters`, `quickicon`) VALUES
(1, 'Default Backup Profile', '###CTR128###rcwiV9/f39+z5xHFg27dlLozrokZP70+LUsQyQYRPoHNG71h6oiwzJBypcUUX1iG2EKQpA+96/vJ0RMReSk7ealtDVhf8W+q6+NS0NT437Gw9zlqOFxPfSdnzFPEV/s3Ny/Fmg/kQ8r8JP5ZsjfFz76p+9my0i273qMRCIGos468wFqD7QkmVLgNiwqyM9D3UN5oAEXsih6xvpy8hLYfJyOfnoQE4IMpWZwvI7FEqQoV+PwboAXXMQeJCgO6ufXj2vgz89cyevqFtkKLRD9o1+PDbpC8ry0bKCErHkO6IBNatyzbRDKgjTeiPq7ts8O6kZW50Y7WadLIRamLgw9DFnTa0xGi0VyNqSnfFC3dBWZ1c1n70+gzHd/y9gMgvrEGK4EWfDvK5BA2xHulhSb2WtfX9+TJSKCfLi0hONNAFDw9a5YgMHWGaqeFvK+QMlHVXNfK+Jce5d6sn5p3ogEfJjyLXaPe+V59V72AM3lYl6r0ELrtLmKKXwsNlAqoiZlC7iuTwqgvlkx8iPqrIMce60v7wd5aaTjNjOCTRJ273T6tCYN02zfHlax+Q5TFvoY3u8eNfdRSzTz7p0pyWVN+qjGiDgnF9uSFsmRkzSrHfkEJldAeDIMRurpFSBMhqWExYF36rPszaQLijiB3XlijzsSfaTZt9RoBpFMKmQC2tucyALK51LOzRw93HBSHlQAfOcs+LzQ3Dt6bymumCFTzrxYFDEsTMz7CtuVcG1+U864ntqsfJ2P380hpS4cwnGulea+aEBTCvtXH1ywRZomJGjvCMea/rT2IVaD4sn7qoaNgOFCDbZ+ci+MZpSx34Tmnu2ODFU85grYTQ3S9Nypavq+eNsrcCll2novw96myQCYiakdLx+p2I9xFd286opjx0m2sAAs+tpwRqpfj7dHXda3XVGp7jhGsF8WlYioIl4sdHnsIQVkPlafLe+WujS6pMluDd+TQnAhxev0psuzVFBLrdHa3Q+cBCHd1NFZV+obo4RaV2VE1UVO7T3jdE0B0yV6m1NouvoF4LBM4Uc6ImQuSUF1AdPSaBWNq3E4dPrk+Wg7dSiP8CsZWJ5KlNS303hgu/uCYenEsRmFSx9bcZRzwwVIC/pU0S9muopFCPw7Tis/TEL9JFACEHWE/GEgY6Gin1t0vxZw7hf2kR4DW+PWFvJ39+m7O/cRcpzGRf2gk/W9V1R8kXuF8FAx8YmsmgoOpAohARXM26W6n8znsrquqDbqAPeSg7LcCabNwaGBf2sTY1WETtk1gMuk4vW6LVKRcH0REfWJkf/ttY4GluRs47OLj1lGBDEWTH5nfMjmJxmg5W12gO68RndfXGBGn1t5ZoB7byUxFQ4mMWe2EHyTVpLH/AbQus6vECVsPopsUQQUeuUnKysoJezp/jIGDfd2hpkbuEmJMRve19jMAkNCAbjbvg+4LUPz+y5K3J4xoTHYMDqIZX4P+S9TMqhiaiBZ9S0dKhV8XiOfYB2M0Y5k53S3wjwKC4IEhPbKKTUO/SlQI6Z/J4uahMZmjjSFasGvaZALaiODL1sXUP1JbBemWibfP+fyzUNF/J0pI6vfCqp5qm9Jx8Z8+Zg/eN9lCSmvVTp6FAHkcuaQ9dGDXAM6fUAr3OiAFsVh37TNInMtK0bJJQ3zQ1XjTtWeK/+tTKn04gcSFsTRPpnB0fAorC46xH8FDe3q4lfFiJsS7IXWSfF83JUOOEuS5LRnk//ZoPUrV9Mr4nic4aJLFHjnD5v/lz8seh02n52zeA9EvTLy8vnS9oHnvN+QDvDmO8csAABXDDEYIc/KtJ9Ij5KVvqbfDASVXeoGdLnMS2zONY795y+ghcsGgNSmdtlXQGzRZU8+Prt19m05xPixBrFmjmUV4/KsoH45bkPsX3TcLZ6/Y+c1mbCc00hXYeuQ91kytcbTjqrBXhoK+QDroUIIdIQvAMTYUL2LoOU1Eu5QDhYJVEvGHpqrPwuICb4hDAQ7MJ9w7UaqohxTzY4NJb5FyIdI4xuTMwyiFvbShj1vBsfNW8GMBrml53pDHAomP20xaLg4qt0FCXQImMUJ/ls7uHFXzPZFSQqsAr5+eQZmTB4oER529xlrmzl0VU4qQZ/mQg7+/jtfTvQ2FGd9FJqW8fw6aEzCM3mazRsAFEz6umKRpeJBKS3s9GfbIyfaPPFAzxNBWlChlFjdoNfdtLwt0iWEcRsNeTIETlI0Y3G8bzQqsmjJZLHU72VQJZCIZZosuA9zPnzZAKsULLinZ1YV4s4NfBJroVCOqppL86TGcdvN8s8tNoBWjI+2UQytn0zXlBDHAZ8qwkL/X4Kns22MoosLh9jhDmG4gFYqKbjI1/xFVaE7NrHOgIrC5bdayKphFWtItTAEuHLA/HsZwnU7H3E54ss6/xmYCb7sU4UmATW7qk5tP/Wh/', 'a:1:{s:11:"directories";a:1:{s:10:"[SITEROOT]";a:1:{i:0;s:3:"old";}}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_ak_stats`
--

CREATE TABLE IF NOT EXISTS `yp5e2_ak_stats` (
  `id` bigint(20) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'run',
  `origin` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext COLLATE utf8mb4_unicode_ci,
  `absolute_path` longtext COLLATE utf8mb4_unicode_ci,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backupid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_ak_stats`
--

INSERT INTO `yp5e2_ak_stats` (`id`, `description`, `comment`, `backupstart`, `backupend`, `status`, `origin`, `type`, `profile_id`, `archivename`, `absolute_path`, `multipart`, `tag`, `backupid`, `filesexist`, `remote_filename`, `total_size`) VALUES
(21, 'Backup taken on Friday, 06 May 2016 06:58', '', '2016-05-06 04:58:24', '2016-05-06 04:58:44', 'complete', 'backend', 'full', 1, 'site-bad.kier.redhost.dk-20160506-065824.jpa', '/home/kier/domains/bad.kier.redhost.dk/public_html/administrator/components/com_akeeba/backup/site-bad.kier.redhost.dk-20160506-065824.jpa', 1, 'backend', 'id1', 0, NULL, 40447217),
(22, 'Backup taken on Wednesday, 11 May 2016 06:18', '', '2016-05-11 04:18:07', '2016-05-11 04:18:30', 'complete', 'backend', 'full', 1, 'site-bad.kier.redhost.dk-20160511-061807.jpa', '/home/kier/domains/bad.kier.redhost.dk/public_html/administrator/components/com_akeeba/backup/site-bad.kier.redhost.dk-20160511-061807.jpa', 1, 'backend', 'id22', 0, NULL, 43450924),
(23, 'Backup taken on Sunday, 15 May 2016 13:42', '', '2016-05-15 11:42:37', '2016-05-15 11:44:03', 'complete', 'backend', 'full', 1, 'site-bad.kier.redhost.dk-20160515-134237.jpa', '/home/kier/domains/bad.kier.redhost.dk/public_html/administrator/components/com_akeeba/backup/site-bad.kier.redhost.dk-20160515-134237.jpa', 1, 'backend', 'id23', 1, NULL, 43458850),
(24, 'Backup taken on Monday, 23 May 2016 03:11', '', '2016-05-23 01:11:30', '2016-05-23 01:12:21', 'complete', 'backend', 'full', 1, 'site-bad.kier.redhost.dk-20160523-031130.jpa', '/home/kier/domains/bad.kier.redhost.dk/public_html/administrator/components/com_akeeba/backup/site-bad.kier.redhost.dk-20160523-031130.jpa', 1, 'backend', 'id24', 1, NULL, 43782683),
(25, 'Backup taken on Friday, 03 June 2016 07:55', '', '2016-06-03 05:55:12', '2016-06-03 05:55:31', 'complete', 'backend', 'full', 1, 'site-bad.kier.redhost.dk-20160603-075512.jpa', '/home/kier/domains/bad.kier.redhost.dk/public_html/administrator/components/com_akeeba/backup/site-bad.kier.redhost.dk-20160603-075512.jpa', 1, 'backend', 'id25', 1, NULL, 45324780),
(26, 'Backup taken on Thursday, 09 June 2016 19:29', '', '2016-06-09 17:29:52', '0000-00-00 00:00:00', 'complete', 'backend', 'full', 1, 'site-bad.kier.redhost.dk-20160609-192952.jpa', '/home/kier/domains/bad.kier.redhost.dk/public_html/administrator/components/com_akeeba/backup/site-bad.kier.redhost.dk-20160609-192952.jpa', 0, 'backend', 'id26', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_ak_storage`
--

CREATE TABLE IF NOT EXISTS `yp5e2_ak_storage` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_assets`
--

CREATE TABLE IF NOT EXISTS `yp5e2_assets` (
  `id` int(10) unsigned NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_assets`
--

INSERT INTO `yp5e2_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 281, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 27, 28, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 29, 30, 1, 'com_login', 'com_login', '{}'),
(13, 1, 31, 32, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 33, 34, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 35, 36, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 37, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 110, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 111, 114, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 115, 116, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 117, 118, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 119, 120, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 121, 122, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 123, 128, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 129, 130, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 112, 113, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 124, 125, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 131, 132, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 133, 134, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 135, 136, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 137, 138, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 139, 140, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 141, 142, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 42, 43, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(40, 18, 44, 45, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 46, 47, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 48, 49, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 50, 51, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 52, 53, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 54, 55, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 56, 57, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 58, 59, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 60, 61, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 62, 63, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 64, 65, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 66, 67, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 18, 68, 69, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 70, 71, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 18, 72, 73, 2, 'com_modules.module.87', 'Popular Tags', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(55, 18, 74, 75, 2, 'com_modules.module.88', 'Site Information', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(56, 18, 76, 77, 2, 'com_modules.module.89', 'Release News', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(57, 18, 78, 79, 2, 'com_modules.module.90', 'Latest Articles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(58, 18, 80, 81, 2, 'com_modules.module.91', 'User Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(59, 18, 82, 83, 2, 'com_modules.module.92', 'Image Module', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(60, 18, 84, 85, 2, 'com_modules.module.93', 'Search', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(61, 27, 19, 20, 3, 'com_content.article.1', 'Getting Started', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(62, 1, 143, 144, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(63, 1, 145, 146, 1, 'com_akeeba', 'Akeeba', '{}'),
(64, 18, 86, 87, 2, 'com_modules.module.94', 'redCORE language switcher', '{}'),
(65, 1, 147, 148, 1, 'com_redcore', 'COM_REDCORE', '{}'),
(66, 1, 149, 150, 1, 'com_reditem', 'COM_REDITEM', '{}'),
(67, 1, 151, 266, 1, 'com_reditem.type.1', 'com_reditem.type.1', '{"category.view":{"1":1},"category.create":[],"category.delete":[],"category.edit":[],"category.edit.own":[],"item.view":{"1":1},"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(68, 1, 267, 272, 1, 'com_reditem.type.2', 'com_reditem.type.2', '{"category.view":[],"category.create":[],"category.delete":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(70, 67, 152, 153, 2, 'com_reditem.category.3', 'com_reditem.category.3', '{}'),
(71, 89, 165, 166, 3, 'com_reditem.item.1', 'com_reditem.item.1', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(72, 67, 154, 155, 2, 'com_reditem.item.2', 'com_reditem.item.2', '{}'),
(73, 68, 268, 269, 2, 'com_reditem.item.3', 'com_reditem.item.3', '{}'),
(74, 68, 270, 271, 2, 'com_reditem.item.4', 'com_reditem.item.4', '{}'),
(75, 18, 88, 89, 2, 'com_modules.module.95', 'Topbillede + tekst (forside)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(76, 18, 90, 91, 2, 'com_modules.module.96', 'Module custom Udstillingen', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(77, 18, 92, 93, 2, 'com_modules.module.97', 'Module custom Nyt bad', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(78, 18, 94, 95, 2, 'com_modules.module.98', '3 billeder på række', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(79, 18, 96, 97, 2, 'com_modules.module.99', 'Magasiner mm', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(80, 18, 98, 99, 2, 'com_modules.module.100', 'All box bottom', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(81, 18, 100, 101, 2, 'com_modules.module.101', 'Footer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(82, 67, 156, 163, 2, 'com_reditem.category.4', 'com_reditem.category.4', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(83, 90, 169, 170, 3, 'com_reditem.item.5', 'com_reditem.item.5', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(84, 99, 179, 180, 3, 'com_reditem.item.6', 'com_reditem.item.6', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(85, 1, 273, 274, 1, 'com_sh404sef', 'sh404SEF', '{"core.manage":[],"sh404sef.view.configuration":[],"sh404sef.view.urls":[],"sh404sef.view.aliases":[],"sh404sef.view.pageids":[],"sh404sef.view.metas":[],"sh404sef.view.analytics":[]}'),
(86, 1, 275, 276, 1, 'com_jce', 'JCE', '{}'),
(87, 24, 126, 127, 2, 'com_users.category.8', 'redWEB Support', '{}'),
(88, 82, 157, 158, 3, 'com_reditem.item.7', 'com_reditem.item.7', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(89, 67, 164, 167, 2, 'com_reditem.category.5', 'com_reditem.category.5', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(90, 67, 168, 175, 2, 'com_reditem.category.6', 'com_reditem.category.6', '{"category.view":[],"category.edit":{"1":1},"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(91, 82, 159, 160, 3, 'com_reditem.item.8', 'com_reditem.item.8', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(92, 67, 176, 177, 2, 'com_reditem.category.7', 'com_reditem.category.7', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(93, 104, 249, 250, 3, 'com_reditem.item.9', 'com_reditem.item.9', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(94, 104, 247, 248, 3, 'com_reditem.item.10', 'com_reditem.item.10', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(95, 104, 251, 252, 3, 'com_reditem.item.11', 'com_reditem.item.11', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(96, 1, 277, 278, 1, 'com_reditemcategoryfields', 'COM_REDITEMCATEGORYFIELDS', '{}'),
(97, 18, 102, 103, 2, 'com_modules.module.102', 'Bund nyheder', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(98, 1, 279, 280, 1, 'com_reditem.type.3', 'com_reditem.type.3', '{"category.view":[],"category.create":[],"category.delete":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(99, 67, 178, 185, 2, 'com_reditem.category.8', 'com_reditem.category.8', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(100, 99, 181, 182, 3, 'com_reditem.item.12', 'com_reditem.item.12', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(101, 99, 183, 184, 3, 'com_reditem.item.13', 'com_reditem.item.13', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(102, 67, 186, 245, 2, 'com_reditem.category.9', 'com_reditem.category.9', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(103, 18, 104, 105, 2, 'com_modules.module.103', 'Module Contact', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(104, 67, 246, 253, 2, 'com_reditem.category.10', 'com_reditem.category.10', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(105, 90, 171, 172, 3, 'com_reditem.item.14', 'com_reditem.item.14', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(106, 90, 173, 174, 3, 'com_reditem.item.15', 'com_reditem.item.15', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(108, 67, 254, 255, 2, 'com_reditem.category.12', 'com_reditem.category.12', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(110, 67, 256, 257, 2, 'com_reditem.category.14', 'com_reditem.category.14', '{"category.view":[],"category.edit":[],"category.edit.own":[],"item.view":[],"item.create":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(111, 18, 106, 107, 2, 'com_modules.module.104', 'Tilbud under tilbud', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(112, 67, 258, 259, 2, 'com_reditem.item.16', 'com_reditem.item.16', '{}'),
(113, 67, 260, 261, 2, 'com_reditem.item.17', 'com_reditem.item.17', '{}'),
(114, 67, 262, 263, 2, 'com_reditem.item.18', 'com_reditem.item.18', '{}'),
(115, 67, 264, 265, 2, 'com_reditem.item.19', 'com_reditem.item.19', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(116, 102, 187, 188, 3, 'com_reditem.item.20', 'com_reditem.item.20', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(117, 102, 189, 190, 3, 'com_reditem.item.21', 'com_reditem.item.21', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(118, 102, 191, 192, 3, 'com_reditem.item.22', 'com_reditem.item.22', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(119, 102, 193, 194, 3, 'com_reditem.item.23', 'com_reditem.item.23', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(120, 102, 195, 196, 3, 'com_reditem.item.24', 'com_reditem.item.24', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(121, 102, 197, 198, 3, 'com_reditem.item.25', 'com_reditem.item.25', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(122, 102, 199, 200, 3, 'com_reditem.item.26', 'com_reditem.item.26', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(123, 102, 201, 202, 3, 'com_reditem.item.27', 'com_reditem.item.27', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(124, 102, 203, 204, 3, 'com_reditem.item.28', 'com_reditem.item.28', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(125, 102, 205, 206, 3, 'com_reditem.item.29', 'com_reditem.item.29', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(126, 102, 207, 208, 3, 'com_reditem.item.30', 'com_reditem.item.30', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(127, 102, 209, 210, 3, 'com_reditem.item.31', 'com_reditem.item.31', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(128, 102, 211, 212, 3, 'com_reditem.item.32', 'com_reditem.item.32', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(129, 102, 213, 214, 3, 'com_reditem.item.33', 'com_reditem.item.33', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(130, 102, 221, 222, 3, 'com_reditem.item.34', 'com_reditem.item.34', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(131, 102, 219, 220, 3, 'com_reditem.item.35', 'com_reditem.item.35', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(132, 102, 225, 226, 3, 'com_reditem.item.36', 'com_reditem.item.36', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(133, 102, 227, 228, 3, 'com_reditem.item.37', 'com_reditem.item.37', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(134, 102, 215, 216, 3, 'com_reditem.item.38', 'com_reditem.item.38', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(135, 102, 229, 230, 3, 'com_reditem.item.39', 'com_reditem.item.39', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(136, 102, 231, 232, 3, 'com_reditem.item.40', 'com_reditem.item.40', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(137, 102, 233, 234, 3, 'com_reditem.item.41', 'com_reditem.item.41', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(138, 102, 223, 224, 3, 'com_reditem.item.42', 'com_reditem.item.42', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(139, 102, 217, 218, 3, 'com_reditem.item.43', 'com_reditem.item.43', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(140, 102, 235, 236, 3, 'com_reditem.item.44', 'com_reditem.item.44', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(141, 102, 237, 238, 3, 'com_reditem.item.45', 'com_reditem.item.45', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(142, 102, 239, 240, 3, 'com_reditem.item.46', 'com_reditem.item.46', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(143, 102, 241, 242, 3, 'com_reditem.item.47', 'com_reditem.item.47', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(144, 102, 243, 244, 3, 'com_reditem.item.48', 'com_reditem.item.48', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(145, 82, 161, 162, 3, 'com_reditem.item.49', 'com_reditem.item.49', '{"item.view":[],"item.delete":[],"item.edit":[],"item.edit.own":[],"item.comment.view":[],"item.comment.edit":[]}'),
(146, 18, 108, 109, 2, 'com_modules.module.105', 'Vi er fulde af gode ideer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_associations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_banners`
--

CREATE TABLE IF NOT EXISTS `yp5e2_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_banners_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_banners_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `clickurl` varchar(200) DEFAULT NULL,
  `custombannercode` varchar(2048) DEFAULT NULL,
  `state` tinyint(3) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_banner_clients`
--

CREATE TABLE IF NOT EXISTS `yp5e2_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_banner_clients_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_banner_clients_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extrainfo` text,
  `state` tinyint(3) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `yp5e2_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_categories`
--

CREATE TABLE IF NOT EXISTS `yp5e2_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_categories`
--

INSERT INTO `yp5e2_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 13, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 629, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 629, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 629, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 629, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 629, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 629, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 87, 1, 11, 12, 1, 'redweb-support', 'com_users', 'redWEB Support', 'redweb-support', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 630, '2016-04-18 10:11:47', 0, '2016-04-18 10:11:47', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_categories_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_categories_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `description` mediumtext,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_contact_details`
--

CREATE TABLE IF NOT EXISTS `yp5e2_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_contact_details_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_contact_details_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `con_position` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `params` text,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_content`
--

CREATE TABLE IF NOT EXISTS `yp5e2_content` (
  `id` int(10) unsigned NOT NULL,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_content`
--

INSERT INTO `yp5e2_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 61, 'Getting Started', 'getting-started', '<p>It''s easy to get started creating your website. Knowing some of the basics will help.</p><h3>What is a Content Management System?</h3><p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.</p><p>In this site, the content is stored in a <em>database</em>. The look and feel are created by a <em>template</em>. Joomla! brings together the template and your content to create web pages.</p><h3>Logging in</h3><p>To login to your site use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles and modify some settings.</p><h3>Creating an article</h3><p>Once you are logged-in, a new menu will be visible. To create a new article, click on the "Submit Article" link on that menu.</p><p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.</p><div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).</div><h3>Template, site settings, and modules</h3><p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template settings. Click the "Template Settings" in the user menu.</p><p>The boxes around the main content of the site are called modules. You can modify modules on the current page by moving your cursor to the module and clicking the edit link. Always be sure to save and close any module you edit.</p><p>You can change some site settings such as the site name and description by clicking on the "Site Settings" link.</p><p>More advanced options for templates, site settings, modules, and more are available in the site administrator.</p><h3>Site and Administrator</h3><p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "User Menu" menu (visible once you login) or by adding /administrator to the end of your domain name. The same user name and password are used for both sites.</p><h3>Learn more</h3><p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="https://docs.joomla.org" target="_blank">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org" target="_blank"> Joomla! forums</a>.</p>', '', -2, 2, '2013-11-16 00:00:00', 629, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-11-16 00:00:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 216, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `yp5e2_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

--
-- Dumping data for table `yp5e2_contentitem_tag_map`
--

INSERT INTO `yp5e2_contentitem_tag_map` (`type_alias`, `core_content_id`, `content_item_id`, `tag_id`, `tag_date`, `type_id`) VALUES
('com_content.article', 1, 1, 2, '2013-11-16 12:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `yp5e2_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_content_rating`
--

CREATE TABLE IF NOT EXISTS `yp5e2_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_content_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_content_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `introtext` mediumtext,
  `fulltext` mediumtext,
  `metakey` text,
  `metadesc` text,
  `state` tinyint(3) DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `attribs` varchar(5120) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_content_types`
--

CREATE TABLE IF NOT EXISTS `yp5e2_content_types` (
  `type_id` int(10) unsigned NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_content_types`
--

INSERT INTO `yp5e2_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(10000, 'redITEM Field', 'com_reditem.field', '{"special":{"dbtable":"#__reditem_fields","key":"id","type":"Field","prefix":"ReditemTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_reditem\\/models\\/forms\\/field.xml", "hideFields":["checked_out", "checked_out_time", "fieldcode"], "ignoreChanges":["type_id", "fieldcode", "version"], "convertToInt": ["checked_out_time"], "displayLookup":[{"sourceColumn":"type_id","targetTable":"#__reditem_types","targetColumn":"id","displayColumn":"title"}]}'),
(10001, 'redITEM Item', 'com_reditem.item', '{"special":{"dbtable":"#__reditem_items","key":"id","type":"Field","prefix":"ReditemTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_reditem\\/models\\/forms\\/item.xml","hideFields":["checked_out","checked_out_time"],"ignoreChanges":["type_id","version"],"convertToInt":["publish_up","publish_down","checked_out_time","created_time","modified_time"],"displayLookup":[{"sourceColumn":"type_id","targetTable":"#__reditem_types","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `yp5e2_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_extensions`
--

CREATE TABLE IF NOT EXISTS `yp5e2_extensions` (
  `extension_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10057 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_extensions`
--

INSERT INTO `yp5e2_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"da-DK","site":"da-DK"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":"","filename":"simplepie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"43ca90dd7194e293ddc51e4966876110"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.12","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2016","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.3.3","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0);
INSERT INTO `yp5e2_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 12, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 13, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 25, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 15, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 16, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 17, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 19, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 20, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 14, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 21, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 18, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{"name":"plg_system_updatenotification","type":"plugin","creationDate":"May 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","filename":"updatenotification"}', '{"lastrun":1465551298}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(453, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"October 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","filename":"module"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{"name":"plg_system_stats","type":"plugin","creationDate":"November 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","filename":"stats"}', '{"mode":1,"lastrun":1465500566,"unique_id":"c92c29ecb29eb538a695c5e54c22fa8959279d12","interval":12}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"November 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"November 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"April 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.1","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'Akeeba', 'component', 'com_akeeba', '', 1, 1, 0, 0, '{"name":"Akeeba","type":"component","creationDate":"2016-05-16","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2006-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"4.7.2","description":"Akeeba Backup Core - Full Joomla! site backup solution, Core Edition.","group":"","filename":"akeeba"}', '{"confwiz_upgrade":1,"siteurl":"http:\\/\\/bad.kier.redhost.dk\\/","jlibrariesdir":"\\/home\\/kier\\/domains\\/bad.kier.redhost.dk\\/public_html\\/libraries","jversion":"1.6","show_howtorestoremodal":0}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'plg_quickicon_akeebabackup', 'plugin', 'akeebabackup', 'quickicon', 0, 1, 1, 0, '{"name":"plg_quickicon_akeebabackup","type":"plugin","creationDate":"2012-09-26","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"1.0","description":"PLG_QUICKICON_AKEEBABACKUP_XML_DESCRIPTION","group":"","filename":"akeebabackup"}', '{"context":"mod_quickicon","enablewarning":"1","warnfailed":"1","maxbackupperiod":"24","profileid":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'PLG_SYSTEM_AKEEBAUPDATECHECK_TITLE', 'plugin', 'akeebaupdatecheck', 'system', 0, 0, 1, 0, '{"name":"PLG_SYSTEM_AKEEBAUPDATECHECK_TITLE","type":"plugin","creationDate":"2011-05-26","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"1.1","description":"PLG_AKEEBAUPDATECHECK_DESCRIPTION2","group":"","filename":"akeebaupdatecheck"}', '{"email":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(10003, 'PLG_SYSTEM_BACKUPONUPDATE_TITLE', 'plugin', 'backuponupdate', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_BACKUPONUPDATE_TITLE","type":"plugin","creationDate":"2013-08-13","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"3.7","description":"PLG_SYSTEM_BACKUPONUPDATE_DESCRIPTION","group":"","filename":"backuponupdate"}', '{"profileid":"1"}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10005, 'AkeebaStrapper', 'file', 'AkeebaStrapper', '', 0, 1, 0, 0, '{"name":"AkeebaStrapper","type":"file","creationDate":"2016-05-12","author":"Nicholas K. Dionysopoulos","copyright":"(C) 2012-2013 Akeeba Ltd.","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"revAA17947","description":"Namespaced jQuery, jQuery UI and Bootstrap for Akeeba products.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'COM_REDCORE', 'component', 'com_redcore', '', 1, 1, 0, 0, '{"name":"COM_REDCORE","type":"component","creationDate":"February 2016","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.8.4","description":"COM_REDCORE_DESC","group":""}', '{"translations":{"#__banner_clients":{"option":"com_banners","table":"#__banner_clients","name":"Banners - Clients","columns":["id","name","contact","email","extrainfo","state"],"primaryKeys":["id"],"fallbackColumns":["state"],"xml":"banner_clients.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_banners\\/banner_clients.xml","formLinks":[],"state":1},"#__banners":{"option":"com_banners","table":"#__banners","name":"Banners","columns":["id","name","clickurl","custombannercode","state"],"primaryKeys":["id"],"fallbackColumns":["state"],"xml":"banners.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_banners\\/banners.xml","formLinks":["com_banners#banners#id#task#!edit"],"state":1},"#__categories":{"option":"com_categories","table":"#__categories","name":"Categories","columns":["id","title","alias","description","published"],"primaryKeys":["id"],"fallbackColumns":["published"],"xml":"categories.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_categories\\/categories.xml","formLinks":["com_categories#categories#cid#task#!edit"],"state":1},"#__contact_details":{"option":"com_contact","table":"#__contact_details","name":"Contact - details","columns":["id","name","alias","con_position","email_to","address","suburb","state","country","postcode","telephone","fax","misc","params","published"],"primaryKeys":["id"],"fallbackColumns":["params","published"],"xml":"contact_details.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_contact\\/contact_details.xml","formLinks":["com_contact#contact_details#cid#!edit"],"state":1},"#__content":{"option":"com_content","table":"#__content","name":"Contents","columns":["id","title","introtext","fulltext","metakey","metadesc","state","publish_up","publish_down","attribs"],"primaryKeys":["id"],"fallbackColumns":["state","publish_up","publish_down","attribs"],"xml":"content.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_content\\/content.xml","formLinks":["com_content#content#cid#task#!edit","com_frontpage#content#cid#task#!edit"],"state":1},"#__languages":{"option":"com_languages","table":"#__languages","name":"Languages","columns":["lang_id","title","published"],"primaryKeys":["lang_id"],"fallbackColumns":["published"],"xml":"languages.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_languages\\/languages.xml","formLinks":[],"state":1},"#__menu":{"option":"com_menus","table":"#__menu","name":"Menus","columns":["id","title","alias","link","path","home","params","published"],"primaryKeys":["id"],"fallbackColumns":["alias","link","home","params","published"],"xml":"menu.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_menus\\/menu.xml","formLinks":["com_menus#menu#cid#task#!edit"],"state":1},"#__modules":{"option":"com_modules","table":"#__modules","name":"Modules","columns":["id","title","content","params","published"],"primaryKeys":["id"],"fallbackColumns":["params","published"],"xml":"modules.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_modules\\/modules.xml","formLinks":["com_modules#modules#cid#task#!edit#client#!1"],"state":1},"#__newsfeeds":{"option":"com_newsfeeds","table":"#__newsfeeds","name":"Newsfeeds","columns":["id","name","alias","published"],"primaryKeys":["id"],"fallbackColumns":["published"],"xml":"newsfeeds.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_newsfeeds\\/newsfeeds.xml","formLinks":["com_newsfeeds#newsfeeds#cid#task#!edit"],"state":1},"#__extensions":{"option":"com_plugins","table":"#__extensions","name":"Plugins","columns":["extension_id","params","enabled"],"primaryKeys":["extension_id"],"fallbackColumns":["params","enabled"],"xml":"plugins.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_plugins\\/plugins.xml","formLinks":["com_plugins#plugins#cid#task#!edit#client#!1"],"state":1},"#__redcore_country":{"option":"com_redcore","table":"#__redcore_country","name":"Redcore Country","columns":["id","name"],"primaryKeys":["id"],"fallbackColumns":["name"],"xml":"country.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_redcore\\/country.xml","formLinks":["com_redcore#country#cid#task#!edit"],"state":1},"#__redcore_currency":{"option":"com_redcore","table":"#__redcore_currency","name":"Redcore Currency","columns":["id","name"],"primaryKeys":["id"],"fallbackColumns":["name"],"xml":"currency.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_redcore\\/currency.xml","formLinks":["com_redcore#currency#cid#task#!edit"],"state":1},"#__users":{"option":"com_users","table":"#__users","name":"Users","columns":["id","name"],"primaryKeys":["id"],"fallbackColumns":["name"],"xml":"users.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/redcore\\/translations\\/com_users\\/users.xml","formLinks":[],"state":1},"#__reditem_categories":{"option":"com_reditem","table":"#__reditem_categories","name":"RedITEM Category","columns":["id","title","introtext","fulltext"],"primaryKeys":["id"],"fallbackColumns":[],"xml":"category.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/com_reditem\\/translations\\/category.xml","formLinks":["com_reditem#category#cid#task#!edit"],"state":1},"#__reditem_items":{"option":"com_reditem","table":"#__reditem_items","name":"RedITEM Item","columns":["id","title"],"primaryKeys":["id"],"fallbackColumns":[],"xml":"item.xml","path":"\\/var\\/www\\/html\\/kierbad\\/media\\/com_reditem\\/translations\\/item.xml","formLinks":["com_reditem#item#cid#task#!edit"],"state":1}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'MOD_REDCORE_LANGUAGE_SWITCHER', 'module', 'mod_redcore_language_switcher', '', 0, 1, 0, 0, '{"name":"MOD_REDCORE_LANGUAGE_SWITCHER","type":"module","creationDate":"February 2016","author":"redCOMPONENT.com","copyright":"redCOMPONENT","authorEmail":"email@redcomponent.com","authorUrl":"","version":"1.8.0","description":"MOD_REDCORE_LANGUAGE_SWITCHER_XML_DESCRIPTION","group":"","filename":"mod_redcore_language_switcher"}', '{"dropdown":"0","image":"1","inline":"1","show_active":"1","full_name":"1","cache":"0","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'PLG_SYSTEM_REDCORE', 'plugin', 'redcore', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_REDCORE","type":"plugin","creationDate":"February 2016","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.8.0","description":"PLG_SYSTEM_REDCORE_XML_DESCRIPTION","group":"","filename":"redcore"}', '{"frontend_css":"0","frontend_jquery":"1","frontend_jquery_migrate":"1","frontend_mootools_disable":"0","enable_translations":"0","translations_constraint_type":"foreign_keys","enable_translation_fallback":"1","enable_translation_fallback_webservices":"1","enable_webservices":"0","webservice_stateful":"1","webservices_default_format":"json","webservices_default_page_authorization":"0","webservices_authorization_check":"0","debug_webservices":"0","enable_soap":"0","enable_oauth2_server":"0","oauth2_use_jwt_access_tokens":"0","oauth2_store_encrypted_token_string":"1","oauth2_use_openid_connect":"0","oauth2_id_lifetime":"3600","oauth2_access_lifetime":"3600","oauth2_token_param_name":"access_token","oauth2_token_bearer_header_name":"Bearer","oauth2_enforce_state":"1","oauth2_require_exact_redirect_uri":"1","oauth2_allow_implicit":"0","oauth2_redirect_with_token":"0","oauth2_allow_credentials_in_request_body":"1","oauth2_allow_public_clients":"1","oauth2_always_issue_new_refresh_token":"0","oauth2_unset_refresh_token_after_use":"1","enable_payment":"0","payment_list_payments_type":"radio","payment_request_method":"curl","payment_time_between_payment_check_requests":"24","payment_number_of_payment_check_retries":"30","payment_enable_file_logger":"0","payment_chart_type":"Line","payment_dashboard_view_type":"payment_name","payment_enable_chart_sandbox_payments":"1"}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(10010, 'PLG_REDPAYMENT_PAYPAL', 'plugin', 'paypal', 'redpayment', 0, 1, 1, 0, '{"name":"PLG_REDPAYMENT_PAYPAL","type":"plugin","creationDate":"February 2016","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.8.0","description":"PLG_REDPAYMENT_PAYPAL_XML_DESCRIPTION","group":"","filename":"paypal"}', '{"merchant_id":"","sandbox":"1","merchant_id_sandbox":"","payment_title":"Paypal","payment_logo":"","retry_counter":"30"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'COM_REDITEM', 'component', 'com_reditem', '', 1, 1, 0, 0, '{"name":"COM_REDITEM","type":"component","creationDate":"December 2013","author":"redCOMPONENT.com","copyright":"(c) Redweb.dk","authorEmail":"email@redcomponent.com","authorUrl":"www.redweb.dk","version":"2.1.19","description":"COM_REDITEM_DESCRIPTION","group":"","filename":"reditem"}', '{"redcore":{"version":"1.8.4"}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'PLG_SYSTEM_REDITEM_STATES', 'plugin', 'reditem_states', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_REDITEM_STATES","type":"plugin","creationDate":"July 2014","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"2.1","description":"PLG_SYSTEM_REDITEM_STATES_DESC","group":"","filename":"reditem_states"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(10016, 'PLG_SYSTEM_TWIG', 'plugin', 'twig', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_TWIG","type":"plugin","creationDate":"May 2015","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"1.0.0","description":"PLG_SYSTEM_TWIG_DESC","group":"","filename":"twig"}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(10017, 'PLG_SYSTEM_IP2LOCATION', 'plugin', 'ip2location', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_IP2LOCATION","type":"plugin","creationDate":"May 2015","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"1.0.0","description":"PLG_SYSTEM_IP2LOCATION_DESC","group":"","filename":"ip2location"}', '{}', '', '', 0, '0000-00-00 00:00:00', 11, 0),
(10018, 'PLG_USER_REDITEM_REPORTERS', 'plugin', 'reditem_reporters', 'user', 0, 1, 1, 0, '{"name":"PLG_USER_REDITEM_REPORTERS","type":"plugin","creationDate":"October 2014","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"1.0","description":"PLG_USER_REDITEM_REPORTERS_DESC","group":"","filename":"reditem_reporters"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'PLG_REDITEM_USER_BEHAVIORS', 'plugin', 'user_behaviors', 'reditem', 0, 1, 1, 0, '{"name":"PLG_REDITEM_USER_BEHAVIORS","type":"plugin","creationDate":"November 2014","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"1.0","description":"PLG_REDITEM_USER_BEHAVIORS_DESC","group":"","filename":"user_behaviors"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10020, 'PLG_REDITEM_QUICKICON_REDITEM', 'plugin', 'reditem', 'reditem_quickicon', 0, 1, 1, 0, '{"name":"PLG_REDITEM_QUICKICON_REDITEM","type":"plugin","creationDate":"January 2015","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"1.0","description":"PLG_REDITEM_QUICKICON_REDITEM_DESCRIPTION","group":"","filename":"reditem"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'redCOMPONENT', 'template', 'redcomponent', '', 0, 1, 1, 0, '{"name":"redCOMPONENT","type":"template","creationDate":"Dec 2013","author":"redCOMPONENT","copyright":"Copyright redComponent 2013. All rights reserved","authorEmail":"mail@redcomponent.com","authorUrl":"http:\\/\\/www.redcomponent.com","version":"1.4.1.1","description":"TPL_REDCOMPONENT_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"rebrand":"yes","style":"generic","modal":"1","javascriptBottom":"1","logo":"template","logowidth":"4","body_font":"default","header_font":"default","wright_bootstrap_images":"","responsive":"1","stickyFooter":"1","columnsNumber":"12","columns":"sidebar1:3;main:6;sidebar2:3","build":"1","browsercompatibilityswitch":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'Danishda-DK', 'language', 'da-DK', '', 0, 1, 0, 0, '{"name":"Danish(da-DK)","type":"language","creationDate":"2016-04-01","author":"Danish Translation Team (Transl.: Mikael Winther, Ronny Buelund, Ole Bang Ottosen)","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"dansk@danskjoomla.dk","authorUrl":"http:\\/\\/www.danskjoomla.dk","version":"3.5.1.1","description":"Danish language pack for Joomla! 3.3","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'DanishDK', 'language', 'da-DK', '', 1, 1, 0, 0, '{"name":"Danish(DK)","type":"language","creationDate":"2016-04-01","author":"Danish translation Team","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"mail@danskjoomla.dk","authorUrl":"http:\\/\\/www.danskjoomla.dk","version":"3.5.1.1","description":"Danish language pack for Joomla! 3.x","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'Danish (da-DK) language pack', 'package', 'pkg_da-DK', '', 0, 1, 1, 0, '{"name":"Danish (da-DK) language pack","type":"package","creationDate":"2016-04-01","author":"Danish Translation Team (Transl.: Ronny Buelund, Ole Bang Ottosen)","copyright":"","authorEmail":"dansk@danskjoomla.dk","authorUrl":"www.danskjoomla.dk","version":"3.5.1.1","description":"Danish language pack","group":"","filename":"pkg_da-DK"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'sh404SEF', 'component', 'com_sh404sef', '', 1, 1, 0, 0, '{"name":"sh404SEF","type":"component","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"","group":"","filename":"sh404sef"}', '{"Enabled":1,"canReadRemoteConfig":0,"replacement":"-","pagerep":"-","stripthese":",|~|!|@|%|^|(|)|<|>|:|;|{|}|[|]|&|`|„|‹|’|‘|“|”|•|›|«|´|»|°","shReplacements":"Š|S, Œ|O, Ž|Z, š|s, œ|ae, ž|z, Ÿ|Y, ¥|Y, µ|u, À|A, Á|A, Â|A, Ã|A, Ä|A, Å|AA, Æ|AE, Ç|C, È|E, É|E, Ê|E, Ë|E, Ì|I, Í|I, Î|I, Ï|I, Ð|D, Ñ|N, Ò|O, Ó|O, Ô|O, Õ|O, Ö|O, Ø|OE, Ù|U, Ú|U, Û|U, Ü|U, Ý|Y, ß|s, à|a, á|a, â|a, ã|a, ä|a, å|aa, æ|ae, ç|c, è|e, é|e, ê|e, ë|e, ì|i, í|i, î|i, ï|i, ð|o, ñ|n, ò|o, ó|o, ô|o, õ|o, ö|o, ø|oe, ù|u, ú|u, û|u, ü|u, ý|y, ÿ|y, ß|ss, ă|a, ş|s, ţ|t, ț|t, Ț|T, Ș|S, ș|s, Ş|S, .|-","friendlytrim":"-|.","suffix":"","alwaysAppendItemsPerPage":"0","addFile":"","LowerCase":"1","enablePageId":"1","stopCreatingShurls":"0","shurlBlackList":"","shurlNonSefBlackList":"","insertShortlinkTag":"1","insertRevCanTag":"0","insertAltShorterTag":"0","shUseURLCache":"1","shMaxURLInCache":"10000","UrlCacheHandler":"File","displayUrlCacheStats":"0","shRedirectNonSefToSef":"1","shAutoRedirectWww":"0","redirectToCorrectCaseUrl":"1","shLog404Errors":"1","referrerPolicyMeta":"none","shForceNonSefIfHttps":"0","shForcedHomePage":"","slowServer":"0","extensionToExtractGetVars":"com_chronoforums,com_mijoshop","guessItemidOnHomepage":"0","shInsertGlobalItemidIfNone":"0","shInsertTitleIfNoItemid":"0","shAlwaysInsertMenuTitle":"0","shAlwaysInsertItemid":"0","shDefaultMenuItemName":"","autoCheckNewVersion":"1","shKeepConfigOnUpgrade":"1","shKeepStandardURLOnUpgrade":"1","shKeepCustomURLOnUpgrade":"1","shKeepMetaDataOnUpgrade":"1","log404sHits":"0","logAliasesHits":"0","logShurlsHits":"0","logUrlsSource":"0","com_akeeba___manageURL":"0","com_akeeba___shDoNotOverrideOwnSef":"0","com_akeeba___compEnablePageId":"0","com_akeeba___defaultComponentString":"","com_ajax___manageURL":"0","com_ajax___shDoNotOverrideOwnSef":"0","com_ajax___compEnablePageId":"0","com_ajax___defaultComponentString":"","com_banners___manageURL":"0","com_banners___shDoNotOverrideOwnSef":"0","com_banners___compEnablePageId":"0","com_banners___defaultComponentString":"","com_contact___manageURL":"0","com_contact___shDoNotOverrideOwnSef":"0","com_contact___compEnablePageId":"1","com_contact___defaultComponentString":"","com_content___manageURL":"0","com_content___shDoNotOverrideOwnSef":"0","com_content___compEnablePageId":"1","com_content___defaultComponentString":"","com_contenthistory___manageURL":"0","com_contenthistory___shDoNotOverrideOwnSef":"0","com_contenthistory___compEnablePageId":"0","com_contenthistory___defaultComponentString":"","com_finder___manageURL":"0","com_finder___shDoNotOverrideOwnSef":"0","com_finder___compEnablePageId":"0","com_finder___defaultComponentString":"","com_joomlaupdate___manageURL":"0","com_joomlaupdate___shDoNotOverrideOwnSef":"0","com_joomlaupdate___compEnablePageId":"0","com_joomlaupdate___defaultComponentString":"","com_login___manageURL":"0","com_login___shDoNotOverrideOwnSef":"0","com_login___compEnablePageId":"0","com_login___defaultComponentString":"","com_mailto___manageURL":"0","com_mailto___shDoNotOverrideOwnSef":"0","com_mailto___compEnablePageId":"0","com_mailto___defaultComponentString":"","com_newsfeeds___manageURL":"0","com_newsfeeds___shDoNotOverrideOwnSef":"0","com_newsfeeds___compEnablePageId":"1","com_newsfeeds___defaultComponentString":"","com_postinstall___manageURL":"0","com_postinstall___shDoNotOverrideOwnSef":"0","com_postinstall___compEnablePageId":"0","com_postinstall___defaultComponentString":"","com_redcore___manageURL":"0","com_redcore___shDoNotOverrideOwnSef":"0","com_redcore___compEnablePageId":"0","com_redcore___defaultComponentString":"","com_reditem___manageURL":"0","com_reditem___shDoNotOverrideOwnSef":"0","com_reditem___compEnablePageId":"0","com_reditem___defaultComponentString":"","com_reditemcategoryfields___manageURL":"0","com_reditemcategoryfields___shDoNotOverrideOwnSef":"0","com_reditemcategoryfields___compEnablePageId":"0","com_reditemcategoryfields___defaultComponentString":"","com_search___manageURL":"0","com_search___shDoNotOverrideOwnSef":"0","com_search___compEnablePageId":"0","com_search___defaultComponentString":"","com_tags___manageURL":"0","com_tags___shDoNotOverrideOwnSef":"0","com_tags___compEnablePageId":"0","com_tags___defaultComponentString":"","com_users___manageURL":"0","com_users___shDoNotOverrideOwnSef":"0","com_users___compEnablePageId":"0","com_users___defaultComponentString":"","com_wrapper___manageURL":"0","com_wrapper___shDoNotOverrideOwnSef":"0","com_wrapper___compEnablePageId":"0","com_wrapper___defaultComponentString":"","com_jce___manageURL":"0","com_jce___shDoNotOverrideOwnSef":"0","com_jce___compEnablePageId":"0","com_jce___defaultComponentString":"","languages_en-GB_pageText":"Page-%s","languages_da-DK_pageText":"Page-%s","UseAlias":"1","useCatAlias":"0","useMenuAlias":"0","includeContentCat":"4","includeContentCatCategories":"4","contentCategoriesSuffix":"all","slugForUncategorizedContent":"0","shInsertContentTableName":"0","shContentTableName":"","shInsertContentBlogName":"0","shContentBlogName":"","shMultipagesTitle":"1","ContentTitleInsertArticleId":"0","shInsertContentArticleIdCatList":[""],"shInsertNumericalId":"0","shInsertNumericalIdCatList":[""],"insertDate":"0","insertDateCatList":[""],"ContentTitleUseAlias":"0","contentTitleIncludeCat":"0","ContentTitleUseCatAlias":"0","useContactCatAlias":"0","includeContactCat":"5","includeContactCatCategories":"2","contactCategoriesSuffix":"all","slugForUncategorizedContact":"0","useWeblinksCatAlias":"0","includeWeblinksCat":"2","includeWeblinksCatCategories":"2","weblinksCategoriesSuffix":"all","slugForUncategorizedWeblinks":"0","shVmInsertShopName":"0","vmUseMenuItems":"1","vmWhichProductDetailsCat":"0","vmWhichVmProductDetailsTitleCat":"2","vmWhichVmCategoryTitleCat":"2","shInsertCBName":"0","shCBInsertUserName":"0","shCBInsertUserId":"1","shCBUseUserPseudo":"1","shCBShortUserURL":"0","shJSInsertJSName":"1","shJSShortURLToUserProfile":"1","shJSInsertUsername":"1","shJSInsertUserFullName":"0","shJSInsertUserId":"0","shJSInsertGroupCategory":"1","shJSInsertGroupCategoryId":"0","shJSInsertGroupId":"0","shJSInsertGroupBulletinId":"0","shJSInsertDiscussionId":"1","shJSInsertMessageId":"1","shJSInsertPhotoAlbum":"1","shJSInsertPhotoAlbumId":"0","shJSInsertPhotoId":"1","shJSInsertVideoCat":"1","shJSInsertVideoCatId":"0","shJSInsertVideoId":"1","shInsertFireboardName":"1","shMetaManagementActivated":"1","insertGoogleSitename":"1","insertGoogleBreadcrumb":"0","insertGoogleSitelinksSearch":"0","insertGoogleSitelinksSearchCustom":"","removeOtherCanonicals":"1","insertPaginationTags":"1","shMultipleH1ToH2":"0","shInsertOutboundLinksImage":"0","shImageForOutboundLinks":"external-black.png","shRemoveGeneratorTag":"1","pageTitleSeparator":" | ","prependToPageTitle":"","appendToPageTitle":"","mobile_switch_enabled":"0","mobile_template":"","enableOpenGraphData":"0","ogType":"article","ogImage":"","ogEnableDescription":"1","ogEnableSiteName":"1","ogSiteName":"","fbAdminIds":"","enableTwitterCards":"0","twitterCardsSiteAccount":"","twitterCardsCreatorAccount":"","twitterCardsCategories":["show_on_all"],"enableGoogleAuthorship":"0","googleAuthorshipAuthorProfile":"","googleAuthorshipAuthorName":"","googleAuthorshipCategories":["show_on_all"],"enableGooglePublisher":"0","googlePublisherUrl":"","analyticsEdition":"none","analyticsUgaId":"","analyticsGtmId":"","analyticsEnableAnonymization":"0","analyticsEnableDisplayFeatures":"0","analyticsEnableEnhancedLinkAttr":"0","analyticsExcludeIP":[],"analyticsUserGroups":["1"],"analyticsReportsEnabled":"0","wbga_clearauthorization":"0","autoCheckNewAnalytics":"1","analyticsDashboardDateRange":"week","analyticsDashboardDataType":"ga:pageviews","wbgaauth_auth_required":"1","wbgaauth_access_token":"","wbgaauth_refresh_token":"","wbgaauth_expires_on":0,"wbgaauth_token_type":"","wbgaauth_client_id_key":"","shSecEnableSecurity":0,"shSecLogAttacks":"0","monthsToKeepLogs":"1","shSecCheckPOSTData":"1","shSecOnlyNumVars":["itemid","limit","limitstart"],"shSecAlphaNumVars":[],"shSecNoProtocolVars":["task","option","no_html","mosmsg","lang"],"ipWhiteList":[],"ipBlackList":[],"uAgentWhiteList":[],"uAgentBlackList":[],"shSecActivateAntiFlood":"0","shSecAntiFloodOnlyOnPOST":"0","shSecAntiFloodPeriod":"10","shSecAntiFloodCount":"10","shSecCheckHoneyPot":"0","shSecHoneyPotKey":"","shSecEntranceText":"<p>Sorry. You are visiting this site from a suspicious IP address, which triggered our protection system.<\\/p>\\r\\n    <p>If you <strong>ARE NOT<\\/strong> a malware robot of any kind, please accept our apologies for the inconvenience. You can access the page by clicking here : ","shSecSmellyPotText":"The following link is here to further trap malicious internet robots, so please don''t click on it : ","autoRedirect404":"0","autoRedirect404WithMessage":"0","error404MsgColor":"#ffffff","error404MsgBackgroundColor":"#327dcb","error404MsgOpacity":"0.9","notFoundErrorHandling":"1","error404SubTemplate":"index","languages_en-GB_notFoundItemid":"138","languages_da-DK_notFoundItemid":"138","update_credentials_access":"","update_credentials_secret":"","shRewriteMode":1}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10026, 'sh404sef - System plugin', 'plugin', 'sh404sef', 'system', 0, 1, 1, 0, '{"name":"sh404sef - System plugin","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"Sh404sef main system plugin","group":"","filename":"sh404sef"}', '{}', '', '', 0, '0000-00-00 00:00:00', 23, 0),
(10027, 'plg_system_shlib', 'plugin', 'shlib', 'system', 0, 1, 1, 0, '{"name":"plg_system_shlib","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier 2015","authorEmail":"yannick@weeblr.com","authorUrl":"http:\\/\\/weeblr.com","version":"0.3.1.487","description":"PLG_SYSTEM_SHLIB_DESC","group":"","filename":"shlib"}', '{"log_error":"0","log_alert":"0","log_debug":"0","log_info":"0","assets_mode":"1","assets_bundling":"1","sharedmemory_cache_handler":"apc","sharedmemory_cache_host":"127.0.0.1","sharedmemory_cache_port":"11211","enable_query_cache":"0","enable_joomla_query_cache":"0"}', '', '', 0, '0000-00-00 00:00:00', -100, 0);
INSERT INTO `yp5e2_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10028, 'sh404sef - System mobile template switcher', 'plugin', 'shmobile', 'system', 0, 1, 1, 0, '{"name":"sh404sef - System mobile template switcher","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"Switch site template for mobile devices","group":"","filename":"shmobile"}', '{"mobile_switch_enabled":"0","mobile_template":""}', '', '', 0, '0000-00-00 00:00:00', 22, 0),
(10029, 'sh404sef - Analytics plugin', 'plugin', 'sh404sefanalytics', 'sh404sefcore', 0, 1, 1, 0, '{"name":"sh404sef - Analytics plugin","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"Create analytics custom tags\\n\\t","group":"","filename":"sh404sefanalytics"}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10030, 'sh404sef - Offline code plugin', 'plugin', 'sh404sefofflinecode', 'sh404sefcore', 0, 1, 1, 0, '{"name":"sh404sef - Offline code plugin","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"Render Joomla''s offline page with the appropriate http\\tresponse code\\t","group":"","filename":"sh404sefofflinecode"}', '{"disallowAdminAccess":"0","retry_after_delay":"7400"}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10031, 'sh404sef - Similar urls plugin', 'plugin', 'sh404sefsimilarurls', 'sh404sefcore', 0, 1, 1, 0, '{"name":"sh404sef - Similar urls plugin","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"PLG_SH404SEFCORE_SH404SEFSIMILARURLS_XML_DESCRIPTION","group":"","filename":"sh404sefsimilarurls"}', '{"max_number_of_urls":"5","min_segment_length":"3","include_pdf":"0","include_print":"0","excluded_words_sef":"sh404sef-core-content","excluded_words_non_sef":""}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10032, 'PLG_SH404SEFCORE_SH404SEFSOCIAL', 'plugin', 'sh404sefsocial', 'sh404sefcore', 0, 1, 1, 0, '{"name":"PLG_SH404SEFCORE_SH404SEFSOCIAL","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"PLG_SH404SEFCORE_SH404SEFSOCIAL_XML_DESCRIPTION","group":"","filename":"sh404sefsocial"}', '{"enableSocialAnalyticsIntegration":"1","enableGoogleSocialEngagement":"1","onlyDisplayOnCanonicalUrl":"1","buttonsContentLocation":"onlytags","useShurl":"1","enabledCategories":"show_on_all","enableFbLike":"1","fbAction":"like","fbShowFaces":"1","fbLayout":"button_count","enableFbShare":"1","fbShareLayout":"button_count","enableFbSend":"1","fbColorscheme":"","fbWidth":"","fbUseHtml5":"0","enableTweet":"1","viaAccount":"","enablePinterestPinIt":"1","pinItCountLayout":"none","pinItButtonText":"","enablePlusOne":"1","plusOneSize":"","plusOneAnnotation":"none","enableGooglePlusPage":"1","googlePlusPage":"","googlePlusCustomText":"","googlePlusCustomText2":"","googlePlusPageSize":"medium","enableLinkedIn":"1","linkedinlayout":"none"}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10033, 'plg_installer_sh404sef', 'plugin', 'sh404sef', 'installer', 0, 1, 1, 0, '{"name":"plg_installer_sh404sef","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"Handle sh404SEF subscribers updates","group":"","filename":"sh404sef"}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10034, 'sh404sef - Default component support plugin', 'plugin', 'sh404sefextplugindefault', 'sh404sefextplugins', 0, 1, 1, 0, '{"name":"sh404sef - Default component support plugin","type":"plugin","creationDate":"2016-03-15","author":"Yannick Gaultier","copyright":"(c) Yannick Gaultier - Weeblr llc - 2016","authorEmail":"contact@weeblr.com","authorUrl":"https:\\/\\/weeblr.com","version":"4.7.3.3292","description":"Provide default support for sef urls and meta data","group":"","filename":"sh404sefextplugindefault"}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10035, 'JCE', 'component', 'com_jce', '', 1, 1, 0, 0, '{"name":"JCE","type":"component","creationDate":"08 April 2016","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2016 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"www.joomlacontenteditor.net","version":"2.5.16","description":"WF_ADMIN_DESC","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 'plg_editors_jce', 'plugin', 'jce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_jce","type":"plugin","creationDate":"08 April 2016","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2016 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.5.16","description":"WF_EDITOR_PLUGIN_DESC","group":"","filename":"jce"}', '{"verify_html":"1","schema":"mixed","entity_encoding":"raw","keep_nbsp":"1","pad_empty_tags":"1","cleanup_pluginmode":"0","forced_root_block":"p","content_style_reset":"0","content_css":"1","content_css_custom":"","body_class":"","compress_javascript":"1","compress_css":"1","compress_gzip":"0","use_cookies":"1","custom_config":"","callback_file":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 'plg_system_jce', 'plugin', 'jce', 'system', 0, 1, 1, 0, '{"name":"plg_system_jce","type":"plugin","creationDate":"08 April 2016","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2016 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.5.16","description":"PLG_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(10038, 'plg_quickicon_jcefilebrowser', 'plugin', 'jcefilebrowser', 'quickicon', 0, 1, 1, 0, '{"name":"plg_quickicon_jcefilebrowser","type":"plugin","creationDate":"08 April 2016","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2016 Ryan Demmer. All rights reserved","authorEmail":"@@email@@","authorUrl":"www.joomalcontenteditor.net","version":"2.5.16","description":"PLG_QUICKICON_JCEFILEBROWSER_XML_DESCRIPTION","group":"","filename":"jcefilebrowser"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10039, 'PLG_SYSTEM_JCH_OPTIMIZE', 'plugin', 'jch_optimize', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_JCH_OPTIMIZE","type":"plugin","creationDate":"Dec 2015","author":"Samuel Marshall","copyright":"Copyright (C) 2015 Samuel Marshall. All rights reserved.","authorEmail":"sdmarshall73@gmail.com","authorUrl":"http:\\/\\/www.jch-optimize.net","version":"5.0.5","description":"JCH_OPTIMIZE_DESCRIPTION","group":"","filename":"jch_optimize"}', '{"combine_files_enable":"0","html_minify_level":"0","htaccess":"3","try_catch":"1","cache_lifetime":"1","debug":"0","log":"0","css":"1","javascript":"1","gzip":"0","css_minify":"0","js_minify":"0","html_minify":"0","defer_js":"0","bottom_js":"0","includeAllExtensions":"0","hidden_containsgf":"","jchmenu":"101","csg_enable":"0","csg_direction":"vertical","csg_wrap_images":"0","img_attributes_enable":"0","kraken_backup":"1"}', '', '', 0, '0000-00-00 00:00:00', 24, 0),
(10040, 'PLG_REDITEM_SH404SEF_NAME', 'plugin', 'sh404sefextplugincom_reditem', 'sh404sefextplugins', 0, 1, 1, 0, '{"name":"PLG_REDITEM_SH404SEF_NAME","type":"plugin","creationDate":"March 2015","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"www.redcomponent.com","version":"1.0","description":"PLG_REDITEM_SH404SEF_DESCRIPTION","group":"","filename":"sh404sefextplugincom_reditem"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10042, 'Regular Labs Library', 'library', 'regularlabs', '', 0, 1, 1, 0, '{"name":"Regular Labs Library","type":"library","creationDate":"April 2016","author":"Regular Labs (Peter van Westen)","copyright":"Copyright \\u00a9 2016 Regular Labs - All Rights Reserved","authorEmail":"info@regularlabs.com","authorUrl":"https:\\/\\/www.regularlabs.com","version":"16.4.21990","description":"","group":"","filename":"regularlabs"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10043, 'plg_system_regularlabs', 'plugin', 'regularlabs', 'system', 0, 1, 1, 0, '{"name":"plg_system_regularlabs","type":"plugin","creationDate":"April 2016","author":"Regular Labs (Peter van Westen)","copyright":"Copyright \\u00a9 2016 Regular Labs - All Rights Reserved","authorEmail":"info@regularlabs.com","authorUrl":"https:\\/\\/www.regularlabs.com","version":"16.4.21990","description":"PLG_SYSTEM_REGULARLABS_DESC","group":"","filename":"regularlabs"}', '{"combine_admin_menu":"0","max_list_count":"2500"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(10044, 'plg_editors-xtd_modulesanywhere', 'plugin', 'modulesanywhere', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_modulesanywhere","type":"plugin","creationDate":"April 2016","author":"Regular Labs (Peter van Westen)","copyright":"Copyright \\u00a9 2016 Regular Labs - All Rights Reserved","authorEmail":"info@regularlabs.com","authorUrl":"https:\\/\\/www.regularlabs.com","version":"5.0.0","description":"PLG_EDITORS-XTD_MODULESANYWHERE_DESC","group":"","filename":"modulesanywhere"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10045, 'plg_system_modulesanywhere', 'plugin', 'modulesanywhere', 'system', 0, 1, 1, 0, '{"name":"plg_system_modulesanywhere","type":"plugin","creationDate":"April 2016","author":"Regular Labs (Peter van Westen)","copyright":"Copyright \\u00a9 2016 Regular Labs - All Rights Reserved","authorEmail":"info@regularlabs.com","authorUrl":"https:\\/\\/www.regularlabs.com","version":"5.0.0","description":"PLG_SYSTEM_MODULESANYWHERE_DESC","group":"","filename":"modulesanywhere"}', '{"style":"none","styles":"none,division,tabs,well","override_style":"1","ignore_access":"0","ignore_state":"0","ignore_assignments":"0","ignore_caching":"0","place_comments":"1","button_text":"Module","enable_frontend":"1","showtitle":"","div_enable":"0","div_width":"","div_height":"","div_float":"","div_class":"","module_tag":"module","modulepos_tag":"modulepos","tag_characters":"{.}","handle_loadposition":"0","activate_jumper":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10046, 'COM_REDITEMCATEGORYFIELDS', 'component', 'com_reditemcategoryfields', '', 1, 1, 0, 0, '{"name":"COM_REDITEMCATEGORYFIELDS","type":"component","creationDate":"December 2013","author":"redCOMPONENT.com","copyright":"(c) Redweb.dk","authorEmail":"email@redcomponent.com","authorUrl":"www.redweb.dk","version":"2.0.10","description":"COM_REDITEMCATEGORYFIELDS_DESCRIPTION","group":"","filename":"reditemcategoryfields"}', '{"redcore":{"version":"1.8.1"}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10047, 'redITEM Category Fields - Libraries', 'library', 'reditemcategoryfields', '', 0, 1, 1, 0, '{"name":"redITEM Category Fields - Libraries","type":"library","creationDate":"May 2014","author":"redCOMPONENT","copyright":"Copyright (C) 2012 - 2013 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.0.0","description":"redITEM Category Fields library","group":"","filename":"reditemcategoryfields"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10048, 'PLG_CATEGORY_FIELDS', 'plugin', 'category_fields', 'reditem_categories', 0, 1, 1, 0, '{"name":"PLG_CATEGORY_FIELDS","type":"plugin","creationDate":"November 2013","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"2.0.1","description":"PLG_CATEGORY_FIELDS_DESCRIPTION","group":"","filename":"category_fields"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10049, 'PLG_REDITEM_QUICKICON_CATEGORYFIELDS', 'plugin', 'categoryfields', 'reditem_quickicon', 0, 1, 1, 0, '{"name":"PLG_REDITEM_QUICKICON_CATEGORYFIELDS","type":"plugin","creationDate":"February 2015","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"","authorUrl":"","version":"1.0","description":"PLG_REDITEM_QUICKICON_CATEGORYFIELDS_DESCRIPTION","group":"","filename":"categoryfields"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10050, 'MOD_REDITEM_ITEMS', 'module', 'mod_reditem_items', '', 0, 1, 0, 0, '{"name":"MOD_REDITEM_ITEMS","type":"module","creationDate":"October 2013","author":"redCOMPONENT.com","copyright":"redCOMPONENT.com","authorEmail":"thong@redweb.dk","authorUrl":"","version":"2.1.3","description":"MOD_REDITEM_ITEMS_DESCRIPTION","group":"","filename":"mod_reditem_items"}', '{"include_sub":"0","featured_items":"0","items_ordering":"i.alias","items_direction":"asc","limit":"10","setItemId":"0","display":"0","slider_pager":"1","slider_controls":"1","slider_autoplay":"1","owncache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10051, 'redCORE - Libraries', 'library', 'redcore', '', 0, 1, 1, 0, '{"name":"redCORE - Libraries","type":"library","creationDate":"February 2016","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.8.0","description":"redCORE Libraries","group":"","filename":"redcore"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10052, 'redITEM - Libraries', 'library', 'reditem', '', 0, 1, 1, 0, '{"name":"redITEM - Libraries","type":"library","creationDate":"October 2013","author":"redCOMPONENT.com","copyright":"Copyright (C) 2012 - 2013 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.0.2","description":"redITEM Libraries","group":"","filename":"reditem"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10053, 'Twig library', 'library', 'twig', '', 0, 1, 1, 0, '{"name":"Twig library","type":"library","creationDate":"April 2015","author":"redCOMPONENT.com","copyright":"Copyright (C) 2012 - 2015 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.18.1","description":"LIB_TWIG_DESCRIPTION","group":"","filename":"twig"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10054, 'IP2Location library', 'library', 'ip2location', '', 0, 1, 1, 0, '{"name":"IP2Location library","type":"library","creationDate":"May 2015","author":"redCOMPONENT.com","copyright":"Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.","authorEmail":"email@redcomponent.com","authorUrl":"www.redcomponent.com","version":"1.0.0","description":"IP2Location library for getting location based on ip address. BIN files from database folder contains locations based on ip address. Solution is based on ip2location.com databases","group":"","filename":"ip2location"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10055, 'F0F (NEW) DO NOT REMOVE', 'library', 'lib_f0f', '', 0, 1, 1, 0, '{"name":"F0F (NEW) DO NOT REMOVE","type":"library","creationDate":"2016-05-12","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2014 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"revAA17947","description":"Framework-on-Framework (FOF) newer version - DO NOT REMOVE - The rapid component development framework for Joomla!. This package is the newer version of FOF, not the one shipped with Joomla! as the official Joomla! RAD Layer. The Joomla! RAD Layer has ceased development in March 2014. DO NOT UNINSTALL THIS PACKAGE, IT IS *** N O T *** A DUPLICATE OF THE ''FOF'' PACKAGE. REMOVING EITHER FOF PACKAGE WILL BREAK YOUR SITE.","group":"","filename":"lib_f0f"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10056, 'Akeeba Backup package', 'package', 'pkg_akeeba', '', 0, 1, 1, 0, '{"name":"Akeeba Backup package","type":"package","creationDate":"2016-04-21","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2006-2016 Akeeba Ltd \\/ Nicholas K. Dionysopoulos","authorEmail":"","authorUrl":"","version":"4.7.2","description":"Akeeba Backup installation package, for updating from version 4.x only","group":"","filename":"pkg_akeeba"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_extensions_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_extensions_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `extension_id` int(11) DEFAULT NULL,
  `params` text,
  `enabled` tinyint(3) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_filters`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links` (
  `link_id` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_terms`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_terms` (
  `term_id` int(10) unsigned NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yp5e2_finder_terms_common`
--

INSERT INTO `yp5e2_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_finder_types`
--

CREATE TABLE IF NOT EXISTS `yp5e2_finder_types` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_languages`
--

CREATE TABLE IF NOT EXISTS `yp5e2_languages` (
  `lang_id` int(11) unsigned NOT NULL,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_languages`
--

INSERT INTO `yp5e2_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1),
(2, 'da-DK', 'Danish (DK)', 'Danish (DK)', 'da', 'da', '', '', '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_languages_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_languages_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `lang_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_menu`
--

CREATE TABLE IF NOT EXISTS `yp5e2_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_menu`
--

INSERT INTO `yp5e2_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 105, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 20, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 21, 26, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 22, 23, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 24, 25, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 27, 28, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 33, 34, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 35, 36, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 37, 38, 0, '*', 1),
(101, 'mainmenu', 'Forside ', 'forside', '', 'forside', 'index.php?option=com_reditem&view=categorydetail&id=4&templateId=3', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"alias","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"Forside ","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 40, 1, '*', 0),
(118, 'mainmenu', 'Udstillingen', 'udstillingen', '', 'udstillingen', 'index.php?option=com_reditem&view=categorydetail&id=6&templateId=8', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"created_time","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 41, 42, 0, '*', 0),
(119, 'mainmenu', 'Nyt bad', 'nyt-bad', '', 'nyt-bad', 'index.php?option=com_reditem&view=categorydetail&id=5&templateId=8', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"ordering","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 43, 44, 0, '*', 0),
(120, 'mainmenu', 'Aktuelt', 'tilbud', '', 'tilbud', 'index.php?option=com_reditem&view=categorydetail&id=10', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"alias","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 45, 46, 0, '*', 0),
(121, 'mainmenu', 'Leverandører', 'leverandorer', '', 'leverandorer', 'index.php?option=com_reditem&view=categorydetail&id=9&templateId=11', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"alias","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, '*', 0),
(122, 'mainmenu', 'Kontakt & åbningstider', 'kontak-abningstider', '', 'kontak-abningstider', 'index.php?option=com_reditem&view=categorydetail&id=8&templateId=8', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"created_time","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":" kontak-page","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 49, 50, 0, '*', 0),
(123, 'main', 'COM_SH404SEF', 'com-sh404sef', '', 'com-sh404sef', 'index.php?option=com_sh404sef', 'component', 0, 1, 1, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sh404sef/assets/images/menu-icon-sh404sef.png', 0, '{}', 51, 68, 0, '', 1),
(124, 'main', 'COM_SH404SEF_CONTROL_PANEL', 'com-sh404sef-control-panel', '', 'com-sh404sef/com-sh404sef-control-panel', 'index.php?option=com_sh404sef&c=default', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 52, 53, 0, '', 1),
(125, 'main', 'COM_SH404SEF_URL_MANAGER', 'com-sh404sef-url-manager', '', 'com-sh404sef/com-sh404sef-url-manager', 'index.php?option=com_sh404sef&c=urls&layout=default&view=urls', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 54, 55, 0, '', 1),
(126, 'main', 'COM_SH404SEF_ALIASES_MANAGER', 'com-sh404sef-aliases-manager', '', 'com-sh404sef/com-sh404sef-aliases-manager', 'index.php?option=com_sh404sef&c=aliases&layout=default&view=aliases', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 56, 57, 0, '', 1),
(127, 'main', 'COM_SH404SEF_PAGEID_MANAGER', 'com-sh404sef-pageid-manager', '', 'com-sh404sef/com-sh404sef-pageid-manager', 'index.php?option=com_sh404sef&c=pageids&layout=default&view=pageids', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 58, 59, 0, '', 1),
(128, 'main', 'COM_SH404SEF_404_REQ_MANAGER', 'com-sh404sef-404-req-manager', '', 'com-sh404sef/com-sh404sef-404-req-manager', 'index.php?option=com_sh404sef&c=urls&layout=view404&view=urls', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 60, 61, 0, '', 1),
(129, 'main', 'COM_SH404SEF_TITLE_METAS_MANAGER', 'com-sh404sef-title-metas-manager', '', 'com-sh404sef/com-sh404sef-title-metas-manager', 'index.php?option=com_sh404sef&c=metas&layout=default&view=metas', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 62, 63, 0, '', 1),
(130, 'main', 'COM_SH404SEF_ANALYTICS_MANAGER', 'com-sh404sef-analytics-manager', '', 'com-sh404sef/com-sh404sef-analytics-manager', 'index.php?option=com_sh404sef&c=analytics&layout=default&view=analytics', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1),
(131, 'main', 'COM_SH404SEF_DOCUMENTATION', 'com-sh404sef-documentation', '', 'com-sh404sef/com-sh404sef-documentation', 'index.php?option=com_sh404sef&layout=info&view=default&task=info', 'component', 0, 123, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 66, 67, 0, '', 1),
(132, 'main', 'JCE', 'jce', '', 'jce', 'index.php?option=com_jce', 'component', 0, 1, 1, 10035, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/logo.png', 0, '{}', 69, 78, 0, '', 1),
(133, 'main', 'WF_MENU_CPANEL', 'wf-menu-cpanel', '', 'jce/wf-menu-cpanel', 'index.php?option=com_jce', 'component', 0, 132, 2, 10035, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-cpanel.png', 0, '{}', 70, 71, 0, '', 1),
(134, 'main', 'WF_MENU_CONFIG', 'wf-menu-config', '', 'jce/wf-menu-config', 'index.php?option=com_jce&view=config', 'component', 0, 132, 2, 10035, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-config.png', 0, '{}', 72, 73, 0, '', 1),
(135, 'main', 'WF_MENU_PROFILES', 'wf-menu-profiles', '', 'jce/wf-menu-profiles', 'index.php?option=com_jce&view=profiles', 'component', 0, 132, 2, 10035, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-profiles.png', 0, '{}', 74, 75, 0, '', 1),
(136, 'main', 'WF_MENU_INSTALL', 'wf-menu-install', '', 'jce/wf-menu-install', 'index.php?option=com_jce&view=installer', 'component', 0, 132, 2, 10035, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-install.png', 0, '{}', 76, 77, 0, '', 1),
(137, 'mainmenu', 'Jerri QA', 'jerri-qa', '', 'jerri-qa', 'index.php?option=com_reditem&view=itemdetail&id=7', 'component', -2, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 79, 80, 0, '*', 0),
(138, 'hidden', '404', '404', '', '404', 'index.php?option=com_sh404sef&view=error404', 'component', 1, 1, 1, 10025, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 82, 0, '*', 0),
(139, 'main', 'COM_REDCORE', 'com-redcore', '', 'com-redcore', 'index.php?option=com_redcore', 'component', 0, 1, 1, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 83, 96, 0, '', 1),
(140, 'main', 'COM_REDCORE_DASHBOARD', 'com-redcore-dashboard', '', 'com-redcore/com-redcore-dashboard', 'index.php?option=com_redcore&view=dashboard', 'component', 0, 139, 2, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 84, 85, 0, '', 1),
(141, 'main', 'COM_REDCORE_CONFIGURATION', 'com-redcore-configuration', '', 'com-redcore/com-redcore-configuration', 'index.php?option=com_redcore&view=configs', 'component', 0, 139, 2, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 86, 87, 0, '', 1),
(142, 'main', 'COM_REDCORE_TRANSLATIONS', 'com-redcore-translations', '', 'com-redcore/com-redcore-translations', 'index.php?option=com_redcore&view=translation_tables', 'component', 0, 139, 2, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 88, 89, 0, '', 1),
(143, 'main', 'COM_REDCORE_WEBSERVICES', 'com-redcore-webservices', '', 'com-redcore/com-redcore-webservices', 'index.php?option=com_redcore&view=webservices', 'component', 0, 139, 2, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 90, 91, 0, '', 1),
(144, 'main', 'COM_REDCORE_OAUTH_CLIENTS', 'com-redcore-oauth-clients', '', 'com-redcore/com-redcore-oauth-clients', 'index.php?option=com_redcore&view=oauth_clients', 'component', 0, 139, 2, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 92, 93, 0, '', 1),
(145, 'main', 'COM_REDCORE_PAYMENTS', 'com-redcore-payments', '', 'com-redcore/com-redcore-payments', 'index.php?option=com_redcore&view=payment_dashboard', 'component', 0, 139, 2, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 94, 95, 0, '', 1),
(146, 'main', 'COM_REDITEM', 'com-reditem', '', 'com-reditem', 'index.php?option=com_reditem', 'component', 0, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_reditem/images/reditem16.png', 0, '{}', 97, 98, 0, '', 1),
(147, 'hidden', 'Aktuelt', 'aktuelt', '', 'aktuelt', 'index.php?option=com_reditem&view=categorydetail&id=7', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"subcat_ordering":"lft","subcat_destination":"asc","items_ordering":"alias","items_destination":"asc","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 99, 102, 0, '*', 0),
(148, 'hidden', 'Tilbud og demomodeller', 'tilbud-og-demomodeller', '', 'aktuelt/tilbud-og-demomodeller', 'index.php?option=com_reditem&view=itemdetail&id=9', 'component', 1, 147, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 100, 101, 0, '*', 0),
(150, 'main', 'COM_AKEEBA', 'com-akeeba', '', 'com-akeeba', 'index.php?option=com_akeeba', 'component', 1, 1, 1, 10000, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_akeeba/icons/akeeba-16.png', 0, '{}', 103, 104, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_menu_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_menu_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `home` tinyint(3) unsigned DEFAULT NULL,
  `params` text,
  `published` tinyint(4) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_menu_types`
--

CREATE TABLE IF NOT EXISTS `yp5e2_menu_types` (
  `id` int(10) unsigned NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_menu_types`
--

INSERT INTO `yp5e2_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(3, 'hidden', 'Hidden', '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_messages`
--

CREATE TABLE IF NOT EXISTS `yp5e2_messages` (
  `message_id` int(10) unsigned NOT NULL,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `yp5e2_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_modules`
--

CREATE TABLE IF NOT EXISTS `yp5e2_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_modules`
--

INSERT INTO `yp5e2_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 54, 'Popular Tags', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_tags_popular', 1, 1, '{"maximum":"10","timeframe":"alltime","order_value":"count","order_direction":"1","display_count":0,"no_results_text":"0","minsize":1,"maxsize":2,"layout":"_:default","moduleclass_sfx":"","owncache":"1","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(88, 55, 'Site Information', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_stats_admin', 3, 1, '{"serverinfo":"1","siteinfo":"1","counter":"0","increase":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(89, 56, 'Release News', '', '', 0, 'postinstall', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_feed', 1, 1, '{"rssurl":"https:\\/\\/www.joomla.org\\/announcements\\/release-news.feed","rssrtl":"0","rsstitle":"1","rssdesc":"1","rssimage":"1","rssitems":"3","rssitemdesc":"1","word_count":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(90, 57, 'Latest Articles', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":[""],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 59, 'Image Module', '', '<p><img src="images/headers/blue-flower.jpg" alt="Blue Flower" /></p>', 0, 'position-3', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(93, 60, 'Search', '', '', 0, 'position-0', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_search', 1, 1, '{"label":"","width":"20","text":"","button":"0","button_pos":"right","imagebutton":"1","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(94, 64, 'redCORE language switcher', '', '', 0, '', 0, '0000-00-00 00:00:00', '2016-04-28 10:16:07', '0000-00-00 00:00:00', -2, 'mod_redcore_language_switcher', 1, 1, '', 0, '*'),
(95, 75, 'Topbillede + tekst (forside)', '', '<div class="top-banner">\r\n<div id="owl-demo" class="owl-carousel owl-theme">\r\n<div class="item"><img src="images/banners/top-banner.jpg" alt="The Last of us" /></div>\r\n<div class="item"><img src="images/banners/top-banner.jpg" alt="The Last of us" /></div>\r\n<div class="item"><img src="images/banners/top-banner.jpg" alt="The Last of us" /></div>\r\n</div>\r\n<h2 class="description-banner">en verden fuld af muligheder.. <a href="#main-content" class="arrow"><em class="fa fa-chevron-down"></em></a></h2>\r\n</div>', 1, 'featured', 634, '2016-06-07 09:19:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" banner-top","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 76, 'Module custom Udstillingen', '', '<div class="col-md-9 col-sm-8 col-xs-12 image" style="background-image: url(''images/banners/banner-1.jpg'');">&nbsp;</div>\r\n<div class="col-md-3 col-sm-4 col-xs-12 description">\r\n<h3 class="title"><a href="index.php?option=com_reditem&amp;view=itemdetail&amp;id=5&amp;Itemid=118">Udstillinge</a></h3>\r\n<p class="short-desc"><a href="index.php?option=com_reditem&amp;view=itemdetail&amp;id=5&amp;Itemid=118">besøg os</a></p>\r\n<a href="index.php?option=com_reditem&amp;view=itemdetail&amp;id=5&amp;Itemid=118" class="arrow"><em class="fa  fa-chevron-right"></em></a></div>', 1, 'grid-top', 0, '0000-00-00 00:00:00', '2016-04-27 07:58:17', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" box-custom box-udstillinge","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(97, 77, 'Module custom Nyt bad', '', '<div class="col-md-3 col-sm-4 col-xs-12 description">\r\n<h3 class="title"><a href="index.php?option=com_reditem&amp;view=itemdetail&amp;id=1&amp;Itemid=119">Nyt bad</a></h3>\r\n<p class="short-desc"><a href="index.php?option=com_reditem&amp;view=itemdetail&amp;id=1&amp;Itemid=119">få inspiration her</a></p>\r\n<a href="index.php?option=com_reditem&amp;view=itemdetail&amp;id=1&amp;Itemid=119" class="arrow"><em class="fa  fa-chevron-right"></em></a></div>\r\n<div class="col-md-9 col-sm-8 col-xs-12 image" style="background-image: url(''images/banners/banner-2.jpg'');">&nbsp;</div>', 1, 'grid-top2', 0, '0000-00-00 00:00:00', '2016-04-27 07:58:17', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" box-custom box-nytbad","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 78, '3 billeder på række', '', '<div class="col-sm-4 col-xs-12 image" style="background-image: url(''images/banners/banner-3.jpg'');">&nbsp;</div>\r\n<div class="col-sm-4 col-xs-12 image" style="background-image: url(''images/banners/banner-4.jpg'');">&nbsp;</div>\r\n<div class="col-sm-4 col-xs-12 image " style="background-image: url(''images/banners/banner-5.jpg'');">&nbsp;</div>', 1, 'grid-top3', 634, '2016-06-08 06:31:03', '2016-04-27 06:04:30', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" box-custom banner-middle","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 79, 'Magasiner mm', '', '<div class="col-sm-5 col-xs-12 description">\r\n<div class="desc-text">\r\n<h3 class="title">Læs seneste udgave af Badmagasinet</h3>\r\nnr. 24, februar til august 2016</div>\r\n<a href="http://viewer.zmags.com/publication/845bcd2f#/845bcd2f/1"><img src="images/banners/badmagasinet.jpg" alt="" /></a></div>', 1, 'grid-bottom', 634, '2016-06-07 09:18:27', '2016-04-27 07:58:17', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"images\\/banners\\/Ls-seneste_MG_7427.jpg","layout":"_:default","moduleclass_sfx":" box-badmagasinet","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(100, 80, 'All box bottom', '', '<div class="box-style col-sm-4 col-xs-12 ">\r\n<div class="image" style="background-image: url(''images/banners/banner-7.jpg'');">&nbsp;</div>\r\n<div class="box-content">\r\n<h3 class="title">TILBUD - Villeroy &amp; Boch Loop</h3>\r\n<p>Proin mollis non dolor. In has babitasse platea dictumst. Nulla ultrices odio. Donec augue.</p>\r\n<a href="#" class="arrow"><em class="fa fa-chevron-right"></em></a></div>\r\n</div>\r\n<div class="box-style col-sm-4 col-xs-12 ">\r\n<div class="image" style="background-image: url(''images/banners/banner-8.jpg'');">&nbsp;</div>\r\n<div class="box-content">\r\n<h3 class="title">10 gode råd til et badeværelse for hele familien</h3>\r\n<p>Proin mollis non dolor. In has babitasse platea dictumst. Nulla ultrices odio. Donec augue.</p>\r\n<a href="#" class="arrow"><em class="fa fa-chevron-right"></em></a></div>\r\n</div>\r\n<div class="box-style col-sm-4 col-xs-12 ">\r\n<div class="image" style="background-image: url(''images/banners/banner-9.jpg'');">&nbsp;</div>\r\n<div class="box-content">\r\n<h3 class="title">Mød os på livstilsmessen d.2 maj i MESSE C</h3>\r\n<p>Proin mollis non dolor. In has babitasse platea dictumst. Nulla ultrices odio. Donec augue.</p>\r\n<a href="#" class="arrow"><em class="fa fa-chevron-right"></em></a></div>\r\n</div>', 1, 'grid-bottom2', 0, '0000-00-00 00:00:00', '2016-04-27 07:58:17', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" col-lg-12  box-custom all-box-bottom","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 81, 'Footer', '', '<p>Kier-bad - Paludan-Müllers Vej 38 - 8200 Aarhus N - Telefon: 87 39 13 42 - Fax: 87 39 13 63 - <a href="mailto:kierbad@kier.dk"> kierbad@kier.dk</a></p>', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 97, 'Bund nyheder', '', '', 1, 'grid-bottom2', 634, '2016-06-08 06:31:42', '2016-04-27 07:02:31', '0000-00-00 00:00:00', 1, 'mod_reditem_items', 1, 0, '{"templateId":"6","categoriesIds":["10"],"include_sub":"0","featured_items":"0","items_ordering":"i.created_time","items_direction":"asc","limit":3,"setItemId":0,"display":"0","slider_pager":"1","slider_controls":"1","slider_autoplay":"1","layout":"_:default","moduleclass_sfx":" col-lg-12 box-custom  all-box-bottom","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 103, 'Module Contact', '', '', 1, 'position-3', 0, '0000-00-00 00:00:00', '2016-04-28 10:13:04', '0000-00-00 00:00:00', -2, 'mod_reditem_items', 1, 0, '{"templateId":"9","categoriesIds":["8"],"include_sub":"0","featured_items":"1","items_ordering":"i.created_time","items_direction":"asc","limit":3,"setItemId":0,"display":"0","slider_pager":"1","slider_controls":"1","slider_autoplay":"1","layout":"_:default","moduleclass_sfx":" module-contact","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 111, 'Tilbud under tilbud', '', '', 1, 'grid-bottom2', 634, '2016-06-08 06:31:17', '2016-04-27 07:02:31', '0000-00-00 00:00:00', 0, 'mod_reditem_items', 1, 0, '{"templateId":"6","categoriesIds":["7"],"include_sub":"0","featured_items":"0","items_ordering":"i.created_time","items_direction":"asc","limit":3,"setItemId":0,"display":"0","slider_pager":"1","slider_controls":"1","slider_autoplay":"1","layout":"_:default","moduleclass_sfx":" col-lg-12 box-custom  all-box-bottom","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 146, 'Vi er fulde af gode ideer', '', '<div class="col-sm-5 col-xs-12 description">\r\n<div class="desc-text">\r\n<h3 class="title">Vi er fulde af gode ideer til dit nye badeværelse</h3>\r\nSe her hvordan du f.eks. laver korrekte opmålinger</div>\r\n<a href="http://viewer.zmags.com/publication/845bcd2f#/845bcd2f/1"><img src="images/banners/badmagasinet.jpg" alt="" /></a></div>', 1, 'grid-bottom', 634, '2016-06-07 09:18:17', '2016-04-27 07:58:17', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"images\\/banners\\/Ls-seneste_MG_7427.jpg","layout":"_:default","moduleclass_sfx":" box-badmagasinet","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_modules_menu`
--

CREATE TABLE IF NOT EXISTS `yp5e2_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_modules_menu`
--

INSERT INTO `yp5e2_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(95, 101),
(96, 101),
(97, 101),
(99, 101),
(99, 148),
(100, 0),
(101, 0),
(102, 101),
(102, 120),
(103, 119),
(104, 120),
(104, 138),
(104, 147),
(105, 101),
(105, 148);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_modules_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_modules_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `params` text,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `yp5e2_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_newsfeeds_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_newsfeeds_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_overrider`
--

CREATE TABLE IF NOT EXISTS `yp5e2_overrider` (
  `id` int(10) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `yp5e2_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_postinstall_messages`
--

INSERT INTO `yp5e2_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_country`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_country` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `alpha2` char(2) NOT NULL,
  `alpha3` char(3) NOT NULL,
  `numeric` smallint(3) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_redcore_country`
--

INSERT INTO `yp5e2_redcore_country` (`id`, `name`, `alpha2`, `alpha3`, `numeric`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4),
(2, 'Aland Islands', 'AX', 'ALA', 248),
(3, 'Albania', 'AL', 'ALB', 8),
(4, 'Algeria', 'DZ', 'DZA', 12),
(5, 'American Samoa', 'AS', 'ASM', 16),
(6, 'Andorra', 'AD', 'AND', 20),
(7, 'Angola', 'AO', 'AGO', 24),
(8, 'Anguilla', 'AI', 'AIA', 660),
(9, 'Antarctica', 'AQ', 'ATA', 10),
(10, 'Antigua and Barbuda', 'AG', 'ATG', 28),
(11, 'Argentina', 'AR', 'ARG', 32),
(12, 'Armenia', 'AM', 'ARM', 51),
(13, 'Aruba', 'AW', 'ABW', 533),
(14, 'Australia', 'AU', 'AUS', 36),
(15, 'Austria', 'AT', 'AUT', 40),
(16, 'Azerbaijan', 'AZ', 'AZE', 31),
(17, 'Bahamas', 'BS', 'BHS', 44),
(18, 'Bahrain', 'BH', 'BHR', 48),
(19, 'Bangladesh', 'BD', 'BGD', 50),
(20, 'Barbados', 'BB', 'BRB', 52),
(21, 'Belarus', 'BY', 'BLR', 112),
(22, 'Belgium', 'BE', 'BEL', 56),
(23, 'Belize', 'BZ', 'BLZ', 84),
(24, 'Benin', 'BJ', 'BEN', 204),
(25, 'Bermuda', 'BM', 'BMU', 60),
(26, 'Bhutan', 'BT', 'BTN', 64),
(27, 'Bolivia', 'BO', 'BOL', 68),
(28, 'Bosnia and Herzegovina', 'BA', 'BIH', 70),
(29, 'Botswana', 'BW', 'BWA', 72),
(30, 'Bouvet Island', 'BV', 'BVT', 74),
(31, 'Brazil', 'BR', 'BRA', 76),
(32, 'British Indian Ocean Territory', 'IO', 'IOT', 86),
(33, 'Brunei Darussalam', 'BN', 'BRN', 96),
(34, 'Bulgaria', 'BG', 'BGR', 100),
(35, 'Burkina Faso', 'BF', 'BFA', 854),
(36, 'Burundi', 'BI', 'BDI', 108),
(37, 'Cambodia', 'KH', 'KHM', 116),
(38, 'Cameroon', 'CM', 'CMR', 120),
(39, 'Canada', 'CA', 'CAN', 124),
(40, 'Cape Verde', 'CV', 'CPV', 132),
(41, 'Cayman Islands', 'KY', 'CYM', 136),
(42, 'Central African Republic', 'CF', 'CAF', 140),
(43, 'Chad', 'TD', 'TCD', 148),
(44, 'Chile', 'CL', 'CHL', 152),
(45, 'China', 'CN', 'CHN', 156),
(46, 'Christmas Island', 'CX', 'CXR', 162),
(47, 'Cocos (Keeling) Islands', 'CC', 'CCK', 166),
(48, 'Colombia', 'CO', 'COL', 170),
(49, 'Comoros', 'KM', 'COM', 174),
(50, 'Congo', 'CG', 'COG', 178),
(51, 'Congo, Democratic Republic of the', 'CD', 'COD', 180),
(52, 'Cook Islands', 'CK', 'COK', 184),
(53, 'Costa Rica', 'CR', 'CRI', 188),
(54, 'Cote d''Ivoire', 'CI', 'CIV', 384),
(55, 'Croatia', 'HR', 'HRV', 191),
(56, 'Cuba', 'CU', 'CUB', 192),
(57, 'Cyprus', 'CY', 'CYP', 196),
(58, 'Czech Republic', 'CZ', 'CZE', 203),
(59, 'Denmark', 'DK', 'DNK', 208),
(60, 'Djibouti', 'DJ', 'DJI', 262),
(61, 'Dominica', 'DM', 'DMA', 212),
(62, 'Dominican Republic', 'DO', 'DOM', 214),
(63, 'Ecuador', 'EC', 'ECU', 218),
(64, 'Egypt', 'EG', 'EGY', 818),
(65, 'El Salvador', 'SV', 'SLV', 222),
(66, 'Equatorial Guinea', 'GQ', 'GNQ', 226),
(67, 'Eritrea', 'ER', 'ERI', 232),
(68, 'Estonia', 'EE', 'EST', 233),
(69, 'Ethiopia', 'ET', 'ETH', 231),
(70, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238),
(71, 'Faroe Islands', 'FO', 'FRO', 234),
(72, 'Fiji', 'FJ', 'FJI', 242),
(73, 'Finland', 'FI', 'FIN', 246),
(74, 'France', 'FR', 'FRA', 250),
(75, 'French Guiana', 'GF', 'GUF', 254),
(76, 'French Polynesia', 'PF', 'PYF', 258),
(77, 'French Southern Territories', 'TF', 'ATF', 260),
(78, 'Gabon', 'GA', 'GAB', 266),
(79, 'Gambia', 'GM', 'GMB', 270),
(80, 'Georgia', 'GE', 'GEO', 268),
(81, 'Germany', 'DE', 'DEU', 276),
(82, 'Ghana', 'GH', 'GHA', 288),
(83, 'Gibraltar', 'GI', 'GIB', 292),
(84, 'Greece', 'GR', 'GRC', 300),
(85, 'Greenland', 'GL', 'GRL', 304),
(86, 'Grenada', 'GD', 'GRD', 308),
(87, 'Guadeloupe', 'GP', 'GLP', 312),
(88, 'Guam', 'GU', 'GUM', 316),
(89, 'Guatemala', 'GT', 'GTM', 320),
(90, 'Guernsey', 'GG', 'GGY', 831),
(91, 'Guinea', 'GN', 'GIN', 324),
(92, 'Guinea-Bissau', 'GW', 'GNB', 624),
(93, 'Guyana', 'GY', 'GUY', 328),
(94, 'Haiti', 'HT', 'HTI', 332),
(95, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334),
(96, 'Holy See (Vatican City State)', 'VA', 'VAT', 336),
(97, 'Honduras', 'HN', 'HND', 340),
(98, 'Hong Kong', 'HK', 'HKG', 344),
(99, 'Hungary', 'HU', 'HUN', 348),
(100, 'Iceland', 'IS', 'ISL', 352),
(101, 'India', 'IN', 'IND', 356),
(102, 'Indonesia', 'ID', 'IDN', 360),
(103, 'Iran, Islamic Republic of', 'IR', 'IRN', 364),
(104, 'Iraq', 'IQ', 'IRQ', 368),
(105, 'Ireland', 'IE', 'IRL', 372),
(106, 'Isle of Man', 'IM', 'IMN', 833),
(107, 'Israel', 'IL', 'ISR', 376),
(108, 'Italy', 'IT', 'ITA', 380),
(109, 'Jamaica', 'JM', 'JAM', 388),
(110, 'Japan', 'JP', 'JPN', 392),
(111, 'Jersey', 'JE', 'JEY', 832),
(112, 'Jordan', 'JO', 'JOR', 400),
(113, 'Kazakhstan', 'KZ', 'KAZ', 398),
(114, 'Kenya', 'KE', 'KEN', 404),
(115, 'Kiribati', 'KI', 'KIR', 296),
(116, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 408),
(117, 'Korea, Republic of', 'KR', 'KOR', 410),
(118, 'Kuwait', 'KW', 'KWT', 414),
(119, 'Kyrgyzstan', 'KG', 'KGZ', 417),
(120, 'Lao People''s Democratic Republic', 'LA', 'LAO', 418),
(121, 'Latvia', 'LV', 'LVA', 428),
(122, 'Lebanon', 'LB', 'LBN', 422),
(123, 'Lesotho', 'LS', 'LSO', 426),
(124, 'Liberia', 'LR', 'LBR', 430),
(125, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 434),
(126, 'Liechtenstein', 'LI', 'LIE', 438),
(127, 'Lithuania', 'LT', 'LTU', 440),
(128, 'Luxembourg', 'LU', 'LUX', 442),
(129, 'Macao', 'MO', 'MAC', 446),
(130, 'Macedonia, the former Yugoslav Republic of', 'MK', 'MKD', 807),
(131, 'Madagascar', 'MG', 'MDG', 450),
(132, 'Malawi', 'MW', 'MWI', 454),
(133, 'Malaysia', 'MY', 'MYS', 458),
(134, 'Maldives', 'MV', 'MDV', 462),
(135, 'Mali', 'ML', 'MLI', 466),
(136, 'Malta', 'MT', 'MLT', 470),
(137, 'Marshall Islands', 'MH', 'MHL', 584),
(138, 'Martinique', 'MQ', 'MTQ', 474),
(139, 'Mauritania', 'MR', 'MRT', 478),
(140, 'Mauritius', 'MU', 'MUS', 480),
(141, 'Mayotte', 'YT', 'MYT', 175),
(142, 'Mexico', 'MX', 'MEX', 484),
(143, 'Micronesia, Federated States of', 'FM', 'FSM', 583),
(144, 'Moldova', 'MD', 'MDA', 498),
(145, 'Monaco', 'MC', 'MCO', 492),
(146, 'Mongolia', 'MN', 'MNG', 496),
(147, 'Montenegro', 'ME', 'MNE', 499),
(148, 'Montserrat', 'MS', 'MSR', 500),
(149, 'Morocco', 'MA', 'MAR', 504),
(150, 'Mozambique', 'MZ', 'MOZ', 508),
(151, 'Myanmar', 'MM', 'MMR', 104),
(152, 'Namibia', 'NA', 'NAM', 516),
(153, 'Nauru', 'NR', 'NRU', 520),
(154, 'Nepal', 'NP', 'NPL', 524),
(155, 'Netherlands', 'NL', 'NLD', 528),
(156, 'Netherlands Antilles', 'AN', 'ANT', 530),
(157, 'New Caledonia', 'NC', 'NCL', 540),
(158, 'New Zealand', 'NZ', 'NZL', 554),
(159, 'Nicaragua', 'NI', 'NIC', 558),
(160, 'Niger', 'NE', 'NER', 562),
(161, 'Nigeria', 'NG', 'NGA', 566),
(162, 'Niue', 'NU', 'NIU', 570),
(163, 'Norfolk Island', 'NF', 'NFK', 574),
(164, 'Northern Mariana Islands', 'MP', 'MNP', 580),
(165, 'Norway', 'NO', 'NOR', 578),
(166, 'Oman', 'OM', 'OMN', 512),
(167, 'Pakistan', 'PK', 'PAK', 586),
(168, 'Palau', 'PW', 'PLW', 585),
(169, 'Palestinian Territory, Occupied', 'PS', 'PSE', 275),
(170, 'Panama', 'PA', 'PAN', 591),
(171, 'Papua New Guinea', 'PG', 'PNG', 598),
(172, 'Paraguay', 'PY', 'PRY', 600),
(173, 'Peru', 'PE', 'PER', 604),
(174, 'Philippines', 'PH', 'PHL', 608),
(175, 'Pitcairn', 'PN', 'PCN', 612),
(176, 'Poland', 'PL', 'POL', 616),
(177, 'Portugal', 'PT', 'PRT', 620),
(178, 'Puerto Rico', 'PR', 'PRI', 630),
(179, 'Qatar', 'QA', 'QAT', 634),
(180, 'Reunion', 'RE', 'REU', 638),
(181, 'Romania', 'RO', 'ROU', 642),
(182, 'Russian Federation', 'RU', 'RUS', 643),
(183, 'Rwanda', 'RW', 'RWA', 646),
(184, 'Saint Barthelemy', 'BL', 'BLM', 652),
(185, 'Saint Helena', 'SH', 'SHN', 654),
(186, 'Saint Kitts and Nevis', 'KN', 'KNA', 659),
(187, 'Saint Lucia', 'LC', 'LCA', 662),
(188, 'Saint Martin (French part), ', 'MF', 'MAF', 663),
(189, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666),
(190, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670),
(191, 'Samoa', 'WS', 'WSM', 882),
(192, 'San Marino', 'SM', 'SMR', 674),
(193, 'Sao Tome and Principe', 'ST', 'STP', 678),
(194, 'Saudi Arabia', 'SA', 'SAU', 682),
(195, 'Senegal', 'SN', 'SEN', 686),
(196, 'Serbia', 'RS', 'SRB', 688),
(197, 'Seychelles', 'SC', 'SYC', 690),
(198, 'Sierra Leone', 'SL', 'SLE', 694),
(199, 'Singapore', 'SG', 'SGP', 702),
(200, 'Slovakia', 'SK', 'SVK', 703),
(201, 'Slovenia', 'SI', 'SVN', 705),
(202, 'Solomon Islands', 'SB', 'SLB', 90),
(203, 'Somalia', 'SO', 'SOM', 706),
(204, 'South Africa', 'ZA', 'ZAF', 710),
(205, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239),
(206, 'Spain', 'ES', 'ESP', 724),
(207, 'Sri Lanka', 'LK', 'LKA', 144),
(208, 'Sudan', 'SD', 'SDN', 736),
(209, 'Suriname', 'SR', 'SUR', 740),
(210, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744),
(211, 'Swaziland', 'SZ', 'SWZ', 748),
(212, 'Sweden', 'SE', 'SWE', 752),
(213, 'Switzerland', 'CH', 'CHE', 756),
(214, 'Syrian Arab Republic', 'SY', 'SYR', 760),
(215, 'Taiwan, Province of China', 'TW', 'TWN', 158),
(216, 'Tajikistan', 'TJ', 'TJK', 762),
(217, 'Tanzania, United Republic of', 'TZ', 'TZA', 834),
(218, 'Thailand', 'TH', 'THA', 764),
(219, 'Timor-Leste', 'TL', 'TLS', 626),
(220, 'Togo', 'TG', 'TGO', 768),
(221, 'Tokelau', 'TK', 'TKL', 772),
(222, 'Tonga', 'TO', 'TON', 776),
(223, 'Trinidad and Tobago', 'TT', 'TTO', 780),
(224, 'Tunisia', 'TN', 'TUN', 788),
(225, 'Turkey', 'TR', 'TUR', 792),
(226, 'Turkmenistan', 'TM', 'TKM', 795),
(227, 'Turks and Caicos Islands', 'TC', 'TCA', 796),
(228, 'Tuvalu', 'TV', 'TUV', 798),
(229, 'Uganda', 'UG', 'UGA', 800),
(230, 'Ukraine', 'UA', 'UKR', 804),
(231, 'United Arab Emirates', 'AE', 'ARE', 784),
(232, 'United Kingdom', 'GB', 'GBR', 826),
(233, 'United States', 'US', 'USA', 840),
(234, 'United States Minor Outlying Islands', 'UM', 'UMI', 581),
(235, 'Uruguay', 'UY', 'URY', 858),
(236, 'Uzbekistan', 'UZ', 'UZB', 860),
(237, 'Vanuatu', 'VU', 'VUT', 548),
(238, 'Venezuela', 'VE', 'VEN', 862),
(239, 'Viet Nam', 'VN', 'VNM', 704),
(240, 'Virgin Islands, British', 'VG', 'VGB', 92),
(241, 'Virgin Islands, U.S.', 'VI', 'VIR', 850),
(242, 'Wallis and Futuna', 'WF', 'WLF', 876),
(243, 'Western Sahara', 'EH', 'ESH', 732),
(244, 'Yemen', 'YE', 'YEM', 887),
(245, 'Zambia', 'ZM', 'ZMB', 894),
(246, 'Zimbabwe', 'ZW', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_country_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_country_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_currency`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_currency` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `alpha3` char(3) NOT NULL,
  `numeric` smallint(3) unsigned NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `symbol_position` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'display currency symbol before (0) or after (1) price',
  `decimals` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'number of decimals to show in prices',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'disabled(0) / enabled(1)',
  `blank_space` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'display a blank space between the currency symbol and the price',
  `decimal_separator` varchar(1) NOT NULL DEFAULT ',',
  `thousands_separator` varchar(1) NOT NULL DEFAULT '.'
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_redcore_currency`
--

INSERT INTO `yp5e2_redcore_currency` (`id`, `name`, `alpha3`, `numeric`, `symbol`, `symbol_position`, `decimals`, `state`, `blank_space`, `decimal_separator`, `thousands_separator`) VALUES
(1, 'UAE Dirham', 'AED', 784, 'د.إ', 1, 2, 1, 1, ',', '.'),
(2, 'Afghani', 'AFN', 971, '؋', 1, 2, 1, 1, ',', '.'),
(3, 'Lek', 'ALL', 8, 'Lek', 1, 2, 1, 1, ',', '.'),
(4, 'Armenian Dram', 'AMD', 51, 'AMD', 1, 2, 1, 1, ',', '.'),
(5, 'Netherlands Antillean Guilder', 'ANG', 532, 'ƒ', 1, 2, 1, 1, ',', '.'),
(6, 'Kwanza', 'AOA', 973, 'Kz', 1, 2, 1, 1, ',', '.'),
(7, 'Argentine Peso', 'ARS', 32, '$', 1, 2, 1, 1, ',', '.'),
(8, 'Australian Dollar', 'AUD', 36, '$', 1, 2, 1, 1, ',', '.'),
(9, 'Aruban Florin', 'AWG', 533, 'ƒ', 1, 2, 1, 1, ',', '.'),
(10, 'Azerbaijanian Manat', 'AZN', 944, 'ман', 1, 2, 1, 1, ',', '.'),
(11, 'Convertible Mark', 'BAM', 977, 'KM', 1, 2, 1, 1, ',', '.'),
(12, 'Barbados Dollar', 'BBD', 52, '$', 1, 2, 1, 1, ',', '.'),
(13, 'Taka', 'BDT', 50, 'Tk', 1, 2, 1, 1, ',', '.'),
(14, 'Bulgarian Lev', 'BGN', 975, 'лв', 1, 2, 1, 1, ',', '.'),
(15, 'Bahraini Dinar', 'BHD', 48, 'BD', 1, 2, 1, 1, ',', '.'),
(16, 'Burundi Franc', 'BIF', 108, 'BIF', 1, 2, 1, 1, ',', '.'),
(17, 'Bermudian Dollar', 'BMD', 60, '$', 1, 2, 1, 1, ',', '.'),
(18, 'Brunei Dollar', 'BND', 96, '$', 1, 2, 1, 1, ',', '.'),
(19, 'Boliviano', 'BOB', 68, '$b', 1, 2, 1, 1, ',', '.'),
(20, 'Brazilian Real', 'BRL', 986, 'R$', 1, 2, 1, 1, ',', '.'),
(21, 'Bahamian Dollar', 'BSD', 44, '$', 1, 2, 1, 1, ',', '.'),
(22, 'Ngultrum', 'BTN', 64, 'BTN', 1, 2, 1, 1, ',', '.'),
(23, 'Pula', 'BWP', 72, 'P', 1, 2, 1, 1, ',', '.'),
(24, 'Belarussian Ruble', 'BYR', 974, 'p.', 1, 2, 1, 1, ',', '.'),
(25, 'Belize Dollar', 'BZD', 84, 'BZ$', 1, 2, 1, 1, ',', '.'),
(26, 'Canadian Dollar', 'CAD', 124, '$', 1, 2, 1, 1, ',', '.'),
(27, 'Congolese Franc', 'CDF', 976, 'CDF', 1, 2, 1, 1, ',', '.'),
(28, 'Swiss Franc', 'CHF', 756, 'CHF', 1, 2, 1, 1, ',', '.'),
(29, 'Chilean Peso', 'CLP', 152, '$', 1, 2, 1, 1, ',', '.'),
(30, 'Yuan Renminbi', 'CNY', 156, '¥', 1, 2, 1, 1, ',', '.'),
(31, 'Colombian Peso', 'COP', 170, '$', 1, 2, 1, 1, ',', '.'),
(32, 'Costa Rican Colon', 'CRC', 188, '₡', 1, 2, 1, 1, ',', '.'),
(33, 'Peso Convertible', 'CUC', 931, 'CUC$', 1, 2, 1, 1, ',', '.'),
(34, 'Cuban Peso', 'CUP', 192, '₱', 1, 2, 1, 1, ',', '.'),
(35, 'Cape Verde Escudo', 'CVE', 132, '$', 1, 2, 1, 1, ',', '.'),
(36, 'Czech Koruna', 'CZK', 203, 'Kč', 1, 2, 1, 1, ',', '.'),
(37, 'Djibouti Franc', 'DJF', 262, 'DJF', 1, 2, 1, 1, ',', '.'),
(38, 'Danish Krone', 'DKK', 208, 'kr. ', 0, 2, 1, 1, ',', '.'),
(39, 'Dominican Peso', 'DOP', 214, 'RD$', 1, 2, 1, 1, ',', '.'),
(40, 'Algerian Dinar', 'DZD', 12, 'DZD', 1, 2, 1, 1, ',', '.'),
(41, 'Egyptian Pound', 'EGP', 818, '£', 1, 2, 1, 1, ',', '.'),
(42, 'Nakfa', 'ERN', 232, 'ERN', 1, 2, 1, 1, ',', '.'),
(43, 'Ethiopian Birr', 'ETB', 230, 'Br', 1, 2, 1, 1, ',', '.'),
(44, 'Euro', 'EUR', 978, '€', 1, 2, 1, 1, ',', '.'),
(45, 'Fiji Dollar', 'FJD', 242, '$', 1, 2, 1, 1, ',', '.'),
(46, 'Falkland Islands Pound', 'FKP', 238, '£', 1, 2, 1, 1, ',', '.'),
(47, 'Pound Sterling', 'GBP', 826, '£', 1, 2, 1, 1, ',', '.'),
(48, 'Lari', 'GEL', 981, 'GEL', 1, 2, 1, 1, ',', '.'),
(49, 'Ghana Cedi', 'GHS', 936, 'GH¢', 1, 2, 1, 1, ',', '.'),
(50, 'Gibraltar Pound', 'GIP', 292, '£', 1, 2, 1, 1, ',', '.'),
(51, 'Gambian Dalasi', 'GMD', 270, 'GMD', 1, 2, 1, 1, ',', '.'),
(52, 'Guinean Franc', 'GNF', 324, 'GNF', 1, 2, 1, 1, ',', '.'),
(53, 'Quetzal', 'GTQ', 320, 'Q', 1, 2, 1, 1, ',', '.'),
(54, 'Guyana Dollar', 'GYD', 328, '$', 1, 2, 1, 1, ',', '.'),
(55, 'Hong Kong Dollar', 'HKD', 344, '$', 1, 2, 1, 1, ',', '.'),
(56, 'Lempira', 'HNL', 340, 'L', 1, 2, 1, 1, ',', '.'),
(57, 'Croatian Kuna', 'HRK', 191, 'kn', 1, 2, 1, 1, ',', '.'),
(58, 'Haitian Gourde', 'HTG', 332, 'G', 1, 2, 1, 1, ',', '.'),
(59, 'Forint', 'HUF', 348, 'Ft', 1, 2, 1, 1, ',', '.'),
(60, 'Rupiah', 'IDR', 360, 'Rp', 1, 2, 1, 1, ',', '.'),
(61, 'New Israeli Sheqel', 'ILS', 376, '₪', 1, 2, 1, 1, ',', '.'),
(62, 'Indian Rupee', 'INR', 356, 'INR', 1, 2, 1, 1, ',', '.'),
(63, 'Iraqi Dinar', 'IQD', 368, 'د.ع ', 1, 2, 1, 1, ',', '.'),
(64, 'Iranian Rial', 'IRR', 364, '﷼', 1, 2, 1, 1, ',', '.'),
(65, 'Iceland Krona', 'ISK', 352, 'kr', 1, 2, 1, 1, ',', '.'),
(66, 'Jamaican Dollar', 'JMD', 388, 'J$', 1, 2, 1, 1, ',', '.'),
(67, 'Jordanian Dinar', 'JOD', 400, 'JOD', 1, 2, 1, 1, ',', '.'),
(68, 'Yen', 'JPY', 392, '¥', 1, 2, 1, 1, ',', '.'),
(69, 'Kenyan Shilling', 'KES', 404, 'KSh', 1, 2, 1, 1, ',', '.'),
(70, 'Som', 'KGS', 417, 'лв', 1, 2, 1, 1, ',', '.'),
(71, 'Riel', 'KHR', 116, '៛', 1, 2, 1, 1, ',', '.'),
(72, 'Comoro Franc', 'KMF', 174, 'KMF', 1, 2, 1, 1, ',', '.'),
(73, 'North Korean Won', 'KPW', 408, '₩', 1, 2, 1, 1, ',', '.'),
(74, 'Won', 'KRW', 410, '₩', 1, 2, 1, 1, ',', '.'),
(75, 'Kuwaiti Dinar', 'KWD', 414, 'ك', 1, 2, 1, 1, ',', '.'),
(76, 'Cayman Islands Dollar', 'KYD', 136, '$', 1, 2, 1, 1, ',', '.'),
(77, 'Tenge', 'KZT', 398, 'лв', 1, 2, 1, 1, ',', '.'),
(78, 'Kip', 'LAK', 418, '₭', 1, 2, 1, 1, ',', '.'),
(79, 'Lebanese Pound', 'LBP', 422, '£', 1, 2, 1, 1, ',', '.'),
(80, 'Sri Lanka Rupee', 'LKR', 144, '₨', 1, 2, 1, 1, ',', '.'),
(81, 'Liberian Dollar', 'LRD', 430, '$', 1, 2, 1, 1, ',', '.'),
(82, 'Loti', 'LSL', 426, 'LSL', 1, 2, 1, 1, ',', '.'),
(83, 'Lithuanian Litas', 'LTL', 440, 'Lt', 1, 2, 1, 1, ',', '.'),
(84, 'Latvian Lats', 'LVL', 428, 'Ls', 1, 2, 1, 1, ',', '.'),
(85, 'Libyan Dinar', 'LYD', 434, 'LD', 1, 2, 1, 1, ',', '.'),
(86, 'Moroccan Dirham', 'MAD', 504, 'MAD', 1, 2, 1, 1, ',', '.'),
(87, 'Moldovan Leu', 'MDL', 498, 'MDL', 1, 2, 1, 1, ',', '.'),
(88, 'Malagasy Ariary', 'MGA', 969, 'Ar', 1, 2, 1, 1, ',', '.'),
(89, 'Denar', 'MKD', 807, 'ден', 1, 2, 1, 1, ',', '.'),
(90, 'Kyat', 'MMK', 104, 'K', 1, 2, 1, 1, ',', '.'),
(91, 'Tugrik', 'MNT', 496, '₮', 1, 2, 1, 1, ',', '.'),
(92, 'Pataca', 'MOP', 446, 'MOP$', 1, 2, 1, 1, ',', '.'),
(93, 'Ouguiya', 'MRO', 478, 'MRO', 1, 2, 1, 1, ',', '.'),
(94, 'Mauritius Rupee', 'MUR', 480, '₨', 1, 2, 1, 1, ',', '.'),
(95, 'Rufiyaa', 'MVR', 462, 'MVR', 1, 2, 1, 1, ',', '.'),
(96, 'Kwacha', 'MWK', 454, 'MK', 1, 2, 1, 1, ',', '.'),
(97, 'Mexican Peso', 'MXN', 484, '$', 1, 2, 1, 1, ',', '.'),
(98, 'Malaysian Ringgit', 'MYR', 458, 'RM', 1, 2, 1, 1, ',', '.'),
(99, 'Mozambique Metical', 'MZN', 943, 'MT', 1, 2, 1, 1, ',', '.'),
(100, 'Namibia Dollar', 'NAD', 516, '$', 1, 2, 1, 1, ',', '.'),
(101, 'Naira', 'NGN', 566, '₦', 1, 2, 1, 1, ',', '.'),
(102, 'Cordoba Oro', 'NIO', 558, 'C$', 1, 2, 1, 1, ',', '.'),
(103, 'Norwegian Krone', 'NOK', 578, 'kr', 1, 2, 1, 1, ',', '.'),
(104, 'Nepalese Rupee', 'NPR', 524, '₨', 1, 2, 1, 1, ',', '.'),
(105, 'New Zealand Dollar', 'NZD', 554, '$', 1, 2, 1, 1, ',', '.'),
(106, 'Rial Omani', 'OMR', 512, '﷼', 1, 2, 1, 1, ',', '.'),
(107, 'Balboa', 'PAB', 590, 'B/.', 1, 2, 1, 1, ',', '.'),
(108, 'Nuevo Sol', 'PEN', 604, 'S/.', 1, 2, 1, 1, ',', '.'),
(109, 'Kina', 'PGK', 598, 'K', 1, 2, 1, 1, ',', '.'),
(110, 'Philippine Peso', 'PHP', 608, '₱', 1, 2, 1, 1, ',', '.'),
(111, 'Pakistan Rupee', 'PKR', 586, '₨', 1, 2, 1, 1, ',', '.'),
(112, 'Zloty', 'PLN', 985, 'zł', 1, 2, 1, 1, ',', '.'),
(113, 'Guarani', 'PYG', 600, 'Gs', 1, 2, 1, 1, ',', '.'),
(114, 'Qatari Rial', 'QAR', 634, '﷼', 1, 2, 1, 1, ',', '.'),
(115, 'New Romanian Leu', 'RON', 946, 'lei', 1, 2, 1, 1, ',', '.'),
(116, 'Serbian Dinar', 'RSD', 941, 'Дин.', 1, 2, 1, 1, ',', '.'),
(117, 'Russian Ruble', 'RUB', 643, 'руб', 1, 2, 1, 1, ',', '.'),
(118, 'Rwanda Franc', 'RWF', 646, 'RWF', 1, 2, 1, 1, ',', '.'),
(119, 'Saudi Riyal', 'SAR', 682, '﷼', 1, 2, 1, 1, ',', '.'),
(120, 'Solomon Islands Dollar', 'SBD', 90, '$', 1, 2, 1, 1, ',', '.'),
(121, 'Seychelles Rupee', 'SCR', 690, '₨', 1, 2, 1, 1, ',', '.'),
(122, 'Sudanese Pound', 'SDG', 938, 'SDG', 1, 2, 1, 1, ',', '.'),
(123, 'Swedish Krona', 'SEK', 752, 'kr', 1, 2, 1, 1, ',', '.'),
(124, 'Singapore Dollar', 'SGD', 702, '$', 1, 2, 1, 1, ',', '.'),
(125, 'Saint Helena Pound', 'SHP', 654, '£', 1, 2, 1, 1, ',', '.'),
(126, 'Leone', 'SLL', 694, 'Le', 1, 2, 1, 1, ',', '.'),
(127, 'Somali Shilling', 'SOS', 706, 'S', 1, 2, 1, 1, ',', '.'),
(128, 'Surinam Dollar', 'SRD', 968, '$', 1, 2, 1, 1, ',', '.'),
(129, 'Dobra', 'STD', 678, 'STD', 1, 2, 1, 1, ',', '.'),
(130, 'El Salvador Colon', 'SVC', 222, '$', 1, 2, 1, 1, ',', '.'),
(131, 'Syrian Pound', 'SYP', 760, '£', 1, 2, 1, 1, ',', '.'),
(132, 'Lilangeni', 'SZL', 748, 'SZL', 1, 2, 1, 1, ',', '.'),
(133, 'Baht', 'THB', 764, '฿', 1, 2, 1, 1, ',', '.'),
(134, 'Somoni', 'TJS', 972, 'TJS', 1, 2, 1, 1, ',', '.'),
(135, 'Turkmenistan New Manat', 'TMT', 934, 'TMT', 1, 2, 1, 1, ',', '.'),
(136, 'Tunisian Dinar', 'TND', 788, 'TND', 1, 2, 1, 1, ',', '.'),
(137, 'Pa''anga', 'TOP', 776, 'T$', 1, 2, 1, 1, ',', '.'),
(138, 'Turkish Lira', 'TRY', 949, 'TL', 1, 2, 1, 1, ',', '.'),
(139, 'Trinidad and Tobago Dollar', 'TTD', 780, 'TT$', 1, 2, 1, 1, ',', '.'),
(140, 'New Taiwan Dollar', 'TWD', 901, 'NT$', 1, 2, 1, 1, ',', '.'),
(141, 'Tanzanian Shilling', 'TZS', 834, 'TZS', 1, 2, 1, 1, ',', '.'),
(142, 'Hryvnia', 'UAH', 980, '₴', 1, 2, 1, 1, ',', '.'),
(143, 'Uganda Shilling', 'UGX', 800, 'USh', 1, 2, 1, 1, ',', '.'),
(144, 'US Dollar', 'USD', 840, '$', 0, 2, 1, 1, ',', '.'),
(145, 'Peso Uruguayo', 'UYU', 858, '$U', 1, 2, 1, 1, ',', '.'),
(146, 'Uzbekistan Sum', 'UZS', 860, 'лв', 1, 2, 1, 1, ',', '.'),
(147, 'Bolivar', 'VEF', 937, 'Bs', 1, 2, 1, 1, ',', '.'),
(148, 'Dong', 'VND', 704, '₫', 1, 2, 1, 1, ',', '.'),
(149, 'Vatu', 'VUV', 548, 'VT', 1, 2, 1, 1, ',', '.'),
(150, 'Tala', 'WST', 882, '$', 1, 2, 1, 1, ',', '.'),
(151, 'CFA Franc BEAC', 'XAF', 950, 'XAF', 1, 2, 1, 1, ',', '.'),
(152, 'East Caribbean Dollar', 'XCD', 951, '$', 1, 2, 1, 1, ',', '.'),
(153, 'SDR (Special Drawing Right)', 'XDR', 960, 'XDR', 1, 2, 1, 1, ',', '.'),
(154, 'CFA Franc BCEAO', 'XOF', 952, 'XOF', 1, 2, 1, 1, ',', '.'),
(155, 'CFP Franc', 'XPF', 953, 'XPF', 1, 2, 1, 1, ',', '.'),
(156, 'Yemeni Rial', 'YER', 886, '﷼', 1, 2, 1, 1, ',', '.'),
(157, 'Rand', 'ZAR', 710, 'R', 1, 2, 1, 1, ',', '.'),
(158, 'Zambian Kwacha', 'ZMK', 894, 'ZK', 1, 2, 1, 1, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_currency_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_currency_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL DEFAULT '',
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_authorization_codes`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL DEFAULT '',
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_clients`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `client_secret` varchar(80) NOT NULL DEFAULT '',
  `redirect_uri` varchar(2000) NOT NULL DEFAULT '',
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` text,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_jti`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_jti` (
  `issuer` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `audiance` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jti` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_jwt`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_jwt` (
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_public_keys`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_public_keys` (
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL DEFAULT '',
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_scopes`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_redcore_oauth_scopes`
--

INSERT INTO `yp5e2_redcore_oauth_scopes` (`scope`, `is_default`) VALUES
('site.create', NULL),
('site.read', NULL),
('site.update', NULL),
('site.delete', NULL),
('site.documentation', NULL),
('site.task', NULL),
('administrator.create', NULL),
('administrator.read', NULL),
('administrator.update', NULL),
('administrator.delete', NULL),
('administrator.documentation', NULL),
('administrator.task', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_oauth_users`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_oauth_users` (
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_payments`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_payments` (
  `id` int(11) unsigned NOT NULL,
  `extension_name` varchar(255) NOT NULL DEFAULT '',
  `owner_name` varchar(255) NOT NULL DEFAULT '',
  `payment_name` varchar(50) NOT NULL DEFAULT '',
  `sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `order_name` varchar(255) NOT NULL DEFAULT '',
  `order_id` varchar(255) NOT NULL DEFAULT '',
  `url_cancel` varchar(2000) NOT NULL DEFAULT '',
  `url_accept` varchar(2000) NOT NULL DEFAULT '',
  `client_email` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `confirmed_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_id` varchar(255) NOT NULL DEFAULT '',
  `amount_original` decimal(10,2) NOT NULL,
  `amount_order_tax` decimal(10,2) NOT NULL,
  `order_tax_details` varchar(2000) NOT NULL DEFAULT '',
  `amount_shipping` decimal(10,2) NOT NULL,
  `shipping_details` varchar(2000) NOT NULL DEFAULT '',
  `amount_payment_fee` decimal(10,2) NOT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `currency` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(255) NOT NULL DEFAULT '',
  `customer_note` varchar(2000) NOT NULL DEFAULT '',
  `status` varchar(32) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `retry_counter` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_payment_configuration`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_payment_configuration` (
  `id` int(11) unsigned NOT NULL,
  `extension_name` varchar(255) NOT NULL DEFAULT '',
  `owner_name` varchar(255) NOT NULL DEFAULT '',
  `payment_name` varchar(50) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_payment_log`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_payment_log` (
  `id` int(11) unsigned NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  `referrer` varchar(2000) NOT NULL DEFAULT '',
  `message_uri` varchar(2000) NOT NULL DEFAULT '',
  `message_post` text NOT NULL,
  `message_text` text NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  `transaction_id` varchar(255) NOT NULL DEFAULT '',
  `customer_note` varchar(2000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_translation_columns`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_translation_columns` (
  `id` int(11) unsigned NOT NULL,
  `translation_table_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `column_type` varchar(45) NOT NULL DEFAULT 'translate',
  `value_type` varchar(45) NOT NULL DEFAULT 'text',
  `fallback` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(50) NOT NULL DEFAULT 'RAW',
  `description` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_redcore_translation_columns`
--

INSERT INTO `yp5e2_redcore_translation_columns` (`id`, `translation_table_id`, `name`, `title`, `column_type`, `value_type`, `fallback`, `filter`, `description`, `params`) VALUES
(1, 1, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(2, 1, 'name', 'Client Name', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(3, 1, 'contact', 'Contact Name', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(4, 1, 'email', 'Contact Email', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(5, 1, 'extrainfo', 'Extra Info', 'translate', 'textarea', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(6, 1, 'state', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(7, 2, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(8, 2, 'name', 'Banner Name', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(9, 2, 'clickurl', 'Click URL', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(10, 2, 'custombannercode', 'Custom banner code', 'translate', 'textarea', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(11, 2, 'state', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(12, 3, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(13, 3, 'extension', 'Extension', 'readonly', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(14, 3, 'title', 'Title', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(15, 3, 'alias', 'Alias', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","posthandler":"filterTitle"}'),
(16, 3, 'description', 'Description', 'translate', 'htmltext', 0, 'RAW', '', '{"filter":"RAW","description":"","ebuttons":"readmore,pagebreak"}'),
(17, 3, 'published', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":"","stateoptions":"0,1,2,-2"}'),
(18, 4, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(19, 4, 'name', 'Name', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(20, 4, 'alias', 'Alias', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","posthandler":"filterTitle"}'),
(21, 4, 'con_position', 'Position', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(22, 4, 'email_to', 'Email Address', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(23, 4, 'address', 'Street Address', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(24, 4, 'suburb', 'Town/Suburb', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(25, 4, 'state', 'State/County', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(26, 4, 'country', 'Country', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(27, 4, 'postcode', 'Postcode', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(28, 4, 'telephone', 'Telefon', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(29, 4, 'fax', 'Fax', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(30, 4, 'misc', 'Miscellaneous Info', 'translate', 'textarea', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(31, 4, 'params', 'Parameters', 'translate', 'params', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(32, 4, 'published', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(33, 5, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(34, 5, 'title', 'Title', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":"","length":"50","maxlength":"250"}'),
(35, 5, 'alias', 'Title Alias', 'readonly', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","length":"50","maxlength":"250"}'),
(36, 5, 'catid', 'Category', 'readonly', 'hiddentext', 0, 'RAW', '', '{"filter":"RAW","description":"","scope":"com_content"}'),
(37, 5, 'introtext', 'Article Text', 'translate', 'htmltext', 0, 'RAW', '', '{"filter":"RAW","description":"","ebuttons":"ignore"}'),
(38, 5, 'fulltext', 'Fulltext', 'translate', 'htmltext', 0, 'RAW', '', '{"filter":"RAW","description":"","ebuttons":"readmore"}'),
(39, 5, 'metakey', 'Metakey', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","length":"50","maxlength":"250"}'),
(40, 5, 'metadesc', 'Metadesc', 'translate', 'textarea', 0, 'RAW', '', '{"filter":"RAW","description":"","rows":"5","columns":"80"}'),
(41, 5, 'state', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":"","stateoptions":"0,1,2,-2"}'),
(42, 5, 'publish_up', 'Start Publishing', 'translate', 'text', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(43, 5, 'publish_down', 'Finish Publishing', 'translate', 'text', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(44, 5, 'attribs', 'Attributes', 'translate', 'params', 1, 'RAW', '', '{"filter":"RAW","description":"","formname":"article","fieldsname":"attribs","fieldsets":"basic,editorConfig"}'),
(45, 6, 'lang_id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(46, 6, 'title', 'Title', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(47, 6, 'published', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(48, 7, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(49, 7, 'title', 'Name', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(50, 7, 'alias', 'Menu Alias', 'translate', 'text', 1, 'RAW', '', '{"filter":"RAW","description":"","posthandler":"filterTitle"}'),
(51, 7, 'link', 'Link', 'translate', 'readonlytext', 1, 'RAW', '', '{"filter":"RAW","description":"","posthandler":"saveUrlParams"}'),
(52, 7, 'path', 'Path', 'translate', 'readonlytext', 0, 'RAW', '', '{"filter":"RAW","description":"","posthandler":"saveMenuPath"}'),
(53, 7, 'type', 'Menu Type', 'readonly', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(54, 7, 'home', 'Homepage', 'translate', 'hiddentext', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(55, 7, 'params', 'Params', 'translate', 'params', 1, 'RAW', '', '{"filter":"RAW","description":"","formname":"item","fieldsname":"params","xpath":"true"}'),
(56, 7, 'published', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(57, 8, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(58, 8, 'title', 'Title', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(59, 8, 'module', 'Module', 'readonly', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(60, 8, 'content', 'Content', 'translate', 'htmltext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(61, 8, 'client_id', 'Module', 'readonly', 'text', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(62, 8, 'params', 'Parameters', 'translate', 'params', 1, 'RAW', '', '{"filter":"RAW","description":"","formname":"advanced","formname25":"module","fieldsname":"params"}'),
(63, 8, 'published', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(64, 9, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(65, 9, 'name', 'Name', 'translate', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(66, 9, 'alias', 'Alias', 'translate', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","posthandler":"filterTitle"}'),
(67, 9, 'published', 'State', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(68, 10, 'extension_id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(69, 10, 'name', 'Name', 'readonly', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(70, 10, 'element', 'Element', 'readonly', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(71, 10, 'folder', 'Folder', 'readonly', 'titletext', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(72, 10, 'params', 'Parameters', 'translate', 'params', 1, 'RAW', '', '{"filter":"RAW","description":"","formname":"plugin","formname25":"plugin","fieldsname":"params"}'),
(73, 10, 'enabled', 'Enabled', 'translate', 'state', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(74, 11, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(75, 11, 'name', 'Country Name', 'translate', 'text', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(76, 11, 'alpha2', 'Alpha 2', 'readonly', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","disabled":"true"}'),
(77, 12, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(78, 12, 'name', 'Currency Name', 'translate', 'text', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(79, 12, 'alpha3', 'Alpha 3', 'readonly', 'text', 0, 'RAW', '', '{"filter":"RAW","description":"","disabled":"true"}'),
(80, 13, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '{"filter":"RAW","description":""}'),
(81, 13, 'name', 'Name', 'translate', 'titletext', 1, 'RAW', '', '{"filter":"RAW","description":""}'),
(82, 14, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '[]'),
(83, 14, 'title', 'Category Name', 'translate', 'text', 0, 'RAW', '', '[]'),
(84, 14, 'introtext', 'Category Introtext', 'translate', 'htmltext', 0, 'RAW', '', '[]'),
(85, 14, 'fulltext', 'Category Fulltext', 'translate', 'htmltext', 0, 'RAW', '', '[]'),
(86, 15, 'id', 'ID', 'primary', 'referenceid', 0, 'RAW', '', '[]'),
(87, 15, 'title', 'Item Name', 'translate', 'text', 0, 'RAW', '', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_translation_tables`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_translation_tables` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `extension_name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '1.0.0',
  `primary_columns` varchar(100) NOT NULL DEFAULT 'id',
  `translate_columns` varchar(500) NOT NULL DEFAULT '',
  `fallback_columns` varchar(500) NOT NULL DEFAULT '',
  `form_links` text,
  `xml_path` varchar(500) NOT NULL DEFAULT '',
  `xml_hashed` varchar(32) NOT NULL DEFAULT '',
  `filter_query` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_redcore_translation_tables`
--

INSERT INTO `yp5e2_redcore_translation_tables` (`id`, `name`, `extension_name`, `title`, `version`, `primary_columns`, `translate_columns`, `fallback_columns`, `form_links`, `xml_path`, `xml_hashed`, `filter_query`, `params`, `state`, `checked_out`, `checked_out_time`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, '#__banner_clients', 'com_banners', 'Banners - Clients', '1.8.3', 'id', 'name,contact,email,extrainfo,state', 'state', '[{"admin":"true","option":"com_banners","view":"client","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_banners/banner_clients.xml', '316d245d34d23c3100f58d31336dd27e', '', '{"description":"Translation definition for Joomla Banner component","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(2, '#__banners', 'com_banners', 'Banners', '1.8.3', 'id', 'name,clickurl,custombannercode,state', 'state', '[{"admin":"true","option":"com_banners","view":"banner","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_banners/banners.xml', '036720a5e97c884d6860b8ae584d9d5b', '', '{"description":"Translation definition for Joomla Banner component","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(3, '#__categories', 'com_categories', 'Categories', '1.8.3', 'id', 'title,alias,description,published', 'published', '[{"admin":"true","option":"com_categories","view":"category","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_categories/categories.xml', 'ad9cb9f4c24656b559ad48934839bb4b', 'o.level > 0', '{"description":"Translation definition for Joomla Categories","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(4, '#__contact_details', 'com_contact', 'Contact - details', '1.8.3', 'id', 'name,alias,con_position,email_to,address,suburb,state,country,postcode,telephone,fax,misc,params,published', 'params,published', '[{"admin":"true","option":"com_contact","view":"contact","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_contact/contact_details.xml', 'a6f2b3bad789b8887842d2d296cfba8d', '', '{"description":"Translation definition for Joomla Contact component","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(5, '#__content', 'com_content', 'Contents', '1.8.3', 'id', 'title,introtext,fulltext,metakey,metadesc,state,publish_up,publish_down,attribs', 'state,publish_up,publish_down,attribs', '[{"admin":"true","option":"com_content","view":"article","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"},{"admin":"false","option":"com_content","view":"form","layout":"edit","identifier":"a_id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_content/content.xml', '0c6d400dcc4f27adc886e4007e194b93', '', '{"description":"Translation definition for Joomla Content component","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(6, '#__languages', 'com_languages', 'Languages', '1.8.3', 'lang_id', 'title,published', 'published', '[{"admin":"true","option":"com_languages","view":"language","layout":"edit","identifier":"lang_id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_languages/languages.xml', 'a290d95f281d290bd9d0db0b0511286a', '', '{"description":"Translation definition for Joomla Languages","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(7, '#__menu', 'com_menus', 'Menus', '1.8.3', 'id', 'title,alias,link,path,home,params,published', 'alias,link,home,params,published', '[{"admin":"true","option":"com_menus","view":"item","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_menus/menu.xml', 'b72abdf238768decd618f95a56ee862e', 'o.client_id = 0 AND o.lft > 0', '{"description":"Translation definition for Joomla Menu Manager","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(8, '#__modules', 'com_modules', 'Modules', '1.8.3', 'id', 'title,content,params,published', 'params,published', '[{"admin":"true","option":"com_modules","view":"module","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_modules/modules.xml', '3e974f41b14f15c3206a5eb6bc0eec3d', 'o.client_id = 0', '{"description":"Translation definition for Joomla Module Management","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(9, '#__newsfeeds', 'com_newsfeeds', 'Newsfeeds', '1.8.3', 'id', 'name,alias,published', 'published', '[{"admin":"true","option":"com_newsfeeds","view":"newsfeed","layout":"edit","identifier":"id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_newsfeeds/newsfeeds.xml', 'bad664a3dcb79ca03fd1f2166ff88627', '', '{"description":"Translation definition for Joomla Newsfeeds component","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(10, '#__extensions', 'com_plugins', 'Plugins', '1.8.3', 'extension_id', 'params,enabled', 'params,enabled', '[{"admin":"true","option":"com_plugins","view":"plugin","layout":"edit","identifier":"extension_id","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_plugins/plugins.xml', '26f01714310788ff2bbc092fd5f57682', 'o.type = ''plugin''', '{"description":"Translation definition for Joomla Plugin Management","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(11, '#__redcore_country', 'com_redcore', 'Redcore Country', '1.8.3', 'id', 'name', 'name', NULL, '/media/redcore/translations/com_redcore/country.xml', '1e4f9e1bdc82f8d7f752b65a75b5ea56', '', '{"description":"Country Table Definition for the redCORE extension","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(12, '#__redcore_currency', 'com_redcore', 'Redcore Currency', '1.8.3', 'id', 'name', 'name', NULL, '/media/redcore/translations/com_redcore/currency.xml', '433624083d847df143d87425b8449134', '', '{"description":"Currency Table Definition for the redCORE extension","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(13, '#__users', 'com_users', 'Users', '1.8.3', 'id', 'name', 'name', '[{"admin":"true","option":"com_users","view":"user","layout":"edit","identifier":"id","showbutton":"false","htmlposition":".btn-toolbar:first"}]', '/media/redcore/translations/com_users/users.xml', '5b57d221ce8b4ba4cbee93f9416a7806', '', '{"description":"Translation definition for Joomla User Management","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(14, '#__reditem_categories', 'com_reditem', 'RedITEM Category', '1.0.0', 'id', 'title,introtext,fulltext', '', '[{"option":"com_reditem","view":"category","identifier":"cid","layout":"edit","admin":"false","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/com_reditem/translations/category.xml', 'f86751ec968a27fec2024f1e342c7548', '', '{"description":"Categories Table Definition for the RedITEM extension","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12'),
(15, '#__reditem_items', 'com_reditem', 'RedITEM Item', '1.0.0', 'id', 'title', '', '[{"option":"com_reditem","view":"item","identifier":"cid","layout":"edit","admin":"false","showbutton":"true","htmlposition":".btn-toolbar:first"}]', '/media/com_reditem/translations/item.xml', '488eea9b63bcb776cf26c5fa1ea00f5c', '', '{"description":"Items Table Definition for the RedITEM extension","author":"redCOMPONENT","copyright":"Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved."}', 1, NULL, '0000-00-00 00:00:00', 629, '2016-04-27 10:00:12', 629, '2016-04-27 10:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redcore_webservices`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redcore_webservices` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(5) NOT NULL DEFAULT '1.0.0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `xmlFile` varchar(255) NOT NULL DEFAULT '',
  `xmlHashed` varchar(32) NOT NULL DEFAULT '',
  `operations` text,
  `scopes` text,
  `client` varchar(15) NOT NULL DEFAULT 'site',
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_redirect_links`
--

CREATE TABLE IF NOT EXISTS `yp5e2_redirect_links` (
  `id` int(10) unsigned NOT NULL,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_categories`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(255) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `category_image` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` text NOT NULL,
  `template_id` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_categories`
--

INSERT INTO `yp5e2_reditem_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `title`, `alias`, `access`, `path`, `type_id`, `category_image`, `introtext`, `fulltext`, `template_id`, `featured`, `ordering`, `published`, `publish_up`, `publish_down`, `checked_out`, `checked_out_time`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `params`) VALUES
(1, 0, 0, 0, 19, 0, 'ROOT', 'root', 0, '', 0, '', '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', ''),
(4, 82, 1, 1, 8, 1, 'Kier bad', 'kier-bad', 1, 'kier-bad', 1, '', '', '', 3, 0, 0, 1, '2016-04-14 03:58:15', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 629, '2016-04-14 03:58:15', 629, '2016-04-27 09:38:51', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(5, 89, 4, 4, 5, 2, 'Nyt bad', 'nyt-bat', 1, 'kier-bad/nyt-bat', 1, '1462886371_nyt-bad1-mg-7431.jpg', '<p>få inspiration her</p>', '', 8, 0, 0, 1, '2016-04-27 03:18:49', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 629, '2016-04-27 03:18:49', 634, '2016-06-09 08:38:10', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(6, 90, 4, 2, 3, 2, 'Udstillingen', 'udstillingen', 1, 'kier-bad/udstillingen', 1, '1462885952_udstillingen-mg-7474.jpg', '<p>besøg os</p>', '', 8, 0, 0, 1, '2016-04-27 03:19:32', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 629, '2016-04-27 03:19:32', 634, '2016-06-06 08:39:05', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(7, 92, 1, 9, 10, 1, 'Aktuel', 'aktuel', 1, 'aktuel', 1, '', '', '', 8, 0, 0, 0, '2016-04-27 06:34:09', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 629, '2016-04-27 06:34:09', 634, '2016-05-10 12:48:07', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(8, 99, 1, 11, 12, 1, 'Kontakt', 'kontakt', 1, 'kontakt', 1, '1463560338_indgangsparti.jpg', '<p>og åbningstider</p>', '', 8, 0, 0, 1, '2016-04-27 10:29:33', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 629, '2016-04-27 10:29:33', 633, '2016-05-18 08:32:18', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(9, 102, 1, 17, 18, 1, 'Leverandører', 'leverandorer', 1, 'leverandorer', 1, '1464676959_banner-1.jpg', '<p>kvalitet holder længere</p>', '', 11, 0, 0, 1, '2016-04-27 03:18:49', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 633, '2016-04-27 12:28:14', 629, '2016-05-31 06:42:39', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(10, 104, 1, 13, 14, 1, 'Aktuelt', 'aktuelt', 1, 'aktuelt', 1, '1462885058_aktuelt-mg-7398.jpg', '', '', 8, 0, 0, 1, '2016-04-28 03:21:36', '0000-00-00 00:00:00', 634, '2016-05-11 06:50:30', 630, '2016-04-28 03:21:36', 634, '2016-05-10 12:57:38', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(12, 108, 4, 6, 7, 2, 'Test show cate..', 'test-show-cate', 1, 'kier-bad/test-show-cate', 1, '', '', '', 8, 0, 0, 0, '2016-04-29 10:43:31', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 630, '2016-04-29 10:43:31', 0, '0000-00-00 00:00:00', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}'),
(14, 110, 1, 15, 16, 1, 'Kier bad (2)', 'kier-bad-2', 1, 'kier-bad-2', 1, '', '', '', 3, 0, 0, 1, '2016-04-14 03:58:15', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 634, '2016-05-09 08:59:35', 0, '0000-00-00 00:00:00', '{"category_item_unpublish_after_user_deactivated":"0","category_item_unpublish_after_user_deleted":"0","category_image_title":"","category_image_alt":"","meta_description":"","meta_keywords":"","meta_robots":""}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_categories_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_categories_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `introtext` mediumtext,
  `fulltext` text,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_category_fields`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_category_fields` (
  `id` int(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `options` text NOT NULL,
  `fieldcode` varchar(255) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_category_fields`
--

INSERT INTO `yp5e2_reditem_category_fields` (`id`, `type`, `type_id`, `ordering`, `published`, `name`, `required`, `options`, `fieldcode`, `checked_out`, `checked_out_time`) VALUES
(9, 'text', 1, 1, 1, 'Title after category areas', 0, '', 'title_after_category_areas', 630, '2016-05-06 09:26:43'),
(10, 'textarea', 1, 2, 1, 'Description after category areas', 0, '', 'description_after_category_areas', 0, '0000-00-00 00:00:00'),
(11, 'editor', 1, 3, 1, 'Content after category areas', 0, '', 'content_after_category_areas', 0, '0000-00-00 00:00:00'),
(12, 'image', 1, 4, 1, 'Image after category areas', 0, '', 'image_after_category_areas', 0, '0000-00-00 00:00:00'),
(13, 'googlemaps', 1, 5, 1, 'Google map', 0, '', 'google_map', 0, '0000-00-00 00:00:00'),
(14, 'editor', 1, 6, 1, 'Google map content', 0, '', 'google_map_content', 0, '0000-00-00 00:00:00'),
(15, 'image', 1, 10, 1, 'Image banner full screen', 0, '', 'image_banner_full_screen', 0, '0000-00-00 00:00:00'),
(16, 'image', 1, 7, 1, 'Banner three column1', 0, '', 'banner_three_column1', 0, '0000-00-00 00:00:00'),
(17, 'image', 1, 8, 1, 'Banner three column2', 0, '', 'banner_three_column2', 0, '0000-00-00 00:00:00'),
(18, 'image', 1, 9, 1, 'Banner three column3', 0, '', 'banner_three_column3', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_category_fields_value`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_category_fields_value` (
  `cat_id` int(10) NOT NULL,
  `title_after_category_areas` mediumtext,
  `description_after_category_areas` mediumtext,
  `content_after_category_areas` mediumtext,
  `image_after_category_areas` mediumtext,
  `google_map` mediumtext,
  `google_map_content` mediumtext,
  `image_banner_full_screen` mediumtext,
  `banner_three_column1` mediumtext,
  `banner_three_column2` mediumtext,
  `banner_three_column3` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_category_fields_value`
--

INSERT INTO `yp5e2_reditem_category_fields_value` (`cat_id`, `title_after_category_areas`, `description_after_category_areas`, `content_after_category_areas`, `image_after_category_areas`, `google_map`, `google_map_content`, `image_banner_full_screen`, `banner_three_column1`, `banner_three_column2`, `banner_three_column3`) VALUES
(4, '', '', '', '', '56.2026602,10.0955601', '', NULL, NULL, NULL, NULL),
(5, 'Nyt bad, hvad nu?', 'Drømmer du om nyt badeværelse eller renovering af dit eksisterende badeværelse...', '<p>Vi hjælper dig med sammensætning af produkter til dit nye badeværelse. Vi laver også en komplet liste til din VVS-installatør, så du kommer helt i mål med dit projekt.</p>\r\n<p>Har du behov for hjælp til indretning. f.eks. ud fra en skitse over dit badeværelse, laver vi gerne en 3D-tegning af dit nye badeværelse.</p>\r\n<p>Vi har et godt samarbejde med VVS-installatører i Aarhus og kan altid hjælpe dig med at finde en håndværker til dit projekt.</p>\r\n<p>Du er også velkommen, hvis du blot leder efter et tip til det lille badeværelse, har brug for plejeprodukter eller en badskraber som værtindegave.</p>\r\n<p>Og vi har altid et godt tilbud!</p>', '["5\\/7a4cf31c7b5fb5c299c3ad65cf02ba360d8a8631.jpg"]', '', '', '', '["5\\/6e5f50152316db047100513b45ce4f5738b6d0d6.jpg"]', '["5\\/518a868e1c2ad6268f34d6906ac074d1a12537e6.jpg"]', '["5\\/ad86b420664e781236609654b50d6066724caf43.jpg"]'),
(6, 'Lad dig inspirere - besøg vores udstilling ', 'En verden af muligheder - gå på opdagelse i vores udstilling', '<p>Du er velkommen til at besøge vores 255 kvadratmeter store og flotte udstilling med 24 forskellige badmiljøer fra de førende leverandører. Her&nbsp;viser vi&nbsp;et særdeles bredt udvalg af de muligheder, der findes på markedet, og de komplette løsninger rummer også et væld af lækre detaljer.<br /><br />Du kan naturligvis kombinere delene fra de enkelte badmiljøer, som du har lyst. Vi hjælper gerne med gode råd og ideer til indretningen, ligesom du kan få brochurer om alt til badeværelset.</p>', '["6\\/f3a9535ad8cd15c2215c1d7a1083110b228d330d.jpg"]', '56.171171,10.183637', '<h3 class="title">Vi er altid klar til at hjælpe, &nbsp;så kig ind i udstillingen.</h3>\r\n<div class="description"><br />Paludan-Müllers Vej 38</div>\r\n<div class="address-info">\r\n<div class="street">\r\n<p>8200 Aarhus N</p>\r\n</div>\r\n<p style="margin-bottom: 0;">Tlf.: 87 39 13 42</p>\r\n<p style="margin-bottom: 18px;">Fax.: 87 39 13 63</p>\r\n</div>\r\n<div class="address-contact">\r\n<div class="col-sm-6 col-xs-12">\r\n<div class="name">Kirsten Jensen</div>\r\n<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="href=">kij@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 49</p>\r\n</div>\r\n<div class="col-sm-6 col-xs-12">\r\n<div class="name">Henriette Mathiasen</div>\r\n<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="mailto:hem@kier.dk">hem@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 45</p>\r\n</div>\r\n</div>\r\n<p>&nbsp;</p>\r\n<p><strong> Undgå ventetid - book et møde, ring eller send os en mail, lørdag undtaget. </strong></p>', '["6\\/884d586b04bdf811ae96b6800bd1e5c2288d8267.jpg"]', '', '', ''),
(7, '', '', '', '', '', '', '', '', '', ''),
(8, '', '', '', '', '56.171171,10.183637', '<h3 class="title">Vi er altid klar til at hjælpe, &nbsp;så kig ind i udstillingen.</h3>\r\n<div class="address-info">\r\n<div class="name">kier-bad</div>\r\n<div class="street">\r\n<p style="margin-bottom: 0; margin-top: 8px;">Paludan-Müllers Vej 38</p>\r\n<p>8200 Aarhus N</p>\r\n</div>\r\n<p style="margin-bottom: 0;">Tlf.: 87 39 13 42</p>\r\n<p style="margin-bottom: 18px;">Fax.: 87 39 13 63</p>\r\n</div>\r\n<div class="address-contact col-xs-12">\r\n<div class="name">Åbningstider:</div>\r\n<div class=" col-sm-6 col-xs-12">Mandag - onsdag</div>\r\n<div class=" col-sm-6 col-xs-12">10.00 - 17.00</div>\r\n<div class=" col-sm-6 col-xs-12">Torsdag</div>\r\n<div class=" col-sm-6 col-xs-12">10.00 - 18.00</div>\r\n<div class=" col-sm-6 col-xs-12">Fredag</div>\r\n<div class=" col-sm-6 col-xs-12">10.00 - 17.00</div>\r\n<div class=" col-sm-6 col-xs-12">Lørdag</div>\r\n<div class=" col-sm-6 col-xs-12">10.00 - 13.00</div>\r\n</div>\r\n<div class="message" style="display: inline-block; margin-top: 30px;">Undgå ventetid - book et møde, ring eller send os en mail, lørdag undtaget.</div>', '', '', '', ''),
(9, 'Leverandører ', 'kvalitet holder længere', '<p>Proin mollis lorem non dolor. In hac habitasse platea dictumst. Nulla ultrices odio. Donec augue. Phasellus dui. Maecenas facilisis nisl vitae nibh.&nbsp;</p>\r\n<p>Nunc adipiscing euismod arcu. Quisque facilisis mattis lacus. Fusce bibendum, velit in venenatis viverra, tellus ligula dignissim felis, quis euismod mauris tellus ut urna. Proin scelerisque. Nulla in mi. Integer ac leo. Nunc urna ligula, gravida a, pretium vitae, bibendum nec, ante. Aliquam ullamcorper iaculis lectus. Sed vel dui.&nbsp;</p>', '["5\\/8bec2b89ea6b2ec1e63abd4fadbab1ab5d9dbf0f.jpg"]', '', '', '["5\\/f1b35373eccbfa93a4b713502e292d238716f63f.jpg"]', '["5\\/1526e8bd1b1127db9eb456714c817bba6bc912ae.jpg"]', '["5\\/518a868e1c2ad6268f34d6906ac074d1a12537e6.jpg"]', '["5\\/c4209ab5ce0d43523c0a494d904c7eafed38f5a5.jpg"]'),
(10, '', '', '', '', '', '', '', '', '', ''),
(11, '', '', '', '', '', '', '', '', '', ''),
(13, '', '', '', '', '56.171171,10.183637', '<h3 class="title">Vi er altid klar til at hjælpe, &nbsp;så kig ind i udstillingen.</h3>\r\n<div class="description">Proin mollis lorem non dolor. In hac habitasse platea dictumst. Nulla ultrices odio. Donec augue.</div>\r\n<div class="address-info">\r\n<div class="name">kier-bad</div>\r\n<div class="street">\r\n<p style="margin-bottom: 0; margin-top: 8px;">Paludan-Müllers Vej 38</p>\r\n<p>8200 Aarhus N</p>\r\n</div>\r\n<p style="margin-bottom: 0;">Tlf.: 87 39 13 42</p>\r\n<p style="margin-bottom: 18px;">Fax.: 87 39 13 63</p>\r\n</div>\r\n<div class="address-contact">\r\n<div class="col-sm-6 col-xs-12">\r\n<div class="name">Kirsten Jensen</div>\r\n<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="href=">kij@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 49</p>\r\n</div>\r\n<div class="col-sm-6 col-xs-12">\r\n<div class="name">Henriette Mathiasen</div>\r\n<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="href=">kij@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 49</p>\r\n</div>\r\n</div>\r\n<div class="message">Undgå ventetid - book et møde, ring eller send os en mail, lørdag undtaget.</div>', '', '', '', ''),
(14, '', '', '', '', '56.2026602,10.0955601', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_category_related`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_category_related` (
  `related_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Related Categories';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_comments`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `reply_user_id` int(11) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  `comment` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Comments';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_comment_reports`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_comment_reports` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `state` int(1) NOT NULL DEFAULT '1',
  `reason` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Comments Reports';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_fields`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_fields` (
  `id` int(10) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `options` text NOT NULL,
  `fieldcode` varchar(255) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `searchable_in_frontend` tinyint(1) NOT NULL DEFAULT '0',
  `searchable_in_backend` tinyint(1) NOT NULL DEFAULT '0',
  `backend_filter` tinyint(1) NOT NULL DEFAULT '0',
  `params` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_fields`
--

INSERT INTO `yp5e2_reditem_fields` (`id`, `type_id`, `type`, `ordering`, `published`, `name`, `options`, `fieldcode`, `checked_out`, `checked_out_time`, `searchable_in_frontend`, `searchable_in_backend`, `backend_filter`, `params`) VALUES
(33, 1, 'text', 9, 1, 'title contact', '', 'title_contact', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"contact","enable_limit_guide":"0","limit":"100","enable_tooltip":"1","tooltip":"","required":"0","includeInRSSContent":"0"}'),
(36, 1, 'editor', 10, 1, 'description contact', '', 'description_contact', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"contact","enable_tooltip":"1","tooltip":"","required":"0","includeInRSSContent":"0"}'),
(39, 1, 'image', 11, 1, 'image contact', '', 'image_contact', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"contact","upload_max_filesize":"2","allowed_file_mimetype":"image\\/jpg,image\\/jpeg,image\\/gif,image\\/png","allowed_file_extension":"jpg,jpeg,gif,png","preview_image_width":"300","preview_image_height":"530","enable_cropping_image":"1","crop_keep_ratio":"0","crop_width":"","crop_height":"530","enable_tooltip":"1","tooltip":"","required":"0"}'),
(42, 1, 'image', 0, 1, 'Image banner full screen', '', 'image_banner_full_screen', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"banner full screen","upload_max_filesize":"2","allowed_file_mimetype":"image\\/jpg,image\\/jpeg,image\\/gif,image\\/png","allowed_file_extension":"jpg,jpeg,gif,png","preview_image_width":"300","preview_image_height":"300","enable_cropping_image":"1","crop_keep_ratio":"0","crop_width":"","crop_height":"","enable_tooltip":"1","tooltip":"","required":"0"}'),
(43, 1, 'text', 0, 1, 'Title gallery', '', 'title_gallery', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"gallery","enable_limit_guide":"0","limit":"100","enable_tooltip":"1","tooltip":"","required":"0","includeInRSSContent":"0"}'),
(44, 1, 'gallery', 0, 1, 'Image gallery', '', 'image_gallery', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"gallery","upload_max_filesize":"2","allowed_file_mimetype":"image\\/jpg,image\\/jpeg,image\\/gif,image\\/png","allowed_file_extension":"jpg,jpeg,gif,png","preview_image_width":"300","preview_image_height":"300","enable_cropping_image":"1","crop_keep_ratio":"0","crop_width":"","crop_height":"","enable_tooltip":"1","tooltip":"","required":"0"}'),
(51, 1, 'textarea', 0, 1, 'Description aktuelt', '', 'description_aktuelt', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"Aktuelt","enable_limit_guide":"0","limit":"100","enable_autosize":"1","enable_tooltip":"1","tooltip":"","required":"0","includeInRSSContent":"0"}'),
(52, 1, 'editor', 0, 1, 'Aktuelt content', '', 'aktuelt_content', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"Aktuelt","enable_tooltip":"1","tooltip":"","required":"0","includeInRSSContent":"0"}'),
(53, 1, 'image', 0, 1, 'Aktuelt image', '', 'aktuelt_image', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"Aktuelt","upload_max_filesize":"2","allowed_file_mimetype":"image\\/jpg,image\\/jpeg,image\\/gif,image\\/png","allowed_file_extension":"jpg,jpeg,gif,png","preview_image_width":"300","preview_image_height":"300","enable_cropping_image":"1","crop_keep_ratio":"0","crop_width":"","crop_height":"","enable_tooltip":"1","tooltip":"","required":"0"}'),
(54, 1, 'url', 0, 1, 'Link Brand', '', 'link_brand', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"Brands"}'),
(55, 1, 'image', 0, 1, 'Image Brand', '', 'image_brand', 0, '0000-00-00 00:00:00', 0, 0, 0, '{"group":"Brands","upload_max_filesize":"2","allowed_file_mimetype":"image\\/jpg,image\\/jpeg,image\\/gif,image\\/png","allowed_file_extension":"jpg,jpeg,gif,png","preview_image_width":"300","preview_image_height":"300","enable_cropping_image":"1","crop_keep_ratio":"0","crop_width":"","crop_height":"","enable_tooltip":"1","tooltip":"","required":"0"}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_items`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_items` (
  `id` int(11) NOT NULL,
  `asset_id` int(255) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_items`
--

INSERT INTO `yp5e2_reditem_items` (`id`, `asset_id`, `title`, `alias`, `ordering`, `access`, `blocked`, `published`, `publish_up`, `publish_down`, `featured`, `type_id`, `template_id`, `checked_out`, `checked_out_time`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `params`) VALUES
(1, 71, 'Nyt bad', 'nyt-bad', 0, 1, 0, -2, '2016-04-11 10:49:18', '0000-00-00 00:00:00', 0, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-04-11 10:49:18', 629, '2016-04-27 04:39:04', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(2, 72, 'Item 2', 'item-2', 0, 1, 0, -2, '2016-04-11 10:49:18', '0000-00-00 00:00:00', 0, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-04-11 10:49:18', 0, '0000-00-00 00:00:00', '{"item_image_title":"","item_image_alt":""}'),
(3, 73, 'Item 3', 'item-3', 0, 1, 0, -2, '2016-04-11 10:49:18', '0000-00-00 00:00:00', 0, 2, 3, 0, '0000-00-00 00:00:00', 629, '2016-04-11 10:49:18', 0, '0000-00-00 00:00:00', '{"item_image_title":"","item_image_alt":""}'),
(4, 74, 'Item 4', 'item-4', 0, 1, 0, -2, '2016-04-11 10:49:18', '0000-00-00 00:00:00', 0, 2, 3, 0, '0000-00-00 00:00:00', 629, '2016-04-11 10:49:18', 0, '0000-00-00 00:00:00', '{"item_image_title":"","item_image_alt":""}'),
(5, 83, 'Miljøer', 'miljoer', 0, 1, 0, 1, '2016-04-14 10:21:19', '0000-00-00 00:00:00', 0, 1, 10, 0, '0000-00-00 00:00:00', 629, '2016-04-14 10:21:19', 634, '2016-06-08 13:23:20', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(6, 84, 'Kirsten Jensen', 'contact-one', 0, 1, 0, 1, '2016-04-15 05:03:13', '0000-00-00 00:00:00', 1, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-04-15 05:03:13', 634, '2016-05-10 12:22:59', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(7, 88, 'Jerri QA ', 'jerri-qa', 0, 1, 0, -2, '2016-04-20 11:12:29', '0000-00-00 00:00:00', 0, 1, 2, 0, '0000-00-00 00:00:00', 632, '2016-04-20 11:12:29', 636, '2016-06-03 09:08:02', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(8, 91, 'Bruges ikke', 'bruges-ikke', 0, 1, 0, 1, '2016-04-27 04:32:35', '0000-00-00 00:00:00', 0, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-04-27 04:32:35', 634, '2016-06-07 07:38:46', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(9, 93, 'Aktuelle tilbud', 'aktuelle-tilbud', -1, 1, 0, 1, '2016-04-27 06:36:37', '0000-00-00 00:00:00', 0, 1, 5, 0, '0000-00-00 00:00:00', 629, '2016-04-27 06:36:37', 634, '2016-06-03 11:18:27', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(10, 94, 'Gode råd til badeværelset for hele familien', 'gode-rad-til-badevaerelset-for-hele-familien', -1, 1, 0, 1, '2016-04-27 06:36:59', '0000-00-00 00:00:00', 0, 1, 5, 0, '0000-00-00 00:00:00', 629, '2016-04-27 06:36:59', 634, '2016-06-07 08:19:42', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(11, 95, 'Arrangementer og nyheder', 'arrangementer-og-nyheder', 0, 1, 0, 1, '2016-04-27 06:37:30', '0000-00-00 00:00:00', 0, 1, 5, 0, '0000-00-00 00:00:00', 629, '2016-04-27 06:37:30', 634, '2016-06-06 13:12:55', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(12, 100, 'Henriette Mathiasen', 'henriette-mathiasen', 0, 1, 0, 1, '2016-04-15 05:03:13', '0000-00-00 00:00:00', 1, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-04-27 11:17:13', 634, '2016-05-10 12:22:12', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(13, 101, 'Kontakt os', 'kontakt-os', 1, 1, 0, 1, '2016-04-15 05:03:13', '0000-00-00 00:00:00', 1, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-04-27 11:20:11', 633, '2016-05-18 08:23:43', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(14, 105, 'Badekar og bruseafskærmning', 'badekar-og-bruseafskaermning', 0, 1, 0, 1, '2016-04-14 10:21:19', '0000-00-00 00:00:00', 0, 1, 10, 0, '0000-00-00 00:00:00', 629, '2016-04-28 03:33:55', 634, '2016-06-08 13:20:30', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(15, 106, 'Armaturer og tilbehør', 'armaturer-og-tilbehor', 0, 1, 0, 1, '2016-04-14 10:21:19', '0000-00-00 00:00:00', 0, 1, 10, 0, '0000-00-00 00:00:00', 629, '2016-04-28 03:33:59', 634, '2016-06-09 09:20:31', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(16, 112, 'Gode råd til et badeværelse for hele familien (2)', 'gode-rad-til-et-badevaerelse-for-hele-familien-2', -1, 1, 0, -2, '2016-04-27 06:36:59', '0000-00-00 00:00:00', 0, 1, 5, 0, '0000-00-00 00:00:00', 634, '2016-05-10 08:25:42', 634, '2016-05-04 11:43:37', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(17, 113, 'TILBUD - Villeroy & Boch Loop (2)', 'tilbud-villeroy-boch-loop-2', -1, 1, 0, -2, '2016-04-27 06:36:37', '0000-00-00 00:00:00', 0, 1, 5, 0, '0000-00-00 00:00:00', 634, '2016-05-10 08:26:02', 630, '2016-04-28 03:36:17', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(18, 114, 'Arrangementer og aktuelt (2)', 'arrangementer-og-aktuelt-2', 0, 1, 0, -2, '2016-04-27 06:37:30', '0000-00-00 00:00:00', 0, 1, 5, 0, '0000-00-00 00:00:00', 634, '2016-05-10 08:26:12', 634, '2016-05-10 06:46:19', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(19, 115, 'Leverandører', 'leverandorer', 0, 1, 0, 1, '2016-05-30 07:53:29', '0000-00-00 00:00:00', 0, 1, 2, 0, '0000-00-00 00:00:00', 629, '2016-05-30 07:53:29', 0, '2016-05-30 07:53:29', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(20, 116, 'Aspen', 'aspen', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 06:08:49', 634, '2016-06-06 07:50:55', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(21, 117, 'Blanco', 'blanco', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 06:10:00', 634, '2016-06-06 07:46:32', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(22, 118, 'Blücher', 'bluecher', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:31:04', 634, '2016-06-06 07:47:01', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(23, 119, 'Børma', 'borma', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:20', 634, '2016-06-06 07:47:56', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(24, 120, 'Damixa', 'brand5', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:20', 634, '2016-06-06 07:51:51', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(25, 121, 'Danline', 'danline', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:20', 634, '2016-06-06 07:52:06', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(26, 122, 'Dansani', 'dansani', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:28', 634, '2016-06-06 08:39:51', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(27, 123, 'Duravit', 'duravit', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:28', 634, '2016-06-06 08:40:06', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(28, 124, 'Geberit', 'geberit', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:28', 634, '2016-06-06 08:40:20', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(29, 125, 'Grohe', 'grohe', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:28', 634, '2016-06-06 08:40:35', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(30, 126, 'Gustavsberg', 'gustavsberg', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:28', 634, '2016-06-06 08:40:56', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(31, 127, 'Hansgrohe', 'hansgrohe', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:33:28', 634, '2016-06-06 08:41:11', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(32, 128, 'Ifo', 'ifo', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:41:32', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(33, 129, 'Inr', 'inr', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:41:50', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(34, 130, 'Kuma', 'kuma', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:43:39', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(35, 131, 'Kriss', 'kriss', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:43:26', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(36, 132, 'Pressalit', 'pressalit', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:44:20', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(37, 133, 'Royal', 'royal', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:44:39', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(38, 134, 'Intra', 'intra', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:42:27', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(39, 135, 'Smedbo', 'smedbo', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:45:36', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(40, 136, 'Strømberg', 'stromberg', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:46:42', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(41, 137, 'Svedbergs', 'svedbergs', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:46:57', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(42, 138, 'Oras', 'oras', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:43:56', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(43, 139, 'J.N. Bech', 'j-n-bech', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:36:39', 634, '2016-06-06 08:43:12', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(44, 140, 'Tvs', 'tvs', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:40:53', 634, '2016-06-06 08:47:12', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(45, 141, 'Unidrain', 'unidrain', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:40:53', 634, '2016-06-06 08:47:26', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(46, 142, 'Villeroy & Boch', 'villeroy-boch', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:40:53', 634, '2016-06-06 08:47:58', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(47, 143, 'Vola', 'vola', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 629, '2016-05-31 07:40:53', 634, '2016-06-06 08:48:14', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(48, 144, 'Lindgreen-Cordes', 'lindgreen-cordes', 0, 1, 0, 1, '2016-05-31 06:08:49', '0000-00-00 00:00:00', 0, 1, 12, 0, '0000-00-00 00:00:00', 634, '2016-06-03 08:24:31', 634, '2016-06-06 08:49:50', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}'),
(49, 145, 'Læs seneste udgave af Badmagasinet', 'laes-seneste-udgave-af-badmagasinet', 0, 1, 0, -2, '2016-04-27 04:32:35', '0000-00-00 00:00:00', 0, 1, 2, 0, '0000-00-00 00:00:00', 634, '2016-06-03 11:20:03', 634, '2016-06-07 06:16:30', '{"append_to_global_seo":"append","page_title":"","page_heading":"","meta_description":"","meta_keywords":"","meta_language":"","meta_robots":""}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_items_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_items_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_item_category_xref`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_item_category_xref` (
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_item_category_xref`
--

INSERT INTO `yp5e2_reditem_item_category_xref` (`item_id`, `category_id`) VALUES
(1, 5),
(2, 3),
(5, 6),
(6, 8),
(7, 4),
(8, 4),
(9, 10),
(10, 10),
(11, 10),
(12, 8),
(13, 8),
(14, 6),
(15, 6),
(16, 7),
(17, 7),
(18, 7),
(20, 9),
(21, 9),
(22, 9),
(23, 9),
(24, 9),
(25, 9),
(26, 9),
(27, 9),
(28, 9),
(29, 9),
(30, 9),
(31, 9),
(32, 9),
(33, 9),
(34, 9),
(35, 9),
(36, 9),
(37, 9),
(38, 9),
(39, 9),
(40, 9),
(41, 9),
(42, 9),
(43, 9),
(44, 9),
(45, 9),
(46, 9),
(47, 9),
(48, 9),
(49, 4);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_item_preview`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_item_preview` (
  `id` varchar(100) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_item_rating`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_item_rating` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `rating_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Item Ratings';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_item_reports`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_item_reports` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `state` int(1) NOT NULL DEFAULT '1',
  `reason` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Items Reports';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_log_useractivity`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_log_useractivity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of user',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Type of log (item.*, template.*, type.*, comment.*, field.*)',
  `target_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of target (Base on type of log: item, template, type, comment)',
  `data` text NOT NULL COMMENT 'JSON data of log',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created time of log'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Log User Activity';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_mail`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_mail` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `default` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Mail Center';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_mail_queue`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_mail_queue` (
  `id` int(11) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '0: unsend, 1: sent',
  `section` varchar(255) NOT NULL DEFAULT '' COMMENT 'Mail section',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT 'Mail subject',
  `body` text NOT NULL COMMENT 'Mail body',
  `recipient` int(11) NOT NULL DEFAULT '0' COMMENT 'Mail recipient (User ID)',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Mail Queue';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_mail_settings`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_mail_settings` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '0: unsubscribed, 1: subscribed',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0: send now, 1: send daily, 2: send weekly',
  `secret` varchar(100) NOT NULL DEFAULT '' COMMENT 'Secret hash string to check when unsubscribing',
  `params` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Notification Settings';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_reporter_point`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_reporter_point` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT '',
  `report_id` int(11) NOT NULL DEFAULT '0',
  `point` float NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Reporter Point';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_search_engine`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_search_engine` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of user',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of type',
  `send_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 => Send mail when new item match this search criteria',
  `search_data` text NOT NULL COMMENT 'Search data, in JSON format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Search Engine for users';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_templates`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `typecode` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_templates`
--

INSERT INTO `yp5e2_reditem_templates` (`id`, `name`, `filename`, `type_id`, `description`, `typecode`, `published`, `ordering`, `checked_out`, `checked_out_time`) VALUES
(2, 'item detail ', 'view_itemdetail/2_item_template.php', 1, 'item detail ', 'view_itemdetail', 1, 0, 629, '2016-05-31 07:31:32'),
(3, 'Category detail', 'view_categorydetail/3_category_detail.php', 1, 'Category detail', 'view_categorydetail', 1, 0, 0, '0000-00-00 00:00:00'),
(4, 'Category Aktuelt', 'view_categorydetail/4_category_aktuelt.php', 1, 'category aktuelt', 'view_categorydetail', 1, 0, 0, '0000-00-00 00:00:00'),
(5, 'Aktuelt Detail', 'view_itemdetail/5_aktuelt_detail.php', 1, 'Aktuelt Detail', 'view_itemdetail', 1, 0, 0, '0000-00-00 00:00:00'),
(6, 'Item module', 'module_items/6_item_module.php', 1, '', 'module_items', 1, 0, 0, '0000-00-00 00:00:00'),
(8, 'Category general detail', 'view_categorydetail/8_category_general_detail.php', 1, '', 'view_categorydetail', 1, 0, 0, '0000-00-00 00:00:00'),
(9, 'Module Kontak', 'module_items/9_module_kontak.php', 1, '', 'module_items', 1, 0, 0, '0000-00-00 00:00:00'),
(10, 'Gallery detail', 'view_itemdetail/10_gallery_detail.php', 1, '', 'view_itemdetail', 1, 0, 0, '0000-00-00 00:00:00'),
(11, 'Leverandør category', 'view_categorydetail/11_leverandr_category.php', 1, '', 'view_categorydetail', 1, 0, 0, '0000-00-00 00:00:00'),
(12, 'Leverandør Detail', 'view_itemdetail/12_leverandr_detail.php', 1, '', 'view_itemdetail', 1, 0, 629, '2016-05-31 07:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_templates_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_templates_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_types`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_types` (
  `id` int(11) NOT NULL,
  `asset_id` int(255) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(200) NOT NULL,
  `params` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_types`
--

INSERT INTO `yp5e2_reditem_types` (`id`, `asset_id`, `title`, `description`, `ordering`, `table_name`, `params`) VALUES
(1, 67, 'RedItem', 'RedItem description', 0, 'type_a_1', '{"thumbnailImageQuality":"90","thumbnailCreateMethod":"0","ownerViewAllPrivate":"1","itemRatingMaxStars":"5","itemRatingStep":"1.0","itemRatingSize":"md","itemRatingLibrary":"bootstrap_star_rating","itemRatingRound":"none","item_gmap_field":"0","default_itemdetail_template":"2","itemTitleLimit":"50","category_gmap_field":"0","default_categorydetail_template":"1","default_categoryimage_large_width":600,"default_categoryimage_large_height":600,"default_categoryimage_medium_width":300,"default_categoryimage_medium_height":300,"default_categoryimage_small_width":150,"default_categoryimage_small_height":150}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_types_type_a_1`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_types_type_a_1` (
  `id` int(11) NOT NULL DEFAULT '0',
  `title_contact` mediumtext,
  `description_contact` mediumtext,
  `image_contact` mediumtext,
  `image_banner_full_screen` mediumtext,
  `title_gallery` mediumtext,
  `image_gallery` mediumtext,
  `description_aktuelt` mediumtext,
  `aktuelt_content` mediumtext,
  `aktuelt_image` mediumtext,
  `link_brand` mediumtext,
  `image_brand` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_types_type_a_1`
--

INSERT INTO `yp5e2_reditem_types_type_a_1` (`id`, `title_contact`, `description_contact`, `image_contact`, `image_banner_full_screen`, `title_gallery`, `image_gallery`, `description_aktuelt`, `aktuelt_content`, `aktuelt_image`, `link_brand`, `image_brand`) VALUES
(1, 'Kirsten Jensen', '<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="#">kij@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 49</p>', '["1\\/fdcf699d7209ac1de85d02492095f08f5d7ec129.jpg"]', '["1\\/b0fd4d2118444ad00e61983bf1704a2611f3eb79.jpg"]', '', '[]', NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '', '', '', '["5\\/054bcb1e6696731606be2f2f1d24f5b89e700d75.jpg"]', 'Miljøer', '[{"path":"5\\/20bad491f9fcb8e37f209b7a9007b6024a3b1737.jpg","alt":"Dansani Calidris","default":0},{"path":"5\\/2116d91a76750d611a59184d3bf8587685550538.jpg","alt":"Aspen Kilen","default":1},{"path":"5\\/c850218de7bf2b10fe3e55fc9528ec152107594c.jpg","alt":"Dansani Luna","default":0},{"path":"5\\/95854e89475c26c2a167074bdd5e651eb87c0878.jpg","alt":"Aspen Kilen","default":0},{"path":"5\\/23aa588fbfddfb9dfef0a6e643eb13c5338c2412.jpg","alt":"","default":0},{"path":"5\\/1d43c1e7e158d9c33db3ed7e08351500922c6608.jpg","alt":"","default":0},{"path":"5\\/a0f1c88c2f511b098950ac09e8cca5d43e4b2899.jpg","alt":"","default":0},{"path":"5\\/90168857ce3f5830b73cbbc08210441625ee140c.jpg","alt":"","default":0},{"path":"5\\/388d6fc7d4273d2a42cff88aece63e1f8f1bfa0d.jpg","alt":"","default":0},{"path":"5\\/ba1b1834fb4bdd0884d63d401a368655d53f3dbe.jpg","alt":"","default":0},{"path":"5\\/b2199045ee580acfc39df5819561d6c9f775e9a4.jpg","alt":"","default":0},{"path":"5\\/07c7f0efb701751e895aba5437ec289383b3e9b0.jpg","alt":"","default":0},{"path":"5\\/8e1a54022013321bd2f691874eb57fca1b9e592b.jpg","alt":"","default":0},{"path":"5\\/2fba729635ee17fb48ac51a5c4987138f301551f.jpg","alt":"","default":0},{"path":"5\\/f68f8fe7275d695301e2954eb77456844a2094a4.jpg","alt":"","default":0},{"path":"5\\/f9e0c5b3f973b7139bfb9846fbaaf00099517dc3.jpg","alt":null,"default":0},{"path":"5\\/e50eb75e518cf6f282b3d8c6de9c644d8d21cb24.jpg","alt":null,"default":0},{"path":"5\\/859a831e98d229563a2752a8fc40d4f22ba70b81.jpg","alt":null,"default":0},{"path":"5\\/ed1549ffe0a367975293651be53d325828829a23.jpg","alt":null,"default":0}]', '', '', '', '', ''),
(6, 'Kirsten Jensen', '<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="#">kij@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 49</p>', '["6\\/54e4b4de61b125bc782efb52dfae1d3f0478de30.jpg"]', '', '', '[]', '', '', '', NULL, NULL),
(7, 'title col1 box4', '<p>description col1 box4</p>', '["7\\/476ce00f698f2a503308b00406e07ca49abd630f.jpg"]', '["7\\/393845adf4c29fe7555858ec0e00de1ed5e8bc70.jpg"]', '', '[{"path":"7\\/1bb241ab404a81aa4ea83ce362461f236f8dde46.jpg","alt":null,"default":1}]', '', '', '', '["","","_blank"]', ''),
(8, '', '', '', '', '', '[]', '', '', '', '["","","_blank"]', ''),
(9, '', '', '', '', '', '', 'Proin mollis non dolor. In has babitasse platea dictumst. Nulla ultrices odio. Donec augue.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>&nbsp;</p>', '["9\\/afd8028712a876f19fc1f94e2c795d37ea671e87.jpg"]', '', ''),
(10, '', '', '', '', '', '', 'Her finder du en række tips til, hvordan du passer og plejer dit nye bad', '<p>Her har du en række tips til, hvordan du passer og plejer dit nye bad.</p>\r\n<p>Porcelæn - herunder toiletrengøring</p>\r\n<p>Spejle</p>\r\n<p>Møbler</p>\r\n<p>Badekar</p>\r\n<p>Belysning</p>\r\n<p>Armaturer</p>\r\n<p>Ventilation/udluftning</p>', '["10\\/70d28dd4fbc646f73ee22f1ca421bf181ad34c66.jpg"]', '', ''),
(11, '', '', '', '', '', '', 'Se her særlige arrangementer og nyheder', '<p><strong>Vi fejrer 2 års fødselsdag</strong></p>\r\n<ul>\r\n<li>Lørdag, den 18. juni 2016 kl. 10.00 - 14.00</li>\r\n</ul>\r\n<p><strong>Lang lørdag</strong></p>\r\n<ul>\r\n<li>Lørdag, den 10. september 2016 kl. 10.00 - 14.00</li>\r\n<li>Lørdag, den 8. oktober 2016 kl. 10.00 - 14.00</li>\r\n</ul>', '["11\\/30ea8b2fb9dd4e17aa65f2d6ed796738cd095a42.jpg"]', '', ''),
(12, 'Henriette Mathiasen', '<p>Indretningskonsulent</p>\r\n<p>E-mail: <a href="mailto:hem@kier.dk">hem@kier.dk</a></p>\r\n<p>Direkte: 27 23 33 45</p>', '["12\\/89c1d4921d16b1d09f5ab2564490de4fb4570def.jpg"]', '', '', '[]', '', '', '', NULL, NULL),
(13, '', '<p>Det er os,<br />du møder i udstillingen ...</p>', '["13\\/f3b5617fec0ea08ab670f97e478c7ec4c9d987fa.jpg"]', '', '', '[]', '', '', '', NULL, NULL),
(14, '', '', '', '["14\\/dabb5d9c28c20ff59e69e645eed8a570863f3bea.jpg"]', 'Badekar og bruseafskærmning', '[{"path":"14\\/4b35c89750d9850241d4519cdb00a812c5439793.jpg","alt":"","default":0},{"path":"14\\/2eeea2c92f2eedc08e94aee4b105d6c7bdd590f0.jpg","alt":"","default":1},{"path":"14\\/089b29a309862d5361b1bcdbf992ea223a8169c8.jpg","alt":"","default":0},{"path":"14\\/229404da218a7906406beaffd04f5bf553a5e180.jpg","alt":"","default":0},{"path":"14\\/dae874990868488c07e1d86f80b0f73c9cb5ce4d.jpg","alt":"","default":0},{"path":"14\\/45f8b012a73c84cf23bec33ad80d3c9181a8440d.jpg","alt":"","default":0},{"path":"14\\/07a8cfccc06ea0d7256bf80d211e127d90053043.jpg","alt":"","default":0},{"path":"14\\/af72b53910c409611054862d5760c6d648db7f48.jpg","alt":"","default":0},{"path":"14\\/b42eeade67cf415d579b329cc55b994ce9e13b36.jpg","alt":null,"default":0}]', '', '', '', '', ''),
(15, '', '', '', '["15\\/113900a15078beb25918f6467316c0b9075c4799.jpg"]', 'Armaturer og tilbehør', '[{"path":"15\\/36643815ab1e6235a526a2182542e502240f7d3d.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/667b2d92b33f91d9489399c595dd1a91e0b144b6.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":1},{"path":"15\\/07feb042a2653a20d36ad10ab3db0761f21c1239.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/635c8443ffa4a9b8fb6e5896aa61ed7e9d6a73cc.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/43ee6cb7319529e30f66bcd8e8e697a9ae1f278c.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/921d899c3a5addae7f57a311d2647c535545e421.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/652a45159e2758db37caf59f6f218946becbca01.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/bf90f6ec914a11df3fbd16f65ce1dc91fb3979d1.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/628ec7156429d4e1b197d99cab499c2db286f662.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/9867445a1abe90fa04d16ad49c4b26cc823252bb.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/a65b5d6c7c80c9f00c84c314eddcd5fdcb3b6152.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/9786e637b4580912b068c8f875fe61a2096d3cf6.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/1481db58a7615ee13cf10f028cd88e16d63cecdf.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/bb794b12e2a012fee27efd48ca6d68df521ff7c1.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/d99c8d808c90e4eb8a1a6be97d326492f6817547.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/14642e790d7ff2a975f95dc10ad9abfc495cd2fb.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/5b85b8954867a45ed4b381cd6af82c198b486e57.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/f3b500eaf06672c7c786802bfc823971cd956526.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/d0eec9215b58561c495f071c6b7b01867ad7f082.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/c93e4bd0376a5e1c2cf55ddac48b3c399cb1dbbd.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/f9402e70b38f8f025eaaefc03e728ec879fbf57e.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/51db71dd4301658799c8d72c740992184e06358a.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/4f72aae8ae3773e47a9c8cfcd4c84ca745dce099.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/54d326425d7a92f7e43ffb4726130e50e2c3462c.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/22c8b5971d0e4f456e75aee7d6f5dc0b43641c61.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/1eba196479a7806fce442d00813479bcebe1365e.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/1b8e42fb8fda837190da70dac0b00bf6c169f404.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/a818bd63a48727c065af370dc15288253fb0fbb7.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/e360324b394d8a524aa91a785767c95343ecea6e.jpg","alt":"Armaturer og tilbeh\\u00f8r","default":0},{"path":"15\\/bfd199d3f84a0f9e49d61fe47f8e88a5038e8f3b.jpg","alt":null,"default":0}]', '', '', '', '', ''),
(16, '', '', '', '', '', '', 'Her finder du en række tips til, hvordan du passer og plejer dit nye bad', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '["16\\/70d28dd4fbc646f73ee22f1ca421bf181ad34c66.jpg"]', NULL, NULL),
(17, '', '', '', '', '', '', 'Proin mollis non dolor. In has babitasse platea dictumst. Nulla ultrices odio. Donec augue.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '["17\\/afd8028712a876f19fc1f94e2c795d37ea671e87.jpg"]', NULL, NULL),
(18, '', '', '', '', '', '', 'Her annoncerer vi åbent hus-arrangementer, lang lørdag m.m.', '<p><strong>2 års fødselsdag</strong></p>\r\n<ul>\r\n<li>Torsdag, den 16. juni 2016</li>\r\n</ul>\r\n<p><strong>Åbent hus-arrangementer</strong></p>\r\n<ul>\r\n<li>Lørdag, den xx. september 2016</li>\r\n<li>Lørdag, den xx. december 2016</li>\r\n</ul>\r\n<p><strong>Lang lørdag</strong></p>\r\n<ul>\r\n<li>Lørdag, den xx. juli 2016</li>\r\n<li></li>\r\n</ul>', '["18\\/f86de0879666988f98b8df28a089efd71ac39c43.jpg"]', NULL, NULL),
(19, '', '', '', '', '', '[]', '', '', '', NULL, NULL),
(20, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.aspenbad.dk\\/","http:\\/\\/www.aspenbad.dk\\/","_blank"]', '["20\\/77bd1092226f22cb2fddb5d20d75e76c19f951b9.jpg"]'),
(21, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.blanco.dk\\/","http:\\/\\/www.blanco.dk\\/","_blank"]', '["21\\/f19c8501bb48dc9b4799d102ba78df4a0f2dcf31.png"]'),
(22, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.blucher.dk\\/","http:\\/\\/www.blucher.dk\\/","_blank"]', '["22\\/6d64a76e88b21cd53075707e49fa2f6d726a2938.png"]'),
(23, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.borma.dk\\/","http:\\/\\/www.borma.dk\\/","_blank"]', '["23\\/af54ec5b6ce2016cb9e142914762836c3fcc7043.png"]'),
(24, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.damixa.dk\\/","http:\\/\\/www.damixa.dk\\/","_blank"]', '["24\\/3ad682ed219daa0f966b97eb6d9e2217c8889489.png"]'),
(25, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.danline.com\\/","http:\\/\\/www.danline.com\\/","_blank"]', '["25\\/2379d32a1ff48ce6156c28187a4f2e9e7c273618.png"]'),
(26, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.dansani.dk\\/","http:\\/\\/www.dansani.dk\\/","_blank"]', '["26\\/a44243a7fb698330262df8ee7cebf69d5029644e.png"]'),
(27, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.duravit.dk\\/","http:\\/\\/www.duravit.dk\\/","_blank"]', '["27\\/ba5c053be18c570d96b2afa6b2dfc5ac8b85449f.png"]'),
(28, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.geberit.dk\\/","http:\\/\\/www.geberit.dk\\/","_blank"]', '["28\\/89008a2724e4aa1d4a9a42375f031e9fd80c7f2e.png"]'),
(29, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.grohe.dk\\/","http:\\/\\/www.grohe.dk\\/","_blank"]', '["29\\/a398c1c91aa8b731e42563e5f9f3393640428ec2.png"]'),
(30, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.gustavsberg.dk\\/","http:\\/\\/www.gustavsberg.dk\\/","_blank"]', '["30\\/6da42c74d2b4011c91595f3fd299c6dffad10fde.png"]'),
(31, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.hansgrohe.dk\\/dk_da","http:\\/\\/www.hansgrohe.dk\\/dk_da","_blank"]', '["31\\/a7d62e46c441cdb08c36f74b0e562d72d1dad0cc.png"]'),
(32, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.maxsibbern.dk\\/","http:\\/\\/www.maxsibbern.dk\\/","_blank"]', '["32\\/2f5f7127f4205eecb3a49b9825ded85118902198.jpg"]'),
(33, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.inr.se\\/da\\/","http:\\/\\/www.inr.se\\/da\\/","_blank"]', '["33\\/0253678d3711576bb9a21787c05c5fffd289a536.png"]'),
(34, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.kuma.dk\\/","http:\\/\\/www.kuma.dk\\/","_blank"]', '["34\\/1b2115d1d2d60725750d244108e022bee568f506.png"]'),
(35, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.kriss.dk\\/","http:\\/\\/www.kriss.dk\\/","_blank"]', '["35\\/de53e8c93a08ede42fc2b04ef043c2848bbb8238.png"]'),
(36, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.pressalit.dk\\/pressalitgroup\\/da-DK","http:\\/\\/www.pressalit.dk\\/pressalitgroup\\/da-DK","_blank"]', '["36\\/9f45b536134ff4284e35dc009f45e84903c8a6ff.png"]'),
(37, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.royal.as\\/","http:\\/\\/www.royal.as\\/","_blank"]', '["37\\/04e6aadfc425fda1a0a19c124184982226187fe5.png"]'),
(38, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.juvel.dk\\/","http:\\/\\/www.juvel.dk\\/","_blank"]', '["38\\/320a754564715f9314bb0b1c9269efa3a623c423.png"]'),
(39, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.smedbo.dk\\/Productcategories.aspx","http:\\/\\/www.smedbo.dk\\/Productcategories.aspx","_blank"]', '["39\\/b3ab4c0275f11cb1fe888488e411474243112da2.png"]'),
(40, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.stromberg-fischer.dk\\/","http:\\/\\/www.stromberg-fischer.dk\\/","_blank"]', '["40\\/93d42befe54e36114274dc846ee6a28116c4bbcf.png"]'),
(41, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.svedbergs.dk\\/","http:\\/\\/www.svedbergs.dk\\/","_blank"]', '["41\\/ef861bb8d5aadb697bce16925d0c41367f12679b.png"]'),
(42, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.oras.com\\/dk\\/consumer\\/Pages\\/Default.aspx","http:\\/\\/www.oras.com\\/dk\\/consumer\\/Pages\\/Default.aspx","_blank"]', '["42\\/a8e51cb16cb7cee50c0f4fc02ec2b7ee9658e8e4.png"]'),
(43, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.bech-glas.dk\\/","http:\\/\\/www.bech-glas.dk\\/","_blank"]', '["43\\/a16287d8ffa6e6b83739824ee7c37e5850869135.png"]'),
(44, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.tvs.dk\\/","http:\\/\\/www.tvs.dk\\/","_blank"]', '["44\\/7334a0c53fed75d79882f980a093149667dbf7ae.jpg"]'),
(45, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.unidrain.dk\\/","http:\\/\\/www.unidrain.dk\\/","_blank"]', '["45\\/44ce942bba41f9f9263f05a27c9f4ce6fad0b422.png"]'),
(46, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.villeroy-boch.com\\/","http:\\/\\/www.villeroy-boch.com\\/","_blank"]', '["46\\/f162356226a7c0326447a115e4dadd8fbccf9768.png"]'),
(47, '', '', '', '', '', '', '', '', '', '["http:\\/\\/www.vola.dk\\/sw8586.asp","http:\\/\\/www.vola.dk\\/sw8586.asp","_blank"]', '["47\\/8e1a2ea794b585f41282c95ae9f295351dc5b8a1.png"]'),
(48, '', '', '', '', '', '', '', '', '', '["http:\\/\\/lindgreen-cordes.dk\\/","http:\\/\\/lindgreen-cordes.dk\\/","_blank"]', '["48\\/406cfa67b2bb2b97aa69fde3917dc5229fe4dc03.jpg"]'),
(49, '', '', '["49\\/"]', '["49\\/"]', '', '[]', '', '', '', '["","","_blank"]', '["49\\/"]');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_types_type_b_2`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_types_type_b_2` (
  `id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_reditem_types_type_b_2`
--

INSERT INTO `yp5e2_reditem_types_type_b_2` (`id`) VALUES
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_reditem_watch_xref`
--

CREATE TABLE IF NOT EXISTS `yp5e2_reditem_watch_xref` (
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of item',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redITEM Watch feature reference';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_schemas`
--

CREATE TABLE IF NOT EXISTS `yp5e2_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_schemas`
--

INSERT INTO `yp5e2_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.5.1-2016-03-29'),
(10007, '1.8.4'),
(10011, '2.1.19'),
(10046, '2.0.8.3');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_session`
--

CREATE TABLE IF NOT EXISTS `yp5e2_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_session`
--

INSERT INTO `yp5e2_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('aabt5cgujt2eb9n77obiabao43', 0, 1, '1465551298', 'joomla|s:1884:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ2NTU1MTI5NztzOjQ6Imxhc3QiO2k6MTQ2NTU1MTI5NztzOjM6Im5vdyI7aToxNDY1NTUxMjk3O31zOjU6InRva2VuIjtzOjMyOiJCOVI1SW5LNmJMOFE3Z3ZZa0U0Skw5d3FVTlhwWWNXNyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjExOiJjb21fcmVkaXRlbSI7Tzo4OiJzdGRDbGFzcyI6Mzp7czoyMzoic3ViX2NhdGVnb3J5X3BhZ2luYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToibGltaXQiO2k6MDt9czo2OiJnbG9iYWwiO086ODoic3RkQ2xhc3MiOjE6e3M6MzoidGlkIjtpOjA7fXM6MTY6Iml0ZW1zX3BhZ2luYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToibGltaXQiO2k6MDt9fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoyNjp7czo5OiIAKgBpc1Jvb3QiO2I6MDtzOjI6ImlkIjtpOjA7czo0OiJuYW1lIjtOO3M6ODoidXNlcm5hbWUiO047czo1OiJlbWFpbCI7TjtzOjg6InBhc3N3b3JkIjtOO3M6MTQ6InBhc3N3b3JkX2NsZWFyIjtzOjA6IiI7czo1OiJibG9jayI7TjtzOjk6InNlbmRFbWFpbCI7aTowO3M6MTI6InJlZ2lzdGVyRGF0ZSI7TjtzOjEzOiJsYXN0dmlzaXREYXRlIjtOO3M6MTA6ImFjdGl2YXRpb24iO047czo2OiJwYXJhbXMiO047czo2OiJncm91cHMiO2E6MTp7aTowO3M6MToiOSI7fXM6NToiZ3Vlc3QiO2k6MTtzOjEzOiJsYXN0UmVzZXRUaW1lIjtOO3M6MTA6InJlc2V0Q291bnQiO047czoxMjoicmVxdWlyZVJlc2V0IjtOO3M6MTA6IgAqAF9wYXJhbXMiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6MTQ6IgAqAF9hdXRoR3JvdXBzIjthOjI6e2k6MDtpOjE7aToxO2k6OTt9czoxNDoiACoAX2F1dGhMZXZlbHMiO2E6Mzp7aTowO2k6MTtpOjE7aToxO2k6MjtpOjU7fXM6MTU6IgAqAF9hdXRoQWN0aW9ucyI7TjtzOjEyOiIAKgBfZXJyb3JNc2ciO047czoxMzoiACoAdXNlckhlbHBlciI7TzoxODoiSlVzZXJXcmFwcGVySGVscGVyIjowOnt9czoxMDoiACoAX2Vycm9ycyI7YTowOnt9czozOiJhaWQiO2k6MDt9czozMjoid2Jfc2g0MDRzZWZfNDA0X3JlZGlyZWN0X21lc3NhZ2UiO047fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_aliases`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_aliases` (
  `id` int(11) NOT NULL,
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_hits_404s`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_hits_404s` (
  `id` int(11) NOT NULL,
  `url` varchar(333) NOT NULL DEFAULT '',
  `target` varchar(333) NOT NULL DEFAULT '',
  `target_domain` varchar(255) NOT NULL DEFAULT '',
  `referrer` varchar(333) NOT NULL DEFAULT '',
  `referrer_domain` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_hits_aliases`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_hits_aliases` (
  `id` int(11) NOT NULL,
  `url` varchar(333) NOT NULL DEFAULT '',
  `target` varchar(333) NOT NULL DEFAULT '',
  `target_domain` varchar(255) NOT NULL DEFAULT '',
  `referrer` varchar(333) NOT NULL DEFAULT '',
  `referrer_domain` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_hits_shurls`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_hits_shurls` (
  `id` int(11) NOT NULL,
  `url` varchar(333) NOT NULL DEFAULT '',
  `target` varchar(333) NOT NULL DEFAULT '',
  `target_domain` varchar(255) NOT NULL DEFAULT '',
  `referrer` varchar(333) NOT NULL DEFAULT '',
  `referrer_domain` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_keystore`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_keystore` (
  `id` int(11) NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT 'default',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `format` tinyint(3) NOT NULL DEFAULT '1',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_sh404sef_keystore`
--

INSERT INTO `yp5e2_sh404sef_keystore` (`id`, `scope`, `key`, `value`, `user_id`, `format`, `modified_at`) VALUES
(1, 'default', 'com_sh404sef.errors.404.da-DK', 's:679:"<div class="pag-404">\r\n<h1>Bad karma: we can''t find that page!</h1>\r\n<p>You asked for <strong>{%sh404SEF_404_URL%}</strong>, but despite our computers looking very hard, we could not find it. What happened ?</p>\r\n<ul>\r\n<li>the link you clicked to arrive here has a typo in it</li>\r\n<li>or somehow we removed that page, or gave it another name</li>\r\n<li>or, quite unlikely for sure, maybe you typed it yourself and there was a little mistake ?</li>\r\n</ul>\r\n<h4>{sh404sefSimilarUrlsCommentStart}It''s not the end of everything though : you may be interested in the following pages on our site:{sh404sefSimilarUrlsCommentEnd}</h4>\r\n<p>{sh404sefSimilarUrls}</p>\r\n<p>&nbsp;</p>\r\n</div>";', 633, 0, '2016-04-28 12:16:49'),
(2, 'default', 'com_sh404sef.errors.404.en-GB', 's:679:"<div class="pag-404">\r\n<h1>Bad karma: we can''t find that page!</h1>\r\n<p>You asked for <strong>{%sh404SEF_404_URL%}</strong>, but despite our computers looking very hard, we could not find it. What happened ?</p>\r\n<ul>\r\n<li>the link you clicked to arrive here has a typo in it</li>\r\n<li>or somehow we removed that page, or gave it another name</li>\r\n<li>or, quite unlikely for sure, maybe you typed it yourself and there was a little mistake ?</li>\r\n</ul>\r\n<h4>{sh404sefSimilarUrlsCommentStart}It''s not the end of everything though : you may be interested in the following pages on our site:{sh404sefSimilarUrlsCommentEnd}</h4>\r\n<p>{sh404sefSimilarUrls}</p>\r\n<p>&nbsp;</p>\r\n</div>";', 633, 0, '2016-04-28 12:16:49');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_metas`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_metas` (
  `id` int(11) NOT NULL,
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `metadesc` varchar(255) DEFAULT '',
  `metakey` varchar(255) DEFAULT '',
  `metatitle` varchar(255) DEFAULT '',
  `metalang` varchar(30) DEFAULT '',
  `metarobots` varchar(30) DEFAULT '',
  `canonical` varchar(255) DEFAULT '',
  `og_enable` tinyint(3) NOT NULL DEFAULT '2',
  `og_type` varchar(30) DEFAULT '',
  `og_image` varchar(255) DEFAULT '',
  `og_enable_description` tinyint(3) NOT NULL DEFAULT '2',
  `og_enable_site_name` tinyint(3) NOT NULL DEFAULT '2',
  `og_site_name` varchar(255) DEFAULT '',
  `fb_admin_ids` varchar(255) DEFAULT '',
  `og_enable_location` tinyint(3) NOT NULL DEFAULT '2',
  `og_latitude` varchar(30) DEFAULT '',
  `og_longitude` varchar(30) DEFAULT '',
  `og_street_address` varchar(255) DEFAULT '',
  `og_locality` varchar(255) DEFAULT '',
  `og_postal_code` varchar(30) DEFAULT '',
  `og_region` varchar(255) DEFAULT '',
  `og_country_name` varchar(255) DEFAULT '',
  `og_enable_contact` tinyint(3) NOT NULL DEFAULT '2',
  `og_email` varchar(255) DEFAULT '',
  `og_phone_number` varchar(255) DEFAULT '',
  `og_fax_number` varchar(255) DEFAULT '',
  `og_enable_fb_admin_ids` tinyint(3) NOT NULL DEFAULT '2',
  `twittercards_enable` tinyint(3) NOT NULL DEFAULT '2',
  `twittercards_site_account` varchar(100) DEFAULT '',
  `twittercards_creator_account` varchar(100) DEFAULT '',
  `google_authorship_enable` tinyint(3) NOT NULL DEFAULT '2',
  `google_authorship_author_profile` varchar(255) DEFAULT '',
  `google_authorship_author_name` varchar(255) DEFAULT '',
  `google_publisher_enable` tinyint(3) NOT NULL DEFAULT '2',
  `google_publisher_url` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_pageids`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_pageids` (
  `id` int(11) NOT NULL,
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `pageid` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_sh404sef_pageids`
--

INSERT INTO `yp5e2_sh404sef_pageids` (`id`, `newurl`, `pageid`, `type`, `hits`) VALUES
(1, 'index.php?option=com_content&Itemid=101&format=feed&id=2&lang=da&layout=blog&type=rss&view=category', 'kk', 1, 0),
(2, 'index.php?option=com_content&Itemid=101&format=feed&id=2&lang=da&layout=blog&type=atom&view=category', 'k3', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_urls`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_urls` (
  `id` int(11) NOT NULL,
  `cpt` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `oldurl` varchar(255) NOT NULL DEFAULT '',
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(255) NOT NULL DEFAULT '',
  `referrer_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Used for 404, 0 = not set, 1 = external, 2 = internal',
  `dateadd` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_sh404sef_urls`
--

INSERT INTO `yp5e2_sh404sef_urls` (`id`, `cpt`, `rank`, `oldurl`, `newurl`, `option`, `referrer_type`, `dateadd`) VALUES
(9, 2, 0, 'index.php/images/icon-map.png', '', '', 1, '2016-04-18'),
(10, 5, 0, 'sitemap.xml', '', '', 0, '2016-04-20'),
(11, 1, 0, 'adhaskld/hsajk', '', '', 0, '2016-04-20'),
(12, 60, 0, 'favicon.ico', '', '', 0, '2016-04-20'),
(15, 1, 0, 'jerri-qar33', '', '', 0, '2016-04-20'),
(17, 3, 0, 'administrator/in', '', '', 0, '2016-04-21'),
(18, 1, 0, 'h', '', '', 1, '2016-04-21'),
(19, 1, 0, 'images/banner/', '', '', 1, '2016-04-21'),
(20, 2, 0, '%7Bbackground_content_box1_value%7D', '', '', 1, '2016-04-21'),
(21, 1, 0, '%EF%BF%BD', '', '', 1, '2016-04-21'),
(22, 4, 0, 'udstillingendsadassd', '', '', 1, '2016-04-21'),
(23, 4, 0, 'ykhj', '', '', 1, '2016-04-21'),
(24, 1, 0, 'a%C3%A2ss', '', '', 0, '2016-04-21'),
(57, 1, 0, 'kier-bad', 'index.php?option=com_reditem&Itemid=101&id=4&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(58, 521, 0, 'kier-bad/udstillingen', 'index.php?option=com_reditem&Itemid=118&id=6&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(59, 139, 0, 'kier-bad/nyt-bad', 'index.php?option=com_reditem&Itemid=119&id=5&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(60, 65, 0, 'aktuelt/tilbud-villeroy-boch-loop', 'index.php?option=com_reditem&Itemid=147&id=9&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(61, 103, 0, 'aktuelt/10-gode-rad-til-et-badevaerelse-for-hele-familien', 'index.php?option=com_reditem&Itemid=147&id=10&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(62, 51, 0, 'aktuelt/mod-os-pa-livstilsmessen-d-2-maj-i-messe-c', 'index.php?option=com_reditem&Itemid=147&id=11&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(63, 0, 1, 'kier-bad/udstillingen', 'index.php?option=com_reditem&Itemid=118&id=6&lang=da&templateId=8&view=categorydetail', '', 0, '0000-00-00'),
(64, 0, 1, 'kier-bad/nyt-bad', 'index.php?option=com_reditem&Itemid=119&id=5&lang=da&templateId=8&view=categorydetail', '', 0, '0000-00-00'),
(65, 116, 0, 'tilbud', 'index.php?option=com_reditem&Itemid=120&id=10&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(66, 279, 0, 'kontak', 'index.php?option=com_reditem&Itemid=122&id=8&lang=da&templateId=8&view=categorydetail', '', 0, '0000-00-00'),
(67, 395, 0, 'kier-bad/udstillingen/lille-badevaerelse', 'index.php?option=com_reditem&Itemid=118&id=5&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(68, 73, 0, 'kier-bad/udstillingen/unik-badekarslosning', 'index.php?option=com_reditem&Itemid=118&id=14&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(69, 83, 0, 'kier-bad/udstillingen/bad-til-den-store-familie', 'index.php?option=com_reditem&Itemid=118&id=15&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(70, 0, 0, 'kier-bad/nyt-bad-test-2', 'index.php?option=com_reditem&Itemid=101&id=9&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(71, 0, 1, 'kontak', 'index.php?option=com_reditem&Itemid=122&id=8&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(72, 0, 0, 'kontak/kirsten-jensen', 'index.php?option=com_reditem&Itemid=122&id=6&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(73, 0, 0, 'kontak/henriette-mathiasen', 'index.php?option=com_reditem&Itemid=122&id=12&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(74, 0, 0, 'kontak/kontact-our', 'index.php?option=com_reditem&Itemid=122&id=13&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(75, 1, 0, 'media/redcore/lib/img/bg-overlay.png', '', '', 1, '2016-04-28'),
(76, 2, 0, 'g-ecx.images-amazon.com/images/G/01/x-locale/common/transparent-pixel._CB386942464_.gif', '', '', 0, '2016-04-28'),
(77, 22, 0, 'HNAP1/', '', '', 1, '2016-04-28'),
(78, 1, 0, 'cgi.cgi', '', '', 0, '2016-04-28'),
(79, 1, 0, 'fcgi-php/php', '', '', 0, '2016-04-28'),
(80, 1, 0, 'phppath/cgi_wrapper', '', '', 0, '2016-04-28'),
(81, 1, 0, 'phppath/php', '', '', 0, '2016-04-28'),
(82, 1, 0, 'phppath/php4', '', '', 0, '2016-04-28'),
(83, 1, 0, 'phppath/php5', '', '', 0, '2016-04-28'),
(84, 1, 0, 'phppath/php-cgi', '', '', 0, '2016-04-28'),
(85, 1, 0, 'phppath/php.cgi', '', '', 0, '2016-04-28'),
(86, 1, 0, 'php/php', '', '', 0, '2016-04-28'),
(87, 1, 0, 'php/php4', '', '', 0, '2016-04-28'),
(88, 1, 0, 'php/php5', '', '', 0, '2016-04-28'),
(89, 1, 0, 'php/php-cgi', '', '', 0, '2016-04-28'),
(90, 1, 0, 'php/php.cgi', '', '', 0, '2016-04-28'),
(91, 1, 0, 'xampp/cgi.cgi', '', '', 0, '2016-04-28'),
(92, 1, 0, 'www.baidu.com/cache/global/img/gs.gif', '', '', 0, '2016-04-29'),
(93, 44, 0, 'holder.js/300x300/text:Kier%20bad/gray', '', '', 1, '2016-04-29'),
(94, 0, 0, 'kier-bad/test-show-cate', 'index.php?option=com_reditem&Itemid=101&id=12&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(95, 1, 0, 'www.sina.com.cn', '', '', 0, '2016-04-29'),
(96, 3, 0, 'muieblackcat', '', '', 0, '2016-05-02'),
(97, 1, 0, 'scripts/setup.php', '', '', 0, '2016-05-02'),
(98, 1, 0, 'admin/scripts/setup.php', '', '', 0, '2016-05-02'),
(99, 1, 0, 'admin/pma/scripts/setup.php', '', '', 0, '2016-05-02'),
(100, 1, 0, 'admin/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(101, 1, 0, 'db/scripts/setup.php', '', '', 0, '2016-05-02'),
(102, 1, 0, 'dbadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(103, 5, 0, 'myadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(104, 2, 0, 'mysql/scripts/setup.php', '', '', 0, '2016-05-02'),
(105, 2, 0, 'mysqladmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(106, 1, 0, 'typo3/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(107, 1, 0, 'phpadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(108, 3, 0, 'pma/scripts/setup.php', '', '', 0, '2016-05-02'),
(109, 1, 0, 'web/phpMyAdmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(110, 1, 0, 'xampp/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(111, 1, 0, 'web/scripts/setup.php', '', '', 0, '2016-05-02'),
(112, 1, 0, 'php-my-admin/scripts/setup.php', '', '', 0, '2016-05-02'),
(113, 1, 0, 'websql/scripts/setup.php', '', '', 0, '2016-05-02'),
(114, 2, 0, 'phpMyAdmin-2/scripts/setup.php', '', '', 0, '2016-05-02'),
(115, 1, 0, '_phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(116, 1, 0, 'administrator/components/com_joommyadmin/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(117, 1, 0, 'apache-default/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(118, 1, 0, 'blog/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(119, 1, 0, 'cpanelphpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(120, 1, 0, 'cpphpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(121, 1, 0, 'forum/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(122, 1, 0, 'php/phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(123, 7, 0, 'phpmyadmin/scripts/setup.php', '', '', 0, '2016-05-02'),
(124, 1, 0, 'phpMyAdmin-2.10.0.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(125, 1, 0, 'phpMyAdmin-2.10.0.2/scripts/setup.php', '', '', 0, '2016-05-02'),
(126, 1, 0, 'phpMyAdmin-2.10.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(127, 1, 0, 'phpMyAdmin-2.10.1.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(128, 1, 0, 'phpMyAdmin-2.10.2.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(129, 1, 0, 'phpMyAdmin-2.11.0.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(130, 1, 0, 'phpMyAdmin-2.11.1-all-languages/scripts/setup.php', '', '', 0, '2016-05-02'),
(131, 1, 0, 'phpMyAdmin-2.11.1.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(132, 1, 0, 'phpMyAdmin-2.11.1.1/scripts/setup.php', '', '', 0, '2016-05-02'),
(133, 1, 0, 'phpMyAdmin-2.11.1.2/scripts/setup.php', '', '', 0, '2016-05-02'),
(134, 1, 0, 'phpMyAdmin-2.6.1-pl2/scripts/setup.php', '', '', 0, '2016-05-02'),
(135, 1, 0, 'phpMyAdmin-2.6.1-pl3/scripts/setup.php', '', '', 0, '2016-05-02'),
(136, 1, 0, 'phpMyAdmin-2.6.4-pl3/scripts/setup.php', '', '', 0, '2016-05-02'),
(137, 1, 0, 'phpMyAdmin-2.6.4-pl4/scripts/setup.php', '', '', 0, '2016-05-02'),
(138, 1, 0, 'phpMyAdmin-2.6.4-rc1/scripts/setup.php', '', '', 0, '2016-05-02'),
(139, 1, 0, 'phpMyAdmin-2.6.5/scripts/setup.php', '', '', 0, '2016-05-02'),
(140, 1, 0, 'phpMyAdmin-2.6.6/scripts/setup.php', '', '', 0, '2016-05-02'),
(141, 1, 0, 'phpMyAdmin-2.6.9/scripts/setup.php', '', '', 0, '2016-05-02'),
(142, 1, 0, 'phpMyAdmin-2.7.0-beta1/scripts/setup.php', '', '', 0, '2016-05-02'),
(143, 1, 0, 'phpMyAdmin-2.7.0-pl1/scripts/setup.php', '', '', 0, '2016-05-02'),
(144, 1, 0, 'phpMyAdmin-2.7.0-pl2/scripts/setup.php', '', '', 0, '2016-05-02'),
(145, 1, 0, 'phpMyAdmin-2.7.0-rc1/scripts/setup.php', '', '', 0, '2016-05-02'),
(146, 1, 0, 'phpMyAdmin-2.7.5/scripts/setup.php', '', '', 0, '2016-05-02'),
(147, 1, 0, 'phpMyAdmin-2.7.6/scripts/setup.php', '', '', 0, '2016-05-02'),
(148, 1, 0, 'phpMyAdmin-2.7.7/scripts/setup.php', '', '', 0, '2016-05-02'),
(149, 1, 0, 'phpMyAdmin-2.8.2.3/scripts/setup.php', '', '', 0, '2016-05-02'),
(150, 1, 0, 'phpMyAdmin-2.8.2/scripts/setup.php', '', '', 0, '2016-05-02'),
(151, 1, 0, 'phpMyAdmin-2.8.3/scripts/setup.php', '', '', 0, '2016-05-02'),
(152, 1, 0, 'phpMyAdmin-2.8.4/scripts/setup.php', '', '', 0, '2016-05-02'),
(153, 1, 0, 'phpMyAdmin-2.8.5/scripts/setup.php', '', '', 0, '2016-05-02'),
(154, 1, 0, 'phpMyAdmin-2.8.6/scripts/setup.php', '', '', 0, '2016-05-02'),
(155, 1, 0, 'phpMyAdmin-2.8.7/scripts/setup.php', '', '', 0, '2016-05-02'),
(156, 1, 0, 'phpMyAdmin-2.8.8/scripts/setup.php', '', '', 0, '2016-05-02'),
(157, 1, 0, 'phpMyAdmin-2.8.9/scripts/setup.php', '', '', 0, '2016-05-02'),
(158, 1, 0, 'phpMyAdmin-2.9.0-rc1/scripts/setup.php', '', '', 0, '2016-05-02'),
(159, 1, 0, 'phpMyAdmin-2.9.0.1/scripts/setup.php', '', '', 0, '2016-05-02'),
(160, 1, 0, 'phpMyAdmin-2.9.0.2/scripts/setup.php', '', '', 0, '2016-05-02'),
(161, 1, 0, 'phpMyAdmin-2.9.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(162, 1, 0, 'phpMyAdmin-2.9.1/scripts/setup.php', '', '', 0, '2016-05-02'),
(163, 1, 0, 'phpMyAdmin-2.9.2/scripts/setup.php', '', '', 0, '2016-05-02'),
(164, 1, 0, 'phpMyAdmin-3.0.0-rc1-english/scripts/setup.php', '', '', 0, '2016-05-02'),
(165, 1, 0, 'phpMyAdmin-3.0.0.0-all-languages/scripts/setup.php', '', '', 0, '2016-05-02'),
(166, 1, 0, 'phpMyAdmin-3.0.1.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(167, 1, 0, 'phpMyAdmin-3.0.1.1/scripts/setup.php', '', '', 0, '2016-05-02'),
(168, 1, 0, 'phpMyAdmin-3.1.0.0-english/scripts/setup.php', '', '', 0, '2016-05-02'),
(169, 1, 0, 'phpMyAdmin-3.1.0.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(170, 1, 0, 'phpMyAdmin-3.1.1.0-all-languages/scripts/setup.php', '', '', 0, '2016-05-02'),
(171, 1, 0, 'phpMyAdmin-3.1.2.0-all-languages/scripts/setup.php', '', '', 0, '2016-05-02'),
(172, 1, 0, 'phpMyAdmin-3.1.2.0-english/scripts/setup.php', '', '', 0, '2016-05-02'),
(173, 1, 0, 'phpMyAdmin-3.1.2.0/scripts/setup.php', '', '', 0, '2016-05-02'),
(174, 1, 0, 'phpMyAdmin-3.4.3.1/scripts/setup.php', '', '', 0, '2016-05-02'),
(175, 1, 0, 'phpMyAdmin2/scripts/setup.php', '', '', 0, '2016-05-02'),
(176, 1, 0, 'phpMyAdmin3/scripts/setup.php', '', '', 0, '2016-05-02'),
(177, 2, 0, 'browserconfig.xml', '', '', 0, '2016-05-03'),
(178, 1, 0, 'media/com_reditem/images/category/13/1461752973_13.jpg', '', '', 1, '2016-05-03'),
(179, 36, 0, 'undefined', '', '', 1, '2016-05-03'),
(180, 0, 0, 'kontakt/kirsten-jensen', 'index.php?option=com_reditem&id=6&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(181, 5, 0, 'xmlrpc.php', '', '', 0, '2016-05-03'),
(182, 1, 0, 'templates/redcomponent/images/print.png', '', '', 1, '2016-05-04'),
(183, 3, 0, 'kier-bad/udstillingen/undefined', '', '', 1, '2016-05-04'),
(184, 9, 0, 'aktuelt/undefined', '', '', 1, '2016-05-04'),
(185, 4, 0, 'kier-bad/undefined', '', '', 1, '2016-05-04'),
(186, 2, 0, 'templates/redcomponent/images/arrow.png', '', '', 0, '2016-05-06'),
(187, 3, 0, '%7Bimage_banner_full_screen_value%7D', '', '', 1, '2016-05-06'),
(188, 2, 0, 'www.qyer.com/', '', '', 0, '2016-05-08'),
(189, 1, 0, 'templates/redcomponent/js/jquery.row-grid.js', '', '', 1, '2016-05-10'),
(190, 1, 0, 'templates/redcomponent/js/jquery.row-grid.min.js', '', '', 1, '2016-05-10'),
(191, 2, 0, 'www.elong.com/', '', '', 0, '2016-05-10'),
(192, 2, 0, 'administration', '', '', 0, '2016-05-10'),
(193, 0, 1, 'aktuelt/tilbud-og-demomodeller', 'index.php?option=com_reditem&Itemid=120&id=9&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(194, 33, 0, 'aktuelt/gode-rad-til-badevaerelset-for-hele-familien', 'index.php?option=com_reditem&Itemid=120&id=10&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(195, 1, 0, 'arrangementer-og-nyheder', 'index.php?option=com_reditem&id=11&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(196, 40, 0, 'aktuelt/arrangementer-og-nyheder', 'index.php?option=com_reditem&Itemid=120&id=11&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(197, 1, 0, 'www.mafengwo.cn/', '', '', 0, '2016-05-11'),
(198, 6, 0, 'manager/html', '', '', 0, '2016-05-12'),
(199, 2, 0, 'www.ctrip.com/', '', '', 0, '2016-05-14'),
(200, 1, 0, 'w00tw00t.at.blackhats.romanian.anti-sec:)', '', '', 0, '2016-05-16'),
(201, 3, 0, 'phpMyAdmin', '', '', 1, '2016-05-16'),
(202, 1, 0, 'httpheader.net/', '', '', 0, '2016-05-16'),
(203, 42, 0, 'aktuelt/tilbud-og-demomodeller', 'index.php?option=com_reditem&Itemid=148&id=9&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(204, 1, 0, 'a2billing/customer/templates/default/header.tpl', '', '', 0, '2016-05-19'),
(205, 1, 0, 'kier-bad/administrator', '', '', 0, '2016-05-19'),
(206, 1, 0, 'wp-login.php', '', '', 0, '2016-05-21'),
(207, 1, 0, 'blog//wp-login.php', '', '', 0, '2016-05-21'),
(208, 1, 0, 'wp//wp-login.php', '', '', 0, '2016-05-21'),
(209, 1, 0, 'wordpress//wp-login.php', '', '', 0, '2016-05-21'),
(210, 1, 0, 'blog/xmlrpc.php', '', '', 0, '2016-05-24'),
(211, 1, 0, '12321', '', '', 0, '2016-05-26'),
(212, 2, 0, 'admin/i18n/readme.txt', '', '', 0, '2016-05-26'),
(213, 1, 0, 'nmaplowercheck1464390025', '', '', 0, '2016-05-27'),
(214, 1, 0, '.git/HEAD', '', '', 0, '2016-05-27'),
(215, 1, 0, 'HNAP1', '', '', 0, '2016-05-27'),
(216, 1, 0, 'webcalendar/install/index.php', '', '', 0, '2016-05-28'),
(217, 0, 1, 'leverandorer', 'index.php?option=com_reditem&Itemid=121&id=19&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(218, 1, 0, 'ad/', '', '', 0, '2016-05-31'),
(219, 10, 0, 'media/com_reditem/images/categoryfield/5/f1b35373eccbfa93a4b713502e292d238716f63f.jpg', '', '', 1, '2016-05-31'),
(220, 70, 0, 'leverandorer', 'index.php?option=com_reditem&Itemid=121&id=9&lang=da&templateId=11&view=categorydetail', '', 0, '0000-00-00'),
(221, 0, 2, 'leverandorer', 'index.php?option=com_reditem&Itemid=121&id=9&lang=da&view=categorydetail', '', 0, '0000-00-00'),
(222, 0, 0, 'leverandorer/brand7', 'index.php?option=com_reditem&Itemid=121&id=26&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(223, 0, 0, 'leverandorer/brand1', 'index.php?option=com_reditem&Itemid=121&id=20&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(224, 0, 0, 'leverandorer/brand10', 'index.php?option=com_reditem&Itemid=121&id=29&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(225, 0, 0, 'leverandorer/brand11', 'index.php?option=com_reditem&Itemid=121&id=30&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(226, 0, 0, 'leverandorer/brand12', 'index.php?option=com_reditem&Itemid=121&id=31&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(227, 0, 0, 'leverandorer/brand13', 'index.php?option=com_reditem&Itemid=121&id=32&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(228, 0, 0, 'leverandorer/brand14', 'index.php?option=com_reditem&Itemid=121&id=33&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(229, 0, 0, 'leverandorer/brand15', 'index.php?option=com_reditem&Itemid=121&id=38&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(230, 0, 0, 'leverandorer/brand16', 'index.php?option=com_reditem&Itemid=121&id=43&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(231, 0, 0, 'leverandorer/brand17', 'index.php?option=com_reditem&Itemid=121&id=35&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(232, 0, 0, 'leverandorer/brand18', 'index.php?option=com_reditem&Itemid=121&id=34&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(233, 0, 0, 'leverandorer/brand19', 'index.php?option=com_reditem&Itemid=121&id=42&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(234, 0, 0, 'leverandorer/brand2', 'index.php?option=com_reditem&Itemid=121&id=21&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(235, 0, 0, 'leverandorer/brand20', 'index.php?option=com_reditem&Itemid=121&id=36&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(236, 0, 0, 'leverandorer/brand21', 'index.php?option=com_reditem&Itemid=121&id=37&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(237, 0, 0, 'leverandorer/brand22', 'index.php?option=com_reditem&Itemid=121&id=39&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(238, 0, 0, 'leverandorer/brand23', 'index.php?option=com_reditem&Itemid=121&id=40&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(239, 0, 0, 'leverandorer/brand24', 'index.php?option=com_reditem&Itemid=121&id=41&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(240, 0, 0, 'leverandorer/brand25', 'index.php?option=com_reditem&Itemid=121&id=44&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(241, 0, 0, 'leverandorer/brand26', 'index.php?option=com_reditem&Itemid=121&id=45&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(242, 0, 0, 'leverandorer/brand27', 'index.php?option=com_reditem&Itemid=121&id=46&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(243, 0, 0, 'leverandorer/brand28', 'index.php?option=com_reditem&Itemid=121&id=47&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(244, 0, 0, 'leverandorer/brand3', 'index.php?option=com_reditem&Itemid=121&id=22&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(245, 0, 0, 'leverandorer/brand4', 'index.php?option=com_reditem&Itemid=121&id=23&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(246, 0, 0, 'leverandorer/brand5', 'index.php?option=com_reditem&Itemid=121&id=24&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(247, 0, 0, 'leverandorer/brand6', 'index.php?option=com_reditem&Itemid=121&id=25&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(248, 0, 0, 'leverandorer/brand8', 'index.php?option=com_reditem&Itemid=121&id=27&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(249, 0, 0, 'leverandorer/brand9', 'index.php?option=com_reditem&Itemid=121&id=28&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(250, 1, 0, 'www.qunar.com/', '', '', 0, '2016-06-01'),
(251, 1, 0, 'hndUnblock.cgi', '', '', 0, '2016-06-01'),
(252, 1, 0, 'tmUnblock.cgi', '', '', 0, '2016-06-01'),
(253, 1, 0, 'Files/System/BK/Grafik/BKContentBottomBG.gif', '', '', 0, '2016-06-02'),
(254, 1, 0, 'Files/System/BK/Grafik/BKArrow.gif', '', '', 0, '2016-06-02'),
(255, 0, 0, 'leverandorer/lindgreen-cordes', 'index.php?option=com_reditem&Itemid=121&id=48&lang=da&view=itemdetail', '', 0, '0000-00-00'),
(256, 1, 0, 'administator', '', '', 0, '2016-06-07'),
(257, 1, 0, 'media/com_reditem/images/customfield/15/c0b2a08ba5343fdc8326ec40daed3bde51d224d8.jpg', '', '', 1, '2016-06-09'),
(258, 1, 0, 'media/com_reditem/images/customfield/15/f357d9ea07ab66f7d8e7112019efdfb7b0cee1bc.jpg', '', '', 1, '2016-06-09'),
(259, 1, 0, 'media/com_reditem/images/customfield/15/0be334549d458ce3a0d1f2fd4d4b51db9687885e.jpg', '', '', 1, '2016-06-09'),
(260, 1, 0, 'admini', '', '', 0, '2016-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_sh404sef_urls_src`
--

CREATE TABLE IF NOT EXISTS `yp5e2_sh404sef_urls_src` (
  `id` int(11) NOT NULL,
  `url` varchar(333) NOT NULL DEFAULT '',
  `routed_url` varchar(333) NOT NULL DEFAULT '',
  `source_url` varchar(333) NOT NULL DEFAULT '',
  `source_routed_url` varchar(333) NOT NULL DEFAULT '',
  `trace` varchar(10000) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_shlib_consumers`
--

CREATE TABLE IF NOT EXISTS `yp5e2_shlib_consumers` (
  `id` int(10) unsigned NOT NULL,
  `resource` varchar(50) NOT NULL DEFAULT '',
  `context` varchar(50) NOT NULL DEFAULT '',
  `min_version` varchar(20) NOT NULL DEFAULT '0',
  `max_version` varchar(20) NOT NULL DEFAULT '0',
  `refuse_versions` varchar(255) NOT NULL DEFAULT '',
  `accept_versions` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_shlib_consumers`
--

INSERT INTO `yp5e2_shlib_consumers` (`id`, `resource`, `context`, `min_version`, `max_version`, `refuse_versions`, `accept_versions`) VALUES
(1, 'shlib', 'com_sh404sef', '0.3.0', '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_shlib_resources`
--

CREATE TABLE IF NOT EXISTS `yp5e2_shlib_resources` (
  `id` int(10) unsigned NOT NULL,
  `resource` varchar(50) NOT NULL DEFAULT '',
  `current_version` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_shlib_resources`
--

INSERT INTO `yp5e2_shlib_resources` (`id`, `resource`, `current_version`) VALUES
(1, 'shlib', '0.3.1.487');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_tags`
--

CREATE TABLE IF NOT EXISTS `yp5e2_tags` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_tags`
--

INSERT INTO `yp5e2_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 3, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 629, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 1, 2, 1, 'joomla', 'Joomla', 'joomla', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"tag_layout":"","tag_link_class":"label label-info","image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '', '', '{"author":"","robots":""}', 629, '2013-11-16 00:00:00', '', 0, '0000-00-00 00:00:00', '', '', 4, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_template_styles`
--

CREATE TABLE IF NOT EXISTS `yp5e2_template_styles` (
  `id` int(10) unsigned NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_template_styles`
--

INSERT INTO `yp5e2_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'redcomponent', 0, '1', 'redCOMPONENT - Default', '{"rebrand":"yes","style":"generic","modal":"1","javascriptBottom":"1","logo":"template","logowidth":"4","body_font":"jdefault","header_font":"jdefault","wright_bootstrap_images":"","responsive":"1","stickyFooter":"1","columnsNumber":12,"columns":"sidebar1:3;main:6;sidebar2:3","build":false,"browsercompatibilityswitch":"0","browsercompatibility":"{\\"Chrome\\":{\\"minimumVersion\\":\\"35\\",\\"recommended\\":true,\\"desktop\\":true,\\"mobile\\":true},\\"Firefox\\":{\\"minimumVersion\\":\\"28\\",\\"recommended\\":false,\\"desktop\\":true,\\"mobile\\":false},\\"Internet Explorer\\":{\\"minimumVersion\\":\\"8\\",\\"recommended\\":false,\\"desktop\\":true,\\"mobile\\":false},\\"Safari\\":{\\"minimumVersion\\":\\"7\\",\\"recommended\\":false,\\"desktop\\":true,\\"mobile\\":false},\\"Opera\\":{\\"minimumVersion\\":\\"24\\",\\"recommended\\":false,\\"desktop\\":true,\\"mobile\\":false},\\"iPad\\":{\\"minimumVersion\\":\\"6\\",\\"recommended\\":false,\\"desktop\\":false,\\"mobile\\":true},\\"iPhone\\":{\\"minimumVersion\\":\\"6\\",\\"recommended\\":false,\\"desktop\\":false,\\"mobile\\":true},\\"iPod\\":{\\"minimumVersion\\":\\"6\\",\\"recommended\\":false,\\"desktop\\":false,\\"mobile\\":true}}"}');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_ucm_base`
--

CREATE TABLE IF NOT EXISTS `yp5e2_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_ucm_base`
--

INSERT INTO `yp5e2_ucm_base` (`ucm_id`, `ucm_item_id`, `ucm_type_id`, `ucm_language_id`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_ucm_content`
--

CREATE TABLE IF NOT EXISTS `yp5e2_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

--
-- Dumping data for table `yp5e2_ucm_content`
--

INSERT INTO `yp5e2_ucm_content` (`core_content_id`, `core_type_alias`, `core_title`, `core_alias`, `core_body`, `core_state`, `core_checked_out_time`, `core_checked_out_user_id`, `core_access`, `core_params`, `core_featured`, `core_metadata`, `core_created_user_id`, `core_created_by_alias`, `core_created_time`, `core_modified_user_id`, `core_modified_time`, `core_language`, `core_publish_up`, `core_publish_down`, `core_content_item_id`, `asset_id`, `core_images`, `core_urls`, `core_hits`, `core_version`, `core_ordering`, `core_metakey`, `core_metadesc`, `core_catid`, `core_xreference`, `core_type_id`) VALUES
(1, 'com_content.article', 'Getting Started', 'getting-started', '<p>It''s easy to get started creating your website. Knowing some of the basics will help.</p><h3>What is a Content Management System?</h3><p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.</p><p>In this site, the content is stored in a <em>database</em>. The look and feel are created by a <em>template</em>. Joomla! brings together the template and your content to create web pages.</p><h3>Logging in</h3><p>To login to your site use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles and modify some settings.</p><h3>Creating an article</h3><p>Once you are logged-in, a new menu will be visible. To create a new article, click on the "Submit Article" link on that menu.</p><p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.</p><div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).</div><h3>Template, site settings, and modules</h3><p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template settings. Click the "Template Settings" in the user menu.</p><p>The boxes around the main content of the site are called modules. You can modify modules on the current page by moving your cursor to the module and clicking the edit link. Always be sure to save and close any module you edit.</p><p>You can change some site settings such as the site name and description by clicking on the "Site Settings" link.</p><p>More advanced options for templates, site settings, modules, and more are available in the site administrator.</p><h3>Site and Administrator</h3><p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "User Menu" menu (visible once you login) or by adding /administrator to the end of your domain name. The same user name and password are used for both sites.</p><h3>Learn more</h3><p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="https://docs.joomla.org" target="_blank">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org" target="_blank"> Joomla! forums</a>.</p>', -2, '', 0, 1, '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 0, '{"robots":"","author":"","rights":"","xreference":""}', 629, '', '2013-11-16 00:00:00', 0, '0000-00-00 00:00:00', '*', '2013-11-16 00:00:00', '0000-00-00 00:00:00', 1, 62, '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', 0, 1, 0, '', '', 2, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_ucm_history`
--

CREATE TABLE IF NOT EXISTS `yp5e2_ucm_history` (
  `version_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_ucm_history`
--

INSERT INTO `yp5e2_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 2, 10, 'Initial content', '2013-11-16 00:00:00', 629, 558, 'be28228b479aa67bad3dc1db2975232a033d5f0f', '{"id":2,"parent_id":"1","lft":"1","rgt":2,"level":1,"path":"joomla","title":"Joomla","alias":"joomla","note":"","description":null,"published":1,"checked_out":"0","checked_out_time":"0000-00-00 00:00:00","access":1,"params":null,"metadesc":null,"metakey":null,"metadata":null,"created_user_id":"849","created_time":"2013-11-16 00:00:00","created_by_alias":"","modified_user_id":"0","modified_time":"0000-00-00 00:00:00","images":null,"urls":null,"hits":"0","language":"*","version":"1","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00"}', 0),
(2, 1, 1, 'Initial content', '2013-11-16 00:00:00', 629, 4539, '4f6bf8f67e89553853c3b6e8ed0a6111daaa7a2f', '{"id":1,"asset_id":54,"title":"Getting Started","alias":"getting-started","introtext":"<p>It''s easy to get started creating your website. Knowing some of the basics will help.<\\/p>\\r\\n<h3>What is a Content Management System?<\\/h3>\\r\\n<p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.<\\/p>\\r\\n<p>In this site, the content is stored in a <em>database<\\/em>. The look and feel are created by a <em>template<\\/em>. Joomla! brings together the template and your content to create web pages.<\\/p>\\r\\n<h3>Logging in<\\/h3>\\r\\n<p>To login to your site use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles and modify some settings.<\\/p>\\r\\n<h3>Creating an article<\\/h3>\\r\\n<p>Once you are logged-in, a new menu will be visible. To create a new article, click on the \\"Submit Article\\" link on that menu.<\\/p>\\r\\n<p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.<\\/p>\\r\\n<div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).<\\/div>\\r\\n<h3>Template, site settings, and modules<\\/h3>\\r\\n<p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template settings. Click the \\"Template Settings\\" in the user menu.\\u00a0<\\/p>\\r\\n<p>The boxes around the main content of the site are called modules. \\u00a0You can modify modules on the current page by moving your cursor to the module and clicking the edit link. Always be sure to save and close any module you edit.<\\/p>\\r\\n<p>You can change some site settings such as the site name and description by clicking on the \\"Site Settings\\" link.<\\/p>\\r\\n<p>More advanced options for templates, site settings, modules, and more are available in the site administrator.<\\/p>\\r\\n<h3>Site and Administrator<\\/h3>\\r\\n<p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the \\"Site Administrator\\" link on the \\"User Menu\\" menu (visible once you login) or by adding \\/administrator to the end of your domain name. The same user name and password are used for both sites.<\\/p>\\r\\n<h3>Learn more<\\/h3>\\r\\n<p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href=\\"http:\\/\\/docs.joomla.org\\" target=\\"_blank\\">Joomla! documentation site<\\/a> and on the<a href=\\"http:\\/\\/forum.joomla.org\\" target=\\"_blank\\"> Joomla! forums<\\/a>.<\\/p>","fulltext":"","state":1,"catid":"2","created":"2013-11-16 00:00:00","created_by":"849","created_by_alias":"","modified":"","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2013-11-16 00:00:00","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(3, 1, 12, '', '2016-04-18 10:11:26', 630, 331, 'd9a929c7a959176daa6ff62b3d7bfd2e44cbe1d0', '{"id":1,"user_id":"631","catid":"7","subject":"redWEB","body":"<p>redWEB Support<\\/p>","state":"1","checked_out":null,"checked_out_time":null,"created_user_id":"630","created_time":"2016-04-18 10:11:26","modified_user_id":"630","modified_time":"2016-04-18 10:11:26","review_time":"2016-04-18","publish_up":null,"publish_down":null}', 0),
(4, 8, 13, '', '2016-04-18 10:11:47', 630, 563, 'e133287c943624611af4dbaf80817a34013f6f71', '{"id":8,"asset_id":87,"parent_id":"1","lft":"11","rgt":12,"level":1,"path":null,"extension":"com_users","title":"redWEB Support","alias":"redweb-support","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"630","created_time":"2016-04-18 10:11:47","modified_user_id":null,"modified_time":"2016-04-18 10:11:47","hits":"0","language":"*","version":null}', 0),
(5, 1, 12, '', '2016-04-18 10:11:57', 630, 391, '0e798cdac0d092a93a11a3790cb5559043cfebdb', '{"id":1,"user_id":"631","catid":"8","subject":"redWEB Support","body":"<p>redWEB Support<\\/p>","state":"1","checked_out":"630","checked_out_time":"2016-04-18 10:11:52","created_user_id":"630","created_time":"2016-04-18 10:11:26","modified_user_id":"630","modified_time":"2016-04-18 10:11:57","review_time":"2016-04-18","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_updates`
--

CREATE TABLE IF NOT EXISTS `yp5e2_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

--
-- Dumping data for table `yp5e2_updates`
--

INSERT INTO `yp5e2_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 11, 10056, 'Akeeba Backup Core package', 'Akeeba Backup Core package', 'pkg_akeeba', 'package', '', 0, '5.1.0', '', 'http://cdn.akeebabackup.com/updates/pkgakeebacore.xml', 'https://www.akeebabackup.com/component/ars/?view=Items&release_id=2485', '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_update_sites`
--

CREATE TABLE IF NOT EXISTS `yp5e2_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Dumping data for table `yp5e2_update_sites`
--

INSERT INTO `yp5e2_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1465551298, ''),
(2, 'Joomla! Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1465551298, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 0, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 0, ''),
(6, 'sh404SEF updates', 'extension', 'https://u1.weeblr.com/public/direct/sh404sef/update/com_sh404sef_j3_full.xml', 1, 0, ''),
(7, 'JCE Editor Updates', 'extension', 'https://www.joomlacontenteditor.net/index.php?option=com_updates&view=update&format=xml&id=1&file=extension.xml', 1, 0, ''),
(8, 'JCH Optimize Updates', 'extension', 'https://www.jch-optimize.net/index.php?option=com_ars&view=update&task=stream&format=xml&id=2&file=extension.xml', 1, 1465500566, ''),
(9, 'NoNumber Modules Anywhere', 'extension', 'http://download.regularlabs.com/updates.xml?e=modulesanywhere&type=.xml', 1, 1465500566, ''),
(11, 'Akeeba Backup Core', 'extension', 'http://cdn.akeebabackup.com/updates/pkgakeebacore.xml', 1, 1465500566, '');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `yp5e2_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Dumping data for table `yp5e2_update_sites_extensions`
--

INSERT INTO `yp5e2_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(3, 10024),
(4, 28),
(6, 10025),
(7, 10035),
(8, 10039),
(9, 10045),
(11, 10056);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_usergroups`
--

CREATE TABLE IF NOT EXISTS `yp5e2_usergroups` (
  `id` int(10) unsigned NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_usergroups`
--

INSERT INTO `yp5e2_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_users`
--

CREATE TABLE IF NOT EXISTS `yp5e2_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login'
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_users`
--

INSERT INTO `yp5e2_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(629, 'Super User', 'nga.redweb', 'nga@redweb.dk', '$2y$10$tLW/tpzSPWJIK8dgoU9Yuuhgo0FEASR6F0FVod9wV6Z.uKMOAeCP2', 0, 1, '2016-04-11 10:41:43', '2016-05-31 03:03:20', '0', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
(630, 'kier.redweb', 'kier.redweb', 'kier@redweb.dk', '$2y$10$/uGPyw866npcFZ5Dahw6y.rFpXNQ0oBslvZ.YbMTcgOGAiXPyqG/u', 0, 0, '2016-04-18 10:07:55', '2016-05-11 03:43:13', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(631, 'mads', 'mads', 'mads@redweb.dk', '$2y$10$a7gQdZ4M5RvdW2tXJN8DS.4f.acrebvwuEFRpOYMHGUVBlnxTUZGW', 0, 0, '2016-04-18 10:09:55', '2016-04-18 10:12:21', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(632, 'jerri', 'jerri', 'jerri@redweb.dk', '$2y$10$rvHICKs8ho1kbhLxhl5XQ.C5SEg41x8Y.aVaGAUePS2GnsuEoo./u', 0, 0, '2016-04-20 07:16:30', '2016-05-10 10:56:54', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(633, 'Hans Henrik', 'hans', 'hans@redweb.dk', '$2y$10$zlCMijtcV00HgLfXF/RyeOlPM4euIPI5Uc4HgKd5N2XibPgza1Dfy', 0, 0, '2016-04-26 12:38:36', '2016-06-07 11:44:53', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(634, 'Marianne', 'mae', 'mae@kier.dk', '$2y$10$.NvXTcIvYEtEtEcyNDCWJuP07j4P9bKzHZOw5xUPZNvOHD2Bqe9k6', 0, 0, '2016-04-28 11:03:09', '2016-06-09 11:13:52', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(635, 'Allan', 'ala', 'ala@kier.dk', '$2y$10$6G.7x6MfuiklgiiSXDfP.OS9NksDOMZBrDoLvS.1oPygHjf8x9qMe', 0, 0, '2016-04-28 11:03:46', '2016-04-29 09:43:14', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(636, 'viet', 'viet.redweb', 'viet@redweb.dk', '$2y$10$nQCxuH7mci8UWFxq8DwFRuxYvKIO9HYq3f3W.SP4pqrgwSlOJex4G', 0, 0, '2016-05-04 10:01:22', '2016-06-07 09:14:58', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(637, 'Petar Tuović', 'petar', 'petar@redcomponent.com', '$2y$10$JnTctDqtmwYwulk4rtzhS.ctLPnZURjVpG3RA/H7mz02GznqYZapq', 0, 0, '2016-06-07 11:44:01', '2016-06-09 19:29:25', '', '{"admin_style":"","admin_language":"en-GB","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(638, 'redWEB', 'redweb', 'email@redweb.dk', '$2y$10$EX45ZAjPuKyoS7C3NwK5U.FDC84AG16zVewn295RrWO5KWaCuwJoq', 0, 0, '2016-06-07 11:46:24', '2016-06-07 11:48:10', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_users_rctranslations`
--

CREATE TABLE IF NOT EXISTS `yp5e2_users_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_user_keys`
--

CREATE TABLE IF NOT EXISTS `yp5e2_user_keys` (
  `id` int(10) unsigned NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_user_notes`
--

CREATE TABLE IF NOT EXISTS `yp5e2_user_notes` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_user_notes`
--

INSERT INTO `yp5e2_user_notes` (`id`, `user_id`, `catid`, `subject`, `body`, `state`, `checked_out`, `checked_out_time`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `review_time`, `publish_up`, `publish_down`) VALUES
(1, 631, 8, 'redWEB Support', '<p>redWEB Support</p>', 1, 0, '0000-00-00 00:00:00', 630, '2016-04-18 10:11:26', 630, '2016-04-18 10:11:57', '2016-04-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_user_profiles`
--

CREATE TABLE IF NOT EXISTS `yp5e2_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `yp5e2_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_user_usergroup_map`
--

INSERT INTO `yp5e2_user_usergroup_map` (`user_id`, `group_id`) VALUES
(629, 8),
(630, 8),
(631, 2),
(631, 8),
(632, 2),
(632, 8),
(633, 2),
(633, 8),
(634, 2),
(634, 8),
(635, 2),
(635, 8),
(636, 2),
(636, 8),
(637, 2),
(637, 8),
(638, 2),
(638, 8);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_utf8_conversion`
--

CREATE TABLE IF NOT EXISTS `yp5e2_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_utf8_conversion`
--

INSERT INTO `yp5e2_utf8_conversion` (`converted`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_viewlevels`
--

CREATE TABLE IF NOT EXISTS `yp5e2_viewlevels` (
  `id` int(10) unsigned NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yp5e2_viewlevels`
--

INSERT INTO `yp5e2_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_wblib_keystore`
--

CREATE TABLE IF NOT EXISTS `yp5e2_wblib_keystore` (
  `id` int(11) NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT 'default',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `format` tinyint(3) NOT NULL DEFAULT '1',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_wblib_messages`
--

CREATE TABLE IF NOT EXISTS `yp5e2_wblib_messages` (
  `id` int(10) unsigned NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `sub_type` varchar(150) NOT NULL DEFAULT '',
  `display_type` tinyint(3) NOT NULL DEFAULT '0',
  `uid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(512) DEFAULT NULL,
  `body` varchar(2048) NOT NULL DEFAULT '',
  `action` tinyint(3) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hide_after` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hide_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_wblib_messages`
--

INSERT INTO `yp5e2_wblib_messages` (`id`, `scope`, `type`, `sub_type`, `display_type`, `uid`, `title`, `body`, `action`, `created_on`, `acked_on`, `hide_after`, `hide_until`) VALUES
(1, 'com_sh404sef', 'sh404sef.general', 'welcome', 0, '3ec4a9b71686a6f20d69afc6c8f347573660c580', 'Welcome to sh404SEF!', 'To enable it for your site, use the main <i>Enable URL optimization</i> Yes/No selector and press the <strong>Save</strong> button. sh404SEF will start with its default settings, suitable in most cases.<br/><br /><a href=''https://weeblr.com/documentation'' target=''_blank'' title=''sh404sef Documentation''>Please check out the documentation</a>', 0, '2016-04-15 10:35:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'com_sh404sef', 'joomla.config', 'language_filter_warning', 3, 'c505804da2f011676fe3033970a9af8c4527493f', 'You may need to enable the language filter plugin.', 'It seems your site is multilingual. From sh404SEF version 4.3.1 up, Joomla! languagefilter system plugin should now be enabled, while older versions required it to be disabled. You can enable it <a href=''index.php?option=com_plugins&folder=system''>on this page</a>', 7, '2016-04-15 10:35:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'com_sh404sef', 'joomla.config', 'sef_settings_dont_match', 3, 'aebef14e27e800d9fb7cf710f186f48c5eb6cb64', 'Joomla SEF settings are probably not correct', 'Joomla! and sh404SEF SEF URLs settings don''t match. Check that Joomla! SEF URLs are enabled. Check also that <strong>if you enabled <i>Adds Suffix to URL</i></strong>, you also added a <i>File suffix</i> in sh404SEF configuration. This is not required by sh404SEF but some extensions may not work properly.', 7, '2016-04-27 12:27:36', '2016-04-27 12:27:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'com_sh404sef', 'joomla.config', 'sef_settings_dont_match', 3, 'cf28cefd9d90b106d650ddb33c0fbb340df62fce', 'Joomla SEF settings are probably not correct', 'Joomla! and sh404SEF SEF URLs settings don''t match. Check that Joomla! SEF URLs are enabled. Check also that <strong>if you enabled <i>Adds Suffix to URL</i></strong>, you also added a <i>File suffix</i> in sh404SEF configuration. This is not required by sh404SEF but some extensions may not work properly.', 7, '2016-04-28 10:17:51', '2016-04-28 10:20:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'com_sh404sef', 'joomla.config', 'sef_settings_dont_match', 3, 'f215d07d05909d5db0f8c71f56417b10d4b98b11', 'Joomla SEF settings are probably not correct', 'Joomla! and sh404SEF SEF URLs settings don''t match. Check that Joomla! SEF URLs are enabled. Check also that <strong>if you enabled <i>Adds Suffix to URL</i></strong>, you also added a <i>File suffix</i> in sh404SEF configuration. This is not required by sh404SEF but some extensions may not work properly.', 7, '2016-05-31 07:09:53', '2016-05-31 07:09:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `yp5e2_wf_profiles`
--

CREATE TABLE IF NOT EXISTS `yp5e2_wf_profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yp5e2_wf_profiles`
--

INSERT INTO `yp5e2_wf_profiles` (`id`, `name`, `description`, `users`, `types`, `components`, `area`, `device`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Default', 'Default Profile for all users', '', '3,4,5,6,8,7', '', 0, 'desktop,tablet,phone', 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,forecolor,backcolor,spacer,clipboard,indent,outdent,lists,sub,sup,textcase,charmap,hr;directionality,fullscreen,preview,source,print,searchreplace,spacer,table;visualaid,visualchars,visualblocks,nonbreaking,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'charmap,contextmenu,browser,inlinepopups,media,help,clipboard,searchreplace,directionality,fullscreen,preview,source,table,textcase,print,style,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article,lists,formatselect,styleselect,fontselect,fontsizeselect,fontcolor,hr', 1, 1, 0, '0000-00-00 00:00:00', ''),
(2, 'Front End', 'Sample Front-end Profile', '', '3,4,5', '', 1, 'desktop,tablet,phone', 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;clipboard,searchreplace,indent,outdent,lists,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars,visualblocks;fullscreen,preview,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'charmap,contextmenu,inlinepopups,help,clipboard,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article,lists,formatselect,styleselect,hr', 0, 2, 0, '0000-00-00 00:00:00', ''),
(3, 'Blogger', 'Simple Blogging Profile', '', '3,4,5,6,8,7', '', 0, 'desktop,tablet,phone', 'bold,italic,strikethrough,lists,blockquote,spacer,justifyleft,justifycenter,justifyright,spacer,link,unlink,imgmanager,article,spellchecker,fullscreen,kitchensink;formatselect,styleselect,underline,justifyfull,clipboard,removeformat,charmap,indent,outdent,undo,redo,help', 'link,imgmanager,article,spellchecker,fullscreen,kitchensink,clipboard,contextmenu,inlinepopups,lists,formatselect,styleselect', 0, 3, 0, '0000-00-00 00:00:00', '{"editor":{"toggle":"0"}}'),
(4, 'Mobile', 'Sample Mobile Profile', '', '3,4,5,6,8,7', '', 0, 'tablet,phone', 'undo,redo,spacer,bold,italic,underline,formatselect,spacer,justifyleft,justifycenter,justifyfull,justifyright,spacer,fullscreen,kitchensink;styleselect,lists,spellchecker,article,link,unlink', 'fullscreen,kitchensink,spellchecker,article,link,inlinepopups,lists,formatselect,styleselect', 0, 4, 0, '0000-00-00 00:00:00', '{"editor":{"toolbar_theme":"mobile","resizing":"0","resize_horizontal":"0","resizing_use_cookie":"0","toggle":"0","links":{"popups":{"default":"","jcemediabox":{"enable":"0"},"window":{"enable":"0"}}}}}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `yp5e2_akeeba_common`
--
ALTER TABLE `yp5e2_akeeba_common`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `yp5e2_ak_profiles`
--
ALTER TABLE `yp5e2_ak_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_ak_stats`
--
ALTER TABLE `yp5e2_ak_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fullstatus` (`filesexist`,`status`),
  ADD KEY `idx_stale` (`status`,`origin`);

--
-- Indexes for table `yp5e2_ak_storage`
--
ALTER TABLE `yp5e2_ak_storage`
  ADD PRIMARY KEY (`tag`(100));

--
-- Indexes for table `yp5e2_assets`
--
ALTER TABLE `yp5e2_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `yp5e2_associations`
--
ALTER TABLE `yp5e2_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `yp5e2_banners`
--
ALTER TABLE `yp5e2_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `yp5e2_banners_rctranslations`
--
ALTER TABLE `yp5e2_banners_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `32630fd13c41b827067dbe3262481cfc` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `ef452f671eef13803e541d0383fbb08d` (`id`);

--
-- Indexes for table `yp5e2_banner_clients`
--
ALTER TABLE `yp5e2_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Indexes for table `yp5e2_banner_clients_rctranslations`
--
ALTER TABLE `yp5e2_banner_clients_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `1d1b91b8a8591eef5d951add951512aa` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `d5f871880cbf2de8c8b8a945c01f2e56` (`id`);

--
-- Indexes for table `yp5e2_banner_tracks`
--
ALTER TABLE `yp5e2_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indexes for table `yp5e2_categories`
--
ALTER TABLE `yp5e2_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `yp5e2_categories_rctranslations`
--
ALTER TABLE `yp5e2_categories_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `8cc548afadc9c00a0de03f842bcc261c` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `e73711c01d1111144ad4e4937c2542d7` (`id`);

--
-- Indexes for table `yp5e2_contact_details`
--
ALTER TABLE `yp5e2_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `yp5e2_contact_details_rctranslations`
--
ALTER TABLE `yp5e2_contact_details_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `43f8bb1d4be5a1d4132d28395ebe397d` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `e47b20a222b419abae309150242a86d2` (`id`);

--
-- Indexes for table `yp5e2_content`
--
ALTER TABLE `yp5e2_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `yp5e2_contentitem_tag_map`
--
ALTER TABLE `yp5e2_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indexes for table `yp5e2_content_frontpage`
--
ALTER TABLE `yp5e2_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `yp5e2_content_rating`
--
ALTER TABLE `yp5e2_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `yp5e2_content_rctranslations`
--
ALTER TABLE `yp5e2_content_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `8a398786a076fd68d4ffa61375320fae` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `429164c1b039d18880ed64f04f0450ce` (`id`);

--
-- Indexes for table `yp5e2_content_types`
--
ALTER TABLE `yp5e2_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Indexes for table `yp5e2_extensions`
--
ALTER TABLE `yp5e2_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indexes for table `yp5e2_extensions_rctranslations`
--
ALTER TABLE `yp5e2_extensions_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `affcdda8d9100e39bf0d7633b3219a6d` (`rctranslations_language`,`rctranslations_state`,`extension_id`),
  ADD KEY `8929473690726fea65dd7a37f7e4c34c` (`extension_id`);

--
-- Indexes for table `yp5e2_finder_filters`
--
ALTER TABLE `yp5e2_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `yp5e2_finder_links`
--
ALTER TABLE `yp5e2_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indexes for table `yp5e2_finder_links_terms0`
--
ALTER TABLE `yp5e2_finder_links_terms0`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms1`
--
ALTER TABLE `yp5e2_finder_links_terms1`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms2`
--
ALTER TABLE `yp5e2_finder_links_terms2`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms3`
--
ALTER TABLE `yp5e2_finder_links_terms3`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms4`
--
ALTER TABLE `yp5e2_finder_links_terms4`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms5`
--
ALTER TABLE `yp5e2_finder_links_terms5`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms6`
--
ALTER TABLE `yp5e2_finder_links_terms6`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms7`
--
ALTER TABLE `yp5e2_finder_links_terms7`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms8`
--
ALTER TABLE `yp5e2_finder_links_terms8`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_terms9`
--
ALTER TABLE `yp5e2_finder_links_terms9`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_termsa`
--
ALTER TABLE `yp5e2_finder_links_termsa`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_termsb`
--
ALTER TABLE `yp5e2_finder_links_termsb`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_termsc`
--
ALTER TABLE `yp5e2_finder_links_termsc`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_termsd`
--
ALTER TABLE `yp5e2_finder_links_termsd`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_termse`
--
ALTER TABLE `yp5e2_finder_links_termse`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_links_termsf`
--
ALTER TABLE `yp5e2_finder_links_termsf`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `yp5e2_finder_taxonomy`
--
ALTER TABLE `yp5e2_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `state` (`state`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `access` (`access`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indexes for table `yp5e2_finder_taxonomy_map`
--
ALTER TABLE `yp5e2_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `yp5e2_finder_terms`
--
ALTER TABLE `yp5e2_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term` (`term`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`);

--
-- Indexes for table `yp5e2_finder_terms_common`
--
ALTER TABLE `yp5e2_finder_terms_common`
  ADD KEY `idx_word_lang` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indexes for table `yp5e2_finder_tokens`
--
ALTER TABLE `yp5e2_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_context` (`context`);

--
-- Indexes for table `yp5e2_finder_tokens_aggregate`
--
ALTER TABLE `yp5e2_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indexes for table `yp5e2_finder_types`
--
ALTER TABLE `yp5e2_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `yp5e2_languages`
--
ALTER TABLE `yp5e2_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_image` (`image`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `yp5e2_languages_rctranslations`
--
ALTER TABLE `yp5e2_languages_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `148983a9c74308b30cb527e06c33753d` (`rctranslations_language`,`rctranslations_state`,`lang_id`),
  ADD KEY `bd4599ff5626495934313cd2dd2f193f` (`lang_id`);

--
-- Indexes for table `yp5e2_menu`
--
ALTER TABLE `yp5e2_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `yp5e2_menu_rctranslations`
--
ALTER TABLE `yp5e2_menu_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `b02100e875443b34367a81dc9d95f4af` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `a83ab8d777bccef0536202809d0e9dda` (`id`);

--
-- Indexes for table `yp5e2_menu_types`
--
ALTER TABLE `yp5e2_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indexes for table `yp5e2_messages`
--
ALTER TABLE `yp5e2_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `yp5e2_messages_cfg`
--
ALTER TABLE `yp5e2_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `yp5e2_modules`
--
ALTER TABLE `yp5e2_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `yp5e2_modules_menu`
--
ALTER TABLE `yp5e2_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `yp5e2_modules_rctranslations`
--
ALTER TABLE `yp5e2_modules_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `55f570cb6475cab7d6fa375cf222bf39` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `b834c3b68c433ca31fe28b3f92b450f7` (`id`);

--
-- Indexes for table `yp5e2_newsfeeds`
--
ALTER TABLE `yp5e2_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `yp5e2_newsfeeds_rctranslations`
--
ALTER TABLE `yp5e2_newsfeeds_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `55333a66f3ca59319a07a56ade72e34d` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `74e4bceb50a66d8b78ec2ce8dd0d91dc` (`id`);

--
-- Indexes for table `yp5e2_overrider`
--
ALTER TABLE `yp5e2_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_postinstall_messages`
--
ALTER TABLE `yp5e2_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indexes for table `yp5e2_redcore_country`
--
ALTER TABLE `yp5e2_redcore_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`name`),
  ADD UNIQUE KEY `idx_alpha2` (`alpha2`),
  ADD UNIQUE KEY `idx_alpha3` (`alpha3`),
  ADD UNIQUE KEY `idx_numeric` (`numeric`);

--
-- Indexes for table `yp5e2_redcore_country_rctranslations`
--
ALTER TABLE `yp5e2_redcore_country_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `e6ca02485e9f3164c85382960b76ffab` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `e7cd1db7c7470719ba0c03c3229e368c` (`id`);

--
-- Indexes for table `yp5e2_redcore_currency`
--
ALTER TABLE `yp5e2_redcore_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_alpha3` (`alpha3`),
  ADD UNIQUE KEY `idx_numeric` (`numeric`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `yp5e2_redcore_currency_rctranslations`
--
ALTER TABLE `yp5e2_redcore_currency_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `8d83880f68ae28e032d42794831ab45c` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `ffcfde4bda4991e67f20ddf67ff0ece7` (`id`);

--
-- Indexes for table `yp5e2_redcore_oauth_access_tokens`
--
ALTER TABLE `yp5e2_redcore_oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`),
  ADD KEY `idx_client_id` (`client_id`);

--
-- Indexes for table `yp5e2_redcore_oauth_authorization_codes`
--
ALTER TABLE `yp5e2_redcore_oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`),
  ADD KEY `idx_client_id` (`client_id`);

--
-- Indexes for table `yp5e2_redcore_oauth_clients`
--
ALTER TABLE `yp5e2_redcore_oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id` (`client_id`);

--
-- Indexes for table `yp5e2_redcore_oauth_jwt`
--
ALTER TABLE `yp5e2_redcore_oauth_jwt`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `yp5e2_redcore_oauth_public_keys`
--
ALTER TABLE `yp5e2_redcore_oauth_public_keys`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `yp5e2_redcore_oauth_refresh_tokens`
--
ALTER TABLE `yp5e2_redcore_oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`),
  ADD KEY `idx_client_id` (`client_id`);

--
-- Indexes for table `yp5e2_redcore_oauth_users`
--
ALTER TABLE `yp5e2_redcore_oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `yp5e2_redcore_payments`
--
ALTER TABLE `yp5e2_redcore_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_extension_order_id` (`extension_name`,`order_id`),
  ADD KEY `idx_extension_payment` (`extension_name`,`owner_name`,`payment_name`),
  ADD KEY `idx_payment_confirmed` (`confirmed_date`);

--
-- Indexes for table `yp5e2_redcore_payment_configuration`
--
ALTER TABLE `yp5e2_redcore_payment_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_extension_config` (`extension_name`,`owner_name`,`payment_name`);

--
-- Indexes for table `yp5e2_redcore_payment_log`
--
ALTER TABLE `yp5e2_redcore_payment_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_id` (`payment_id`),
  ADD KEY `idx_transaction_id` (`transaction_id`);

--
-- Indexes for table `yp5e2_redcore_translation_columns`
--
ALTER TABLE `yp5e2_redcore_translation_columns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_translation_columns_keys` (`translation_table_id`,`name`),
  ADD KEY `idx_translation_columns_keys` (`translation_table_id`);

--
-- Indexes for table `yp5e2_redcore_translation_tables`
--
ALTER TABLE `yp5e2_redcore_translation_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_translations_keys` (`name`,`extension_name`,`state`);

--
-- Indexes for table `yp5e2_redcore_webservices`
--
ALTER TABLE `yp5e2_redcore_webservices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_webservice_keys` (`client`,`name`,`version`);

--
-- Indexes for table `yp5e2_redirect_links`
--
ALTER TABLE `yp5e2_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modifed` (`modified_date`);

--
-- Indexes for table `yp5e2_reditem_categories`
--
ALTER TABLE `yp5e2_reditem_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `access` (`access`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `published` (`published`),
  ADD KEY `publish_up` (`publish_up`),
  ADD KEY `publish_down` (`publish_down`),
  ADD KEY `featured` (`featured`);

--
-- Indexes for table `yp5e2_reditem_categories_rctranslations`
--
ALTER TABLE `yp5e2_reditem_categories_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `000db5a37c2cb8d3bea07edb0c5b7706` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `6835e59a902f2d4655e520ec10894167` (`id`);

--
-- Indexes for table `yp5e2_reditem_category_fields`
--
ALTER TABLE `yp5e2_reditem_category_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_category_fields_value`
--
ALTER TABLE `yp5e2_reditem_category_fields_value`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `yp5e2_reditem_category_related`
--
ALTER TABLE `yp5e2_reditem_category_related`
  ADD KEY `related_id` (`related_id`);

--
-- Indexes for table `yp5e2_reditem_comments`
--
ALTER TABLE `yp5e2_reditem_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_comment_reports`
--
ALTER TABLE `yp5e2_reditem_comment_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_fields`
--
ALTER TABLE `yp5e2_reditem_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `type` (`type`),
  ADD KEY `published` (`published`),
  ADD KEY `searchable_in_frontend` (`searchable_in_frontend`),
  ADD KEY `searchable_in_backend` (`searchable_in_backend`),
  ADD KEY `backend_filter` (`backend_filter`);

--
-- Indexes for table `yp5e2_reditem_items`
--
ALTER TABLE `yp5e2_reditem_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access` (`access`),
  ADD KEY `blocked` (`blocked`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `published` (`published`),
  ADD KEY `publish_down` (`publish_down`),
  ADD KEY `publish_up` (`publish_up`),
  ADD KEY `featured` (`featured`);

--
-- Indexes for table `yp5e2_reditem_items_rctranslations`
--
ALTER TABLE `yp5e2_reditem_items_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `bf8682275052e7a9a5bac9d4c500fe09` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `91431dd235ef2df754964c0a419d41a0` (`id`);

--
-- Indexes for table `yp5e2_reditem_item_category_xref`
--
ALTER TABLE `yp5e2_reditem_item_category_xref`
  ADD PRIMARY KEY (`item_id`,`category_id`);

--
-- Indexes for table `yp5e2_reditem_item_preview`
--
ALTER TABLE `yp5e2_reditem_item_preview`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_item_rating`
--
ALTER TABLE `yp5e2_reditem_item_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `yp5e2_reditem_item_reports`
--
ALTER TABLE `yp5e2_reditem_item_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_log_useractivity`
--
ALTER TABLE `yp5e2_reditem_log_useractivity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_mail`
--
ALTER TABLE `yp5e2_reditem_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_mail_queue`
--
ALTER TABLE `yp5e2_reditem_mail_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_mail_settings`
--
ALTER TABLE `yp5e2_reditem_mail_settings`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `yp5e2_reditem_reporter_point`
--
ALTER TABLE `yp5e2_reditem_reporter_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_search_engine`
--
ALTER TABLE `yp5e2_reditem_search_engine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_templates`
--
ALTER TABLE `yp5e2_reditem_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_templates_rctranslations`
--
ALTER TABLE `yp5e2_reditem_templates_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`);

--
-- Indexes for table `yp5e2_reditem_types`
--
ALTER TABLE `yp5e2_reditem_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_types_type_a_1`
--
ALTER TABLE `yp5e2_reditem_types_type_a_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_types_type_b_2`
--
ALTER TABLE `yp5e2_reditem_types_type_b_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yp5e2_reditem_watch_xref`
--
ALTER TABLE `yp5e2_reditem_watch_xref`
  ADD PRIMARY KEY (`item_id`,`user_id`);

--
-- Indexes for table `yp5e2_schemas`
--
ALTER TABLE `yp5e2_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indexes for table `yp5e2_session`
--
ALTER TABLE `yp5e2_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `yp5e2_sh404sef_aliases`
--
ALTER TABLE `yp5e2_sh404sef_aliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newurl` (`newurl`),
  ADD KEY `alias` (`alias`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `yp5e2_sh404sef_hits_404s`
--
ALTER TABLE `yp5e2_sh404sef_hits_404s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(255)),
  ADD KEY `referrer` (`referrer`(255)),
  ADD KEY `user_agent` (`user_agent`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `yp5e2_sh404sef_hits_aliases`
--
ALTER TABLE `yp5e2_sh404sef_hits_aliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(255)),
  ADD KEY `referrer` (`referrer`(255)),
  ADD KEY `user_agent` (`user_agent`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `yp5e2_sh404sef_hits_shurls`
--
ALTER TABLE `yp5e2_sh404sef_hits_shurls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(255)),
  ADD KEY `referrer` (`referrer`(255)),
  ADD KEY `user_agent` (`user_agent`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `yp5e2_sh404sef_keystore`
--
ALTER TABLE `yp5e2_sh404sef_keystore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main` (`scope`,`key`);

--
-- Indexes for table `yp5e2_sh404sef_metas`
--
ALTER TABLE `yp5e2_sh404sef_metas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newurl` (`newurl`);

--
-- Indexes for table `yp5e2_sh404sef_pageids`
--
ALTER TABLE `yp5e2_sh404sef_pageids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newurl` (`newurl`),
  ADD KEY `alias` (`pageid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `yp5e2_sh404sef_urls`
--
ALTER TABLE `yp5e2_sh404sef_urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newurl` (`newurl`),
  ADD KEY `rank` (`rank`),
  ADD KEY `oldurl` (`oldurl`);

--
-- Indexes for table `yp5e2_sh404sef_urls_src`
--
ALTER TABLE `yp5e2_sh404sef_urls_src`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(255)),
  ADD KEY `routed_url` (`routed_url`(255)),
  ADD KEY `source_url` (`source_url`(255));

--
-- Indexes for table `yp5e2_shlib_consumers`
--
ALTER TABLE `yp5e2_shlib_consumers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_context` (`context`);

--
-- Indexes for table `yp5e2_shlib_resources`
--
ALTER TABLE `yp5e2_shlib_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_resource` (`resource`);

--
-- Indexes for table `yp5e2_tags`
--
ALTER TABLE `yp5e2_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `yp5e2_template_styles`
--
ALTER TABLE `yp5e2_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_home` (`home`);

--
-- Indexes for table `yp5e2_ucm_base`
--
ALTER TABLE `yp5e2_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indexes for table `yp5e2_ucm_content`
--
ALTER TABLE `yp5e2_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indexes for table `yp5e2_ucm_history`
--
ALTER TABLE `yp5e2_ucm_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indexes for table `yp5e2_updates`
--
ALTER TABLE `yp5e2_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `yp5e2_update_sites`
--
ALTER TABLE `yp5e2_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indexes for table `yp5e2_update_sites_extensions`
--
ALTER TABLE `yp5e2_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indexes for table `yp5e2_usergroups`
--
ALTER TABLE `yp5e2_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`);

--
-- Indexes for table `yp5e2_users`
--
ALTER TABLE `yp5e2_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `yp5e2_users_rctranslations`
--
ALTER TABLE `yp5e2_users_rctranslations`
  ADD PRIMARY KEY (`rctranslations_id`),
  ADD KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  ADD KEY `588ebf12470928d6fcbfa2ec372b23da` (`rctranslations_language`,`rctranslations_state`,`id`),
  ADD KEY `c037c3e8946eccca627ca71d8a56e4b1` (`id`);

--
-- Indexes for table `yp5e2_user_keys`
--
ALTER TABLE `yp5e2_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD UNIQUE KEY `series_2` (`series`),
  ADD UNIQUE KEY `series_3` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `yp5e2_user_notes`
--
ALTER TABLE `yp5e2_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indexes for table `yp5e2_user_profiles`
--
ALTER TABLE `yp5e2_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indexes for table `yp5e2_user_usergroup_map`
--
ALTER TABLE `yp5e2_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `yp5e2_viewlevels`
--
ALTER TABLE `yp5e2_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Indexes for table `yp5e2_wblib_keystore`
--
ALTER TABLE `yp5e2_wblib_keystore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main` (`scope`,`key`);

--
-- Indexes for table `yp5e2_wblib_messages`
--
ALTER TABLE `yp5e2_wblib_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scope` (`scope`),
  ADD KEY `type_index` (`type`,`sub_type`),
  ADD KEY `acked_on` (`acked_on`);

--
-- Indexes for table `yp5e2_wf_profiles`
--
ALTER TABLE `yp5e2_wf_profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `yp5e2_ak_profiles`
--
ALTER TABLE `yp5e2_ak_profiles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_ak_stats`
--
ALTER TABLE `yp5e2_ak_stats`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `yp5e2_assets`
--
ALTER TABLE `yp5e2_assets`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `yp5e2_banners`
--
ALTER TABLE `yp5e2_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_banners_rctranslations`
--
ALTER TABLE `yp5e2_banners_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_banner_clients`
--
ALTER TABLE `yp5e2_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_banner_clients_rctranslations`
--
ALTER TABLE `yp5e2_banner_clients_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_categories`
--
ALTER TABLE `yp5e2_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `yp5e2_categories_rctranslations`
--
ALTER TABLE `yp5e2_categories_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_contact_details`
--
ALTER TABLE `yp5e2_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_contact_details_rctranslations`
--
ALTER TABLE `yp5e2_contact_details_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_content`
--
ALTER TABLE `yp5e2_content`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_content_rctranslations`
--
ALTER TABLE `yp5e2_content_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_content_types`
--
ALTER TABLE `yp5e2_content_types`
  MODIFY `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10002;
--
-- AUTO_INCREMENT for table `yp5e2_extensions`
--
ALTER TABLE `yp5e2_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10057;
--
-- AUTO_INCREMENT for table `yp5e2_extensions_rctranslations`
--
ALTER TABLE `yp5e2_extensions_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_finder_filters`
--
ALTER TABLE `yp5e2_finder_filters`
  MODIFY `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_finder_links`
--
ALTER TABLE `yp5e2_finder_links`
  MODIFY `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_finder_taxonomy`
--
ALTER TABLE `yp5e2_finder_taxonomy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_finder_terms`
--
ALTER TABLE `yp5e2_finder_terms`
  MODIFY `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_finder_types`
--
ALTER TABLE `yp5e2_finder_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_languages`
--
ALTER TABLE `yp5e2_languages`
  MODIFY `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `yp5e2_languages_rctranslations`
--
ALTER TABLE `yp5e2_languages_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_menu`
--
ALTER TABLE `yp5e2_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `yp5e2_menu_rctranslations`
--
ALTER TABLE `yp5e2_menu_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_menu_types`
--
ALTER TABLE `yp5e2_menu_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `yp5e2_messages`
--
ALTER TABLE `yp5e2_messages`
  MODIFY `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_modules`
--
ALTER TABLE `yp5e2_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `yp5e2_modules_rctranslations`
--
ALTER TABLE `yp5e2_modules_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_newsfeeds`
--
ALTER TABLE `yp5e2_newsfeeds`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_newsfeeds_rctranslations`
--
ALTER TABLE `yp5e2_newsfeeds_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_overrider`
--
ALTER TABLE `yp5e2_overrider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `yp5e2_postinstall_messages`
--
ALTER TABLE `yp5e2_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_country`
--
ALTER TABLE `yp5e2_redcore_country`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_country_rctranslations`
--
ALTER TABLE `yp5e2_redcore_country_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_currency`
--
ALTER TABLE `yp5e2_redcore_currency`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_currency_rctranslations`
--
ALTER TABLE `yp5e2_redcore_currency_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_oauth_clients`
--
ALTER TABLE `yp5e2_redcore_oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_payments`
--
ALTER TABLE `yp5e2_redcore_payments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_payment_configuration`
--
ALTER TABLE `yp5e2_redcore_payment_configuration`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_payment_log`
--
ALTER TABLE `yp5e2_redcore_payment_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_translation_columns`
--
ALTER TABLE `yp5e2_redcore_translation_columns`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_translation_tables`
--
ALTER TABLE `yp5e2_redcore_translation_tables`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `yp5e2_redcore_webservices`
--
ALTER TABLE `yp5e2_redcore_webservices`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_redirect_links`
--
ALTER TABLE `yp5e2_redirect_links`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_categories`
--
ALTER TABLE `yp5e2_reditem_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_categories_rctranslations`
--
ALTER TABLE `yp5e2_reditem_categories_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_category_fields`
--
ALTER TABLE `yp5e2_reditem_category_fields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_comments`
--
ALTER TABLE `yp5e2_reditem_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_comment_reports`
--
ALTER TABLE `yp5e2_reditem_comment_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_fields`
--
ALTER TABLE `yp5e2_reditem_fields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_items`
--
ALTER TABLE `yp5e2_reditem_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_items_rctranslations`
--
ALTER TABLE `yp5e2_reditem_items_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_item_rating`
--
ALTER TABLE `yp5e2_reditem_item_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_item_reports`
--
ALTER TABLE `yp5e2_reditem_item_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_log_useractivity`
--
ALTER TABLE `yp5e2_reditem_log_useractivity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_mail`
--
ALTER TABLE `yp5e2_reditem_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_mail_queue`
--
ALTER TABLE `yp5e2_reditem_mail_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_reporter_point`
--
ALTER TABLE `yp5e2_reditem_reporter_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_search_engine`
--
ALTER TABLE `yp5e2_reditem_search_engine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_templates`
--
ALTER TABLE `yp5e2_reditem_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_templates_rctranslations`
--
ALTER TABLE `yp5e2_reditem_templates_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_reditem_types`
--
ALTER TABLE `yp5e2_reditem_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_aliases`
--
ALTER TABLE `yp5e2_sh404sef_aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_hits_404s`
--
ALTER TABLE `yp5e2_sh404sef_hits_404s`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_hits_aliases`
--
ALTER TABLE `yp5e2_sh404sef_hits_aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_hits_shurls`
--
ALTER TABLE `yp5e2_sh404sef_hits_shurls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_keystore`
--
ALTER TABLE `yp5e2_sh404sef_keystore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_metas`
--
ALTER TABLE `yp5e2_sh404sef_metas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_pageids`
--
ALTER TABLE `yp5e2_sh404sef_pageids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_urls`
--
ALTER TABLE `yp5e2_sh404sef_urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=261;
--
-- AUTO_INCREMENT for table `yp5e2_sh404sef_urls_src`
--
ALTER TABLE `yp5e2_sh404sef_urls_src`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_shlib_consumers`
--
ALTER TABLE `yp5e2_shlib_consumers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_shlib_resources`
--
ALTER TABLE `yp5e2_shlib_resources`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_tags`
--
ALTER TABLE `yp5e2_tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `yp5e2_template_styles`
--
ALTER TABLE `yp5e2_template_styles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `yp5e2_ucm_content`
--
ALTER TABLE `yp5e2_ucm_content`
  MODIFY `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_ucm_history`
--
ALTER TABLE `yp5e2_ucm_history`
  MODIFY `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `yp5e2_updates`
--
ALTER TABLE `yp5e2_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_update_sites`
--
ALTER TABLE `yp5e2_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `yp5e2_usergroups`
--
ALTER TABLE `yp5e2_usergroups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `yp5e2_users`
--
ALTER TABLE `yp5e2_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=639;
--
-- AUTO_INCREMENT for table `yp5e2_users_rctranslations`
--
ALTER TABLE `yp5e2_users_rctranslations`
  MODIFY `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_user_keys`
--
ALTER TABLE `yp5e2_user_keys`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_user_notes`
--
ALTER TABLE `yp5e2_user_notes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yp5e2_viewlevels`
--
ALTER TABLE `yp5e2_viewlevels`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `yp5e2_wblib_keystore`
--
ALTER TABLE `yp5e2_wblib_keystore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yp5e2_wblib_messages`
--
ALTER TABLE `yp5e2_wblib_messages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `yp5e2_wf_profiles`
--
ALTER TABLE `yp5e2_wf_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `yp5e2_banners_rctranslations`
--
ALTER TABLE `yp5e2_banners_rctranslations`
  ADD CONSTRAINT `ef452f671eef13803e541d0383fbb08d` FOREIGN KEY (`id`) REFERENCES `yp5e2_banners` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_banner_clients_rctranslations`
--
ALTER TABLE `yp5e2_banner_clients_rctranslations`
  ADD CONSTRAINT `d5f871880cbf2de8c8b8a945c01f2e56` FOREIGN KEY (`id`) REFERENCES `yp5e2_banner_clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_categories_rctranslations`
--
ALTER TABLE `yp5e2_categories_rctranslations`
  ADD CONSTRAINT `e73711c01d1111144ad4e4937c2542d7` FOREIGN KEY (`id`) REFERENCES `yp5e2_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_contact_details_rctranslations`
--
ALTER TABLE `yp5e2_contact_details_rctranslations`
  ADD CONSTRAINT `e47b20a222b419abae309150242a86d2` FOREIGN KEY (`id`) REFERENCES `yp5e2_contact_details` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_content_rctranslations`
--
ALTER TABLE `yp5e2_content_rctranslations`
  ADD CONSTRAINT `429164c1b039d18880ed64f04f0450ce` FOREIGN KEY (`id`) REFERENCES `yp5e2_content` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_extensions_rctranslations`
--
ALTER TABLE `yp5e2_extensions_rctranslations`
  ADD CONSTRAINT `8929473690726fea65dd7a37f7e4c34c` FOREIGN KEY (`extension_id`) REFERENCES `yp5e2_extensions` (`extension_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_languages_rctranslations`
--
ALTER TABLE `yp5e2_languages_rctranslations`
  ADD CONSTRAINT `bd4599ff5626495934313cd2dd2f193f` FOREIGN KEY (`lang_id`) REFERENCES `yp5e2_languages` (`lang_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_menu_rctranslations`
--
ALTER TABLE `yp5e2_menu_rctranslations`
  ADD CONSTRAINT `a83ab8d777bccef0536202809d0e9dda` FOREIGN KEY (`id`) REFERENCES `yp5e2_menu` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_modules_rctranslations`
--
ALTER TABLE `yp5e2_modules_rctranslations`
  ADD CONSTRAINT `b834c3b68c433ca31fe28b3f92b450f7` FOREIGN KEY (`id`) REFERENCES `yp5e2_modules` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_newsfeeds_rctranslations`
--
ALTER TABLE `yp5e2_newsfeeds_rctranslations`
  ADD CONSTRAINT `74e4bceb50a66d8b78ec2ce8dd0d91dc` FOREIGN KEY (`id`) REFERENCES `yp5e2_newsfeeds` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_redcore_country_rctranslations`
--
ALTER TABLE `yp5e2_redcore_country_rctranslations`
  ADD CONSTRAINT `e7cd1db7c7470719ba0c03c3229e368c` FOREIGN KEY (`id`) REFERENCES `yp5e2_redcore_country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_redcore_currency_rctranslations`
--
ALTER TABLE `yp5e2_redcore_currency_rctranslations`
  ADD CONSTRAINT `ffcfde4bda4991e67f20ddf67ff0ece7` FOREIGN KEY (`id`) REFERENCES `yp5e2_redcore_currency` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_reditem_categories_rctranslations`
--
ALTER TABLE `yp5e2_reditem_categories_rctranslations`
  ADD CONSTRAINT `6835e59a902f2d4655e520ec10894167` FOREIGN KEY (`id`) REFERENCES `yp5e2_reditem_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_reditem_items_rctranslations`
--
ALTER TABLE `yp5e2_reditem_items_rctranslations`
  ADD CONSTRAINT `91431dd235ef2df754964c0a419d41a0` FOREIGN KEY (`id`) REFERENCES `yp5e2_reditem_items` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `yp5e2_users_rctranslations`
--
ALTER TABLE `yp5e2_users_rctranslations`
  ADD CONSTRAINT `c037c3e8946eccca627ca71d8a56e4b1` FOREIGN KEY (`id`) REFERENCES `yp5e2_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
