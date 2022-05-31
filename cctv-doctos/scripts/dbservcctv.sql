-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2021 a las 17:57:17
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
-- Base de datos: `dbservcctv`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`usrApps`@`localhost` PROCEDURE `sp_01SelectCatalogos` (IN `tipo` INT)  BEGIN
	CASE tipo
		WHEN tipo = 1 THEN 
			SELECT * FROM tblcat_tipocltes;
		WHEN tipo = 2 THEN 
			SELECT * FROM tblcat_tiposerv;
		WHEN tipo = 2 THEN 
			SELECT * FROM tblcat_marcasdvrs;
		WHEN tipo = 3 THEN 
			SELECT * FROM tblcat_marcascam;
		WHEN tipo = 4 THEN 
			SELECT * FROM tblcat_marcasmonitores;
		WHEN tipo = 5 THEN 
			SELECT * FROM tblcat_marcasdiscos;
		WHEN tipo = 6 THEN 
			SELECT * FROM tblcat_capdiscos;
		WHEN tipo = 7 THEN 
			SELECT * FROM tblcat_marcasmouse;
		WHEN tipo = 8 THEN 
			SELECT * FROM tblcat_marcasfuentes;
		WHEN tipo = 9 THEN 
			SELECT * FROM tblcat_canalesfuentes;
		WHEN tipo = 10 THEN 
			SELECT * FROM tblcat_tipocam;
	END CASE;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00camaras`
--

CREATE TABLE `tbl00camaras` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarcaCam` int(3) NOT NULL,
  `IdTipoCam` int(1) NOT NULL,
  `MarcaCamOtro` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00clientes`
--

CREATE TABLE `tbl00clientes` (
  `IdClteReg` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdTipoClte` int(1) NOT NULL,
  `Nomb_RazonSocial` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Celular` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `TelefonoFijo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL,
  `Vigente` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00condicionesgenerales`
--

CREATE TABLE `tbl00condicionesgenerales` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Garantia` bit(1) NOT NULL,
  `FechaGarantia` datetime NOT NULL,
  `PromoEmail` bit(1) NOT NULL,
  `PromoWhatsApp` bit(1) NOT NULL,
  `ManttoPrev` bit(1) NOT NULL,
  `IdPago` int(1) NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00discos`
--

CREATE TABLE `tbl00discos` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarcaDisco` int(3) NOT NULL,
  `IdCapDisco` int(1) NOT NULL,
  `MarcaDiscoOtro` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00dvr`
--

CREATE TABLE `tbl00dvr` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarcaDVR` int(3) NOT NULL,
  `MarcaDVROtro` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Usuario` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Passw` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00fuentespoder`
--

CREATE TABLE `tbl00fuentespoder` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarcaFuente` int(3) NOT NULL,
  `MarcaFuenteOtro` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00materialadicional`
--

CREATE TABLE `tbl00materialadicional` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `AdapJackMacho` int(3) NOT NULL,
  `AdapJackHembra` int(3) NOT NULL,
  `Eliminados12V` int(3) NOT NULL,
  `KitTransceptores` int(3) NOT NULL,
  `CajasEstanca` int(3) NOT NULL,
  `ConectorBNCMacho` int(3) NOT NULL,
  `ConectorBNCHembra` int(3) NOT NULL,
  `CableCoaxialArmado` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `CableCoaxial` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Canaleta` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `CableHDMI` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `CableUTP` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Tuberia` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00monitores`
--

CREATE TABLE `tbl00monitores` (
  `IdClteReg` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarcaMonitor` int(3) NOT NULL,
  `MarcaMonitorOtro` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl00mouse`
--

CREATE TABLE `tbl00mouse` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarcaMouse` int(3) NOT NULL,
  `MarcaMouseOtro` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Obs` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_canalesftes`
--

CREATE TABLE `tblcat_canalesftes` (
  `IdCanalesFte` int(1) NOT NULL,
  `CanalesFuente` int(2) NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_canalesftes`
--

INSERT INTO `tblcat_canalesftes` (`IdCanalesFte`, `CanalesFuente`, `FechaCreacion`, `Vigente`) VALUES
(1, 1, '2021-07-30 20:07:58', b'0'),
(2, 4, '2021-07-30 20:07:58', b'0'),
(3, 8, '2021-07-30 20:07:58', b'0'),
(4, 16, '2021-07-30 20:07:58', b'0'),
(5, 32, '2021-07-30 20:07:58', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_capdiscos`
--

CREATE TABLE `tblcat_capdiscos` (
  `IdCapDisco` int(1) NOT NULL,
  `CapacidadDisco` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_capdiscos`
--

INSERT INTO `tblcat_capdiscos` (`IdCapDisco`, `CapacidadDisco`, `FechaCreacion`, `Vigente`) VALUES
(1, '500 GB', '2021-07-30 19:42:26', b'1'),
(2, '1 TB', '2021-07-30 19:42:30', b'1'),
(3, '2 TB', '2021-07-30 19:42:35', b'1'),
(4, '6 TB', '2021-07-30 19:42:38', b'1'),
(99, 'OTRO', '2021-07-30 19:42:41', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_marcascam`
--

CREATE TABLE `tblcat_marcascam` (
  `IdMarcaCam` int(1) NOT NULL,
  `MarcaCam` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_marcascam`
--

INSERT INTO `tblcat_marcascam` (`IdMarcaCam`, `MarcaCam`, `FechaCreacion`, `Vigente`) VALUES
(1, 'DAHUA', '2021-07-30 19:43:48', b'1'),
(2, 'HIKVISION\r\n', '2021-07-30 19:43:48', b'1'),
(3, 'HILOOK\r\n', '2021-07-30 19:43:48', b'1'),
(4, 'PELCO', '2021-07-30 19:43:48', b'1'),
(5, 'SAXXON', '2021-07-30 19:43:48', b'1'),
(6, 'ZKTECO', '2021-07-30 19:43:48', b'1'),
(7, 'EPCOM', '2021-07-30 19:43:48', b'1'),
(99, 'OTRO', '2021-07-30 19:43:48', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_marcasdiscos`
--

CREATE TABLE `tblcat_marcasdiscos` (
  `IdMarcaDisco` int(1) NOT NULL,
  `MarcaDisco` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_marcasdiscos`
--

INSERT INTO `tblcat_marcasdiscos` (`IdMarcaDisco`, `MarcaDisco`, `FechaCreacion`, `Vigente`) VALUES
(1, 'WESTERN DIGITAL', '2021-07-30 19:47:21', b'1'),
(2, 'SEAGATE', '2021-07-30 19:47:21', b'1'),
(3, 'ADATA', '2021-07-30 19:47:21', b'1'),
(4, 'TOSHIBA', '2021-07-30 19:47:21', b'1'),
(99, 'OTRO', '2021-07-30 19:47:21', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_marcasdvrs`
--

CREATE TABLE `tblcat_marcasdvrs` (
  `IdMarcaDVR` int(1) NOT NULL,
  `MarcaDVR` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_marcasdvrs`
--

INSERT INTO `tblcat_marcasdvrs` (`IdMarcaDVR`, `MarcaDVR`, `FechaCreacion`, `Vigente`) VALUES
(1, 'DAHUA', '2021-07-30 19:47:44', b'1'),
(2, 'HIKVISION', '2021-07-30 19:47:44', b'1'),
(3, 'HILOOK', '2021-07-30 19:47:44', b'1'),
(4, 'PELCO', '2021-07-30 19:47:44', b'1'),
(5, 'SAXXON', '2021-07-30 19:47:44', b'1'),
(6, 'ZKTECO', '2021-07-30 19:47:44', b'1'),
(7, 'EPCOM', '2021-07-30 19:47:44', b'1'),
(99, 'OTRO', '2021-07-30 19:47:44', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_marcasfuentes`
--

CREATE TABLE `tblcat_marcasfuentes` (
  `IdMarcaFuente` int(1) NOT NULL,
  `MarcaFuente` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_marcasfuentes`
--

INSERT INTO `tblcat_marcasfuentes` (`IdMarcaFuente`, `MarcaFuente`, `FechaCreacion`, `Vigente`) VALUES
(1, 'DAHUA', '2021-07-30 19:49:19', b'1'),
(2, 'SAXXON', '2021-07-30 19:49:19', b'1'),
(3, 'BOSCH', '2021-07-30 19:49:19', b'1'),
(4, 'VIVOTEK', '2021-07-30 19:49:19', b'1'),
(99, 'OTRO', '2021-07-30 19:49:19', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_marcasmonitores`
--

CREATE TABLE `tblcat_marcasmonitores` (
  `IdMarcaMonitor` int(1) NOT NULL,
  `MarcaMonitor` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_marcasmonitores`
--

INSERT INTO `tblcat_marcasmonitores` (`IdMarcaMonitor`, `MarcaMonitor`, `FechaCreacion`, `Vigente`) VALUES
(1, 'SAMSUNG', '2021-07-30 19:50:05', b'1'),
(2, 'LG', '2021-07-30 19:50:05', b'1'),
(3, 'HP', '2021-07-30 19:50:05', b'1'),
(99, 'OTRO', '2021-07-30 19:50:05', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_marcasmouse`
--

CREATE TABLE `tblcat_marcasmouse` (
  `IdMarcaMouse` int(1) NOT NULL,
  `MarcaMouse` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_marcasmouse`
--

INSERT INTO `tblcat_marcasmouse` (`IdMarcaMouse`, `MarcaMouse`, `FechaCreacion`, `Vigente`) VALUES
(1, 'VIENE CON DVR', '2021-07-30 19:50:28', b'1'),
(2, 'LOGITECH', '2021-07-30 19:50:28', b'1'),
(99, 'OTRO', '2021-07-30 19:50:28', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_tipocam`
--

CREATE TABLE `tblcat_tipocam` (
  `IdTipoCam` int(1) NOT NULL,
  `TipoCamara` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_tipocam`
--

INSERT INTO `tblcat_tipocam` (`IdTipoCam`, `TipoCamara`, `FechaCreacion`, `Vigente`) VALUES
(1, 'BULLET', '2021-07-30 19:50:48', b'1'),
(2, 'DOMO', '2021-07-30 19:50:48', b'1'),
(3, 'PTZ', '2021-07-30 19:50:48', b'1'),
(99, 'OTRO', '2021-07-30 19:50:48', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_tipocltes`
--

CREATE TABLE `tblcat_tipocltes` (
  `IdTipoClte` int(1) NOT NULL,
  `TipoClte` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_tipocltes`
--

INSERT INTO `tblcat_tipocltes` (`IdTipoClte`, `TipoClte`, `FechaCreacion`, `Vigente`) VALUES
(1, 'Empresa', '2021-07-30 19:50:56', b'1'),
(2, 'Particular', '2021-07-30 19:50:59', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcat_tiposerv`
--

CREATE TABLE `tblcat_tiposerv` (
  `IdTipoServ` int(1) NOT NULL,
  `Servicio` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblcat_tiposerv`
--

INSERT INTO `tblcat_tiposerv` (`IdTipoServ`, `Servicio`, `FechaCreacion`, `Vigente`) VALUES
(1, 'Instalación', '2021-07-30 19:51:21', b'1'),
(2, 'Configuración', '2021-07-30 19:51:21', b'1'),
(3, 'Mantenimiento', '2021-07-30 19:51:21', b'1'),
(4, 'Reparación', '2021-07-30 19:51:21', b'1'),
(5, 'Instalación Express', '2021-07-30 19:51:21', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrelcltesservs`
--

CREATE TABLE `tblrelcltesservs` (
  `IdClteReg` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `IdCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdTipoServ` int(1) NOT NULL,
  `IdServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl00camaras`
--
ALTER TABLE `tbl00camaras`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`,`Serie`);

--
-- Indices de la tabla `tbl00clientes`
--
ALTER TABLE `tbl00clientes`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`);

--
-- Indices de la tabla `tbl00condicionesgenerales`
--
ALTER TABLE `tbl00condicionesgenerales`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`);

--
-- Indices de la tabla `tbl00discos`
--
ALTER TABLE `tbl00discos`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`,`Serie`);

--
-- Indices de la tabla `tbl00dvr`
--
ALTER TABLE `tbl00dvr`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`,`Serie`);

--
-- Indices de la tabla `tbl00fuentespoder`
--
ALTER TABLE `tbl00fuentespoder`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`,`Serie`);

--
-- Indices de la tabla `tbl00materialadicional`
--
ALTER TABLE `tbl00materialadicional`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`);

--
-- Indices de la tabla `tbl00monitores`
--
ALTER TABLE `tbl00monitores`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`,`Serie`);

--
-- Indices de la tabla `tbl00mouse`
--
ALTER TABLE `tbl00mouse`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdServicio`,`Serie`);

--
-- Indices de la tabla `tblcat_canalesftes`
--
ALTER TABLE `tblcat_canalesftes`
  ADD PRIMARY KEY (`IdCanalesFte`);

--
-- Indices de la tabla `tblcat_capdiscos`
--
ALTER TABLE `tblcat_capdiscos`
  ADD PRIMARY KEY (`IdCapDisco`);

--
-- Indices de la tabla `tblcat_marcascam`
--
ALTER TABLE `tblcat_marcascam`
  ADD PRIMARY KEY (`IdMarcaCam`);

--
-- Indices de la tabla `tblcat_marcasdiscos`
--
ALTER TABLE `tblcat_marcasdiscos`
  ADD PRIMARY KEY (`IdMarcaDisco`);

--
-- Indices de la tabla `tblcat_marcasdvrs`
--
ALTER TABLE `tblcat_marcasdvrs`
  ADD PRIMARY KEY (`IdMarcaDVR`);

--
-- Indices de la tabla `tblcat_marcasfuentes`
--
ALTER TABLE `tblcat_marcasfuentes`
  ADD PRIMARY KEY (`IdMarcaFuente`);

--
-- Indices de la tabla `tblcat_marcasmonitores`
--
ALTER TABLE `tblcat_marcasmonitores`
  ADD PRIMARY KEY (`IdMarcaMonitor`);

--
-- Indices de la tabla `tblcat_marcasmouse`
--
ALTER TABLE `tblcat_marcasmouse`
  ADD PRIMARY KEY (`IdMarcaMouse`);

--
-- Indices de la tabla `tblcat_tipocam`
--
ALTER TABLE `tblcat_tipocam`
  ADD PRIMARY KEY (`IdTipoCam`);

--
-- Indices de la tabla `tblcat_tipocltes`
--
ALTER TABLE `tblcat_tipocltes`
  ADD PRIMARY KEY (`IdTipoClte`);

--
-- Indices de la tabla `tblcat_tiposerv`
--
ALTER TABLE `tblcat_tiposerv`
  ADD PRIMARY KEY (`IdTipoServ`);

--
-- Indices de la tabla `tblrelcltesservs`
--
ALTER TABLE `tblrelcltesservs`
  ADD PRIMARY KEY (`IdClteReg`,`IdCliente`,`IdTipoServ`,`IdServicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
