-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2021 a las 07:40:34
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
-- Base de datos: `dbevosoluciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcontactos`
--

CREATE TABLE `tblcontactos` (
  `IdContacto` varchar(18) COLLATE utf8_spanish_ci NOT NULL,
  `Contacto` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `IdEmpresa` varchar(18) COLLATE utf8_spanish_ci NOT NULL,
  `Telefonos` varchar(180) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Email` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Vigente` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblctrlaccesos`
--

CREATE TABLE `tblctrlaccesos` (
  `IdEmpresa` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `IdAplicacion` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Servidor` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `BaseDatos` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Usuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Encriptado` bit(1) NOT NULL,
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblctrlaccesos`
--

INSERT INTO `tblctrlaccesos` (`IdEmpresa`, `IdAplicacion`, `Servidor`, `BaseDatos`, `Usuario`, `Password`, `Encriptado`, `FechaCreacion`, `Vigente`) VALUES
('SERVCCTV', 'evocctv', 'localhost:8080', 'dbservcctv', 'usrApps', 'Ev0luc10n@6706', b'0', '2021-07-30 18:42:04', b'1'),
('SERVCCTV', 'evocctv_ctrl', 'localhost:8080', 'dbservcctv_ctrl', 'usrApps', 'Ev0luc10n@6706', b'0', '2021-07-30 18:38:42', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldatfisrecep`
--

CREATE TABLE `tbldatfisrecep` (
  `IdDomFiscal` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `IdEmpresa` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `RFC` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `TipoPersonal` bit(1) NOT NULL,
  `Calle` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `NumInt` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumExt` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Colonia` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `DelegMun` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `CP` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Vigente` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempresas`
--

CREATE TABLE `tblempresas` (
  `IdEmpresa` varchar(18) COLLATE utf8_spanish_ci NOT NULL,
  `Empresa` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Telefonos` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `TipoAmbiente` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Vigente` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tblempresas`
--

INSERT INTO `tblempresas` (`IdEmpresa`, `Empresa`, `Direccion`, `Telefonos`, `Email`, `TipoAmbiente`, `FechaCreacion`, `Vigente`) VALUES
('DM001', 'Evo Soluciones', 'Conocida', '', 'evo_soluciones@hotmail.com', 'Demo', '2019-08-28 17:42:49', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcontactos`
--
ALTER TABLE `tblcontactos`
  ADD PRIMARY KEY (`IdContacto`,`IdEmpresa`);

--
-- Indices de la tabla `tblctrlaccesos`
--
ALTER TABLE `tblctrlaccesos`
  ADD PRIMARY KEY (`IdEmpresa`,`IdAplicacion`,`BaseDatos`);

--
-- Indices de la tabla `tbldatfisrecep`
--
ALTER TABLE `tbldatfisrecep`
  ADD PRIMARY KEY (`IdDomFiscal`,`IdEmpresa`);

--
-- Indices de la tabla `tblempresas`
--
ALTER TABLE `tblempresas`
  ADD PRIMARY KEY (`IdEmpresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
