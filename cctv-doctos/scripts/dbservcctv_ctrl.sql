-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2021 a las 17:58:12
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbservcctv_ctrl`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_01SelectClteReg` (IN `p_Tel` VARCHAR(25), IN `p_Email` VARCHAR(180), IN `p_Passw` VARCHAR(15), IN `p_Reg` INT)  BEGIN

	IF (p_Reg = 1) THEN	/*** Nuevo Registro ****/
		IF (SELECT COUNT(IdClteReg) FROM tblregistros WHERE (Telefono = p_Tel OR Email = p_Email) ) > 0 THEN 
			SELECT 'Su registro ya fue realizado, favor de verificar.' As Resultado;
		ELSE 
			SELECT 'ok' As Resultado;
		END IF;
	END IF;
    
	IF (p_Reg = 2) THEN	/*** Solicitud de ingreso ***/
		IF (SELECT COUNT(IdClteReg) FROM tblregistros WHERE (Telefono = p_Tel OR Email = p_Email) And Passw = p_Passw) = 0 THEN 
			SELECT '' As IdClteReg, '' As IdTipoClte, '' As Nomb_RazonSocial, '' As Telefono, '' As Email, 
					'' As Ciudad, '' As Estado, '' As FechaAlta, '' As Activo,  'Verifique sus datos de acceso.' As Resultado;
		ELSE 
			SELECT IdClteReg, IdTipoClte, Nomb_RazonSocial, Telefono, Email, Ciudad, Estado, FechaAlta, Activo, 'ok' As Resultado
			FROM tblregistros WHERE (Telefono = p_Tel OR Email = p_Email);
		END IF;
	END IF;

END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_01SelectCtrlPaqClte` (IN `p_ClteReg` VARCHAR(15))  BEGIN
	SELECT 
		a.IdClteReg, a.IdCtrlPaquete, a.IdPaquete, b.Paquete, a.UltimaFechaAct, a.FoliosOcupados, a.FoliosXOcupar, a.Vigente, 
        b.CantFolios, b.DiasVigencia
	FROM tblctrlpaquetes a
	INNER JOIN tblcat_paquetes b ON a.IdPaquete =  b.IdPaquete
    WHERE a.IdClteReg =  p_ClteReg
    ORDER BY IdCtrlPaquete DESC LIMIT 1;
    
END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_01SelectCtrlPaqCltesHist` (IN `p_ClteReg` VARCHAR(15))  BEGIN
	SELECT 
		a.IdClteReg, a.IdCtrlPaquete, a.IdPaquete, b.Paquete, a.UltimaFechaAct, a.FoliosOcupados, a.FoliosXOcupar, a.Vigente, 
        b.CantFolios, b.DiasVigencia
	FROM tblctrlpaquetes a
	INNER JOIN tblcat_paquetes b ON a.IdPaquete =  b.IdPaquete
    WHERE a.IdClteReg =  p_ClteReg
    ORDER BY IdCtrlPaquete DESC;

END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_01SelectPaquetes` ()  BEGIN
	SELECT * FROM tblcat_paquetes;
END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_02InsPaqClte` (IN `p_IdClteReg` VARCHAR(15), IN `p_IdPaquete` INT)  BEGIN
	DECLARE ctrlPaq INT DEFAULT 1;
	DECLARE folios INT;
    DECLARE ocupados INT;
    DECLARE porOcupar INT;
    DECLARE fechaActual DATETIME;
    DECLARE ultimaFechaClte DATETIME;
    DECLARE flujo VARCHAR(60);
    
    SET fechaActual = NOW(); /*(SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'));*/
    
	SELECT CantFolios INTO folios FROM tblcat_paquetes WHERE IdPaquete = p_IdPaquete;

    SELECT MAX(UltimaFechaAct) As UltimaFechaAct, MAX(FoliosOcupados) As FoliosOcupados, MAX(FoliosxOcupar) As FoliosxOcupar, 
		CASE WHEN MAX(IdCtrlPaquete) IS NULL THEN 1 ELSE MAX(IdCtrlPaquete) + 1 END 
	INTO ultimaFechaClte, ocupados, porOcupar, ctrlPaq
    FROM tblctrlpaquetes WHERE IdClteReg = p_IdClteReg
    GROUP BY IdClteReg;
    
    IF (date(ultimaFechaClte) <= date(fechaActual)) THEN 
		SET porOcupar = porOcupar + folios;
	ELSE
		SET porOcupar = folios;
        SET ocupados = 0;
    END IF;

	/*SELECT ultimaFechaClte, fechaActual, porOcupar, ocupados, ctrlPaq;*/

	IF (ultimaFechaClte IS NOT NULL) THEN 
		UPDATE tblctrlpaquetes SET Vigente = 0 WHERE UltimaFechaAct = ultimaFechaClte;
    END IF;

	INSERT INTO tblctrlpaquetes (IdClteReg, IdCtrlPaquete, IdPaquete, UltimaFechaAct, FoliosOcupados, FoliosXOcupar) 
		VALUES (p_IdClteReg, ctrlpaq, p_IdPaquete, NOW(), ocupados, porOcupar);
    
    SELECT a.IdClteReg, a.IdPaquete, b.Paquete, a.FoliosOcupados, a.FoliosxOcupar, a.UltimaFechaAct
    FROM tblctrlpaquetes a
    INNER JOIN tblcat_paquetes b ON a.IdPaquete = b.IdPaquete
    WHERE IdClteReg = p_IdClteReg
    ORDER BY UltimaFechaAct DESC LIMIT 1;
	

END$$

CREATE DEFINER=`usrAdmin`@`localhost` PROCEDURE `sp_02InsRegistro` (IN `p_IdTipoClte` INT, IN `p_NombClte` VARCHAR(180), IN `p_NombNeg` VARCHAR(180), IN `p_Contacto` VARCHAR(180), IN `p_Tel` VARCHAR(25), IN `p_Email` VARCHAR(180), IN `p_Ciudad` VARCHAR(80), IN `p_Estado` VARCHAR(80), IN `p_Cve` VARCHAR(15))  BEGIN

    DECLARE clteReg varchar(8);
    DECLARE existe int;

	SELECT COUNT(IdClteReg) INTO existe FROM tblregistros WHERE (Telefono = p_Tel OR Email = p_Email);

	IF (existe = 0) THEN 
		BEGIN
			SELECT UPPER(SUBSTRING(UUID(),1,8)) INTO clteReg;

			INSERT INTO tblregistros (IdClteReg, IdTipoClte, NombClte, NombNegocio, Contacto, Telefono, Email, Ciudad, Estado, Clave) 
			VALUES (clteReg, p_IdTipoClte, p_NombClte, p_NombNeg, p_Contacto, p_Tel, p_Email, p_Ciudad, p_Estado, p_Cve);
        END;
	END IF;

	SELECT * FROM tblregistros WHERE (Telefono = p_Tel OR Email = p_Email);
    
END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_03UpdClteReg` (IN `p_Email` VARCHAR(180), IN `p_Activo` INT)  BEGIN
	UPDATE tblregistros SET Activo = p_Activo WHERE Email = p_Email;
END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_03UpdCodigoVerif` (IN `p_IdClteReg` VARCHAR(25))  BEGIN
	DECLARE codverif INT DEFAULT 0;
    SET codverif = (select round( rand()*100000));
    
    /*** Validar con cuantos minutos debe cambiar el codigo ****/
    UPDATE tblregistros SET CodigoVerificacion = codverif, FechaCodVerif = NOW() WHERE IdClteReg = p_IdClteReg;
    
    SELECT CodigoVerificacion FROM tblregistros WHERE IdClteReg = p_IdClteReg;
    
END$$

CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_03UpdRestauraCveClteReg` (IN `p_IdClteReg` VARCHAR(25), IN `p_CodigoVerif` INT, IN `p_Clave` VARCHAR(15))  BEGIN
	
    IF (SELECT Count(CodigoVerificacion) FROM tblregistros WHERE IdClteReg = p_IdClteReg And CodigoVerificacion = p_CodigoVerif) > 0 THEN 
		UPDATE tblregistros SET CodigoVerificacion = codverif, FechaCodVerif = NOW() WHERE IdClteReg = p_IdClteReg;
		SELECT 'Contraseña cambiada EXITOSAMENTE!!!' As Msg;
	ELSE
		SELECT 'Contraseña NO fue posible cambiarla, favor de avisar al Administrador' As Msg;
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_paquetes`
--

CREATE TABLE `tblcat_paquetes` (
  `IdPaquete` int(3) NOT NULL,
  `Paquete` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `CantFolios` int(4) NOT NULL,
  `DiasVigencia` int(3) NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_paquetes`
--

INSERT INTO `tblcat_paquetes` (`IdPaquete`, `Paquete`, `CantFolios`, `DiasVigencia`, `FechaCreacion`, `Vigente`) VALUES
(1, 'PAQUETE No. 1', 10, 30, '2021-08-01 18:51:08', b'0'),
(2, 'PAQUETE No. 2', 20, 40, '2021-08-01 18:51:13', b'0'),
(3, 'PAQUETE No. 3', 30, 50, '2021-08-01 18:51:18', b'0'),
(4, 'PAQUETE No. 4', 40, 60, '2021-08-01 18:51:40', b'0'),
(5, 'PAQUETE No. 5', 50, 70, '2021-08-01 18:51:43', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblctrlpaquetes`
--

CREATE TABLE `tblctrlpaquetes` (
  `IdClteReg` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdCtrlPaquete` int(8) NOT NULL,
  `IdPaquete` int(1) NOT NULL,
  `UltimaFechaAct` datetime NOT NULL,
  `FoliosOcupados` int(3) NOT NULL,
  `FoliosxOcupar` int(3) NOT NULL,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblregistros`
--

CREATE TABLE `tblregistros` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdTipoClte` int(1) NOT NULL,
  `NombClte` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `NombNegocio` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Contacto` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `FechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Clave` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoVerificacion` int(4) NOT NULL DEFAULT '0',
  `FechaCodVerif` datetime DEFAULT NULL,
  `Activo` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblregistros`
--

INSERT INTO `tblregistros` (`IdClteReg`, `IdTipoClte`, `NombClte`, `NombNegocio`, `Contacto`, `Telefono`, `Email`, `Ciudad`, `Estado`, `FechaAlta`, `Clave`, `CodigoVerificacion`, `FechaCodVerif`, `Activo`) VALUES
('5F64B889', 1, 'Martin Romero', '', '', '558213-8888', 'martin.romero@hotmail.com', 'CDMX', 'Cuauhtemoc', '2021-08-02 23:50:10', '123456', 0, NULL, 1),
('823D4D4E', 1, 'Jesus Garcia', '', '', '558213-7777', 'jesus@hotmail.com', 'CDMX', 'Iztapalapa', '2021-08-02 23:51:08', '789123', 0, NULL, 1),
('D6B516A0', 1, 'Martin Alfonso Romero', '', '', '5538-9999', 'martin@hotmail.com', 'CDMX', 'Cuautemoc', '2021-08-01 04:06:25', 'marg456', 0, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcat_paquetes`
--
ALTER TABLE `tblcat_paquetes`
  ADD PRIMARY KEY (`IdPaquete`);

--
-- Indices de la tabla `tblctrlpaquetes`
--
ALTER TABLE `tblctrlpaquetes`
  ADD PRIMARY KEY (`IdClteReg`,`IdCtrlPaquete`);

--
-- Indices de la tabla `tblregistros`
--
ALTER TABLE `tblregistros`
  ADD PRIMARY KEY (`IdClteReg`,`Telefono`,`Email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
