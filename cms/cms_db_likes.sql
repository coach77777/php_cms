-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3309
-- Generation Time: Sep 13, 2022 at 06:31 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_db_likes`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `user_id`, `cat_title`) VALUES
(48, 29, 'PHP'),
(52, 28, 'Javascript'),
(53, 35, 'Java'),
(54, 35, 'Python'),
(55, 35, 'CSS');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(2, 139, 'Edwin', 'edwin@gmail.com', 'hello', 'approved', '2018-01-19'),
(3, 139, 'Edwin', 'edwin@gmail.com', 'hellosss', 'approved', '2018-01-19'),
(4, 161, 'craig', 'cn60@hotmail.com', 'intelligente y guapo. Buyo con Dias.', 'approved', '2022-09-01'),
(5, 161, 'pete', 'pete@gmail.com', 'test comment count should be one.', 'unapproved', '2022-09-04'),
(6, 161, 'pete', 'pete@gmail.com', 'bueno', 'approved', '2022-09-04'),
(7, 162, 'pete', 'pete@gmail.com', 'test', 'approved', '2022-09-04'),
(8, 162, 'pete', 'pete@gmail.com', 'test', 'approved', '2022-09-04');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(18, 28, 140),
(22, 29, 139),
(24, 28, 147),
(25, 28, 139),
(26, 28, 161),
(32, 29, 161),
(33, 37, 161);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` varchar(255) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `user_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`) VALUES
(161, 48, 28, 'Volvo', '', 'craig', '2022-09-12', 'volvo.jpg', 'Hello!! TEST POST for PHP CMS', 'Hello!! TEST POST for PHP CMS', '', 'published', 332, 3),
(162, 52, 35, 'Rolls!', '', 'craig', '2022-09-01', 'DSC05830.JPG', 'My favorite car is Rolls Royc3. this is a cool car also.', 'cool cars, favorite car', '', 'published', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22',
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`, `token`) VALUES
(28, 'edwin', '$2y$12$zPbnnWlotLzv2dy7E7kRPe0R84y822BlSD/d.12AyYYFavHQE8XZ.', 'Edwin', 'Diaz', 'edwin@edwindiaz.com', '', 'admin', '$2y$10$iusesomecrazystrings22', ''),
(35, 'craig', '$2y$12$gcvrqM1S8WAaxVqL.qZtIusBsXMm10VYXwG4Q8uo59npaSDoOGuYu', 'Craig', 'Nelson', 'cn60@hotmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22', ''),
(37, 'pete', '$2y$10$10DGmY1sLaRKL2tnfUo/Xuib/uPrpYKmettXa8JKrbaysG9BG7aiW', 'pete', 'pete', 'pete@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(44, '', 1447434996),
(45, 's47g806mg6788i92u5ogm6kqi4', 1447441570),
(46, '72clfovqk7vo2p8fiii26tkmr4', 1447461586),
(47, '3gs3q67k5ntpma8tbp2kuvof23', 1447691896),
(48, 'bouqd4fslhn2b1nv20k559col1', 1447796024),
(49, 'tign71tbpar4di74k13f8nr022', 1447867949),
(50, 'ju0s1j019d1qlc1q4tb703rgm3', 1447880891),
(51, 'tp6khbvgo4hdlfueekpmaefcu0', 1447952096),
(52, 'kv0klvlajm8j50d3uqt6go4bm6', 1448174347),
(53, 'qsdv073j4c3lqd6m0rtdpg3615', 1448296313),
(54, 'tmliedhtcgvi8r96l6qplehos4', 1448292854),
(55, 'vrumjbdrjrauucdhg6cta8hhn6', 1448800892),
(56, 'eb1ae8996caf679d187c1037ec9620b1', 1478098539),
(57, '40780dfe8631b764c435168775d44432', 1479443689),
(58, '6d9081fbf0106e9bfef3e77f6fa68f8a', 1481004509),
(59, 'b57212ad3e92b65c05d8ddcd1805a370', 1481382178),
(60, '3cf8d2b7eb470cb635a6102868ae9bd6', 1481397855),
(61, 'c7e0ac8eeeaaf5d3ac4329af9bf4b777', 1481685807),
(62, 'b50a5d9ab4b00848c009d472c63ae2cd', 1485830805),
(63, '3ef98f25d1b1762dd799f33b1a2b2657', 1499988384),
(64, '229f256600c1d05e81bd5036d941069a', 1499993069),
(65, '34aea21ebd8d1ae1b572236a4783cbad', 1500065466),
(66, '785773965af3236b1c2cf0b9661706a5', 1500564176),
(67, 'ec914205500203ca58c0d70ab4325eac', 1501215419),
(68, '05b2dd2fea94f34f565cf8b9109152dc', 1501785425),
(69, '5f156703e5bf0ddc08eb1752deceabc4', 1501902739),
(70, '37e92fb87d44d9585ce02c017eb4ffca', 1502169396),
(71, 'db0f50ca1aed7d57ac3474f7578c163d', 1503683360),
(72, '7f7edff4687c47c7b0ca682e412e0e7f', 1506728103),
(73, 'f09929ec653715c022ef799348b41299', 1506815658),
(74, '3340c268ea471ad8372b6cf8e36a459e', 1509893815),
(75, 'fa9bc9b6e1e6a4a84b28d6e2f3f5df00', 1510326424),
(76, '5a2b356546dbae5def67ad2958fd2140', 1513025931),
(77, '1ccc6c361aa9b37fa9ef8df7991105a7', 1514422852),
(78, '27115787187b5e547aad0e462fe0c4a0', 1516369447),
(79, '7713299c73c346b5e503ce8bccee6326', 1516375343),
(80, 'ab98eaeb7d4c0fc98d78f62778ca838b', 1516761247),
(81, 'fed44de77f69c38e0d855d7019e697d8', 1521333533),
(82, 'baa6f2f248dda9071e0d3eda7a31a758', 1523055319),
(83, 'd382958313e3521b1e54220601a4019c', 1530209264),
(84, 'af7ef70f627451cb5d392b29095b6298', 1530207146),
(85, 'fe93aaeeea3cb5338362efd4250eb1e5', 1530207054),
(86, '71e5bd62dd28c295eb86141ba76971d8', 1530649651),
(87, '61b259a519bb385e68d1cd261dd49200', 1530394826),
(88, '56b75a929b7cb47898580fe432242f79', 1530394096),
(89, '274bf4ed05eda4160ccf82d2887385c0', 1530797817),
(90, '32bbfbaec3ad8edb113f6ca4a3d5ad98', 1531006286),
(91, '699a013a506bddcf6d803db1e42d4404', 1535579855),
(92, '5ccd3bd786afcd4b3653c30cd30fcd09', 1535579855),
(93, 'aac8efb64898b78d77f2d932757fdf9a', 1535735974),
(94, 'bc19073bbaf3da9c41b9fffcda8b137b', 1535738502),
(95, '861ac5f094f1e8ca25ea93eb09349027', 1547584256),
(96, '9kcj4s5oc4b8qr82ju0om9aecu', 1662084502),
(97, 'aopktml5664vb151gicddusht5', 1662311201),
(98, 'q3iqvgbobq7iuurbl41qrq4jug', 1663041116);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
