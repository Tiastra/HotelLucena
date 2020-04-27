-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Abr-2020 às 04:29
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotellucena`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `idApartamento` int(11) NOT NULL,
  `codigoApartamento` int(11) DEFAULT NULL,
  `categoria_codigoCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `apartamento`
--

INSERT INTO `apartamento` (`idApartamento`, `codigoApartamento`, `categoria_codigoCategoria`) VALUES
(1, 101, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigoCategoria` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `tipoCategoria` varchar(255) DEFAULT NULL,
  `valorDiaria` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`codigoCategoria`, `capacidade`, `tipoCategoria`, `valorDiaria`) VALUES
(1, 2, 'A1', 300);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `idItem` int(11) NOT NULL,
  `codItem` int(11) DEFAULT NULL,
  `nomeItem` varchar(255) DEFAULT NULL,
  `descricaoItem` varchar(255) DEFAULT NULL,
  `valorItem` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`idItem`, `codItem`, `nomeItem`, `descricaoItem`, `valorItem`) VALUES
(2, 1, 'Dolly Guarana', 'pet 200ml', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `codigoReserva` int(11) NOT NULL,
  `dataEntrada` date DEFAULT NULL,
  `dataSaida` date DEFAULT NULL,
  `numeroHospedes` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `valorPago` double DEFAULT NULL,
  `Apartamento_codigoApartamento` int(11) DEFAULT NULL,
  `usuarios_codUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `codUsuario` int(11) DEFAULT NULL,
  `contatoUsuario` varchar(255) DEFAULT NULL,
  `emailUsuario` varchar(50) NOT NULL,
  `nomeUsuario` varchar(255) DEFAULT NULL,
  `tipoUsuariol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `codUsuario`, `contatoUsuario`, `emailUsuario`, `nomeUsuario`, `tipoUsuariol`) VALUES
(3, 0, '984291559', 'carlostiagojf@hotmail.com', 'Tiago Oliveira', 'Gerente'),
(4, 0, '984266544', 'asd', 'teste', 'Gerente'),
(5, 2, '145235234524', 'aaa', 'Pablo', 'Cliente'),
(6, 3, '984291559', 'sss', 'gerin', 'Atendente');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`idApartamento`),
  ADD KEY `FK_Apartamento_categoria_codigoCategoria` (`categoria_codigoCategoria`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigoCategoria`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`codigoReserva`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `apartamento`
--
ALTER TABLE `apartamento`
  MODIFY `idApartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigoCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `codigoReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `FK_Apartamento_categoria_codigoCategoria` FOREIGN KEY (`categoria_codigoCategoria`) REFERENCES `categoria` (`codigoCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
