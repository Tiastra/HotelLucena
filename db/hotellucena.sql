-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/05/2020 às 04:49
-- Versão do servidor: 10.4.11-MariaDB
-- Versão do PHP: 7.4.4

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
-- Estrutura para tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `idApartamento` int(11) NOT NULL,
  `codigoApartamento` int(11) DEFAULT NULL,
  `categoria_codigoCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `apartamento`
--

INSERT INTO `apartamento` (`idApartamento`, `codigoApartamento`, `categoria_codigoCategoria`) VALUES
(1, 101, 1),
(2, 102, 1),
(3, 201, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigoCategoria` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `tipoCategoria` varchar(255) DEFAULT NULL,
  `valorDiaria` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`codigoCategoria`, `capacidade`, `tipoCategoria`, `valorDiaria`) VALUES
(1, 2, 'A1', 300),
(2, 3, 'A2', 450);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE `item` (
  `idItem` int(11) NOT NULL,
  `codItem` int(11) DEFAULT NULL,
  `nomeItem` varchar(255) DEFAULT NULL,
  `descricaoItem` varchar(255) DEFAULT NULL,
  `valorItem` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `item`
--

INSERT INTO `item` (`idItem`, `codItem`, `nomeItem`, `descricaoItem`, `valorItem`) VALUES
(2, 1, 'Dolly Guarana', 'pet 200ml', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
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

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`codigoReserva`, `dataEntrada`, `dataSaida`, `numeroHospedes`, `status`, `valorPago`, `Apartamento_codigoApartamento`, `usuarios_codUsuario`) VALUES
(1, '2020-05-26', '2020-05-28', 3, 'Concluído', 450, 101, 23),
(2, '2020-05-29', '2020-05-31', 2, 'reservado', 300, 101, 23),
(3, '2020-06-05', '2020-06-07', 2, 'reservado', 300, 101, 23);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
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
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `codUsuario`, `contatoUsuario`, `emailUsuario`, `nomeUsuario`, `tipoUsuariol`) VALUES
(3, 0, '984291559', 'carlostiagojf@hotmail.com', 'Tiago Oliveira', 'Gerente'),
(4, 0, '984266544', 'asd', 'teste', 'Gerente'),
(5, 2, '145235234524', 'aaa', 'Pablo', 'Cliente'),
(6, 3, '984291559', 'sss', 'gerin', 'Atendente'),
(7, 23, '45354664432', 'email@asd.br', 'Mario', 'Cliente');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`idApartamento`),
  ADD KEY `FK_Apartamento_categoria_codigoCategoria` (`categoria_codigoCategoria`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigoCategoria`);

--
-- Índices de tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`codigoReserva`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `apartamento`
--
ALTER TABLE `apartamento`
  MODIFY `idApartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigoCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `codigoReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `FK_Apartamento_categoria_codigoCategoria` FOREIGN KEY (`categoria_codigoCategoria`) REFERENCES `categoria` (`codigoCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
