-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 31 jan. 2023 à 16:54
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `superm`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `utilisateur_id`, `produit_id`, `quantite`, `date`) VALUES
(20, 2, 12, 1, '2023-01-30 00:00:00'),
(21, 2, 11, 1, '2023-01-30 00:00:00'),
(22, 2, 11, 1, '2023-01-30 00:00:00'),
(23, 2, 11, 1, '2023-01-30 00:00:00'),
(24, 2, 11, 1, '2023-01-30 00:00:00'),
(25, 2, 12, 1, '2023-01-30 00:00:00'),
(26, 2, 11, 1, '2023-01-30 00:00:00'),
(27, 4, 11, 1, '2023-01-30 00:00:00'),
(28, 4, 15, 1, '2023-01-30 00:00:00'),
(29, 4, 15, 1, '2023-01-30 00:00:00'),
(30, 4, 10, 1, '2023-01-30 00:00:00'),
(31, 4, 11, 1, '2023-01-30 00:00:00'),
(32, 4, 11, 1, '2023-01-30 00:00:00'),
(33, 4, 10, 2, '2023-01-30 00:00:00'),
(34, 4, 12, 3, '2023-01-30 00:00:00'),
(35, 4, 13, 1, '2023-01-30 00:00:00'),
(36, 4, 10, 2, '2023-01-30 00:00:00'),
(37, 4, 11, 1, '2023-01-30 00:00:00'),
(38, 4, 12, 1, '2023-01-30 00:00:00'),
(39, 4, 15, 3, '2023-01-30 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `image`) VALUES
(9, 'IPHONE', 'Iphone 64GB 4GB ram', '4000.00', 'images/iphone.jpg'),
(10, 'Montre', 'montre pour homme', '230.00', 'images/montre.jpg'),
(11, 'gant', 'gant unisexe', '90.00', 'images/gant.jpg'),
(12, 'Tshirt superman', 'cotton', '65.00', 'images/tshirt.jpg'),
(13, 'anime blocnote', '200page ', '40.00', 'images/book.jpg'),
(14, 'casquette', 'casquette', '55.00', 'images/casquette.jpg'),
(15, 'souris', 'souris sans fil', '145.00', 'images/moussr.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `produit_categories`
--

CREATE TABLE `produit_categories` (
  `produit_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `email`, `mot_de_passe`, `role`) VALUES
(1, 'admin', 'user', 'admin@gmail.com', '1234', 1),
(2, 'user', 'user', 'user@gmail.com', '1234', 2),
(4, 'aiman', 'mouhat', 'aiman@ensem.ac.ma', '1234', 2),
(5, 'hida', 'zakaria', 'zakaria@ensem.ac.ma', '1234', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit_categories`
--
ALTER TABLE `produit_categories`
  ADD KEY `produit_id` (`produit_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `produit_categories`
--
ALTER TABLE `produit_categories`
  ADD CONSTRAINT `produit_categories_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`),
  ADD CONSTRAINT `produit_categories_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
