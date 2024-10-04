-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 04 oct. 2024 à 12:26
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `anne_sco`
--

CREATE TABLE `anne_sco` (
  `id_an` int(11) NOT NULL,
  `annee` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `anne_sco`
--

INSERT INTO `anne_sco` (`id_an`, `annee`) VALUES
(1, '2024-10-01');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `nom_classe` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom_classe`) VALUES
(1, '6ème M1');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` int(11) NOT NULL,
  `nom` varchar(225) NOT NULL,
  `prenom` varchar(225) NOT NULL,
  `date-nais` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `nom`, `prenom`, `date-nais`) VALUES
(1, 'john', 'die', '2024-10-03 12:16:26');

-- --------------------------------------------------------

--
-- Structure de la table `frais_sco`
--

CREATE TABLE `frais_sco` (
  `id_frais` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_an` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `frais_spe`
--

CREATE TABLE `frais_spe` (
  `id_frais_sp` int(11) DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `id_ins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id_ins` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_an` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id_ins`, `date`, `id_an`, `id_eleve`, `id_classe`, `id_user`) VALUES
(1, '2024-10-06', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Paiement`
--

CREATE TABLE `Paiement` (
  `id_paie` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Paiement`
--

INSERT INTO `Paiement` (`id_paie`, `montant`, `date`, `id_user`, `id_ins`) VALUES
(1, 20000, '2024-10-07', 1, 1),
(2, 170000, '2024-10-12', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(225) NOT NULL,
  `prenom` varchar(225) NOT NULL,
  `type` varchar(20) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `type`, `password`) VALUES
(1, 'jane', 'doe', 'admin', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `anne_sco`
--
ALTER TABLE `anne_sco`
  ADD PRIMARY KEY (`id_an`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleve`);

--
-- Index pour la table `frais_sco`
--
ALTER TABLE `frais_sco`
  ADD KEY `fk_annee_frais` (`id_an`),
  ADD KEY `fk_annee_class` (`id_classe`);

--
-- Index pour la table `frais_spe`
--
ALTER TABLE `frais_spe`
  ADD KEY `fk_ins` (`id_ins`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id_ins`),
  ADD KEY `fk_an` (`id_an`),
  ADD KEY `fk_elves` (`id_eleve`),
  ADD KEY `fk_user` (`id_user`),
  ADD KEY `fk` (`id_classe`);

--
-- Index pour la table `Paiement`
--
ALTER TABLE `Paiement`
  ADD PRIMARY KEY (`id_paie`),
  ADD KEY `fk_users` (`id_user`),
  ADD KEY `fk_inscr` (`id_ins`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `anne_sco`
--
ALTER TABLE `anne_sco`
  MODIFY `id_an` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id_ins` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Paiement`
--
ALTER TABLE `Paiement`
  MODIFY `id_paie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `frais_sco`
--
ALTER TABLE `frais_sco`
  ADD CONSTRAINT `fk_annee_class` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `fk_annee_frais` FOREIGN KEY (`id_an`) REFERENCES `anne_sco` (`id_an`);

--
-- Contraintes pour la table `frais_spe`
--
ALTER TABLE `frais_spe`
  ADD CONSTRAINT `fk_ins` FOREIGN KEY (`id_ins`) REFERENCES `inscription` (`id_ins`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `fk` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `fk_an` FOREIGN KEY (`id_an`) REFERENCES `anne_sco` (`id_an`),
  ADD CONSTRAINT `fk_class` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `fk_elv` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `fk_elves` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `Paiement`
--
ALTER TABLE `Paiement`
  ADD CONSTRAINT `fk_inscr` FOREIGN KEY (`id_ins`) REFERENCES `inscription` (`id_ins`),
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
