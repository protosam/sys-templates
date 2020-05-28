DROP TABLE IF EXISTS `mail_domains`;
CREATE TABLE `mail_domains` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`domain_id`),
  UNIQUE KEY `domain_2` (`domain`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `mail_forwardings`;
CREATE TABLE `mail_forwardings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(80) NOT NULL,
  `destination` text NOT NULL,
  `domain` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`),
  KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `mail_transport`;
CREATE TABLE `mail_transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) NOT NULL DEFAULT '',
  `transport` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `mail_users`;
CREATE TABLE `mail_users` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `domain` (`domain`),
  KEY `email` (`email`),
  CONSTRAINT `mail_users_ibfk_1` FOREIGN KEY (`domain`) REFERENCES `mail_domains` (`domain`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
