CREATE DATABASE `sample` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
GRANT ALL ON *.* TO 'demo'@'%';
FLUSH PRIVILEGES;

USE `sample`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `project` varchar(64),
  PRIMARY KEY (`id`),
  UNIQUE KEY (`username`)
) ENGINE=InnoDB;

INSERT INTO `users` VALUES (1, 'admin', PASSWORD('123456'), null);
