-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2026 a las 17:16:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `video juego`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre`, `descripcion`) VALUES
(1, 'Accion', 'Enfocado en punteria, reflejos y combate frenetico'),
(2, 'Aventura', 'Centrado en la narrativa, la exploracion y la resolucion de puzzles.'),
(3, 'Rol', 'Juego basado en la evolucion de personajes, toma de decisiones y ambientaciones.'),
(4, 'Estrategia', 'Requiere planificacion, gestion de recursos y tactica en tiempo real.'),
(5, 'Shooter', 'Se divide en primera persona (fps) como Doom o tercera persona (tps)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id_plataforma` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `fabricante` varchar(80) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id_plataforma`, `nombre`, `fabricante`, `año_lanzamiento`) VALUES
(1, 'Xbox', 'Microsoft', '2001'),
(2, 'Playstation 2', 'Sony', '2000'),
(3, 'Nintendo 64', 'Nintendo', '1996'),
(4, 'Wii', 'Nintendo', '2006');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `id_juego` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `desarrolladora` varchar(100) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL,
  `precio` decimal(6,0) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`id_juego`, `titulo`, `desarrolladora`, `año_lanzamiento`, `precio`, `id_genero`) VALUES
(1, 'Fortnite', 'Epic Games', '2015', 0, 5),
(2, 'Free Fire', 'Garena', '2016', 0, 5),
(3, 'Minecraft', 'Mojang', '2011', 240, 2),
(4, 'Super Mario Bros', 'Nintendo', '1985', 100, 2),
(5, 'The Legend of Zelda', 'Nintendo', '1998', 200, 4),
(6, 'Wii Sports', 'Nintendo', '2006', 168, 4),
(7, 'God of War', 'Santa Monica Studio', '2005', 500, 1),
(8, 'Metal Gear Solid', 'Konami', '2005', 999, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego_plataforma`
--

CREATE TABLE `videojuego_plataforma` (
  `id_juego` int(11) NOT NULL,
  `id_plataforma` int(11) NOT NULL,
  `fecha_disponible` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `videojuego_plataforma`
--

INSERT INTO `videojuego_plataforma` (`id_juego`, `id_plataforma`, `fecha_disponible`) VALUES
(1, 1, '2016-04-21'),
(2, 1, '2017-06-22'),
(3, 1, '2011-08-16'),
(4, 3, '2008-12-11'),
(5, 3, '2010-05-04'),
(6, 4, '2026-04-29'),
(7, 2, '2026-04-05'),
(4, 4, '2026-06-16'),
(3, 2, '2026-03-15'),
(2, 2, '2026-06-18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id_plataforma`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`id_juego`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD KEY `id_juego` (`id_juego`),
  ADD KEY `id_plataforma` (`id_plataforma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id_plataforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD CONSTRAINT `videojuego_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`);

--
-- Filtros para la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD CONSTRAINT `videojuego_plataforma_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `videojuego` (`id_juego`),
  ADD CONSTRAINT `videojuego_plataforma_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
