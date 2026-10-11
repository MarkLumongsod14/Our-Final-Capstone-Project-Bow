-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2026 at 06:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cesh_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) DEFAULT NULL,
  `patient_name` varchar(200) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General',
  `doctor_id` int(11) DEFAULT NULL,
  `status` enum('Pending','Confirmed','In Progress','Completed','Cancelled') DEFAULT 'Pending',
  `contact` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `doctor_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_mrn`, `patient_name`, `patient_id`, `date`, `time`, `provider`, `type`, `department`, `doctor_id`, `status`, `contact`, `notes`, `created_at`, `updated_at`, `completed_at`, `start_time`, `end_time`, `doctor_notes`) VALUES
(22, 1008, NULL, NULL, '2026-06-11', '13:14:00', 'Dr. Anna Cruz', 'Initial Consultation', 'General', NULL, 'Completed', '', '', '2026-06-09 17:14:29', '2026-06-10 01:14:35', '2026-06-10 01:14:35', NULL, NULL, NULL),
(23, 1018, NULL, NULL, '2026-06-10', '13:22:00', 'Dr. Robert Lim', 'Initial Consultation', 'General', NULL, 'Completed', '', '', '2026-06-09 17:22:04', '2026-06-10 08:46:31', '2026-06-10 08:46:31', NULL, NULL, NULL),
(24, 1010, NULL, NULL, '2026-06-12', '15:24:00', 'Dr. Maria Reyes', 'Follow-up', 'General', NULL, 'Pending', '', '', '2026-06-09 17:24:24', NULL, NULL, NULL, NULL, NULL),
(25, 1018, NULL, NULL, '2026-06-13', '09:00:00', 'Dr. Anna Cruz', 'Follow-up', 'General', NULL, 'Completed', NULL, '', '2026-06-10 00:59:28', '2026-06-10 09:00:01', NULL, NULL, NULL, NULL),
(26, 1018, NULL, NULL, '2026-06-15', '12:00:00', 'Dr. Anna Cruz', 'Follow-up', 'General', NULL, 'Pending', '', '', '2026-06-10 03:28:00', NULL, NULL, NULL, NULL, NULL),
(27, 1018, NULL, NULL, '2026-08-12', '02:56:00', 'Dr. Anna Cruz', 'Initial Consultation', 'General', NULL, 'Confirmed', '', '', '2026-07-28 18:56:56', NULL, NULL, NULL, NULL, NULL),
(28, 1028, NULL, NULL, '2026-08-26', '12:12:00', 'Dr. Anna Cruz', 'Initial Consultation', 'General', NULL, 'Confirmed', '', '', '2026-08-18 04:18:50', NULL, NULL, NULL, NULL, NULL),
(31, 1031, NULL, NULL, '2026-09-05', '14:52:00', 'Dr. Maria Reyes', 'Emergency', 'General', NULL, 'Pending', '', 'balik baya dong ha ', '2026-08-23 01:52:22', NULL, NULL, NULL, NULL, NULL),
(32, 1032, NULL, NULL, '2026-08-26', '14:30:00', 'System Administrator', 'Follow-up', 'General', NULL, 'Pending', '', 'eat your dog food', '2026-08-23 15:27:48', NULL, NULL, NULL, NULL, NULL),
(33, 1035, NULL, NULL, '2026-10-10', '00:14:00', '', 'Initial Consultation', 'General', NULL, 'Cancelled', '', 'balik dri ha pag ubohon ka ', '2026-10-08 10:14:03', '2026-10-08 22:50:25', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_email_log`
--

CREATE TABLE `appointment_email_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `email_type` varchar(50) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `sent_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_email_log`
--

INSERT INTO `appointment_email_log` (`id`, `appointment_id`, `email_type`, `recipient_email`, `sent_at`) VALUES
(1, 30, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-08-23 09:49:07'),
(2, 31, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-08-23 09:52:24'),
(3, 32, 'confirmation', 'iamzesarjen@gmail.com', '2026-08-23 23:27:50'),
(4, 33, 'confirmation', 'iamzesarjen@gmail.com', '2026-10-08 18:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `diagnosis_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule`
--

CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `department` varchar(50) DEFAULT 'General',
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedule`
--

INSERT INTO `doctor_schedule` (`id`, `doctor_id`, `schedule_date`, `start_time`, `end_time`, `department`, `is_available`, `created_at`) VALUES
(1, 3, '2026-06-10', '08:00:00', '17:00:00', 'Pediatrics', 1, '2026-06-09 16:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedules`
--

CREATE TABLE `doctor_schedules` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `uploaded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `patient_mrn`, `file_name`, `type`, `uploaded`) VALUES
(1, 1000, 'uploads/1779088046_GradecardReport.pdf', 'application/pdf', '2026-05-18'),
(3, 1028, 'uploads/1787026946_RobloxScreenShot20250106_232614837.png', 'image/png', '2026-08-18'),
(4, 1038, 'uploads/1791469991_appointment_report_2026_10_08.csv', 'text/csv', '2026-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `family_history`
--

CREATE TABLE `family_history` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE `immunizations` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `vaccine` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `status` enum('Success','Failed') NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attempted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `user_id`, `username`, `full_name`, `ip_address`, `status`, `reason`, `attempted_at`) VALUES
(1, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 00:47:17'),
(2, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 00:47:43'),
(3, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-24 00:47:59'),
(4, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-24 00:58:51'),
(5, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 01:00:53'),
(6, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-24 01:01:16'),
(7, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 01:20:07'),
(8, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-24 01:21:07'),
(9, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 01:23:05'),
(10, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-24 01:26:03'),
(11, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 01:39:27'),
(12, 1, 'admin', 'System Administrator', '::1', 'Failed', 'Invalid authenticator code', '2026-08-25 04:49:08'),
(13, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 04:49:13'),
(14, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-25 04:49:32'),
(15, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-25 04:50:45'),
(16, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-08-25 04:52:56'),
(17, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 04:53:13'),
(18, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 04:54:17'),
(19, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-25 05:02:22'),
(20, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-25 05:15:41'),
(21, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-25 05:16:08'),
(22, 10, 'dr.mark', 'Dr. Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-08-25 05:25:38'),
(23, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 05:38:09'),
(24, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-09-30 18:28:31'),
(25, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-09-30 18:28:57'),
(26, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-09-30 18:31:37'),
(27, NULL, 'fd.general', NULL, '::1', 'Failed', 'Invalid username or password', '2026-09-30 18:32:57'),
(28, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-09-30 18:33:08'),
(29, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-09-30 18:43:26'),
(30, 1, 'admin', 'System Administrator', '::1', 'Failed', 'Invalid authenticator code', '2026-10-02 16:42:08'),
(31, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-02 16:42:12'),
(32, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 17:40:10'),
(33, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 17:40:55'),
(34, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 18:09:56'),
(35, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 18:13:26'),
(36, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 20:06:34'),
(37, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 20:17:26'),
(38, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 20:59:10'),
(39, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 20:59:33'),
(40, NULL, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Failed', 'Account is inactive', '2026-10-08 20:59:54'),
(41, 1, 'admin', 'System Administrator', '::1', 'Failed', 'Invalid authenticator code', '2026-10-08 21:01:44'),
(42, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 21:03:35'),
(43, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:07:02'),
(44, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 21:07:33'),
(45, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:08:30'),
(46, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:09:37'),
(47, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 21:09:46'),
(48, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 21:10:03'),
(49, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:10:20'),
(50, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:10:28'),
(56, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:13:36'),
(57, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:13:48'),
(68, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:15:10'),
(69, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 21:15:28'),
(70, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:18:55'),
(71, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 22:22:19'),
(72, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 22:51:16'),
(73, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 23:00:00'),
(74, 4, 'dr.obgyn', 'Dr. Anna Cruz', '::1', 'Success', 'Login successful', '2026-10-08 23:23:37'),
(75, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 23:39:39'),
(76, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 23:43:43'),
(77, NULL, 'admin', NULL, '::1', 'Failed', 'Incorrect security check', '2026-10-11 20:21:46'),
(78, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-11 20:22:06'),
(79, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-11 21:11:35'),
(80, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-11 21:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `medications` text DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`id`, `patient_mrn`, `diagnosis`, `medications`, `allergies`, `notes`, `created_at`) VALUES
(1, 1002, 'none', 'none', 'none', 'none\r\n\r\n', '2026-06-03 16:11:02'),
(2, 1028, 'ya', 'ya', 'ya', 'ya', '2026-08-18 04:22:02'),
(3, 1032, 'high blood', 'cholesterol', 'kagid', 'okay ra\r\n', '2026-08-24 21:38:58'),
(4, 1032, 'tambok', 'sa ', 'li', 'og', '2026-08-24 21:39:22'),
(5, 1029, 'dengue', 'paracetamol', 'kagid', 'sa liog', '2026-08-24 21:42:45'),
(6, 1033, 'dog', 'dog', 'dog', 'dog', '2026-10-08 12:36:03');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `mrn` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `primary_physician` varchar(100) DEFAULT NULL,
  `status` enum('Active','Archived') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `serial_no` varchar(50) DEFAULT NULL,
  `patient_type` varchar(20) DEFAULT NULL,
  `military_rank` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`mrn`, `first_name`, `middle_name`, `last_name`, `suffix`, `dob`, `gender`, `contact`, `email`, `address`, `primary_physician`, `status`, `created_at`, `serial_no`, `patient_type`, `military_rank`) VALUES
(1000, 'mark adrian', NULL, 'lumongsod', NULL, '2026-05-04', 'Male', '045405045', NULL, '10 Zone', 'me', 'Active', '2026-05-18 06:44:40', NULL, NULL, NULL),
(1002, 'mickey', NULL, 'mouse', NULL, '2026-05-06', 'Female', '09485609458', NULL, 'address', 'dr murphy', 'Active', '2026-05-31 14:30:10', NULL, NULL, NULL),
(1003, 'minnie', NULL, 'mouse', NULL, '2026-05-15', 'Female', '', NULL, '', '', 'Active', '2026-05-31 14:45:36', NULL, NULL, NULL),
(1004, 'donald', NULL, 'duck', NULL, '2026-05-10', 'Male', '0950495049', NULL, 'address', 'minnie', 'Active', '2026-05-31 15:10:17', NULL, NULL, NULL),
(1005, 'bato', NULL, 'rock', NULL, '2004-12-14', 'Male', '987787547', NULL, 'ZONE 6 GUMAMELA', 'dr murphy', 'Active', '2026-05-31 15:12:34', NULL, NULL, NULL),
(1006, 'john', NULL, 'smith', NULL, '2026-06-01', 'Male', '09954986549', NULL, 'carmen', 'mark', 'Active', '2026-06-01 03:48:31', NULL, NULL, NULL),
(1007, 'randy', NULL, 'santiago', NULL, '2026-06-02', 'Male', '09954986549', NULL, '10 Zone', 'me', 'Active', '2026-06-03 14:16:32', NULL, NULL, NULL),
(1008, 'indayyyy', '', 'bejona', '', '2026-06-01', 'Male', '09954986549', NULL, '10 Zone', 'mme', 'Active', '2026-06-03 14:34:19', NULL, NULL, NULL),
(1009, 'donald', NULL, 'trump', NULL, '2026-06-03', 'Male', '9084309583', NULL, 'zone 10', '', 'Active', '2026-06-03 15:28:17', NULL, NULL, NULL),
(1010, 'Zesar', 'Jen', 'Bejona', 'II', '2026-06-02', 'Male', '09589856956', NULL, 'sdfslkdfj', '', 'Archived', '2026-06-03 15:47:13', NULL, NULL, NULL),
(1012, 'Zesarjennn', 'Balane', 'Bejona', '', '2026-06-02', 'Female', '09349948395', NULL, '10 Zone', '', 'Active', '2026-06-03 15:52:05', NULL, NULL, NULL),
(1014, 'Zesarjen', 'Balane', 'Bejona', '', '2026-06-04', 'Female', '09873498348', NULL, 'zone 10', '', 'Active', '2026-06-03 16:08:59', NULL, NULL, NULL),
(1015, 'Zesarjennnnn', 'Balane', 'Bejona', '', '2026-06-04', 'Female', '09954986549', NULL, '10 Zone', '', 'Active', '2026-06-03 16:10:05', NULL, NULL, NULL),
(1016, 'Jenefer', 'Balane', 'Bejona', '', '2026-06-07', 'Female', '09450940544', NULL, 'zone 10 orange st', 'n/a', 'Active', '2026-06-07 14:38:36', NULL, NULL, NULL),
(1017, 'Daisy', '', 'Duck', '', '2026-06-03', 'Female', '09888888888', NULL, 'kmkmk', '', 'Active', '2026-06-07 17:45:51', NULL, NULL, NULL),
(1018, 'Cesario', 'Ambrad', 'Bejona', '', '1983-11-01', 'Male', '09121231234', NULL, 'Saudi Arabia', 'inday', 'Active', '2026-06-09 15:25:16', NULL, NULL, NULL),
(1019, 'chudney', 'jamil', 'rairai', '', '2026-06-01', 'Male', '09954986549', NULL, 'carmen', 'mamark', 'Active', '2026-06-10 06:29:23', NULL, NULL, NULL),
(1020, 'Test', '', 'Military', '', '2026-03-09', 'Male', '09954986549', NULL, 'test', 'test', 'Active', '2026-06-15 21:01:56', NULL, NULL, NULL),
(1021, 'Test', '', 'Military2', '', '2026-02-10', 'Male', '09954986549', NULL, 'test', 'test', 'Active', '2026-06-15 21:02:30', NULL, NULL, NULL),
(1022, 'RegPatient', '', 'Tester', '', '2023-06-16', 'Male', '09999999999', NULL, '10 Zone', 'twest', 'Active', '2026-06-15 22:08:28', NULL, NULL, NULL),
(1023, 'testingg', '', 'latest', '', '2026-04-08', 'Male', '09999999999', NULL, 'carmen', 'test\\', 'Active', '2026-06-15 22:34:59', NULL, NULL, NULL),
(1024, 'testing', '', 'updated', '', '2026-06-03', 'Male', '09900000000', NULL, 'carmen', 'test', 'Active', '2026-06-15 22:36:39', NULL, NULL, NULL),
(1025, 'Alexis', 'Viador', 'Larosa', '', '2026-06-02', 'Male', '09963434343', NULL, 'carmen', 'dr smith', 'Active', '2026-06-16 00:16:11', NULL, NULL, NULL),
(1026, 'Riel Jun', '', 'Cainglet', '', '2026-06-03', 'Other', '09353535355', NULL, 'carmen', 'dr smith', 'Active', '2026-06-16 00:19:01', NULL, NULL, NULL),
(1027, 'Raciel', 'To', 'Naive', '', '2026-06-02', 'Female', '09999999999', NULL, 'carmen', 'test', 'Active', '2026-06-16 03:30:32', NULL, NULL, NULL),
(1028, 'dadadadada', 'dadada', 'dadada', 'Jr.', '2026-07-29', 'Male', '09954986549', NULL, 'dadada', 'dr estroga', 'Active', '2026-08-18 04:15:09', NULL, NULL, NULL),
(1029, 'lolo', 'as', 'asyong', '', '2026-07-26', 'Male', '09954986549', NULL, 'dadada', 'dr estroga', 'Active', '2026-08-18 06:43:01', NULL, NULL, NULL),
(1030, 'kharamia', 'b', 'lumongsod', '', '2004-12-12', 'Male', '09954986548', NULL, 'carmen', 'carmen', 'Active', '2026-08-23 01:39:59', NULL, NULL, NULL),
(1031, 'kramkram', 'pader', 'Lumongsod', 'Jr.', '2026-07-26', 'Male', '09954986549', 'mark.adrian.lumongsod@gmail.com', 'Cagayan de Oro City, Philippines', 'dr quack', 'Active', '2026-08-23 01:42:23', NULL, NULL, NULL),
(1032, 'shin', 'shin', 'shin', '', '2026-07-27', 'Female', '09954986549', 'iamzesarjen@gmail.com', 'dadada', 'mamark gwapo', 'Active', '2026-08-23 15:26:58', NULL, NULL, NULL),
(1033, 'rochie', 'the', 'dog', '', '2005-12-12', 'Male', '09954986549', '', 'dadada', 'dr quack', 'Active', '2026-08-24 17:40:00', NULL, NULL, NULL),
(1034, 'yuki', 'yuki', 'yuki', '', '2005-12-12', 'Female', '09954986549', '', 'dadada', '', 'Active', '2026-10-02 08:42:51', NULL, NULL, NULL),
(1035, 'dymwel', 'b', 'bejuna', '', '2005-12-12', 'Other', '09954986549', 'iamzesarjen@gmail.com', 'dadada', 'nurse dodong', 'Active', '2026-10-08 10:06:09', NULL, NULL, NULL),
(1037, 'zesar jen', 'balane', 'bejona-lumongsod', '', '2026-09-27', 'Female', '09954986549', '', 'dadada', 'nurse dodong', 'Active', '2026-10-08 12:33:28', NULL, NULL, NULL),
(1038, 'roblox', 'minecraft', 'assaultfire', 'Jr.', '2026-06-11', 'Female', '09954986549', '', 'Cagayan de Oro City, Philippines', 'nurse dodong', 'Active', '2026-10-08 14:30:57', NULL, NULL, NULL),
(1040, 'testinq', 'testing', 'testingg', '', '2026-10-06', 'Male', '09954986549', '', 'dadada', 'dr mercado', 'Active', '2026-10-11 12:32:27', '123123123', 'Military', 'Master Sergeant'),
(1041, 'kramkram', 'gani', 'pagsure', '', '2026-10-01', 'Male', '09954986549', '', 'dadada', 'admin', 'Active', '2026-10-11 13:22:14', '123123123', 'Military', 'Second Lieutenant'),
(1042, 'Zisar Jin', 'Balane', 'Bejona', '', '2026-06-15', 'Female', '09954986549', 'iamzesarjen@gmail.com', 'dadada', 'nurse dodong', 'Active', '2026-10-11 15:30:01', '0912334', 'Dependent', ''),
(1043, 'sinsin', 'bihona', 'bakla', '', '2026-10-04', 'Other', '09954986549', '', 'dadada', 'dr estroga', 'Active', '2026-10-11 15:45:17', '123123123', 'Dependent', '');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `queue_number` int(11) NOT NULL,
  `priority` enum('Normal','Senior','PWD','Emergency') DEFAULT 'Normal',
  `status` enum('Waiting','In Consultation','Completed','Cancelled','No Show') DEFAULT 'Waiting',
  `doctor_id` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General',
  `called_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `appointment_id` int(11) DEFAULT NULL,
  `is_from_appointment` tinyint(1) DEFAULT 0,
  `tracking_token` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`id`, `patient_mrn`, `queue_number`, `priority`, `status`, `doctor_id`, `department`, `called_at`, `started_at`, `completed_at`, `created_at`, `appointment_id`, `is_from_appointment`, `tracking_token`) VALUES
(2, 1000, 2, 'Normal', 'Cancelled', 4, 'General', NULL, NULL, NULL, '2026-05-31 13:36:06', NULL, 0, 'f60384a42e24c72abe1406b91940aeb886c31784ab3d6d381106d3e3a2eda8bd'),
(5, 1000, 5, 'Normal', 'Completed', 2, 'General', '2026-05-31 21:48:27', NULL, '2026-05-31 21:48:33', '2026-05-31 13:47:58', NULL, 0, 'ca95bedc7ecab4c448177818d45fa7673d6674771a9a5d53f70e0c2a527405b5'),
(7, 1000, 7, 'Normal', 'Completed', 2, 'General', '2026-05-31 23:34:09', NULL, '2026-05-31 23:34:29', '2026-05-31 13:57:56', NULL, 0, 'f74ee0c7b00018404f392f524b1805204faf1ffa7765c11ac22c4cd7731b7602'),
(8, 1002, 8, 'Normal', 'Completed', 2, 'General', '2026-05-31 23:34:15', NULL, '2026-05-31 23:34:27', '2026-05-31 14:44:39', NULL, 0, 'fa0f1f01c4be10dfd7c48a56468452b967656a1ee9551b6dc9a49262ebcb753e'),
(9, 1003, 9, 'Normal', 'Completed', 2, 'General', '2026-05-31 23:34:18', NULL, '2026-05-31 23:34:23', '2026-05-31 14:46:02', NULL, 0, '325488f03af8bd6f1c9ad907c26f520acf9b3cc813fb4ebc5fb510f031a5a1b3'),
(10, 1005, 10, 'PWD', 'Completed', 2, 'General', '2026-05-31 23:13:55', NULL, '2026-05-31 23:14:33', '2026-05-31 15:13:09', NULL, 0, '2f1f79e9010047c6f5bf541b8ca57e538b31e843eef6a89275d4f3501a864108'),
(11, 1006, 1, 'Normal', 'Completed', 2, 'General', '2026-06-01 11:51:57', NULL, '2026-06-01 11:56:07', '2026-06-01 03:51:19', NULL, 0, 'deaaff670e90411ee10326bd4d81ba4638b3c41de719b6f1a8a73f51b4d30cf7'),
(12, 1000, 2, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:54:57', NULL, '2026-06-04 00:55:18', '2026-06-01 03:53:24', NULL, 0, '3c4abafccf6a56d4dbf751ad5a3669dd2d8521eb9a22a38e4a88b51f4c5d1826'),
(14, 1007, 1, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:54:40', NULL, '2026-06-04 00:54:54', '2026-06-03 14:33:09', NULL, 0, '5e673bfbc623d910a561f1cb4d363077d52304edb664beded78a02fcbb1e6749'),
(15, 1006, 2, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:55:08', NULL, '2026-06-04 00:55:14', '2026-06-03 14:33:18', NULL, 0, 'e930e817e25ef77c88afe3dfdfa7a45e7694176129bfc2859905dec86d213eed'),
(16, 1005, 3, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:55:20', NULL, '2026-06-04 00:55:27', '2026-06-03 14:33:23', NULL, 0, '36db31a54645d7e4a003ea36efa85008d5739c5d4df7b7a93585aad17a4c5aa8'),
(17, 1004, 4, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:55:29', NULL, '2026-06-04 00:55:39', '2026-06-03 14:33:28', NULL, 0, 'b6bfc0fc7307f2f6c9dd9a8787401ec1ca7b923c89dd33f9603a4360f9193ca9'),
(18, 1003, 5, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:55:46', NULL, '2026-06-04 00:56:11', '2026-06-03 14:33:35', NULL, 0, 'df326bd3069f6a1b9a251791c7ea7c3f19495444cbcbfa9b4084e011334bb7c9'),
(19, 1002, 6, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:55:50', NULL, '2026-06-04 00:56:08', '2026-06-03 14:33:39', NULL, 0, '72e1b1f5a2f00f59d679efb36d00cfacc90f87c99a86a19e0eceffb48d0c8a22'),
(20, 1012, 7, 'Normal', 'Completed', 2, 'General', '2026-06-04 00:55:56', NULL, '2026-06-04 00:56:04', '2026-06-03 15:52:18', NULL, 0, '10636e70b0dfd0e3c1b280565369c46dc4db55560c6b4f17507768ffbc7337d4'),
(21, 1000, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 16:45:57', NULL, 0, '05b635e6f36ee1d479d9cae0add9435d3410f7315e6da36b7d3d8fa3e18c7a1b'),
(22, 1002, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 16:46:06', NULL, 0, 'd75b4bb7266e0443d0eded9ea5e3766824efc1acad8c5c534f138d08f2e96e2a'),
(23, 1003, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 16:48:22', NULL, 0, '5bceb22f7a2212451b198c2fb3947a3492c2cf9aca341df7fda0d5efe32fec7f'),
(24, 1000, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:00:25', NULL, 0, '3e76c6edf810a5ccf577911073a72ebeec81e3c0af3d646039602934257775a2'),
(25, 1003, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:00:33', NULL, 0, '6a6fe72471d75ae5a2b530bb9f4a4964baa06dff6e6d238169672d1415b6ce45'),
(26, 1016, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:04:47', NULL, 0, '4dddd8a9acb568bb10a5963f9678d9993489d8ff0e384d0b819ebb8b8f3c4b9b'),
(28, 1014, 1, 'Senior', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:07:49', NULL, 0, '663f16ce36ddde6c4e3cd369ab2e4be953a06a7d1cd5b95f4ec510498c87a80c'),
(29, 1010, 1, 'PWD', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:08:00', NULL, 0, '0e5d9fa62ac2cb1cd6ec4d07f02bac3b44fb8f98f34aab6c8470c7bf1d75d52d'),
(30, 1002, 1, 'Normal', 'Completed', 3, 'Pediatrics', '2026-06-08 01:19:06', NULL, '2026-06-08 01:19:19', '2026-06-07 17:09:04', NULL, 0, 'ef3c91af06d17ecd88f7713ea8e6146891b2c35c9e5a881a4c736c242903fd02'),
(32, 1000, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:12:50', NULL, 0, 'be8d442ebfd8220289066b3730e9b2377d6b2b5ff52918afa2605303f2640654'),
(33, 1003, 1, 'Normal', 'Cancelled', NULL, 'General', NULL, NULL, NULL, '2026-06-07 17:12:57', NULL, 0, 'a028393e81e2e6c71ea8caaaa68c0f193d8a53347368c4fa433aacb0cbf59d2e'),
(34, 1000, 1, 'Normal', 'Completed', 2, 'General', '2026-06-08 01:18:22', NULL, '2026-06-08 01:18:35', '2026-06-07 17:17:43', NULL, 0, 'd2f6be70f0cb6673d4291e3d573502ae722a58b6f2dad4a7a4e628741d75eca0'),
(35, 1014, 2, 'Normal', 'Completed', 2, 'General', '2026-06-08 01:18:40', NULL, '2026-06-08 01:18:48', '2026-06-07 17:18:04', NULL, 0, '0d063fc05b2fe3fc12511bce30c3603f240402de7675cc3b677f66cea80f91a8'),
(36, 1016, 3, 'Normal', 'Completed', 2, 'General', '2026-06-08 01:41:11', NULL, '2026-06-08 01:42:34', '2026-06-07 17:25:31', NULL, 0, '7aba14bad9c928b4a507ee660b415cc5ebafa1d89a45c6b59272d4b6e2635530'),
(37, 1015, 4, 'Normal', 'Completed', 2, 'General', '2026-06-08 01:42:36', NULL, '2026-06-08 01:42:38', '2026-06-07 17:25:39', NULL, 0, 'afbdd95334a77e8679e1e38219a9d0ae9a5d8fb9e80dc382aca524c0c9faca4f'),
(38, 1000, 1, 'Normal', 'Completed', 3, 'Pediatrics', '2026-06-09 23:27:38', NULL, '2026-06-09 23:28:20', '2026-06-07 17:26:00', NULL, 0, '6244afbd7ce1c695a60c8d96c136c4eee6fabf429984dfca01741034c295c05b'),
(39, 1002, 2, 'Normal', 'Completed', 3, 'Pediatrics', '2026-06-09 23:28:02', NULL, '2026-06-09 23:28:29', '2026-06-07 17:26:14', NULL, 0, '53bd013c583dda3cc6da80fa911429dc51952268ef9fb3f4a1121089d571a09a'),
(41, 1014, 1, 'Normal', 'Cancelled', NULL, 'OB-Gyne', NULL, NULL, NULL, '2026-06-07 17:30:14', NULL, 0, '1702509638736cb2bdae780108a65b28bd191ce9657e5c56328de1a76c8b9013'),
(42, 1003, 5, 'Normal', 'Completed', 2, 'General', '2026-06-08 01:42:39', NULL, '2026-06-08 01:42:43', '2026-06-07 17:37:23', NULL, 0, '5426c681a95071eb8204e52b6a363547e1bd01a0e633dfa3646ac6ddcd76dd23'),
(43, 1004, 4, 'Normal', 'Completed', 3, 'Pediatrics', '2026-06-09 23:28:08', NULL, '2026-06-09 23:28:36', '2026-06-07 17:37:51', NULL, 0, 'aa931bda9ee4575aef5758b0d2109c4fd7b89c89d04981ffd6210685f820580b'),
(44, 1018, 5, 'Normal', 'Completed', 3, 'Pediatrics', '2026-06-09 23:28:13', NULL, '2026-06-09 23:28:41', '2026-06-09 15:25:40', NULL, 0, '8a37af8f46a50a182a3adda7b386b499c1889f87d1cfde86dff28b6a08135f30'),
(45, 1018, 6, 'Normal', 'Completed', 2, 'General', '2026-06-10 00:20:57', NULL, '2026-06-10 00:20:59', '2026-06-09 15:51:12', NULL, 0, '8ebaa79f8a5bc1b4f8c7733e94726d11ad965cd0908ae7862dfede75dcbe8996'),
(46, 1008, 1, 'Normal', 'Waiting', 1, '0', NULL, NULL, NULL, '2026-06-09 16:32:04', 13, 1, '61b14869b2a1f5f721b08dcad4a5ba89b0678a0825f3d0f652fbf9b26f61453e'),
(47, 1018, 2, 'Normal', 'Waiting', 1, '0', NULL, NULL, NULL, '2026-06-09 16:32:10', 12, 1, '54cf5f6351fd01aadb9fc307e714c727b3a790ec0ffaa47711506fdf92a928a1'),
(48, 1008, 3, 'Normal', 'Waiting', 1, '0', NULL, NULL, NULL, '2026-06-09 16:35:24', 15, 1, '8d8fd925168f327c642509635d94c44669148e55c9eb38e7cd3240d729a93963'),
(49, 1017, 1, 'Normal', 'Completed', 5, 'Internal Medicine', '2026-06-10 01:12:20', NULL, '2026-06-10 01:12:26', '2026-06-09 17:11:58', NULL, 0, 'a02bf64f9d77bb0f906a61c06a1f9ec220454157fab11b071ea49e83c6f184ff'),
(50, 1017, 7, 'Normal', 'Completed', 2, 'General', '2026-06-10 14:39:09', NULL, '2026-06-10 14:40:12', '2026-06-10 01:00:53', NULL, 0, 'af5b0600517a0f4881ebda81ecaa68475a6f66eea03cd3bcda26cd4b2215c75e'),
(51, 1019, 8, 'Normal', 'Completed', 2, 'General', '2026-06-10 14:39:51', NULL, '2026-06-10 14:40:33', '2026-06-10 06:38:02', NULL, 0, '167bb554c927bbc811d8eb10b001c3cfa93e16ce423efb659dc5fa602c07806d'),
(52, 1016, 9, 'Normal', 'Completed', 2, 'General', '2026-06-10 14:40:39', NULL, '2026-06-10 14:40:57', '2026-06-10 06:38:28', NULL, 0, '01ca28dd625a9636c5d2e80e9090283a440bb466eec86f8f81ff6d13155027f2'),
(53, 1028, 6, 'Normal', 'Completed', 3, 'Pediatrics', '2026-08-18 12:26:29', NULL, '2026-08-18 12:26:45', '2026-08-18 04:19:28', NULL, 0, 'a9520dfed75bd221c6c7ea660570dc42f7bce3ac6ffcaaac36ce4d534e9ca0c9'),
(54, 1033, 10, 'Normal', 'Completed', 10, 'General', '2026-10-08 18:27:35', NULL, '2026-10-08 18:28:19', '2026-08-24 21:22:25', NULL, 0, 'f8af671fa1c27ee11404fc9adcb08a36e8993d343bd40dfef7a58e07a9e009eb'),
(55, 1034, 11, 'Normal', 'Cancelled', 10, 'General', NULL, NULL, NULL, '2026-10-08 09:40:29', NULL, 0, '9a027e70cb3020ffe93dfea8f3dec97516454250cea99aa39df448d257110037'),
(56, 1032, 12, 'Normal', 'Cancelled', 10, 'General', NULL, NULL, NULL, '2026-10-08 10:03:25', NULL, 0, '4246fed561e7b3a7a7ab4e58364b0b960d31962479981b681515306c85fcb208'),
(57, 1035, 13, 'Normal', 'Cancelled', 10, 'General', NULL, NULL, NULL, '2026-10-08 10:06:47', NULL, 0, '6aa894196efa5c71b8c3083341989617a4963c73e4ad4a30044cb025b3098370'),
(58, 1033, 2, 'Senior', 'Waiting', 5, 'Internal Medicine', NULL, NULL, NULL, '2026-10-08 12:11:27', NULL, 0, 'd7af0a569053901c3b340dc2d7b37378659a1eb7c8f6d4d9b37a54a3d472cb3d'),
(59, 1038, 1, 'Normal', 'Completed', 10, 'General Medicine', '2026-10-08 22:53:38', NULL, '2026-10-08 22:54:59', '2026-10-08 14:50:52', NULL, 0, '85cfd39d00e5650fca7df9ea561b59192cd508a772df23532c9376e8917756d7'),
(60, 1037, 2, 'Normal', 'Completed', 10, 'General Medicine', '2026-10-08 23:20:15', NULL, '2026-10-08 23:21:48', '2026-10-08 14:52:59', NULL, 0, '8dfa3b44cb280911b668518ed4f123b60e86c8a2cdf780f854301a6758adfd05'),
(61, 1038, 2, 'Normal', 'Completed', 4, 'OB-Gyne', '2026-10-08 23:24:00', NULL, '2026-10-08 23:25:37', '2026-10-08 15:23:50', NULL, 0, 'a355cc39fecb180f23c2e20b4ecf51874f21e34ccd9cdcb48d4c49adc782d845'),
(62, 1040, 3, 'Normal', 'Completed', 10, 'General Medicine', '2026-10-11 22:56:03', NULL, '2026-10-11 23:25:00', '2026-10-11 12:38:46', NULL, 0, '767c356eb39aa8c61d33d57c04f618b69e0544d3c9cc074cf77088c4bc4c6aa0'),
(63, 1038, 4, 'Normal', 'Waiting', 10, 'General Medicine', NULL, NULL, NULL, '2026-10-11 12:48:18', NULL, 0, '77c56f4ba0a723aa6208419db529f21cc4e7cb9d5405be11c1ea621450f48eb7'),
(64, 1038, 5, 'Normal', 'Waiting', 10, 'General Medicine', NULL, NULL, NULL, '2026-10-11 12:53:46', NULL, 0, 'd589edf96cb69b1e63727d6866762f554402430487aecc9e5c3658383e5d040d'),
(65, 1041, 7, 'Normal', 'Waiting', 3, 'Pediatrics', NULL, NULL, NULL, '2026-10-11 13:22:14', NULL, 0, '9c6c1b544a4eabd91788c6b5bf7dc6614c8f2a87e648fd8502b2dbfed3c052cf'),
(66, 1037, 8, 'Normal', 'Waiting', 3, 'Pediatrics', NULL, NULL, NULL, '2026-10-11 13:37:35', NULL, 0, '8dc8415b5725cfb183e619297d8860a09cfdb6ede8542b30dba5516bde8cd1bd'),
(67, 1035, 9, 'Normal', 'Waiting', 3, 'Pediatrics', NULL, NULL, NULL, '2026-10-11 13:37:41', NULL, 0, '0f833536a7521d55373a45c17218aa512eae5df0dbd910f7ffc1b4f969c2f5a0'),
(68, 1042, 3, 'PWD', 'Completed', 4, 'OB-Gyne', '2026-10-11 23:32:51', NULL, '2026-10-11 23:36:05', '2026-10-11 15:30:01', NULL, 0, '20643e8c33ceb886e40a7b2f3c3d42ab2c36102f3eca24d4bcbd4d961d4b9449'),
(69, 1043, 6, 'Senior', 'Completed', 10, 'General Medicine', '2026-10-11 23:45:37', NULL, '2026-10-11 23:46:12', '2026-10-11 15:45:17', NULL, 0, '2b1e589f8c3323646ea08ffed53028983e471d850d121dbadf971013a34d428e');

-- --------------------------------------------------------

--
-- Table structure for table `queue_display`
--

CREATE TABLE `queue_display` (
  `id` int(11) NOT NULL,
  `currently_serving` int(11) DEFAULT NULL,
  `last_called` datetime DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_settings`
--

CREATE TABLE `queue_settings` (
  `id` int(11) NOT NULL,
  `department` varchar(50) NOT NULL,
  `current_number` int(11) DEFAULT 0,
  `last_reset_date` date DEFAULT NULL,
  `prefix` varchar(10) DEFAULT 'Q'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue_settings`
--

INSERT INTO `queue_settings` (`id`, `department`, `current_number`, `last_reset_date`, `prefix`) VALUES
(9, 'General', 13, '2026-10-08', 'Q'),
(10, 'Pediatrics', 9, '2026-10-11', 'P'),
(11, 'OB-Gyne', 3, '2026-10-11', 'G'),
(12, 'Internal Medicine', 2, '2026-10-08', 'M'),
(13, 'General Medicine', 6, '2026-10-11', 'Q');

-- --------------------------------------------------------

--
-- Table structure for table `surgeries`
--

CREATE TABLE `surgeries` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `surgery` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('admin','doctor','nurse','staff') NOT NULL DEFAULT 'staff',
  `assigned_department` varchar(50) DEFAULT 'General',
  `can_access_all_depts` tinyint(1) DEFAULT 0,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `two_factor_secret` varchar(64) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `role`, `assigned_department`, `can_access_all_depts`, `status`, `is_available`, `two_factor_secret`, `two_factor_enabled`, `last_login`, `created_at`) VALUES
(1, 'adminoutpatient', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'System Administrator', 'admin@cesh.gov.ph', 'admin', 'General', 1, 'Active', 1, 'ZJJWUPQONTHDS3TE', 1, '2026-10-11 20:22:06', '2026-05-18 06:43:28'),
(2, 'dr.general', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. John Santos', 'general@cesh.gov.ph', 'doctor', 'General', 0, 'Active', 0, NULL, 0, '2026-09-30 18:43:26', '2026-05-18 06:43:28'),
(3, 'dr.peds', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Maria Reyes', 'peds@cesh.gov.ph', 'doctor', 'Pediatrics', 0, 'Active', 1, NULL, 0, '2026-08-18 13:28:04', '2026-05-18 06:43:28'),
(4, 'dr.obgyn', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Anna Cruz', 'obgyn@cesh.gov.ph', 'doctor', 'OB-Gyne', 0, 'Active', 1, NULL, 0, '2026-10-08 23:23:37', '2026-05-18 06:43:28'),
(5, 'dr.internal', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Robert Lim', 'internal@cesh.gov.ph', 'doctor', 'Internal Medicine', 0, 'Active', 1, NULL, 0, '2026-06-10 01:12:16', '2026-05-18 06:43:28'),
(6, 'fd.general', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - General', 'fd.general@cesh.gov.ph', 'staff', 'General', 0, 'Active', 1, NULL, 0, '2026-10-11 21:11:35', '2026-05-18 06:43:28'),
(7, 'fd.peds', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - Pediatrics', 'fd.peds@cesh.gov.ph', 'staff', 'Pediatrics', 0, 'Inactive', 1, NULL, 0, '2026-08-18 13:27:51', '2026-05-18 06:43:28'),
(8, 'fd.obgyn', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - OB-Gyne', 'fd.obgyn@cesh.gov.ph', 'staff', 'OB-Gyne', 0, 'Active', 1, NULL, 0, '2026-05-31 23:43:23', '2026-05-18 06:43:28'),
(9, 'fd.internal', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - Internal Med', 'fd.internal@cesh.gov.ph', 'staff', 'Internal Medicine', 0, 'Active', 1, NULL, 0, '2026-06-10 01:11:30', '2026-05-18 06:43:28'),
(10, 'dr.mark', '$2y$10$tYY6vO.x1tu16F/wghE6w.mAlzZoDeqYFDP0gNHmQi.FAay3c1lH6', 'Mark Adrian Lumongsod', 'mark.adrian.lumongsod@gmail.com', 'doctor', 'General Medicine', 0, 'Active', 1, NULL, 0, '2026-10-11 21:23:39', '2026-08-24 21:24:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`),
  ADD KEY `idx_date` (`date`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `fk_appointment_doctor` (`doctor_id`);

--
-- Indexes for table `appointment_email_log`
--
ALTER TABLE `appointment_email_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_appointment_email` (`appointment_id`,`email_type`),
  ADD KEY `idx_email_log_appointment` (`appointment_id`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`,`schedule_date`);

--
-- Indexes for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doctor_dept` (`doctor_id`,`department`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `family_history`
--
ALTER TABLE `family_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_login_activity_time` (`attempted_at`),
  ADD KEY `idx_login_activity_username` (`username`),
  ADD KEY `idx_login_activity_status` (`status`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`mrn`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `queue_display`
--
ALTER TABLE `queue_display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_settings`
--
ALTER TABLE `queue_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department` (`department`);

--
-- Indexes for table `surgeries`
--
ALTER TABLE `surgeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `appointment_email_log`
--
ALTER TABLE `appointment_email_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `diagnoses`
--
ALTER TABLE `diagnoses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `family_history`
--
ALTER TABLE `family_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `mrn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1044;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `queue_display`
--
ALTER TABLE `queue_display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `queue_settings`
--
ALTER TABLE `queue_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `surgeries`
--
ALTER TABLE `surgeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD CONSTRAINT `doctor_schedules_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `family_history`
--
ALTER TABLE `family_history`
  ADD CONSTRAINT `family_history_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `immunizations_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `surgeries`
--
ALTER TABLE `surgeries`
  ADD CONSTRAINT `surgeries_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
