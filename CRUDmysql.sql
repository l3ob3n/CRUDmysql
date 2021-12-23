-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2021 a las 05:39:25
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mysqlcrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_doc_identidad` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `doc_identidad` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `celular` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellido`, `fecha_nacimiento`, `sexo`, `tipo_doc_identidad`, `doc_identidad`, `celular`) VALUES
(12345, 'Jonathan', 'Mamani', '2000-05-02', 'M', 'DNI', '11463498', 933718381),
(22345, 'Maria', 'Lopez', '2000-12-25', 'F', 'DNI', '21463498', 933718382),
(32345, 'Juana', 'Ramirez', '1998-10-12', 'F', 'DNI', '31463498', 933718383),
(42345, 'Jose', 'Mariano', '1998-05-12', 'M', 'DNI', '41463498', 933718384),
(52345, 'Laura', 'Vela', '1997-08-12', 'F', 'DNI', '51463498', 933718385);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL,
  `genero` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `abrev_genero` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idGenero`, `genero`, `abrev_genero`) VALUES
(123, 'Accion', 'AC'),
(223, 'Comedia', 'CO'),
(323, 'Drama', 'DR'),
(423, 'Fantasia', 'DR'),
(523, 'Ciencia Ficcion', 'CF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renta`
--

CREATE TABLE `renta` (
  `idRenta` int(11) NOT NULL,
  `idVideo` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `monto` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `renta`
--

INSERT INTO `renta` (`idRenta`, `idVideo`, `idCliente`, `fecha_inicio`, `fecha_fin`, `monto`) VALUES
(54321, 5234, 12345, '2021-02-10', '2021-03-10', 80),
(54322, 3234, 22345, '2021-04-02', '2021-06-10', 160),
(54323, 1234, 42345, '2021-07-20', '2021-08-10', 100),
(54324, 2234, 32345, '2021-08-20', '2021-09-10', 120),
(54325, 5234, 12345, '2021-09-16', '2021-11-16', 180);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `idVideo` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `idGenero` int(11) NOT NULL,
  `audiencia` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `anio` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `productor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `compania` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`idVideo`, `titulo`, `idGenero`, `audiencia`, `anio`, `fecha_registro`, `productor`, `compania`) VALUES
(1234, 'Terminator', 523, 'jovenes', 1995, '2021-12-22', 'James Cameron', 'Hemdale Film Cinema'),
(2234, 'Spiderman', 523, 'jovenes', 2021, '2021-09-28', 'Kevin Feige y Amy Pascal', 'Marvel Studios'),
(3234, 'El padrino', 123, 'adultos', 1972, '2021-10-02', 'Albert S. Ruddy', ' Paramount Pictures Studios'),
(4234, 'Hannibal', 523, 'jovenes', 2001, '2021-02-18', 'Ridley Scott', 'Scott Free Productions y Universal Pictures'),
(5234, 'Parasite', 323, 'jovenes', 2019, '2021-04-03', 'Bong Joon-ho', 'Barunson E&A Corp');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `uq_doc_identidad` (`doc_identidad`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `renta`
--
ALTER TABLE `renta`
  ADD PRIMARY KEY (`idRenta`),
  ADD KEY `fk_renta_idVideo` (`idVideo`),
  ADD KEY `fk_renta_idCliente` (`idCliente`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`idVideo`),
  ADD KEY `fk_video_idGenero` (`idGenero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `renta`
--
ALTER TABLE `renta`
  ADD CONSTRAINT `fk_renta_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `fk_renta_idVideo` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_video_idGenero` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
