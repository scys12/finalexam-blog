START
TRANSACTION;

CREATE TABLE `users`
(
  `id` bigint
(20) UNSIGNED NOT NULL,
  `name` varchar
(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar
(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar
(191) COLLATE utf8mb4_unicode_ci NOT NULL  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `users`
ADD PRIMARY KEY
(`id`),
ADD UNIQUE KEY `users_email_unique`
(`email`);

ALTER TABLE `users` MODIFY `id` bigint
(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;