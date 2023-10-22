-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 05:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coficab`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `id_reponse` int(11) DEFAULT NULL,
  `Probleme_Resultat` varchar(2000) DEFAULT NULL,
  `Causes_Creation` varchar(2000) DEFAULT NULL,
  `Actions_Correctives` varchar(2000) DEFAULT NULL,
  `Status` varchar(2000) DEFAULT NULL,
  `Resp` timestamp NULL DEFAULT NULL,
  `responsable` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `id_reponse`, `Probleme_Resultat`, `Causes_Creation`, `Actions_Correctives`, `Status`, `Resp`, `responsable`) VALUES
(38, 254, 'u', 'j', 'j', 'En cours', '2023-08-05 14:30:00', 'j'),
(40, 258, 'questionn 134567890\'', 'questionn 134567890\'', 'questionn 134567890\'', 'Clôturé', '2023-08-12 13:27:00', 'questionn 134567890\'');

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` int(11) NOT NULL,
  `id_check_list` int(11) DEFAULT NULL,
  `auditeur` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_realisation` timestamp NULL DEFAULT NULL,
  `date_limite` timestamp NULL DEFAULT NULL,
  `score` float DEFAULT NULL,
  `niveau` enum('A','B','C','') DEFAULT NULL,
  `machine` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `id_check_list`, `auditeur`, `date_creation`, `date_realisation`, `date_limite`, `score`, `niveau`, `machine`) VALUES
(32, 1, 'ae234', '2023-08-01 14:29:00', '2023-08-31 14:30:44', '2023-08-30 23:00:00', 100, 'A', ''),
(33, 1, 'ae234', '2023-08-01 14:30:00', '2023-08-31 14:30:59', '2023-08-30 23:00:00', 0, 'C', ''),
(34, 1, 'ae234', '2023-08-01 14:30:00', NULL, '2023-08-11 23:00:00', NULL, NULL, ''),
(35, 1, 'ae234', '2023-08-01 14:30:00', NULL, '2023-08-31 23:00:00', NULL, NULL, ''),
(36, 27, 'ae234', '2023-08-01 14:31:00', '2023-09-06 13:27:47', '2023-08-04 23:00:00', 83.3333, 'B', ''),
(37, 1, 'ae234', '2023-09-06 16:54:00', NULL, '2023-09-28 23:00:00', NULL, NULL, ''),
(39, 1, 'ae234', '2023-09-07 14:54:00', '2023-09-07 15:00:51', '2023-09-07 19:00:00', 100, 'A', 'qwerty'),
(40, 32, 'ae234', '2023-09-09 15:19:00', '2023-09-07 15:33:41', '2023-09-29 23:00:00', 100, 'A', 'M1');

--
-- Triggers `audits`
--
DELIMITER $$
CREATE TRIGGER `delete_reponses` BEFORE DELETE ON `audits` FOR EACH ROW BEGIN
    DELETE FROM reponses
    WHERE id_audit = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `check_lists`
--

CREATE TABLE `check_lists` (
  `id` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `check_lists`
--

INSERT INTO `check_lists` (`id`, `description`) VALUES
(1, '[value-2]'),
(20, 'q'),
(21, 'qq'),
(22, 'w111'),
(26, 'check  list  test_111'),
(27, 'check test_2'),
(29, '[ue-2]'),
(30, 'fg'),
(31, 'test__________________________________________________________-t'),
(32, 'PROCESS/PRODUIT CHECK-LIST LPA/LINE WALK - LAPIDAIRE');

--
-- Triggers `check_lists`
--
DELIMITER $$
CREATE TRIGGER `delete_sections` BEFORE DELETE ON `check_lists` FOR EACH ROW BEGIN
    DELETE FROM sections 
    WHERE id_check_list = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `id_section` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `id_section`, `description`) VALUES
(27, 23, 'qqq'),
(28, 23, 'qqqqq'),
(29, 24, 'qqqqqqqq'),
(35, 31, 'w1'),
(36, 31, 'w2'),
(37, 32, 'ww1'),
(38, 32, 'ww2'),
(39, 32, 'ww3'),
(50, 39, 'question test_1666666666666666666666'),
(51, 40, 'question test_3'),
(52, 40, 'question test_4'),
(53, 39, 'question test_2666666666666666666666666666666666666666'),
(54, 41, 'question test_1'),
(56, 44, 'question 100'),
(57, 44, 'questionn 100'),
(58, 44, 'questionn 134567890\''),
(59, 46, 'w'),
(60, 47, 'qqq'),
(61, 48, 'g'),
(62, 49, 'test111111111111111111111111111111111112222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111A'),
(63, 49, 'test12'),
(64, 49, 'test13'),
(65, 50, 'test21'),
(66, 50, 'test22'),
(67, 51, 'test31'),
(68, 52, 'z'),
(69, 53, ' Les instructions du travail sont-elles disponibles et mises à jour?       (Fiche pilote, PAC Ebauche, Instructions , AVs, et instruction de traitement de produit NC) '),
(70, 54, 'Comparer les quantités reçues avec celles commandées (certificat de validation fournisseur)'),
(71, 54, ' Vérifier s\'il existe un fichier/dossier/application pour chaque filière réceptionnée.'),
(72, 54, ' Les filières du tréfilage doivent être contrôlées en accord avec les spécifications respectives (Diamètre; Ovalisation; Etat de la surface), selon les instructions internes en vigueur)'),
(73, 54, 'Les filières du compactage doivent être contrôlés en accord avec les spécifications respectives (Diamètre; Ovalisation; Etat de la surface), en utilisant le Microscope .'),
(74, 55, 'Vérifier l\'enregistrement des mouvements/ bons pour chaque demande de la production'),
(75, 55, ' Vérifier si le diamètre du fil ébauché est bien controlé après chaque changement de filière, et si l\'enregistrement existe?'),
(76, 56, ' S\'assurer que les outillages sont systèmatiquement vérifié après chaque rectification ou repolissage, en particulier les filières tréfilage et filières de compactage'),
(77, 57, ' Confirmer que pour les outillages jugés non conformes, après une vérification concernant les dimensions ou aspect, le technicien lapidaire enregistre la NC trouvée dans la base de données de chaque filière:        - Filière finisseuse : Si une filière est hors tolérance spécifiée, elle doit être changée; Par contre, si dans un même jeu de filières apparaît 3 valeurs ou plus non conformes, tout le jeu de filière doit être changé et envoyé pour rectification.        - Filières de compactages : Si elle présente une forme irrégulière, ou diamètre NC; doit être Changer immédiatement.      - Filière Extrusion: Si elle présente une forme irrégulière, endommagement près de la surface ou diamètre NC; elle doit être changer immédiatement.          - Guide fil : S\'il présente une forme irrégulière (Ovalisation); diamètre NC; Changement immédiat.  (S\'assurer de la bonne appllication de l\'instruction gestion d\'outillage)*'),
(78, 58, 'Si le stock des filières a atteint le minimum définie; l\'agent Lapidaire doit passer commande en spécifiant la quantité nécessaire avec le support du service IP.'),
(79, 58, 'Vérifier si le stock de sécutité est défini pour chaque référence et s\'il est bien respecté; (Comparer le nombre de filière en stock par réf par rapport au stock de sécurité défini)'),
(80, 58, 'Vérifier si l\'agent Lapidaire effectue un inventaire mensuel sur l\'état du stock des outillages et communique le résultat au responsable hiérarchique.'),
(81, 58, 'Vérifier l’état des guides fil et filières des articles à 7 Brins dans le stock des outillages en mouvement'),
(82, 59, ' Vérifier le respect de la fréquence du contrôle périodique des émulsions (Concentration, Huile utilisée, pH, Température et taux de Bactéries)* '),
(83, 60, 'Les consignes de sécurité sont disponibles et respectées? '),
(84, 60, 'Les équipements de protection collective et individuelle adaptés aux risques (par ex.: Bouchons d\'oreille, Chaussures de sécurité, masques, gants) sont-ils bien utilisés? *'),
(85, 60, ' Les sorties de secours et les équipements de lutte contre l\'incendie sont-ils accessibles, bien visible et opérationnels?'),
(86, 61, 'Les CSR\'s applicables sont-elles mises en œuvre et suivies ?'),
(87, 61, ' Vérifier de l\'état des étiquettes de calibration et d\'étallonnage.');

-- --------------------------------------------------------

--
-- Table structure for table `reponses`
--

CREATE TABLE `reponses` (
  `id` int(11) NOT NULL,
  `id_audit` int(11) DEFAULT NULL,
  `id_question` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reponses`
--

INSERT INTO `reponses` (`id`, `id_audit`, `id_question`, `description`) VALUES
(253, 33, 68, 'Visuel_Conforme'),
(254, 32, 68, 'Visuel_Non Conforme'),
(255, 36, 54, 'Visuel_Conforme'),
(256, 36, 56, 'Visuel_Non Applicable'),
(257, 36, 57, 'Visuel_Conforme'),
(258, 36, 58, 'Non Visuel_Conforme'),
(259, 36, 59, 'Visuel_Conforme'),
(260, 36, 60, 'Visuel_Conforme'),
(261, 39, 68, 'Visuel_Conforme'),
(262, 40, 69, 'Visuel_Conforme'),
(263, 40, 70, 'Visuel_Conforme'),
(264, 40, 71, 'Visuel_Conforme'),
(265, 40, 72, 'Visuel_Conforme'),
(266, 40, 73, 'Visuel_Conforme'),
(267, 40, 74, 'Visuel_Conforme'),
(268, 40, 75, 'Visuel_Conforme'),
(269, 40, 76, 'Visuel_Conforme'),
(270, 40, 77, 'Visuel_Conforme'),
(271, 40, 78, 'Visuel_Conforme'),
(272, 40, 79, 'Visuel_Conforme'),
(273, 40, 80, 'Visuel_Conforme'),
(274, 40, 81, 'Visuel_Conforme'),
(275, 40, 82, 'Visuel_Conforme'),
(276, 40, 83, 'Visuel_Conforme'),
(277, 40, 84, 'Visuel_Conforme'),
(278, 40, 85, 'Visuel_Conforme'),
(279, 40, 86, 'Visuel_Conforme'),
(280, 40, 87, 'Visuel_Conforme');

--
-- Triggers `reponses`
--
DELIMITER $$
CREATE TRIGGER `delete_actions` BEFORE DELETE ON `reponses` FOR EACH ROW BEGIN
    DELETE FROM actions
    WHERE id_reponse = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `id_check_list` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `id_check_list`, `description`) VALUES
(22, 20, 'qq'),
(23, 20, 'qqq'),
(24, 21, 'q'),
(31, 22, 'w'),
(32, 22, 'ww'),
(33, 22, 'www'),
(39, 26, 'section test_3666666666'),
(40, 26, 'section test_4'),
(41, 27, 'sections test_1'),
(44, 27, 'section_100'),
(45, 27, 's102'),
(46, 27, 'q'),
(47, 27, 'qq'),
(48, 30, 's'),
(49, 31, 'test_1'),
(50, 31, 'test_2'),
(51, 31, 'test_3'),
(52, 1, 'zzzzzzzzzzzzzzzz'),
(53, 32, '  Documents'),
(54, 32, ' Gestion d\'outillage  : - Vérification du contrôle d\'outillage à la réception et les conditions de stockage respectives.'),
(55, 32, 'Gestion d\'outillage  : -  Gestion quotidienne des outillages utilisé en production '),
(56, 32, ' Gestion d\'outillage  : - Contrôle d\'outillage après chaque Rectification ou Repolissage'),
(57, 32, ' Gestion d\'outillage  : -  Flux et traitement des outillages non conformes'),
(58, 32, ' Gestion d\'outillage  : - Vérifier la gestion du stock de sécurité'),
(59, 32, 'Gestion des émulsions'),
(60, 32, ' Santé & Sécurité'),
(61, 32, 'Autres Paramètres à vérifier');

--
-- Triggers `sections`
--
DELIMITER $$
CREATE TRIGGER `delete_questions` BEFORE DELETE ON `sections` FOR EACH ROW BEGIN
    DELETE FROM questions
    WHERE id_section = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `CODE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`CODE`) VALUES
('Maroc_Tanger_International'),
('Tunisie_Tunies_CT1'),
('Tunisie_Tunies_CT12'),
('UK_Casa_International');

--
-- Triggers `sites`
--
DELIMITER $$
CREATE TRIGGER `delete_utilisateurs_trigger` BEFORE DELETE ON `sites` FOR EACH ROW BEGIN
    DELETE FROM utilisateurs
    WHERE site = OLD.code;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `desactive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `role`, `matricule`, `email`, `mot_de_passe`, `departement`, `site`, `desactive`) VALUES
(1, 'EJJALILI', 'Medamine', 'admin', 'ae234', 'medamine@coficab.com', '1234', 'INFO', 'UK_Casa_International', 0),
(21, 'qwert', 'qwert', 'qwer', 'asdfgh', 'qwertyu', 'qwerty', 'xcvbn', 'UK_Casa_International', 1),
(22, 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'Maroc_Tanger_International', 1),
(24, '', '', '', '', '', '', '', 'Maroc_Tanger_International', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reponse` (`id_reponse`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_check_list` (`id_check_list`),
  ADD KEY `fk_audits_utilisateurs` (`auditeur`);

--
-- Indexes for table `check_lists`
--
ALTER TABLE `check_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`) USING HASH;

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_section` (`id_section`);

--
-- Indexes for table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_audit` (`id_audit`),
  ADD KEY `id_question` (`id_question`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_check_list` (`id_check_list`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`CODE`) USING BTREE;

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricule` (`matricule`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mot_de_passe` (`mot_de_passe`),
  ADD KEY `fk_utilisateurs_site` (`site`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `check_lists`
--
ALTER TABLE `check_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`id_reponse`) REFERENCES `reponses` (`id`);

--
-- Constraints for table `audits`
--
ALTER TABLE `audits`
  ADD CONSTRAINT `audits_ibfk_1` FOREIGN KEY (`id_check_list`) REFERENCES `check_lists` (`id`),
  ADD CONSTRAINT `audits_ibfk_2` FOREIGN KEY (`auditeur`) REFERENCES `utilisateurs` (`matricule`),
  ADD CONSTRAINT `fk_audits_utilisateurs` FOREIGN KEY (`auditeur`) REFERENCES `utilisateurs` (`matricule`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id`);

--
-- Constraints for table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `reponses_ibfk_1` FOREIGN KEY (`id_audit`) REFERENCES `audits` (`id`),
  ADD CONSTRAINT `reponses_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`id_check_list`) REFERENCES `check_lists` (`id`);

--
-- Constraints for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `fk_utilisateurs_site` FOREIGN KEY (`site`) REFERENCES `sites` (`CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
