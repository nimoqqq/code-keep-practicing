CREATE TABLE `users` (
                         `id` bigint(20) NOT NULL AUTO_INCREMENT,
                         `username` varchar(50) NOT NULL,
                         `password` varchar(60) NOT NULL,
                         `enable` tinyint(4) NOT NULL DEFAULT 1,
                         `roles` text character set utf8,
                         PRIMARY KEY (`id`),
                         KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;