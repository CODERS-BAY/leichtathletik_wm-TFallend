-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Apr 2021 um 10:42
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `worldcup`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aid`
--

CREATE TABLE `aid` (
  `aid_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `aid`
--

INSERT INTO `aid` (`aid_id`, `first_name`, `last_name`) VALUES
(1, 'Tito', 'Vallencano'),
(2, 'Mercedes', 'Rodriguez');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `athlete`
--

CREATE TABLE `athlete` (
  `athlete_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `nation` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `athlete`
--

INSERT INTO `athlete` (`athlete_id`, `first_name`, `last_name`, `nation`) VALUES
(1, 'Timo', 'Fallend', 'AUT'),
(2, 'Max', 'Mustermann', 'BRA');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `athlete_registration`
--

CREATE TABLE `athlete_registration` (
  `athlete_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `athlete_registration`
--

INSERT INTO `athlete_registration` (`athlete_id`, `event_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `discipline`
--

CREATE TABLE `discipline` (
  `discipline_id` int(11) NOT NULL,
  `discipline_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `discipline`
--

INSERT INTO `discipline` (`discipline_id`, `discipline_name`) VALUES
(1, '100-Meter Lauf'),
(2, 'Weitsprung'),
(3, 'Speerwerfen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `discipline_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`event_id`, `event_date`, `time`, `discipline_id`, `location_id`) VALUES
(1, '2021-05-01', '10:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_aid_list`
--

CREATE TABLE `event_aid_list` (
  `event_id` int(11) NOT NULL,
  `aid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `event_aid_list`
--

INSERT INTO `event_aid_list` (`event_id`, `aid_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `city`, `street`, `postal_code`) VALUES
(1, 'Linz', 'Froschberg 1', '4020'),
(2, 'Wien', 'Ernst-Happel-Stadion 1', '1010');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referee`
--

CREATE TABLE `referee` (
  `aid_id` int(11) NOT NULL,
  `level` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `referee`
--

INSERT INTO `referee` (`aid_id`, `level`) VALUES
(1, 'A');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `result_value` decimal(10,2) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `athlete_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `result`
--

INSERT INTO `result` (`result_id`, `ranking`, `result_value`, `event_id`, `athlete_id`) VALUES
(1, 1, '11.20', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `steward`
--

CREATE TABLE `steward` (
  `aid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `steward`
--

INSERT INTO `steward` (`aid_id`) VALUES
(2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `aid`
--
ALTER TABLE `aid`
  ADD PRIMARY KEY (`aid_id`);

--
-- Indizes für die Tabelle `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`athlete_id`);

--
-- Indizes für die Tabelle `athlete_registration`
--
ALTER TABLE `athlete_registration`
  ADD PRIMARY KEY (`athlete_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indizes für die Tabelle `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`discipline_id`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `discipline_id` (`discipline_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `event_aid_list`
--
ALTER TABLE `event_aid_list`
  ADD PRIMARY KEY (`event_id`,`aid_id`),
  ADD KEY `aid_id` (`aid_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `referee`
--
ALTER TABLE `referee`
  ADD PRIMARY KEY (`aid_id`);

--
-- Indizes für die Tabelle `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `athlete_id` (`athlete_id`);

--
-- Indizes für die Tabelle `steward`
--
ALTER TABLE `steward`
  ADD PRIMARY KEY (`aid_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `aid`
--
ALTER TABLE `aid`
  MODIFY `aid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `athlete`
--
ALTER TABLE `athlete`
  MODIFY `athlete_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `discipline`
--
ALTER TABLE `discipline`
  MODIFY `discipline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `athlete_registration`
--
ALTER TABLE `athlete_registration`
  ADD CONSTRAINT `athlete_registration_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`athlete_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `athlete_registration_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`discipline_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `event_aid_list`
--
ALTER TABLE `event_aid_list`
  ADD CONSTRAINT `event_aid_list_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_aid_list_ibfk_2` FOREIGN KEY (`aid_id`) REFERENCES `aid` (`aid_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `referee`
--
ALTER TABLE `referee`
  ADD CONSTRAINT `referee_ibfk_1` FOREIGN KEY (`aid_id`) REFERENCES `aid` (`aid_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`athlete_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `steward`
--
ALTER TABLE `steward`
  ADD CONSTRAINT `steward_ibfk_1` FOREIGN KEY (`aid_id`) REFERENCES `aid` (`aid_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
