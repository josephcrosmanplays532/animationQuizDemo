-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Feb 18, 2020 at 09:14 PM
-- Server version: 10.0.36-MariaDB-1~xenial
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animationDemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback_option`
--

CREATE TABLE `feedback_option` (
  `optid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `flag` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_quiz_qs`
--

CREATE TABLE `feedback_quiz_qs` (
  `q_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pmp_feature`
--

CREATE TABLE `pmp_feature` (
  `fid` int(20) NOT NULL COMMENT 'feature_ID',
  `feature_name` varchar(100) NOT NULL,
  `feature_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feature_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `pmp_role` (
  `role_id` int(10) NOT NULL,
  `r_name` varchar(255) NOT NULL,
  `role_status` varchar(1) NOT NULL,
  `role_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `pmp_role_feature_mapping` (
  `rf_id` int(100) NOT NULL,
  `r_id` int(100) NOT NULL,
  `fid` int(100) NOT NULL,
  `mapping_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmp_role_feature_mapping`
--

INSERT INTO `pmp_role_feature_mapping` (`rf_id`, `r_id`, `fid`, `mapping_time_stamp`) VALUES
(694, 2, 2, '2020-02-15 19:13:08'),
(707, 1, 1, '2020-02-17 16:27:48'),
(708, 1, 2, '2020-02-17 16:27:48'),
(709, 1, 3, '2020-02-17 16:27:48'),
(710, 1, 4, '2020-02-17 16:27:48'),
(711, 3, 2, '2020-02-17 16:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `pmp_user_role_mapping`
--

CREATE TABLE `pmp_user_role_mapping` (
  `ur_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `role_id` int(15) NOT NULL,
  `user_role_status` int(1) NOT NULL DEFAULT '1' COMMENT 'enable -1 or disable-0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmp_user_role_mapping`
--

INSERT INTO `pmp_user_role_mapping` (`ur_id`, `user_id`, `role_id`, `user_role_status`, `create_date`) VALUES
(1, 1, 1, 1, '2020-02-12 23:57:01'),
(2, 2, 2, 1, '2020-02-15 21:48:21'),
(3, 3, 3, 1, '2020-02-15 23:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phnum` int(10) NOT NULL,
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
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fname`, `lname`, `password`, `phnum`, `email`, `age`, `gender`, `org`, `role`, `addr1`, `addr2`, `city`, `state`, `zip`, `timestamp`) VALUES
(1, 'anushamatcha', 'anusha', 'matcha', '$2y$10$HO1ejKVAL3Qq3biwOrnjeO3eBpE4OqcVn8WStFv9g2lav3ed5eIs.', 654, 'amatc001@odu.edu', 25, 'f', '', 'admin', 'line', 'line 2', 'virginia beach', 'va', 12345, '2020-02-12 21:58:00'),
(2, 'preceptor', 'preceptor', 'john', '$2y$10$HO1ejKVAL3Qq3biwOrnjeO3eBpE4OqcVn8WStFv9g2lav3ed5eIs.', 1234567899, 'a@g.com', 12, 'o', 'wer', '', 'asfaf', 'afaf', 'afaf', 'AZ', 23345, '2020-02-13 14:05:37'),
(3, 'faculty', 'faculty', 'linda', '$2y$10$wpbDsr2ke7SafkdnfJmfY.dL9RWK1uqykMfmkeCVMpVIxwqk.sIjm', 1234567892, 'a@re.co', 3, 'o', '', '', 'test address', 'address line 2', 'vatican', 'CA', 123421, '2020-02-15 23:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_history`
--

CREATE TABLE `user_activity_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `session_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(706, 1, 'Access Control ', 'Opened Access Control', '2020-02-18 15:17:09', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback_quiz_qs`
--
ALTER TABLE `feedback_quiz_qs`
  ADD PRIMARY KEY (`q_id`);

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
-- AUTO_INCREMENT for table `feedback_quiz_qs`
--
ALTER TABLE `feedback_quiz_qs`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pmp_feature`
--
ALTER TABLE `pmp_feature`
  MODIFY `fid` int(20) NOT NULL AUTO_INCREMENT COMMENT 'feature_ID', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pmp_role`
--
ALTER TABLE `pmp_role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pmp_role_feature_mapping`
--
ALTER TABLE `pmp_role_feature_mapping`
  MODIFY `rf_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=712;

--
-- AUTO_INCREMENT for table `pmp_user_role_mapping`
--
ALTER TABLE `pmp_user_role_mapping`
  MODIFY `ur_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `user_activity_history`
--
ALTER TABLE `user_activity_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=707;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
