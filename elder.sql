-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 12, 2020 at 08:00 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elder`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add accounts', 1, 'add_accounts'),
(2, 'Can change accounts', 1, 'change_accounts'),
(3, 'Can delete accounts', 1, 'delete_accounts'),
(4, 'Can view accounts', 1, 'view_accounts'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add members', 8, 'add_members'),
(30, 'Can change members', 8, 'change_members'),
(31, 'Can delete members', 8, 'delete_members'),
(32, 'Can view members', 8, 'view_members');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(1, 'main', 'accounts'),
(8, 'main', 'members'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-01-12 15:23:23.479656'),
(2, 'auth', '0001_initial', '2020-01-12 15:23:23.628072'),
(3, 'admin', '0001_initial', '2020-01-12 15:23:23.824091'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-01-12 15:23:23.865045'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-01-12 15:23:23.871091'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-01-12 15:23:23.894058'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-01-12 15:23:23.909569'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-01-12 15:23:23.968759'),
(9, 'auth', '0004_alter_user_username_opts', '2020-01-12 15:23:23.975928'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-01-12 15:23:23.988291'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-01-12 15:23:23.989286'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-01-12 15:23:23.995307'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-01-12 15:23:24.017452'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-01-12 15:23:24.042536'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-01-12 15:23:24.062230'),
(16, 'auth', '0011_update_proxy_permissions', '2020-01-12 15:23:24.069444'),
(17, 'main', '0001_initial', '2020-01-12 15:23:24.099808'),
(18, 'sessions', '0001_initial', '2020-01-12 15:23:24.125391'),
(19, 'main', '0002_auto_20200112_1529', '2020-01-12 15:29:26.208976'),
(20, 'main', '0003_members', '2020-01-12 15:44:18.582001'),
(21, 'main', '0004_members_user_id', '2020-01-12 16:57:10.004938'),
(22, 'main', '0005_members_contact', '2020-01-12 18:57:45.662409');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('dyl86gscfjzxf6rm2qqwg5jqekb8cvz9', 'ZGJmODM4M2I4MzNkNGExZjI0MDljNjE3YjI3ZGU5OTkwY2NjMzhlNzp7InVzZXJfaWQiOjF9', '2020-01-26 17:37:02.369613');

-- --------------------------------------------------------

--
-- Table structure for table `main_accounts`
--

CREATE TABLE `main_accounts` (
  `id` int(11) NOT NULL,
  `email` longtext NOT NULL,
  `password` longtext NOT NULL,
  `date_submitted` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_accounts`
--

INSERT INTO `main_accounts` (`id`, `email`, `password`, `date_submitted`) VALUES
(1, 'member1@gmail.com', 'pbkdf2_sha256$180000$generating_password$nGWnXXZpe//ajZQTfF+ozNvrNxwQZVTU3eHHz9ZL1eo=', '2020-01-12 15:29:40.000000'),
(2, 'member2@gmail.com', 'pbkdf2_sha256$180000$generating_password$nGWnXXZpe//ajZQTfF+ozNvrNxwQZVTU3eHHz9ZL1eo=', '2020-01-12 17:15:57.000000'),
(3, 'member3@gmail.com', 'pbkdf2_sha256$180000$generating_password$nGWnXXZpe//ajZQTfF+ozNvrNxwQZVTU3eHHz9ZL1eo=', '2020-01-12 17:16:18.000000'),
(4, 'member4@gmail.com', 'pbkdf2_sha256$180000$generating_password$nGWnXXZpe//ajZQTfF+ozNvrNxwQZVTU3eHHz9ZL1eo=', '2020-01-12 17:17:15.000000'),
(5, 'member5@gmail.com', 'pbkdf2_sha256$180000$generating_password$nGWnXXZpe//ajZQTfF+ozNvrNxwQZVTU3eHHz9ZL1eo=', '2020-01-12 17:18:06.000000');

-- --------------------------------------------------------

--
-- Table structure for table `main_members`
--

CREATE TABLE `main_members` (
  `id` int(11) NOT NULL,
  `fullname` longtext NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `averagescore` int(11) NOT NULL,
  `highestscore` int(11) NOT NULL,
  `location` longtext NOT NULL,
  `opponent` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_members`
--

INSERT INTO `main_members` (`id`, `fullname`, `wins`, `losses`, `averagescore`, `highestscore`, `location`, `opponent`, `date`, `user_id`, `contact`) VALUES
(26, 'Name 0', 92, 22, 11, 55, 'Location 0', 'Opponent 0', '2020-01-12 17:11:04.000000', 2, '96093909120171'),
(27, 'Name 1', 1, 41, 99, 59, 'Location 1', 'Opponent 1', '2020-01-12 17:11:04.000000', 3, '16593314285994'),
(28, 'Name 2', 100, 50, 79, 78, 'Location 2', 'Opponent 2', '2020-01-12 17:11:04.000000', 1, '8580849764752'),
(29, 'Name 3', 39, 19, 45, 14, 'Location 3', 'Opponent 3', '2020-01-12 17:11:04.000000', 1, '21093771576836'),
(30, 'Name 4', 50, 14, 21, 45, 'Location 4', 'Opponent 4', '2020-01-12 17:11:04.000000', 5, '33014225526522'),
(31, 'Name 5', 42, 80, 65, 14, 'Location 5', 'Opponent 5', '2020-01-12 17:11:04.000000', 1, '49028161085196'),
(32, 'Name 6', 77, 23, 42, 79, 'Location 6', 'Opponent 6', '2020-01-12 17:11:04.000000', 1, '90325440858074'),
(33, 'Name 7', 83, 30, 42, 92, 'Location 7', 'Opponent 7', '2020-01-12 17:11:04.000000', 4, '64912670632359'),
(34, 'Name 8', 31, 37, 6, 73, 'Location 8', 'Opponent 8', '2020-01-12 17:11:04.000000', 1, '87232020395831'),
(35, 'Name 9', 74, 22, 88, 29, 'Location 9', 'Opponent 9', '2020-01-12 17:11:04.000000', 1, '43345023032433'),
(36, 'Name 10', 57, 78, 30, 41, 'Location 10', 'Opponent 10', '2020-01-12 17:11:04.000000', 1, '56868608193131'),
(37, 'Name 11', 94, 50, 24, 20, 'Location 11', 'Opponent 11', '2020-01-12 17:11:04.000000', 3, '21350184263063'),
(38, 'Name 12', 28, 59, 45, 68, 'Location 12', 'Opponent 12', '2020-01-12 17:11:04.000000', 4, '21385532263424'),
(39, 'Name 13', 91, 85, 43, 33, 'Location 13', 'Opponent 13', '2020-01-12 17:11:04.000000', 3, '50384117386384'),
(40, 'Name 14', 83, 48, 84, 13, 'Location 14', 'Opponent 14', '2020-01-12 17:11:04.000000', 1, '52099705544224'),
(41, 'Name 15', 14, 47, 41, 15, 'Location 15', 'Opponent 15', '2020-01-12 17:11:04.000000', 5, '18285774515372'),
(42, 'Name 16', 88, 9, 29, 17, 'Location 16', 'Opponent 16', '2020-01-12 17:11:04.000000', 4, '80458113805608'),
(43, 'Name 17', 59, 41, 4, 96, 'Location 17', 'Opponent 17', '2020-01-12 17:11:04.000000', 2, '19131737036976'),
(44, 'Name 18', 98, 67, 1, 95, 'Location 18', 'Opponent 18', '2020-01-12 17:11:04.000000', 1, '32243576723867'),
(45, 'Name 19', 57, 30, 67, 57, 'Location 19', 'Opponent 19', '2020-01-12 17:11:04.000000', 1, '77470662209865'),
(46, 'Name 20', 29, 77, 68, 86, 'Location 20', 'Opponent 20', '2020-01-12 17:11:04.000000', 1, '78534466136601'),
(47, 'Name 21', 80, 92, 50, 64, 'Location 21', 'Opponent 21', '2020-01-12 17:11:04.000000', 1, '14393371472708'),
(48, 'Name 22', 61, 70, 67, 63, 'Location 22', 'Opponent 22', '2020-01-12 17:11:04.000000', 1, '61905617689976'),
(49, 'Name 23', 8, 62, 85, 94, 'Location 23', 'Opponent 23', '2020-01-12 17:11:04.000000', 1, '52752391893444'),
(50, 'Name 24', 19, 91, 7, 72, 'Location 24', 'Opponent 24', '2020-01-12 17:11:04.000000', 4, '90499122451067'),
(51, 'Name 25', 3, 6, 89, 94, 'Location 25', 'Opponent 25', '2020-01-12 17:11:04.000000', 4, '1535546020047'),
(52, 'Name 26', 15, 16, 26, 15, 'Location 26', 'Opponent 26', '2020-01-12 17:11:04.000000', 3, '26010425579000'),
(53, 'Name 27', 55, 100, 16, 32, 'Location 27', 'Opponent 27', '2020-01-12 17:11:04.000000', 2, '40789832870757'),
(54, 'Name 28', 17, 52, 62, 0, 'Location 28', 'Opponent 28', '2020-01-12 17:11:04.000000', 1, '34246223525033'),
(55, 'Name 29', 83, 79, 93, 24, 'Location 29', 'Opponent 29', '2020-01-12 17:11:04.000000', 2, '69811229827511'),
(56, 'Name 30', 2, 28, 50, 69, 'Location 30', 'Opponent 30', '2020-01-12 17:11:04.000000', 3, '78279448773681'),
(57, 'Name 31', 95, 31, 38, 37, 'Location 31', 'Opponent 31', '2020-01-12 17:11:04.000000', 1, '46198994296272'),
(58, 'Name 32', 44, 12, 11, 66, 'Location 32', 'Opponent 32', '2020-01-12 17:11:04.000000', 5, '29583664109340'),
(59, 'Name 33', 12, 8, 60, 79, 'Location 33', 'Opponent 33', '2020-01-12 17:11:04.000000', 2, '72632119261303'),
(60, 'Name 34', 18, 59, 13, 50, 'Location 34', 'Opponent 34', '2020-01-12 17:11:04.000000', 4, '90046377723606'),
(61, 'Name 35', 67, 89, 73, 29, 'Location 35', 'Opponent 35', '2020-01-12 17:11:04.000000', 4, '23062311287132'),
(62, 'Name 36', 4, 69, 87, 9, 'Location 36', 'Opponent 36', '2020-01-12 17:11:04.000000', 2, '64293914511982'),
(63, 'Name 37', 19, 30, 7, 29, 'Location 37', 'Opponent 37', '2020-01-12 17:11:04.000000', 1, '85396280092120'),
(64, 'Name 38', 69, 45, 68, 6, 'Location 38', 'Opponent 38', '2020-01-12 17:11:04.000000', 2, '48954419037486'),
(65, 'Name 39', 16, 63, 17, 1, 'Location 39', 'Opponent 39', '2020-01-12 17:11:04.000000', 2, '12222909491214'),
(66, 'Name 40', 95, 5, 89, 70, 'Location 40', 'Opponent 40', '2020-01-12 17:11:04.000000', 4, '70521867637905'),
(67, 'Name 41', 100, 1, 58, 99, 'Location 41', 'Opponent 41', '2020-01-12 17:11:04.000000', 5, '81709883664343'),
(68, 'Name 42', 8, 62, 59, 68, 'Location 42', 'Opponent 42', '2020-01-12 17:11:04.000000', 1, '54530253997040'),
(69, 'Name 43', 54, 63, 65, 91, 'Location 43', 'Opponent 43', '2020-01-12 17:11:04.000000', 2, '31445245931573'),
(70, 'Name 44', 13, 31, 51, 77, 'Location 44', 'Opponent 44', '2020-01-12 17:11:04.000000', 4, '5091629423544'),
(71, 'Name 45', 22, 96, 27, 40, 'Location 45', 'Opponent 45', '2020-01-12 17:11:04.000000', 3, '40823648218160'),
(72, 'Name 46', 51, 16, 30, 79, 'Location 46', 'Opponent 46', '2020-01-12 17:11:04.000000', 1, '93710834362172'),
(73, 'Name 47', 26, 8, 32, 68, 'Location 47', 'Opponent 47', '2020-01-12 17:11:04.000000', 3, '90869386697696'),
(74, 'Name 48', 25, 52, 30, 73, 'Location 48', 'Opponent 48', '2020-01-12 17:11:04.000000', 3, '82785151869906'),
(75, 'Name 49', 14, 64, 19, 36, 'Location 49', 'Opponent 49', '2020-01-12 17:11:04.000000', 5, '83531741952587');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_accounts`
--
ALTER TABLE `main_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_members`
--
ALTER TABLE `main_members`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `main_accounts`
--
ALTER TABLE `main_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `main_members`
--
ALTER TABLE `main_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
