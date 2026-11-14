-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-11-2026 a las 20:34:25
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `raiz_local`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido_vendedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `rel_detalle_apartado` (`id_pedido_vendedor`),
  KEY `rel_detalle_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `id_favorito` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `fecha_guardado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_favorito`),
  UNIQUE KEY `id_usuario` (`id_usuario`,`id_producto`),
  KEY `fk_favoritos_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','confirmado','completado','cancelado') DEFAULT 'pendiente',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_pedido`),
  KEY `rel_pedidos_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_vendedor`
--

DROP TABLE IF EXISTS `pedidos_vendedor`;
CREATE TABLE IF NOT EXISTS `pedidos_vendedor` (
  `id_pedido_vendedor` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente_contacto','en_negociacion','confirmado','completado','cancelado') DEFAULT 'pendiente_contacto',
  PRIMARY KEY (`id_pedido_vendedor`),
  UNIQUE KEY `id_pedido` (`id_pedido`,`id_vendedor`),
  UNIQUE KEY `uq_pedido_vendedor` (`id_pedido`,`id_vendedor`),
  KEY `rel_apartado_vendedor` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles_vendedor`
--

DROP TABLE IF EXISTS `perfiles_vendedor`;
CREATE TABLE IF NOT EXISTS `perfiles_vendedor` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `tipo_productor` varchar(100) DEFAULT NULL,
  `horario_atencion` varchar(150) DEFAULT NULL,
  `punto_entrega` varchar(200) DEFAULT NULL,
  `acepta_intercambio` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_perfil`),
  UNIQUE KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `perfiles_vendedor`
--

INSERT INTO `perfiles_vendedor` (`id_perfil`, `id_usuario`, `municipio`, `localidad`, `descripcion`, `tipo_productor`, `horario_atencion`, `punto_entrega`, `acepta_intercambio`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 2, 'toliman', 'kdf', 'jfwkd', 'Otro', '454kfmds', 'toliman centro', 1),
(3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `categoria` varchar(80) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT '0.00',
  `disponibilidad` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `ubicacion` varchar(200) DEFAULT NULL,
  `modalidad` varchar(30) DEFAULT NULL,
  `fotografia` varchar(500) DEFAULT NULL,
  `id_vendedor` int NOT NULL,
  `fecha_publicacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('activo','inactivo','eliminado') DEFAULT 'activo',
  PRIMARY KEY (`id_producto`),
  KEY `idx_producto_categoria` (`categoria`),
  KEY `idx_producto_vendedor` (`id_vendedor`),
  KEY `idx_producto_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `categoria`, `precio`, `unidad`, `cantidad`, `disponibilidad`, `descripcion`, `ubicacion`, `modalidad`, `fotografia`, `id_vendedor`, `fecha_publicacion`, `estado`) VALUES
(1, 'oregano', 'Otros', 56.00, 'docena', 12.00, 'Disponible', '100% natural', 'centro de toliman', 'Venta', 'assets\\img\\productos\\1.png', 2, '2026-11-06 17:01:29', 'eliminado'),
(2, 'oregano', 'Otros', 56.00, 'pieza', 45.00, 'Disponible', '100% NATURAL', 'centro de toliman', 'Venta', 'assets/img/productos/4fd3b7c7600a1634928e0ba1b63c0aee.jpg', 2, '2026-11-06 17:15:04', 'activo'),
(3, 'jrej', 'Frutas', 41.00, 'pieza', 44.00, 'Disponible', 'hrehire', 'centro de toliman', 'Venta', 'assets/img/productos/0e8ec99c6219151fd4b8e17db1dabb4b.png', 2, '2026-11-06 17:23:27', 'activo'),
(4, 'kljrw', 'Granos', 5.00, 'pieza', 4.00, 'Disponible', '4', 'centro de toliman', 'Venta', '', 2, '2026-11-06 17:29:48', 'eliminado'),
(5, 'hj', 'Artesanías', 656.00, 'litro', 48.00, 'Disponible', '49', 'centro de toliman', 'Venta', 'assets/img/productos/fad8342dbe75455b340d283066eb904d.jpg', 2, '2026-11-06 17:32:45', 'activo'),
(6, 'Sandia', 'Frutas', 70.00, 'pieza', 5.00, 'Disponible', 'Sandia Jugosa de campo', 'San pablo, Toliman', 'Venta', 'assets/img/productos/7d68e5bcaec9e91a57c8d549c09e647d.webp', 1, '2026-11-12 20:23:34', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nombre_publico` varchar(100) DEFAULT NULL,
  `correo` varchar(120) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rol` enum('cliente','vendedor','ambos') NOT NULL DEFAULT 'cliente',
  `foto_perfil` varchar(500) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `nombre_publico`, `correo`, `contrasena`, `telefono`, `rol`, `foto_perfil`, `fecha_registro`, `activo`) VALUES
(1, 'llema pk', NULL, 'lup@gmail.com', '$2y$10$wGH25FinU5/8mssxb.7vKud3JuJHcfsaE0.gjTCCPUhv61/t4oa6G', '5244124749', 'ambos', NULL, '2026-11-06 04:59:58', 1),
(2, 'Alberta Lopéz Casas', 'lola', 'nfdfdkg@gmail.com', '$2y$10$AT/d7Ual/6H8lAPF3Nz17.KGV205Rn0/d/UPUMYeACOft1Gx3JBwS', '5244124749', 'ambos', NULL, '2026-11-06 16:42:03', 1),
(3, 'Maria Guadalupe Perez Resendiz', 'mari', 'kkfg@gmail.com', '$2y$10$rUbsRnBDpL79qSoYFc9Q/.21E6FjPS3CqhuPXlkyETWN1Xn7oBSHW', '5244124749', 'cliente', NULL, '2026-11-06 16:47:01', 1),
(4, 'MARTINEZ', NULL, 'hjfsd@gmail.com', '$2y$10$NIftoQHnpdOOV0KLHfS8x..C4EukrZ54Bd1vmb.iplFeQVpigDiIm', '524412474905', 'vendedor', NULL, '2026-11-06 16:48:29', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `rel_detalle_apartado` FOREIGN KEY (`id_pedido_vendedor`) REFERENCES `pedidos_vendedor` (`id_pedido_vendedor`) ON DELETE CASCADE,
  ADD CONSTRAINT `rel_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `fk_favoritos_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_favoritos_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `rel_pedidos_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos_vendedor`
--
ALTER TABLE `pedidos_vendedor`
  ADD CONSTRAINT `rel_apartado_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `rel_apartado_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfiles_vendedor`
--
ALTER TABLE `perfiles_vendedor`
  ADD CONSTRAINT `fk_perfil_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_usuarios` FOREIGN KEY (`id_vendedor`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
