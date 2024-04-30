-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 30 2024 г., 08:15
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `files_cloud_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accesses`
--

CREATE TABLE `accesses` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `accesses`
--

INSERT INTO `accesses` (`id`, `file_name`, `file_id`, `full_name`, `email`, `type`, `user_id`) VALUES
(1, 'бережливое производство 2 лаба.drawio.png', 'tl6VaYpkt2', 'asd adminLastName', 'admin1@gmail.com', 'author', 11),
(2, 'forest.jpg', 'v2mWzWkuZo', 'asd adminLastName', 'admin1@gmail.com', 'author', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `name`, `url`, `file_id`, `updated_at`, `created_at`) VALUES
(1, 'бережливое производство 2 лаба.drawio.png', 'http://127.0.0.1:8000/api-file/files/tl6VaYpkt2', 'tl6VaYpkt2', '2024-04-30 06:12:57', '2024-04-30 06:12:57'),
(2, 'forest.jpg', 'http://127.0.0.1:8000/api-file/files/v2mWzWkuZo', 'v2mWzWkuZo', '2024-04-30 06:12:57', '2024-04-30 06:12:57');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'AuthToken', 'f229f4296a49c8db282691131b222b366b8d84b5045cc60f0e261d19860d9fd8', '[\"*\"]', NULL, NULL, '2024-04-24 21:27:05', '2024-04-24 21:27:05'),
(2, 'App\\Models\\User', 2, 'AuthToken', '15da8111cc03d4eead0af2d5f4d80975f25f69331e8f0f7757c6fc254edc8f9e', '[\"*\"]', NULL, NULL, '2024-04-24 21:44:50', '2024-04-24 21:44:50'),
(3, 'App\\Models\\User', 3, 'AuthToken', 'ae6d731380076ed3fde0d4bbf984b6753623f9ed95911e47911a37b6f68e04d5', '[\"*\"]', NULL, NULL, '2024-04-24 21:47:13', '2024-04-24 21:47:13'),
(9, 'App\\Models\\User', 5, 'AuthToken', '3c5e6e33d78fe489a627ed8c0a7c0648eb61536f1c18cef3f2d30e0cbc8c370e', '[\"*\"]', NULL, NULL, '2024-04-24 22:04:06', '2024-04-24 22:04:06'),
(10, 'App\\Models\\User', 6, 'AuthToken', 'b54d58e66638785badcad55a100b1ebab4b350ab53db682eca7c7e232a39a01c', '[\"*\"]', NULL, NULL, '2024-04-24 22:05:23', '2024-04-24 22:05:23'),
(11, 'App\\Models\\User', 7, 'AuthToken', '33406704841ba6813c27f68c66c442145e74f911b7e6cac76d82dfd0e9f0deb2', '[\"*\"]', NULL, NULL, '2024-04-24 22:30:16', '2024-04-24 22:30:16'),
(12, 'App\\Models\\User', 7, 'AuthToken', 'c99d5526cb668417f91e047140cc74671e6e8691a50e52e1daba1563c74d3906', '[\"*\"]', NULL, NULL, '2024-04-24 22:30:42', '2024-04-24 22:30:42'),
(13, 'App\\Models\\User', 7, 'AuthToken', '47a4d24b770af8e64ee30690d01efdc73f8fd5f057c1b315065360c92375a11e', '[\"*\"]', NULL, NULL, '2024-04-24 22:30:50', '2024-04-24 22:30:50'),
(14, 'App\\Models\\User', 7, 'AuthToken', '5ff9e770c6e6ee56359dcea86792dc56839944619eae93532123318e9ca86a44', '[\"*\"]', NULL, NULL, '2024-04-24 22:31:27', '2024-04-24 22:31:27'),
(15, 'App\\Models\\User', 8, 'AuthToken', '21d53d4b06ddb7a90cd81fab69ecf1a24a108d3f83c85e2f194841140ff648ff', '[\"*\"]', NULL, NULL, '2024-04-24 22:31:32', '2024-04-24 22:31:32'),
(16, 'App\\Models\\User', 9, 'AuthToken', 'd75be37a96777feb4d7b868b93de13bd543b5466eeb861d959dd7e25a6942baf', '[\"*\"]', NULL, NULL, '2024-04-24 22:32:21', '2024-04-24 22:32:21'),
(20, 'App\\Models\\User', 10, 'AuthToken', '0311ee1a4f55dc02f4dd4f5421e61de984219191aecd77fffd4aefac60deb052', '[\"*\"]', NULL, NULL, '2024-04-24 22:42:28', '2024-04-24 22:42:28'),
(21, 'App\\Models\\User', 10, 'AuthToken', 'b61187474f8673c6794e17c9d08fd6017dcefd80bc838987747f3001dee2924c', '[\"*\"]', '2024-04-28 18:49:05', NULL, '2024-04-25 19:54:58', '2024-04-28 18:49:05'),
(22, 'App\\Models\\User', 10, 'AuthToken', '337e69986eaaeca4ceaf7c822e9f8b633c090009f2328b52eaeb562eaea1a4c3', '[\"*\"]', '2024-04-29 21:57:31', NULL, '2024-04-28 18:47:08', '2024-04-29 21:57:31'),
(23, 'App\\Models\\User', 11, 'AuthToken', 'dc79724076836ef04113226082f513d14c91bf586dd7e5c1bc74fe1035afc186', '[\"*\"]', NULL, NULL, '2024-04-28 20:50:55', '2024-04-28 20:50:55'),
(24, 'App\\Models\\User', 11, 'AuthToken', 'a37c9161562b421d1571c90f8905e9374203c4f1de03f67e5f77c59d4a22e1e9', '[\"*\"]', '2024-04-28 20:58:50', NULL, '2024-04-28 20:51:12', '2024-04-28 20:58:50'),
(25, 'App\\Models\\User', 11, 'AuthToken', '71439e4fce874f76cec016240352e5207a92095d3d24bd59d0c23d0d9615f789', '[\"*\"]', '2024-04-29 20:25:10', NULL, '2024-04-29 20:15:03', '2024-04-29 20:25:10'),
(26, 'App\\Models\\User', 11, 'AuthToken', '4688d4048715080ad86ff97c29f2bcb1462baea8f7253e75fba8dba96fae7048', '[\"*\"]', '2024-04-29 21:06:49', NULL, '2024-04-29 20:35:07', '2024-04-29 21:06:49'),
(27, 'App\\Models\\User', 10, 'AuthToken', 'a4e738f024c5c9f65786f06e238ca4098f4c7a0da788751ae3e32674c4a65adc', '[\"*\"]', '2024-04-29 21:08:58', NULL, '2024-04-29 21:07:19', '2024-04-29 21:08:58'),
(28, 'App\\Models\\User', 11, 'AuthToken', 'fd7827fe4e4eb771a37516e49d6931a4bb14a860bfed40c5adefe7cf2b7bfcf0', '[\"*\"]', '2024-04-29 21:10:34', NULL, '2024-04-29 21:09:12', '2024-04-29 21:10:34'),
(29, 'App\\Models\\User', 10, 'AuthToken', '05ceb4177e2ea6cb9427a0fe3e537e7ad883e19e264d59f5f3cd0a69b0dfe63f', '[\"*\"]', '2024-04-29 21:13:24', NULL, '2024-04-29 21:10:49', '2024-04-29 21:13:24'),
(30, 'App\\Models\\User', 10, 'AuthToken', '555142046143a3bf07914647945da5050d24d6a1a3dd962cbf6d87ce3172dada', '[\"*\"]', '2024-04-29 21:13:52', NULL, '2024-04-29 21:13:47', '2024-04-29 21:13:52'),
(31, 'App\\Models\\User', 11, 'AuthToken', '059c4e00384f64a0561deaa2d341192376fd91cc69d8fbc22f8ca3a4eb3177cc', '[\"*\"]', '2024-04-29 21:34:21', NULL, '2024-04-29 21:13:58', '2024-04-29 21:34:21'),
(32, 'App\\Models\\User', 11, 'AuthToken', 'c7eee880fe3ea39192ad272ad514a053fb97525ec28e6985d4ba151e9820291c', '[\"*\"]', '2024-04-29 21:45:30', NULL, '2024-04-29 21:41:19', '2024-04-29 21:45:30'),
(33, 'App\\Models\\User', 11, 'AuthToken', '98746b6d89b2f1edecf720e688f516f7023dc95fe2fc0198a6c47c928e7615de', '[\"*\"]', '2024-04-29 22:51:52', NULL, '2024-04-29 21:49:30', '2024-04-29 22:51:52'),
(34, 'App\\Models\\User', 11, 'AuthToken', 'ad1c5cdb2d411532a403d559a77f6019cfcfcedfdb1f2fd80a3a992daece22e2', '[\"*\"]', '2024-04-29 23:13:47', NULL, '2024-04-29 23:09:10', '2024-04-29 23:13:47');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`type_id`, `name`) VALUES
(1, 'author'),
(2, 'co-author');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `updated_at`, `created_at`) VALUES
(10, 'admin@gmail.com', '$2y$12$xjA21eRZeWPVgrx1OdDmSO1y5gonHBt0.2ccV1OiiYy5kjce4lKwy', 'adminName', 'adminLastName', '2024-04-25 05:37:51', '2024-04-25 05:37:51'),
(11, 'admin1@gmail.com', '$2y$12$GsQ0QxdsgPExxl.d.OdKBezemF65G3Yphs/cbZGjXl2hId0lahCru', 'asd', 'adminLastName', '2024-04-29 03:50:55', '2024-04-29 03:50:55');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accesses`
--
ALTER TABLE `accesses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_id` (`file_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accesses`
--
ALTER TABLE `accesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accesses`
--
ALTER TABLE `accesses`
  ADD CONSTRAINT `accesses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `accesses_ibfk_3` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `accesses_ibfk_4` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  ADD CONSTRAINT `accesses_ibfk_5` FOREIGN KEY (`type`) REFERENCES `types` (`name`),
  ADD CONSTRAINT `accesses_ibfk_6` FOREIGN KEY (`file_name`) REFERENCES `files` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
