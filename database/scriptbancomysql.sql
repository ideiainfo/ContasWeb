-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           5.7.24 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para cpagrec
CREATE DATABASE IF NOT EXISTS `cpagrec` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cpagrec`;

-- Copiando estrutura para tabela cpagrec.conta
CREATE TABLE IF NOT EXISTS `conta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `grupo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cpagrec.conta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` (`id`, `codigo`, `descricao`, `tipo`, `grupo`) VALUES
	(1, 1, 'Conta de energia elétrca', 'Despesa', 1),
	(2, 2, 'Conta de Água', 'Despesa', 1),
	(3, 3, 'Compra de Papel A4', 'Despesa', 2),
	(4, 5, 'Adiantamento de Salário', 'Despesa', 5);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;

-- Copiando estrutura para tabela cpagrec.grupoconta
CREATE TABLE IF NOT EXISTS `grupoconta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(100) NOT NULL DEFAULT '0',
  `tipo` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cpagrec.grupoconta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `grupoconta` DISABLE KEYS */;
INSERT INTO `grupoconta` (`id`, `codigo`, `descricao`, `tipo`) VALUES
	(1, 1, 'Despesa de Imóvel', 'Despesa'),
	(2, 2, 'Material de Expediente', 'Despesa'),
	(3, 3, 'Vendas', 'Receita'),
	(4, 4, 'Serviços ', 'Receita'),
	(5, 5, 'Despesa com pessoal', 'Despesas');
/*!40000 ALTER TABLE `grupoconta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
