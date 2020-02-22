-- phpMyAdmin SQL Dump
-- version 4.4.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2020 at 11:28 PM
-- Server version: 10.0.36-MariaDB-1~trusty
-- PHP Version: 5.5.9-1ubuntu4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `animationDemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `fb_ans`
--

CREATE TABLE IF NOT EXISTS `fb_ans` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `ans_value` varchar(50) NOT NULL,
  `ans_flag` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fb_ans`
--

INSERT INTO `fb_ans` (`id`, `q_id`, `user_id`, `ans_value`, `ans_flag`, `timestamp`) VALUES
(13, 1, 1, 'Almost Never', 1, '2020-02-20 17:26:15'),
(14, 1, 1, 'Almost Never', 1, '2020-02-20 17:27:38'),
(15, 2, 1, 'Never (pops up)', 1, '2020-02-20 17:29:38'),
(16, 1, 1, 'Sometimes', 1, '2020-02-20 19:03:54'),
(17, 2, 1, 'Almost Never', 1, '2020-02-20 19:04:04'),
(18, 1, 94, 'Almost Never', 1, '2020-02-20 19:05:08'),
(19, 2, 94, 'Almost Never', 1, '2020-02-20 19:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `fb_qs`
--

CREATE TABLE IF NOT EXISTS `fb_qs` (
  `id` int(11) NOT NULL,
  `qurl` varchar(500) NOT NULL,
  `all_option` varchar(500) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fb_qs`
--

INSERT INTO `fb_qs` (`id`, `qurl`, `all_option`, `time_stamp`) VALUES
(1, 'intro.mp4', '', '2020-02-20 15:22:28'),
(2, 'q1.mp4', '{"1": "Always", "2":"Very Often", "3":"Sometimes", "4":"Almost Never","5": "Never (pops up)"}', '2020-02-20 15:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `pmp_feature`
--

CREATE TABLE IF NOT EXISTS `pmp_feature` (
  `fid` int(20) NOT NULL COMMENT 'feature_ID',
  `feature_name` varchar(100) NOT NULL,
  `feature_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feature_desc` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmp_feature`
--

INSERT INTO `pmp_feature` (`fid`, `feature_name`, `feature_timestamp`, `feature_desc`) VALUES
(1, 'Access Control', '2020-02-17 16:37:13', '1 Can view and modify Access control and user features'),
(2, 'Quiz Submissions', '2020-02-17 16:37:19', '2 Can View Quiz Submissions'),
(3, 'User Activity', '2020-02-17 16:37:23', '3 Can view all users log details');

-- --------------------------------------------------------

--
-- Table structure for table `pmp_role`
--

CREATE TABLE IF NOT EXISTS `pmp_role` (
  `role_id` int(10) NOT NULL,
  `r_name` varchar(255) NOT NULL,
  `role_status` varchar(1) NOT NULL,
  `role_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmp_role`
--

INSERT INTO `pmp_role` (`role_id`, `r_name`, `role_status`, `role_time_stamp`) VALUES
(1, 'Admin', '1', '2020-02-13 01:56:55'),
(2, 'Preceptor', '1', '2020-02-13 01:56:52'),
(3, 'Faculty', '1', '2020-02-13 01:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `pmp_role_feature_mapping`
--

CREATE TABLE IF NOT EXISTS `pmp_role_feature_mapping` (
  `rf_id` int(100) NOT NULL,
  `r_id` int(100) NOT NULL,
  `fid` int(100) NOT NULL,
  `mapping_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=716 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmp_role_feature_mapping`
--

INSERT INTO `pmp_role_feature_mapping` (`rf_id`, `r_id`, `fid`, `mapping_time_stamp`) VALUES
(694, 2, 2, '2020-02-15 19:13:08'),
(707, 1, 1, '2020-02-17 16:27:48'),
(708, 1, 2, '2020-02-17 16:27:48'),
(709, 1, 3, '2020-02-17 16:27:48'),
(710, 1, 4, '2020-02-17 16:27:48'),
(715, 3, 2, '2020-02-19 01:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `pmp_user_role_mapping`
--

CREATE TABLE IF NOT EXISTS `pmp_user_role_mapping` (
  `ur_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `role_id` int(15) NOT NULL,
  `user_role_status` int(1) NOT NULL DEFAULT '1' COMMENT 'enable -1 or disable-0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmp_user_role_mapping`
--

INSERT INTO `pmp_user_role_mapping` (`ur_id`, `user_id`, `role_id`, `user_role_status`, `create_date`) VALUES
(1, 1, 1, 1, '2020-02-12 23:57:01'),
(2, 2, 2, 1, '2020-02-15 21:48:21'),
(3, 3, 3, 1, '2020-02-15 23:45:05'),
(11, 94, 3, 1, '2020-02-18 23:56:18'),
(12, 100, 1, 1, '2020-02-19 01:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phnum` bigint(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `org` varchar(50) NOT NULL,
  `role` varchar(30) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `addr2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zip` int(5) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quiz_status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fname`, `lname`, `password`, `phnum`, `email`, `age`, `gender`, `org`, `role`, `addr1`, `addr2`, `city`, `state`, `zip`, `timestamp`, `quiz_status`) VALUES
(1, 'anushamatcha', 'anusha', 'matcha', '$2y$10$HO1ejKVAL3Qq3biwOrnjeO3eBpE4OqcVn8WStFv9g2lav3ed5eIs.', 654, 'amatc001@odu.edu', 25, 'f', '', 'admin', 'line', 'line 2', 'virginia beach', 'va', 12345, '2020-02-12 21:58:00', 0),
(2, 'preceptor', 'preceptor', 'john', '$2y$10$HO1ejKVAL3Qq3biwOrnjeO3eBpE4OqcVn8WStFv9g2lav3ed5eIs.', 1234567899, 'a@g.com', 12, 'o', 'wer', '', 'asfaf', 'afaf', 'afaf', 'AZ', 23345, '2020-02-13 14:05:37', 0),
(3, 'faculty', 'faculty', 'linda', '$2y$10$wpbDsr2ke7SafkdnfJmfY.dL9RWK1uqykMfmkeCVMpVIxwqk.sIjm', 1234567892, 'a@re.co', 3, 'o', '', '', 'test address', 'address line 2', 'vatican', 'CA', 123421, '2020-02-15 23:45:05', 0),
(94, 'testfaculty', 'test', 'faculty', '$2y$10$P/h1PmSL/JiOZydCTjk7Y.qA/hrKX3VnVhX16DiYYIInGUMx69Kfm', 2147483647, 'anusha.m21@f.co', 3, 'o', 'jbhvg', '', 'adf', 'af', 'asasf', 'AK', 23456, '2020-02-18 23:56:18', 0),
(100, 'testadmin', 'admin', 'test', '$2y$10$P/h1PmSL/JiOZydCTjk7Y.qA/hrKX3VnVhX16DiYYIInGUMx69Kfm', 32423, 'an@mg.com', 1, 'o', 'sdf', '', 'hmghn', 'nsdsf', 'vis', 'AK', 3333, '2020-02-19 01:11:20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_history`
--

CREATE TABLE IF NOT EXISTS `user_activity_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `session_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=941 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_activity_history`
--

INSERT INTO `user_activity_history` (`id`, `user_id`, `type`, `description`, `creation_date`, `session_id`) VALUES
(577, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 18:55:32', 2),
(578, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 18:57:26', 2),
(579, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 18:57:51', 2),
(580, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 18:58:08', 2),
(581, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 18:58:59', 2),
(582, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 18:59:32', 2),
(583, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 18:59:33', 2),
(584, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 18:59:35', 2),
(585, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 18:59:35', 2),
(586, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 18:59:53', 2),
(587, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-17 19:00:04', 2),
(588, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 19:00:07', 2),
(589, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 19:00:10', 2),
(590, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 19:00:11', 2),
(591, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 19:00:13', 2),
(592, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-17 20:58:31', 2),
(593, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 20:58:32', 2),
(594, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 20:58:32', 2),
(595, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 20:58:33', 2),
(596, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 20:58:34', 2),
(597, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 20:58:57', 2),
(598, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:02:34', 2),
(599, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:10:04', 2),
(600, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:10:30', 2),
(601, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:17:12', 2),
(602, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:18:19', 2),
(603, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:18:46', 2),
(604, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:18:57', 2),
(605, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:19:33', 2),
(606, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:20:55', 2),
(607, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:21:31', 2),
(608, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:21:52', 2),
(609, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:22:22', 2),
(610, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:24:50', 2),
(611, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:20', 2),
(612, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:22', 2),
(613, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:27', 2),
(614, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:28', 2),
(615, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:29', 2),
(616, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:29', 2),
(617, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:25:52', 2),
(618, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:27:00', 2),
(619, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:27:00', 2),
(620, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:27:19', 2),
(621, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:29:06', 2),
(622, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:29:31', 2),
(623, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:29:40', 2),
(624, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:29:40', 2),
(625, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:30:41', 2),
(626, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:31:34', 2),
(627, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:42:02', 2),
(628, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:42:03', 2),
(629, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:06', 2),
(630, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:07', 2),
(631, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:08', 2),
(632, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:16', 2),
(633, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:16', 2),
(634, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:18', 2),
(635, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:20', 2),
(636, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:23', 2),
(637, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:43:57', 2),
(638, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:44:42', 2),
(639, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:44:43', 2),
(640, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:44:44', 2),
(641, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:07', 2),
(642, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:18', 2),
(643, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:19', 2),
(644, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:19', 2),
(645, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:44', 2),
(646, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:45', 2),
(647, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:45:45', 2),
(648, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:46:04', 2),
(649, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:46:44', 2),
(650, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:47:50', 2),
(651, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:49:40', 2),
(652, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 21:50:18', 2),
(653, 1, 'LOGIN', 'Just logged in', '2020-02-17 22:06:12', 2),
(654, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-17 22:06:12', 2),
(655, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 22:06:20', 2),
(656, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-17 22:06:22', 2),
(657, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 22:06:23', 2),
(658, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:06:25', 2),
(659, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 22:06:26', 2),
(660, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:06:27', 2),
(661, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:07:45', 2),
(662, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:07', 2),
(663, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:08', 2),
(664, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:08', 2),
(665, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:08', 2),
(666, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:35', 2),
(667, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:36', 2),
(668, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:36', 2),
(669, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:36', 2),
(670, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:36', 2),
(671, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:37', 2),
(672, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:08:37', 2),
(673, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:16', 2),
(674, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:25', 2),
(675, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:25', 2),
(676, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:25', 2),
(677, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:25', 2),
(678, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:26', 2),
(679, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:26', 2),
(680, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:26', 2),
(681, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:09:27', 2),
(682, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:16:37', 2),
(683, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:17:17', 2),
(684, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:17:18', 2),
(685, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 22:17:18', 2),
(686, 3, 'LOGIN', 'Just logged in', '2020-02-17 22:18:17', 2),
(687, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-17 22:18:17', 2),
(688, 3, 'Profile Page ', 'Opened Profile Page', '2020-02-17 22:18:19', 2),
(689, 3, 'Access Control ', 'Opened Access Control', '2020-02-17 22:18:30', 2),
(690, 3, 'Profile Page ', 'Opened Profile Page', '2020-02-17 22:18:32', 2),
(691, 3, 'Profile Page ', 'Opened Profile Page', '2020-02-17 23:02:03', 2),
(692, 1, 'LOGIN', 'Just logged in', '2020-02-17 23:04:23', 2),
(693, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-17 23:04:24', 2),
(694, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-17 23:04:43', 2),
(695, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 23:04:50', 2),
(696, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 23:05:31', 2),
(697, 1, 'Access Control ', 'Opened Access Control', '2020-02-17 23:10:58', 2),
(698, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-17 23:10:58', 2),
(699, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 23:10:59', 2),
(700, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-17 23:11:00', 2),
(701, 1, 'User Activity', 'Opened Activity Logs', '2020-02-17 23:11:01', 2),
(702, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 14:51:37', 2),
(703, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 14:55:17', 2),
(704, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 14:55:18', 2),
(705, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 14:55:20', 2),
(706, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 15:17:09', 2),
(707, 1, 'LOGIN', 'Just logged in', '2020-02-18 21:16:49', 2),
(708, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:16:49', 2),
(709, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 21:16:53', 2),
(710, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 21:16:53', 2),
(711, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 21:16:57', 2),
(712, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:16:58', 2),
(713, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:17:01', 2),
(714, 1, 'LOGIN', 'Just logged in', '2020-02-18 21:33:20', 2),
(715, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:33:20', 2),
(716, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 21:33:31', 2),
(717, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 21:33:33', 2),
(718, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:33:34', 2),
(719, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:34:21', 2),
(720, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:34:22', 2),
(721, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:34:22', 2),
(722, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:34:28', 2),
(723, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:36:50', 2),
(724, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:37:50', 2),
(725, 1, 'LOGIN', 'Just logged in', '2020-02-18 21:56:00', 0),
(726, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:56:00', 0),
(727, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:56:04', 0),
(728, 1, 'LOGIN', 'Just logged in', '2020-02-18 21:57:09', 0),
(729, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:57:09', 0),
(730, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 21:57:12', 0),
(731, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 21:57:35', 0),
(732, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 21:57:37', 0),
(733, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 21:57:39', 0),
(734, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 21:57:40', 0),
(735, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 21:57:41', 0),
(736, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:57:58', 0),
(737, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 21:58:04', 0),
(738, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 21:58:07', 0),
(739, 1, 'LOGIN', 'Just logged in', '2020-02-18 22:02:20', 0),
(740, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:02:20', 0),
(741, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:02:59', 0),
(742, 1, 'LOGIN', 'Just logged in', '2020-02-18 22:03:08', 0),
(743, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:03:08', 0),
(744, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 22:33:45', 0),
(745, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 22:34:03', 0),
(746, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 22:34:12', 0),
(747, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 22:34:15', 0),
(748, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 22:34:18', 0),
(749, 3, 'LOGIN', 'Just logged in', '2020-02-18 22:34:27', 0),
(750, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:34:27', 0),
(751, 3, 'Access Control ', 'Opened Access Control', '2020-02-18 22:34:33', 0),
(752, 3, 'Profile Page ', 'Opened Profile Page', '2020-02-18 22:34:35', 0),
(753, 1, 'LOGIN', 'Just logged in', '2020-02-18 22:34:43', 0),
(754, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:34:43', 0),
(755, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 22:34:46', 0),
(756, 3, 'LOGIN', 'Just logged in', '2020-02-18 22:35:16', 0),
(757, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:35:16', 0),
(758, 3, 'Access Control ', 'Opened Access Control', '2020-02-18 22:35:20', 0),
(759, 1, 'LOGIN', 'Just logged in', '2020-02-18 22:35:34', 0),
(760, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:35:34', 0),
(761, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 22:35:38', 0),
(762, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 22:35:40', 0),
(763, 3, 'LOGIN', 'Just logged in', '2020-02-18 22:36:04', 0),
(764, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 22:36:04', 0),
(765, 1, 'LOGIN', 'Just logged in', '2020-02-18 23:01:17', 0),
(766, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 23:01:17', 0),
(767, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 23:01:20', 0),
(768, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 23:01:21', 0),
(769, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 23:01:22', 0),
(770, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 23:01:22', 0),
(771, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 23:01:23', 0),
(772, 2, 'LOGIN', 'Just logged in', '2020-02-18 23:01:50', 0),
(773, 2, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 23:01:50', 0),
(774, 1, 'LOGIN', 'Just logged in', '2020-02-18 23:02:09', 0),
(775, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 23:02:09', 0),
(776, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 23:02:19', 0),
(777, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 23:02:27', 0),
(778, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 23:02:33', 0),
(779, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 23:02:38', 0),
(780, 1, 'LOGIN', 'Just logged in', '2020-02-18 23:58:20', 0),
(781, 1, 'LOGIN', 'Just logged in', '2020-02-18 23:58:44', 0),
(782, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-18 23:58:44', 0),
(783, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 23:58:48', 0),
(784, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-18 23:58:51', 0),
(785, 1, 'User Activity', 'Opened Activity Logs', '2020-02-18 23:58:53', 0),
(786, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-18 23:58:56', 0),
(787, 94, 'LOGIN', 'Just logged in', '2020-02-19 00:00:44', 0),
(788, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 00:00:44', 0),
(789, 100, 'LOGIN', 'Just logged in', '2020-02-19 01:11:44', 0),
(790, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:11:44', 0),
(791, 100, 'Access Control ', 'Opened Access Control', '2020-02-19 01:11:48', 0),
(792, 100, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:11:57', 0),
(793, 100, 'LOGIN', 'Just logged in', '2020-02-19 01:13:14', 0),
(794, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:13:14', 0),
(795, 94, 'LOGIN', 'Just logged in', '2020-02-19 01:14:16', 0),
(796, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:14:16', 0),
(797, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:14:19', 0),
(798, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:14:25', 0),
(799, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:14:25', 0),
(800, 94, 'Profile Page ', 'Opened Profile Page', '2020-02-19 01:14:26', 0),
(801, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:14:28', 0),
(802, 1, 'LOGIN', 'Just logged in', '2020-02-19 01:20:38', 0),
(803, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:20:38', 0),
(804, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:22:43', 0),
(805, 3, 'LOGIN', 'Just logged in', '2020-02-19 01:22:52', 0),
(806, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:22:52', 0),
(807, 100, 'LOGIN', 'Just logged in', '2020-02-19 01:28:27', 0),
(808, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:28:27', 0),
(809, 100, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:28:51', 0),
(810, 100, 'Access Control ', 'Opened Access Control', '2020-02-19 01:28:59', 0),
(811, 100, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:29:06', 0),
(812, 1, 'LOGIN', 'Just logged in', '2020-02-19 01:46:17', 0),
(813, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:46:17', 0),
(814, 1, 'Access Control ', 'Opened Access Control', '2020-02-19 01:46:19', 0),
(815, 3, 'LOGIN', 'Just logged in', '2020-02-19 01:46:41', 0),
(816, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:46:41', 0),
(817, 3, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:46:46', 0),
(818, 3, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:46:47', 0),
(819, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:46:52', 0),
(820, 3, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:46:53', 0),
(821, 3, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:46:54', 0),
(822, 3, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:46:55', 0),
(823, 3, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:46:56', 0),
(824, 3, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:47:00', 0),
(825, 3, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:47:01', 0),
(826, 3, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:47:02', 0),
(827, 3, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:47:02', 0),
(828, 3, 'Profile Page ', 'Opened Profile Page', '2020-02-19 01:47:05', 0),
(829, 3, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:47:07', 0),
(830, 1, 'LOGIN', 'Just logged in', '2020-02-19 01:47:20', 0),
(831, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:47:20', 0),
(832, 1, 'User Activity', 'Opened Activity Logs', '2020-02-19 01:47:22', 0),
(833, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 01:47:23', 0),
(834, 1, 'Access Control ', 'Opened Access Control', '2020-02-19 01:47:25', 0),
(835, 3, 'LOGIN', 'Just logged in', '2020-02-19 01:47:41', 0),
(836, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 01:47:41', 0),
(837, 100, 'LOGIN', 'Just logged in', '2020-02-19 20:06:02', 22),
(838, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:06:02', 22),
(839, 100, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 20:07:48', 22),
(840, 100, 'Access Control ', 'Opened Access Control', '2020-02-19 20:08:00', 22),
(841, 100, 'User Activity', 'Opened Activity Logs', '2020-02-19 20:08:02', 22),
(842, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:09:59', 22),
(843, 100, 'LOGIN', 'Just logged in', '2020-02-19 20:10:53', 22),
(844, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:10:53', 22),
(845, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:11:39', 22),
(846, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:12:19', 22),
(847, 3, 'LOGIN', 'Just logged in', '2020-02-19 20:14:21', 0),
(848, 3, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:14:21', 0),
(849, 1, 'LOGIN', 'Just logged in', '2020-02-19 20:52:48', 0),
(850, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 20:52:48', 0),
(851, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:05:52', 0),
(852, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:07:37', 0),
(853, 1, 'LOGIN', 'Just logged in', '2020-02-19 21:08:36', 0),
(854, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:08:36', 0),
(855, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:09:14', 0),
(856, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:09:20', 0),
(857, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:09:21', 0),
(858, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:11:35', 0),
(859, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:11:37', 0),
(860, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:12:50', 0),
(861, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:17:21', 0),
(862, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:17:29', 0),
(863, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:18:11', 0),
(864, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:18:31', 0),
(865, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:19:30', 0),
(866, 94, 'LOGIN', 'Just logged in', '2020-02-19 21:51:07', 0),
(867, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:51:07', 0),
(868, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 21:53:05', 0),
(869, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 21:53:19', 0),
(870, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 21:53:20', 0),
(871, 94, 'Profile Page ', 'Opened Profile Page', '2020-02-19 21:53:22', 0),
(872, 100, 'LOGIN', 'Just logged in', '2020-02-19 21:53:51', 0),
(873, 100, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 21:53:51', 0),
(874, 100, 'Access Control ', 'Opened Access Control', '2020-02-19 21:55:13', 0),
(875, 100, 'Access Control ', 'Opened Access Control', '2020-02-19 21:56:13', 0),
(876, 100, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 21:56:15', 0),
(877, 100, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 21:56:32', 0),
(878, 100, 'User Activity', 'Opened Activity Logs', '2020-02-19 21:56:33', 0),
(879, 100, 'Profile Page ', 'Opened Profile Page', '2020-02-19 21:56:45', 0),
(880, 100, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-19 21:56:54', 0),
(881, 1, 'LOGIN', 'Just logged in', '2020-02-19 23:11:06', 0),
(882, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:11:06', 0),
(883, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:16:28', 0),
(884, 1, 'LOGIN', 'Just logged in', '2020-02-19 23:29:57', 0),
(885, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:29:57', 0),
(886, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:32:09', 0),
(887, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:34:22', 0),
(888, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:39:57', 0),
(889, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:41:28', 0),
(890, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:47:26', 0),
(891, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:50:43', 0),
(892, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:50:43', 0),
(893, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:50:44', 0),
(894, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-19 23:50:47', 0),
(895, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:50:49', 0),
(896, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-19 23:53:27', 0),
(897, 1, 'LOGIN', 'Just logged in', '2020-02-20 03:45:08', 0),
(898, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 03:45:08', 0),
(899, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 03:48:19', 0),
(900, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 03:49:58', 0),
(901, 1, 'LOGIN', 'Just logged in', '2020-02-20 03:59:32', 0),
(902, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 03:59:32', 0),
(903, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-20 03:59:38', 0),
(904, 1, 'User Activity', 'Opened Activity Logs', '2020-02-20 03:59:40', 0),
(905, 1, 'User Activity', 'Opened Activity Logs', '2020-02-20 04:00:45', 0),
(906, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 04:00:47', 0),
(907, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 04:01:11', 0),
(908, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 04:01:51', 0),
(909, 1, 'LOGIN', 'Just logged in', '2020-02-20 04:04:23', 0),
(910, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 04:04:23', 0),
(911, 1, 'Profile Page ', 'Opened Profile Page', '2020-02-20 04:04:25', 0),
(912, 94, 'LOGIN', 'Just logged in', '2020-02-20 15:21:15', 0),
(913, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 15:21:15', 0),
(914, 1, 'LOGIN', 'Just logged in', '2020-02-20 19:01:02', 0),
(915, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:01:02', 0),
(916, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:03:20', 0),
(917, 1, 'LOGIN', 'Just logged in', '2020-02-20 19:03:28', 0),
(918, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:03:28', 0),
(919, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:04:04', 0),
(920, 1, 'LOGIN', 'Just logged in', '2020-02-20 19:04:12', 0),
(921, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:04:12', 0),
(922, 94, 'LOGIN', 'Just logged in', '2020-02-20 19:04:54', 0),
(923, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:04:54', 0),
(924, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:05:14', 0),
(925, 94, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 19:06:54', 0),
(926, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:06:55', 0),
(927, 94, 'LOGIN', 'Just logged in', '2020-02-20 19:12:54', 0),
(928, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:12:54', 0),
(929, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:13:21', 0),
(930, 1, 'LOGIN', 'Just logged in', '2020-02-20 19:13:36', 0),
(931, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:13:36', 0),
(932, 94, 'LOGIN', 'Just logged in', '2020-02-20 19:14:50', 0),
(933, 94, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 19:14:50', 0),
(934, 1, 'LOGIN', 'Just logged in', '2020-02-20 23:09:38', 0),
(935, 1, 'Home', 'Opened Home Page with Quiz vedio1', '2020-02-20 23:09:38', 0),
(936, 1, 'Access Control ', 'Opened Access Control', '2020-02-20 23:09:40', 0),
(937, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 23:09:43', 0),
(938, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 23:16:44', 0),
(939, 1, 'User Activity', 'Opened Activity Logs', '2020-02-20 23:16:46', 0),
(940, 1, 'Quiz Feedback', 'Opened Quiz Feedback', '2020-02-20 23:16:47', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fb_ans`
--
ALTER TABLE `fb_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_qs`
--
ALTER TABLE `fb_qs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pmp_feature`
--
ALTER TABLE `pmp_feature`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `pmp_role`
--
ALTER TABLE `pmp_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `pmp_role_feature_mapping`
--
ALTER TABLE `pmp_role_feature_mapping`
  ADD PRIMARY KEY (`rf_id`),
  ADD KEY `r_id` (`r_id`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `pmp_user_role_mapping`
--
ALTER TABLE `pmp_user_role_mapping`
  ADD PRIMARY KEY (`ur_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `phnum` (`phnum`);

--
-- Indexes for table `user_activity_history`
--
ALTER TABLE `user_activity_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fb_ans`
--
ALTER TABLE `fb_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `fb_qs`
--
ALTER TABLE `fb_qs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pmp_feature`
--
ALTER TABLE `pmp_feature`
  MODIFY `fid` int(20) NOT NULL AUTO_INCREMENT COMMENT 'feature_ID',AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `pmp_role`
--
ALTER TABLE `pmp_role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pmp_role_feature_mapping`
--
ALTER TABLE `pmp_role_feature_mapping`
  MODIFY `rf_id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=716;
--
-- AUTO_INCREMENT for table `pmp_user_role_mapping`
--
ALTER TABLE `pmp_user_role_mapping`
  MODIFY `ur_id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `user_activity_history`
--
ALTER TABLE `user_activity_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=941;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
