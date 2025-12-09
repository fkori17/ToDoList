-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 09. 11:01
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `todolistdb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_20_100849_create_personal_access_tokens_table', 1),
(5, '2025_10_20_100923_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `assigned_to` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `is_completed`, `assigned_to`, `created_at`, `updated_at`) VALUES
(31, 'Fix login bug', 'Resolve issue where users cannot log in with Google accounts.', 0, 'anna.kovacs', '2025-09-22 12:11:03', '2025-09-23 08:45:18'),
(32, 'Write documentation', 'Prepare API documentation for the new endpoints.', 1, 'balazs.nagy', '2025-06-05 07:14:42', '2025-06-06 09:22:54'),
(33, 'Design homepage', 'Create a new homepage layout in Figma.', 0, 'tamas.toth', '2025-05-13 17:45:10', '2025-05-14 06:10:23'),
(34, 'Database migration', 'Add new columns to the users table.', 1, 'viktor.szabo', '2025-08-01 11:28:56', '2025-08-02 08:20:19'),
(35, 'Optimize queries', 'Review and optimize slow SQL queries.', 0, 'eszter.kelemen', '2025-07-12 13:33:27', '2025-07-13 07:05:11'),
(36, 'Deploy to staging', 'Deploy the current build to staging environment.', 1, 'david.horvath', '2025-04-28 15:42:33', '2025-04-29 06:55:00'),
(37, 'Code review', 'Review the latest merge requests on GitHub.', 0, 'andrea.kiss', '2025-08-19 12:25:44', '2025-08-20 08:31:12'),
(38, 'Setup CI/CD', 'Configure GitHub Actions for automated testing.', 1, 'peter.molnar', '2025-10-09 07:21:00', '2025-10-10 05:52:35'),
(39, 'Fix CSS issues', 'Adjust margins and paddings on mobile view.', 0, 'noemi.szabo', '2025-07-04 09:22:18', '2025-07-05 08:05:47'),
(40, 'Add unit tests', 'Write tests for user authentication module.', 0, 'laszlo.farkas', '2025-05-31 16:44:59', '2025-06-01 05:39:12'),
(41, 'Prepare presentation', 'Create slides for the client meeting.', 1, 'zsofia.balogh', '2025-06-28 10:31:21', '2025-06-29 06:42:01'),
(42, 'Update dependencies', 'Run composer update and fix any issues.', 1, 'gergely.marton', '2025-07-09 13:52:16', '2025-07-10 07:18:22'),
(43, 'Refactor controller', 'Simplify the logic in TaskController.', 0, 'beata.molnar', '2025-09-11 07:41:25', '2025-09-12 08:01:48'),
(44, 'Fix email templates', 'Correct typos and formatting in email views.', 1, 'robert.torok', '2025-05-02 12:50:30', '2025-05-03 05:05:55'),
(45, 'Add dark mode', 'Implement dark mode toggle in settings.', 0, 'katalin.kovacs', '2025-10-17 06:11:42', '2025-10-18 07:25:10'),
(46, 'Improve performance', 'Add caching for dashboard stats.', 1, 'adam.simon', '2025-09-01 15:05:37', '2025-09-02 05:33:19'),
(47, 'Create seeders', 'Generate database seeders for testing.', 0, 'monika.varga', '2025-06-21 07:44:58', '2025-06-22 08:11:17'),
(48, 'Write blog post', 'Draft new blog article about Laravel 11 features.', 1, 'milan.kertesz', '2025-08-27 17:01:05', '2025-08-28 07:20:49'),
(49, 'Setup Redis', 'Integrate Redis caching for sessions.', 0, 'orsolya.szucs', '2025-05-24 06:18:44', '2025-05-25 07:37:13'),
(50, 'Fix validation', 'Update form validation rules for registration.', 1, 'dora.kovacs', '2025-10-06 09:31:50', '2025-10-07 06:09:41'),
(51, 'Configure Nginx', 'Optimize Nginx settings for production.', 0, 'norbert.marton', '2025-09-07 11:15:11', '2025-09-08 06:49:20'),
(52, 'Implement search', 'Add full-text search to the tasks module.', 1, 'balazs.nagy', '2025-04-26 15:59:24', '2025-04-27 07:18:40'),
(53, 'Clean up codebase', 'Remove unused imports and debug statements.', 0, 'endre.nagy', '2025-05-09 10:30:19', '2025-05-10 07:44:07'),
(54, 'Security audit', 'Run security scan and fix vulnerabilities.', 1, 'balazs.nagy', '2025-08-11 13:11:06', '2025-08-12 08:29:55'),
(55, 'Set up analytics', 'Add Google Analytics tracking to dashboard.', 0, 'geza.kovacs', '2025-07-25 08:39:15', '2025-07-26 06:55:23'),
(56, 'Review UX', 'Collect feedback on new UI elements.', 1, 'zsuzsa.papp', '2025-06-16 14:28:17', '2025-06-17 07:59:03'),
(57, 'Fix timezone issue', 'Ensure timestamps are saved in UTC.', 0, 'janos.szabo', '2025-05-19 12:57:44', '2025-05-20 07:16:40'),
(58, 'Add notifications', 'Implement push notifications for new tasks.', 1, 'maria.lukacs', '2025-09-26 16:41:12', '2025-09-27 07:10:36'),
(59, 'Integrate Stripe', 'Add Stripe payment integration.', 0, 'gabor.horvath', '2025-06-10 07:33:51', '2025-06-11 06:29:25'),
(60, 'Polish UI', 'Fine-tune button styles and colors.', 1, 'edit.toth', '2025-10-15 08:55:37', '2025-10-16 07:01:03'),
(61, 'Add multi-language', 'Implement localization for English and Hungarian.', 0, 'andras.kovacs', '2025-08-23 13:14:28', '2025-08-24 07:12:09'),
(62, 'Improve tests', 'Increase test coverage to 90%.', 1, 'ivett.varga', '2025-04-30 10:27:10', '2025-05-01 07:22:00'),
(63, 'Setup Docker', 'Add Dockerfile for local development.', 0, 'tibor.marton', '2025-09-29 06:10:22', '2025-09-30 08:44:37'),
(64, 'Fix image upload', 'Resolve issues with large image uploads.', 1, 'krisztina.nagy', '2025-05-27 12:59:11', '2025-05-28 07:18:03'),
(65, 'Enhance logging', 'Add more detailed error logging.', 0, 'attila.kiss', '2025-06-14 07:33:55', '2025-06-15 06:55:27'),
(66, 'Review pull requests', 'Check open PRs and merge approved ones.', 1, 'alexandra.toth', '2025-10-02 09:49:38', '2025-10-03 06:14:10'),
(67, 'Fix search bug', 'Search returns duplicate results under certain conditions.', 0, 'gergo.kovacs', '2025-07-07 08:28:05', '2025-07-08 07:45:30'),
(68, 'Setup monitoring', 'Add uptime monitoring for main services.', 1, 'ildiko.balogh', '2025-09-18 14:33:49', '2025-09-19 07:51:22'),
(69, 'Clean cache system', 'Remove stale cache entries from Redis.', 0, 'rita.szabo', '2025-04-22 13:17:23', '2025-04-23 07:26:44'),
(70, 'Update frontend libs', 'Upgrade Vue.js and Tailwind CSS to latest versions.', 1, 'gergely.marton', '2025-08-15 11:49:19', '2025-08-16 06:57:36');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- A tábla indexei `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- A tábla indexei `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
