-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2026 at 10:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neopoth`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drop_job`
--

CREATE TABLE `drop_job` (
  `drop_job_id` bigint(20) NOT NULL,
  `apply_status` enum('ACCEPTED','OPEN','PENDING','REJECTED') DEFAULT NULL,
  `dropping_date` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `sub_admin_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `job_status` enum('ASSIGNED','BOOKED','CLOSED','OPEN') DEFAULT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_type` enum('CONTRACTUAL','FREELANCE','FULL_TIME','PART_TIME') DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary` double NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('READ','UNREAD') DEFAULT NULL,
  `employer_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_method` enum('BANK_TRANSFER','BKASH','NAGAD','ROCKET','UPAY') DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) NOT NULL,
  `payed_by_id` bigint(20) NOT NULL,
  `payed_to_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `reviewee_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `take_job`
--

CREATE TABLE `take_job` (
  `take_job_id` bigint(20) NOT NULL,
  `apply_date` datetime(6) DEFAULT NULL,
  `apply_status` enum('ACCEPTED','OPEN','PENDING','REJECTED') DEFAULT NULL,
  `job_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `nid_card_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_type` enum('EMPLOYER','MASTER_ADMIN','STUDENT','SUB_ADMIN') NOT NULL,
  `username` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `total_hired_students` int(11) DEFAULT NULL,
  `total_posted_jobs` int(11) DEFAULT NULL,
  `can_manage_all_jobs` bit(1) DEFAULT NULL,
  `can_manage_sub_admins` bit(1) DEFAULT NULL,
  `is_super_admin` bit(1) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  `is_verified` bit(1) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `total_earnings` double DEFAULT NULL,
  `university_email` varchar(255) NOT NULL,
  `institution_address` varchar(255) DEFAULT NULL,
  `institution_code` varchar(255) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `total_students` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `user_skill`
--

CREATE TABLE `user_skill` (
  `user_skill_id` bigint(20) NOT NULL,
  `proficiency` varchar(255) DEFAULT NULL,
  `skill_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `UK46ccwnsi9409t36lurvtyljak` (`name`);

--
-- Indexes for table `drop_job`
--
ALTER TABLE `drop_job`
  ADD PRIMARY KEY (`drop_job_id`),
  ADD KEY `FKe0p9gs2dn9gm7pa2x2p58mkib` (`user_id`),
  ADD KEY `FK6vqyq5u1l86js1c0gu2xd0vcf` (`job_id`),
  ADD KEY `FKabwp0bw7bin766s9hbuuaggb0` (`sub_admin_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `FK1jtisqv4yk9oxdk2a2qgdnwq6` (`category_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `FKl6g3348xu9c2q7scpmkh6u98d` (`employer_id`),
  ADD KEY `FKrlpb4gfv9r15xw1fy4vu69ltv` (`job_id`),
  ADD KEY `FKgee1djrxvcvpw1gixam6s14ds` (`student_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FKpgsqitqi4jqkvf4eaolsa3qi9` (`job_id`),
  ADD KEY `FK4b22rgcq8i2wc05710l3hj06f` (`payed_by_id`),
  ADD KEY `FK46ondxno6mkinut1pudf4b1ar` (`payed_to_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FKbu0ubqxb2bkae3dfurbdj3k7j` (`job_id`),
  ADD KEY `FKrxxkeo5xlq721tgwpnyfx326i` (`reviewee_id`),
  ADD KEY `FKt58e9mdgxpl7j90ketlaosmx4` (`reviewer_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`),
  ADD UNIQUE KEY `UK5ljf2l2h4odhtxrsuohlro4ir` (`name`);

--
-- Indexes for table `take_job`
--
ALTER TABLE `take_job`
  ADD PRIMARY KEY (`take_job_id`),
  ADD KEY `FK41v3iecvqsb9qy38ovjfdh6ua` (`job_id`),
  ADD KEY `FK6d9s4ytlg1pj43kv7o650lw5e` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  ADD UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD UNIQUE KEY `UK8225o602bb6ge0ufvlmj7ojae` (`university_email`),
  ADD UNIQUE KEY `UKewuneal2mvmh1nn3tw036acir` (`institution_code`),
  ADD UNIQUE KEY `UK5dswpv19v0n0qaev9kn37h8c2` (`institution_name`),
  ADD UNIQUE KEY `UKftitle1t4hnrwckp5cjbl6nt5` (`nid_card_number`),
  ADD UNIQUE KEY `UKi1pkkkteed13wt581o8vanlx8` (`student_id`);

--
-- Indexes for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD PRIMARY KEY (`user_skill_id`),
  ADD KEY `FKj53flyds4vknyh8llw5d7jdop` (`skill_id`),
  ADD KEY `FKfixgsonf2ev168mfck7co17u1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drop_job`
--
ALTER TABLE `drop_job`
  MODIFY `drop_job_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `take_job`
--
ALTER TABLE `take_job`
  MODIFY `take_job_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_skill`
--
ALTER TABLE `user_skill`
  MODIFY `user_skill_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drop_job`
--
ALTER TABLE `drop_job`
  ADD CONSTRAINT `FK6vqyq5u1l86js1c0gu2xd0vcf` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  ADD CONSTRAINT `FKabwp0bw7bin766s9hbuuaggb0` FOREIGN KEY (`sub_admin_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKe0p9gs2dn9gm7pa2x2p58mkib` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK1jtisqv4yk9oxdk2a2qgdnwq6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKgee1djrxvcvpw1gixam6s14ds` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKl6g3348xu9c2q7scpmkh6u98d` FOREIGN KEY (`employer_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKrlpb4gfv9r15xw1fy4vu69ltv` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK46ondxno6mkinut1pudf4b1ar` FOREIGN KEY (`payed_to_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK4b22rgcq8i2wc05710l3hj06f` FOREIGN KEY (`payed_by_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKpgsqitqi4jqkvf4eaolsa3qi9` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FKbu0ubqxb2bkae3dfurbdj3k7j` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  ADD CONSTRAINT `FKrxxkeo5xlq721tgwpnyfx326i` FOREIGN KEY (`reviewee_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKt58e9mdgxpl7j90ketlaosmx4` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `take_job`
--
ALTER TABLE `take_job`
  ADD CONSTRAINT `FK41v3iecvqsb9qy38ovjfdh6ua` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  ADD CONSTRAINT `FK6d9s4ytlg1pj43kv7o650lw5e` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD CONSTRAINT `FKfixgsonf2ev168mfck7co17u1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKj53flyds4vknyh8llw5d7jdop` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
