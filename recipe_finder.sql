-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 07:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`) VALUES
(5, 'arborio rice'),
(1, 'basmati rice'),
(20, 'bell peppers'),
(3, 'biryani masala'),
(26, 'black pepper'),
(13, 'coconut milk'),
(24, 'coriander leaves'),
(11, 'corn'),
(12, 'cream'),
(17, 'cucumber'),
(14, 'curry powder'),
(19, 'feta cheese'),
(21, 'garlic'),
(22, 'ginger'),
(28, 'lemon juice'),
(2, 'mixed vegetables'),
(6, 'mushrooms'),
(25, 'olive oil'),
(18, 'olives'),
(16, 'onions'),
(7, 'parmesan cheese'),
(9, 'pasta'),
(4, 'saffron'),
(27, 'salt'),
(10, 'spinach'),
(15, 'tomatoes'),
(23, 'turmeric'),
(8, 'vegetable stock');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prep_time` int(11) DEFAULT NULL,
  `cooking_time` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `prep_time`, `cooking_time`, `image_url`, `created_at`) VALUES
(1, 'Vegetable Biryani', 'Aromatic Indian rice dish with mixed vegetables and authentic spices', 30, 45, 'veg-biryani.jpg', '2025-01-30 04:59:22'),
(2, 'Mushroom Risotto', 'Creamy Italian rice dish with mushrooms and parmesan cheese', 20, 30, 'mushroom-risotto.jpg', '2025-01-30 04:59:22'),
(3, 'Spinach and Corn Pasta', 'Healthy pasta dish with fresh spinach and sweet corn in creamy sauce', 15, 20, 'spinach-pasta.jpg', '2025-01-30 04:59:22'),
(4, 'Vegetable Curry', 'Rich and spicy mixed vegetable curry with coconut milk', 25, 35, 'veg-curry.jpg', '2025-01-30 04:59:22'),
(5, 'Mediterranean Salad', 'Fresh salad with cucumber, tomatoes, olives, and feta cheese', 15, 0, 'med-salad.jpg', '2025-01-30 04:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_id`, `ingredient_id`, `quantity`) VALUES
(1, 1, '2 cups'),
(1, 2, '2 cups'),
(1, 3, '2 tbsp'),
(1, 4, '1/4 tsp'),
(1, 21, '4 cloves'),
(1, 22, '1 inch'),
(2, 5, '1.5 cups'),
(2, 6, '300g'),
(2, 7, '1/2 cup'),
(2, 8, '4 cups'),
(2, 21, '2 cloves'),
(3, 9, '250g'),
(3, 10, '2 cups'),
(3, 11, '1 cup'),
(3, 12, '1 cup'),
(3, 26, '1 tsp'),
(4, 2, '3 cups'),
(4, 13, '400ml'),
(4, 14, '2 tbsp'),
(4, 15, '2 medium'),
(4, 16, '1 large'),
(5, 15, '2 medium'),
(5, 17, '1 large'),
(5, 18, '1/2 cup'),
(5, 19, '100g'),
(5, 25, '2 tbsp'),
(5, 28, '2 tbsp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
