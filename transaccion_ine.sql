-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2015 a las 22:46:21
-- Versión del servidor: 5.6.16-log
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `transaccion_ine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'asus'),
(2, 'apple'),
(3, 'lenovo'),
(4, 'samsung electronics'),
(5, 'sony corporation'),
(6, 'dell'),
(7, 'hewlett-packard'),
(8, 'toshiba'),
(9, 'alienware'),
(10, 'acer inc'),
(11, 'gateway'),
(12, 'cannon'),
(13, 'brother'),
(14, 'kyocera'),
(15, 'epson'),
(16, 'xerox'),
(17, 'kodak');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `serie_number` varchar(30) DEFAULT NULL,
  `stock_number` int(11) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `responsible` varchar(30) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty_end` date NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`type_id`,`brand_id`),
  KEY `fk_equipos_marcas_idx` (`brand_id`),
  KEY `fk_equipos_tipos1_idx` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `devices`
--

INSERT INTO `devices` (`id`, `type_id`, `brand_id`, `description`, `serie_number`, `stock_number`, `model`, `responsible`, `purchase_date`, `warranty_end`, `location`, `status`) VALUES
(1, 2, 7, 'PC HP 320 HDD, 4 RAM, intel core I5', 'HSG65ERT36', 21474, 'Pavilion C5', 'Javier Rojas', '2015-01-04', '2016-01-04', 'Recursos Humanos', 1),
(2, 3, 3, 'Laptop lenovo 320 HDD, 4 RAM intel core 2 duo', 'SHYETR783H', 21475, 'G3-21', 'Carlos Mora', '2014-01-12', '2015-01-12', 'Finanzas', 1),
(3, 1, 6, 'Power Edge R220 1 TB HDD, 6 RAM, intel xenon', 'DHGT63GDT6', 28630, 'R220', 'Fernando Cabrera', '2009-02-11', '2012-02-11', 'Site central sistemas', 1),
(4, 5, 13, 'Impresora de inyeccion de tinta brother', 'HDYR638SGT', 63521, 'RS-56', 'Ana Luna', '2009-12-04', '2010-12-04', 'Contabilidad', 1),
(5, 17, 4, 'Celular samsung young 1 GB RAM, 16 GB SD', 'GHD635DTR627', 17209, 'Young', 'Pedro altamirano', '2014-01-31', '2015-01-31', 'Marketing', 1),
(6, 20, 2, 'Ipad 4, 2GB RAM 16 GB HDD', 'DYCY98D0KP', 73610, 'Ipad 4', 'Arturo Marquez', '2011-04-01', '2012-04-01', 'Marketing', 1),
(7, 3, 8, 'Laptop toshiba 320 HDD, 4 RAM, intel core I3', 'JDU7RYET36AS', 63527, 'SATELLITE 1135', 'Esteban Mora', '2014-05-08', '2015-05-08', 'Sistemas', 1),
(8, 8, 15, 'Scanner epson professional', 'HDY65SGEUR80', 62710, 'SC-PR', 'Sergio Ruiz', '2009-02-01', '2010-03-01', 'Contabilidad', 0),
(9, 9, 5, 'proyector Sony', 'HDU87SGTRE09', 72630, 'PR-SY01', 'Manuel rodriguez', '2011-09-01', '2012-10-01', 'sala de juntas', 1),
(10, 17, 2, 'Iphone 5S 64GB, dorado', 'DYCOI09AGST6', 53001, '5S', 'Genaro Garcia', '2015-01-09', '2016-01-09', 'Contabilidad', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `equipos_con_garantia`
--
CREATE TABLE IF NOT EXISTS `equipos_con_garantia` (
`ID` int(11)
,`EQUIPO` varchar(50)
,`MARCA` varchar(50)
,`DESCRIPCION` varchar(60)
,`SERIE` varchar(30)
,`NUMERO_STOCK` int(11)
,`MODELO` varchar(20)
,`RESPONSABLE` varchar(30)
,`FECHA_COMPRA` date
,`FIN_GARANTIA` date
,`UBICACION` varchar(30)
,`ESTATUS` tinyint(4)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `equipos_con_mantenimiento`
--
CREATE TABLE IF NOT EXISTS `equipos_con_mantenimiento` (
`ID` int(11)
,`TIPO` varchar(50)
,`EQUIPO` varchar(60)
,`MARCA` varchar(50)
,`SERIE` varchar(30)
,`MODELO` varchar(20)
,`RESPONSABLE` varchar(30)
,`UBICACION` varchar(30)
,`ESTATUS` tinyint(4)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `equipos_por_marca`
--
CREATE TABLE IF NOT EXISTS `equipos_por_marca` (
`ID` int(11)
,`EQUIPO` varchar(60)
,`MARCA` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `equipos_por_tipo`
--
CREATE TABLE IF NOT EXISTS `equipos_por_tipo` (
`ID` int(11)
,`EQUIPO` varchar(60)
,`TIPO` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `equipos_sin_garantia`
--
CREATE TABLE IF NOT EXISTS `equipos_sin_garantia` (
`ID` int(11)
,`EQUIPO` varchar(50)
,`MARCA` varchar(50)
,`DESCRIPCION` varchar(60)
,`SERIE` varchar(30)
,`NUMERO_STOCK` int(11)
,`MODELO` varchar(20)
,`RESPONSABLE` varchar(30)
,`FECHA_COMPRA` date
,`FIN_GARANTIA` date
,`UBICACION` varchar(30)
,`ESTATUS` tinyint(4)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `equipos_sin_mantenimiento`
--
CREATE TABLE IF NOT EXISTS `equipos_sin_mantenimiento` (
`ID` int(11)
,`TIPO` varchar(50)
,`DESCRIPCION` varchar(60)
,`MARCA` varchar(50)
,`SERIE` varchar(30)
,`MODELO` varchar(20)
,`RESPONSABLE` varchar(30)
,`UBICACION` varchar(30)
,`ESTATUS` tinyint(4)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `garantias_por_vencer`
--
CREATE TABLE IF NOT EXISTS `garantias_por_vencer` (
`ID` int(11)
,`DESCRIPCION` varchar(60)
,`FECHA_COMPRA` date
,`EXPIRA_GARANTIA` date
,`DIAS_RESTANTES` bigint(10)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `historial_mant_equipos`
--
CREATE TABLE IF NOT EXISTS `historial_mant_equipos` (
`ID` int(11)
,`EQUIPO` varchar(60)
,`TECNICO` varchar(30)
,`TIPO_MANTENIMIENTO` varchar(30)
,`FECHA_MANTENIMIENTO` date
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenances`
--

CREATE TABLE IF NOT EXISTS `maintenances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `technical_id` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `maintenance_date` date DEFAULT NULL,
  PRIMARY KEY (`id`,`device_id`,`technical_id`),
  KEY `fk_mantenimientos_tecnicos1_idx` (`technical_id`),
  KEY `fk_mantenimientos_equipos1_idx` (`device_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `maintenances`
--

INSERT INTO `maintenances` (`id`, `device_id`, `technical_id`, `type`, `maintenance_date`) VALUES
(1, 1, 1, 'Preventivo', '2013-09-08'),
(2, 6, 2, 'Preventivo', '2013-11-09'),
(3, 3, 1, 'Preventivo', '2014-01-02'),
(4, 4, 2, 'Preventivo', '2013-09-08'),
(5, 8, 1, 'Correctivo', '2014-09-01'),
(6, 4, 4, 'Preventivo', '2013-09-08'),
(7, 5, 1, 'preventivo', '2013-04-03'),
(8, 4, 2, 'Preventivo', '2014-12-09'),
(9, 9, 4, 'Preventivo', '2014-01-01'),
(10, 9, 2, 'Correctivo', '2014-08-07'),
(11, 3, 2, 'preventivo', '2014-01-04');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mayor_numero_mantenimientos`
--
CREATE TABLE IF NOT EXISTS `mayor_numero_mantenimientos` (
`ID` int(11)
,`DESCRIPCION` varchar(60)
,`NUMERO_DE_MANTENIMIENTOS` bigint(21)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `technicals`
--

CREATE TABLE IF NOT EXISTS `technicals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `technicals`
--

INSERT INTO `technicals` (`id`, `name`, `lastname`, `user`, `password`, `status`) VALUES
(1, 'Jorge', 'Rivera', 'jorge', '123456', 1),
(2, 'Juan', 'Perez', 'juan', '12345', 1),
(3, 'Raul', 'Vazquez', 'raul', '12345', 0),
(4, 'Rodolfo', 'Suarez', 'rodolfo', '12345', 1),
(5, 'Jaime', 'Solar', 'jaime', '12345', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tecnico_mantenimientos`
--
CREATE TABLE IF NOT EXISTS `tecnico_mantenimientos` (
`TECNICO` varchar(30)
,`mantenimientos` bigint(21)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'servidor'),
(2, 'estacion de trabajo'),
(3, 'equipo portatil'),
(4, 'impresora matriz de punto'),
(5, 'impresora inyeccion de tinta'),
(6, 'impresora laser monocromatica'),
(7, 'impresora laser a color'),
(8, 'scanner'),
(9, 'proyector'),
(10, 'teclado'),
(11, 'mouse'),
(12, 'switch'),
(13, 'router'),
(14, 'conmutador'),
(15, 'ups'),
(16, 'regulador'),
(17, 'telefono'),
(18, 'monitor'),
(19, 'bocina'),
(20, 'tablet'),
(21, 'disco duro externo'),
(22, 'equipo kvm'),
(23, 'camara cctv'),
(25, 'camara web');

-- --------------------------------------------------------

--
-- Estructura para la vista `equipos_con_garantia`
--
DROP TABLE IF EXISTS `equipos_con_garantia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipos_con_garantia` AS select `devices`.`id` AS `ID`,`types`.`name` AS `EQUIPO`,`brands`.`name` AS `MARCA`,`devices`.`description` AS `DESCRIPCION`,`devices`.`serie_number` AS `SERIE`,`devices`.`stock_number` AS `NUMERO_STOCK`,`devices`.`model` AS `MODELO`,`devices`.`responsible` AS `RESPONSABLE`,`devices`.`purchase_date` AS `FECHA_COMPRA`,`devices`.`warranty_end` AS `FIN_GARANTIA`,`devices`.`location` AS `UBICACION`,`devices`.`status` AS `ESTATUS` from ((`devices` join `types`) join `brands`) where ((`devices`.`type_id` = `types`.`id`) and (`devices`.`brand_id` = `brands`.`id`) and (`devices`.`warranty_end` >= curdate()));

-- --------------------------------------------------------

--
-- Estructura para la vista `equipos_con_mantenimiento`
--
DROP TABLE IF EXISTS `equipos_con_mantenimiento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipos_con_mantenimiento` AS select `devices`.`id` AS `ID`,`types`.`name` AS `TIPO`,`devices`.`description` AS `EQUIPO`,`brands`.`name` AS `MARCA`,`devices`.`serie_number` AS `SERIE`,`devices`.`model` AS `MODELO`,`devices`.`responsible` AS `RESPONSABLE`,`devices`.`location` AS `UBICACION`,`devices`.`status` AS `ESTATUS` from (((`devices` join `types`) join `brands`) join `maintenances`) where ((`devices`.`brand_id` = `brands`.`id`) and (`devices`.`type_id` = `types`.`id`) and (`devices`.`id` = `maintenances`.`device_id`)) group by `devices`.`description` order by `devices`.`id`;

-- --------------------------------------------------------

--
-- Estructura para la vista `equipos_por_marca`
--
DROP TABLE IF EXISTS `equipos_por_marca`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipos_por_marca` AS select `devices`.`id` AS `ID`,`devices`.`description` AS `EQUIPO`,`brands`.`name` AS `MARCA` from (`devices` join `brands`) where (`devices`.`brand_id` = `brands`.`id`) order by `devices`.`id`;

-- --------------------------------------------------------

--
-- Estructura para la vista `equipos_por_tipo`
--
DROP TABLE IF EXISTS `equipos_por_tipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipos_por_tipo` AS select `devices`.`id` AS `ID`,`devices`.`description` AS `EQUIPO`,`types`.`name` AS `TIPO` from (`devices` join `types`) where (`devices`.`type_id` = `types`.`id`) order by `devices`.`id`;

-- --------------------------------------------------------

--
-- Estructura para la vista `equipos_sin_garantia`
--
DROP TABLE IF EXISTS `equipos_sin_garantia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipos_sin_garantia` AS select `devices`.`id` AS `ID`,`types`.`name` AS `EQUIPO`,`brands`.`name` AS `MARCA`,`devices`.`description` AS `DESCRIPCION`,`devices`.`serie_number` AS `SERIE`,`devices`.`stock_number` AS `NUMERO_STOCK`,`devices`.`model` AS `MODELO`,`devices`.`responsible` AS `RESPONSABLE`,`devices`.`purchase_date` AS `FECHA_COMPRA`,`devices`.`warranty_end` AS `FIN_GARANTIA`,`devices`.`location` AS `UBICACION`,`devices`.`status` AS `ESTATUS` from ((`devices` join `types`) join `brands`) where ((`devices`.`type_id` = `types`.`id`) and (`devices`.`brand_id` = `brands`.`id`) and (`devices`.`warranty_end` < curdate()));

-- --------------------------------------------------------

--
-- Estructura para la vista `equipos_sin_mantenimiento`
--
DROP TABLE IF EXISTS `equipos_sin_mantenimiento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipos_sin_mantenimiento` AS select `devices`.`id` AS `ID`,`types`.`name` AS `TIPO`,`devices`.`description` AS `DESCRIPCION`,`brands`.`name` AS `MARCA`,`devices`.`serie_number` AS `SERIE`,`devices`.`model` AS `MODELO`,`devices`.`responsible` AS `RESPONSABLE`,`devices`.`location` AS `UBICACION`,`devices`.`status` AS `ESTATUS` from ((`devices` join `types`) join `brands`) where ((`devices`.`brand_id` = `brands`.`id`) and (`devices`.`type_id` = `types`.`id`) and (not(`devices`.`id` in (select `maintenances`.`device_id` from `maintenances`))));

-- --------------------------------------------------------

--
-- Estructura para la vista `garantias_por_vencer`
--
DROP TABLE IF EXISTS `garantias_por_vencer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `garantias_por_vencer` AS select `devices`.`id` AS `ID`,`devices`.`description` AS `DESCRIPCION`,`devices`.`purchase_date` AS `FECHA_COMPRA`,`devices`.`warranty_end` AS `EXPIRA_GARANTIA`,(curdate() - `devices`.`warranty_end`) AS `DIAS_RESTANTES` from `devices` where ((curdate() - `devices`.`warranty_end`) between 1 and 31);

-- --------------------------------------------------------

--
-- Estructura para la vista `historial_mant_equipos`
--
DROP TABLE IF EXISTS `historial_mant_equipos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `historial_mant_equipos` AS select `maintenances`.`id` AS `ID`,`devices`.`description` AS `EQUIPO`,`technicals`.`name` AS `TECNICO`,`maintenances`.`type` AS `TIPO_MANTENIMIENTO`,`maintenances`.`maintenance_date` AS `FECHA_MANTENIMIENTO` from ((`maintenances` join `devices`) join `technicals`) where ((`maintenances`.`device_id` = `devices`.`id`) and (`maintenances`.`technical_id` = `technicals`.`id`)) order by `devices`.`description`;

-- --------------------------------------------------------

--
-- Estructura para la vista `mayor_numero_mantenimientos`
--
DROP TABLE IF EXISTS `mayor_numero_mantenimientos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mayor_numero_mantenimientos` AS select `devices`.`id` AS `ID`,`devices`.`description` AS `DESCRIPCION`,count(`maintenances`.`device_id`) AS `NUMERO_DE_MANTENIMIENTOS` from (`devices` join `maintenances`) where (`devices`.`id` = `maintenances`.`device_id`) group by `maintenances`.`device_id` order by `NUMERO_DE_MANTENIMIENTOS` desc;

-- --------------------------------------------------------

--
-- Estructura para la vista `tecnico_mantenimientos`
--
DROP TABLE IF EXISTS `tecnico_mantenimientos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tecnico_mantenimientos` AS select `technicals`.`name` AS `TECNICO`,count(`maintenances`.`technical_id`) AS `mantenimientos` from ((`maintenances` join `devices`) join `technicals`) where ((`maintenances`.`device_id` = `devices`.`id`) and (`maintenances`.`technical_id` = `technicals`.`id`)) group by `maintenances`.`technical_id` order by `mantenimientos` desc limit 0,1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `fk_equipos_marcas` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipos_tipos1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `maintenances`
--
ALTER TABLE `maintenances`
  ADD CONSTRAINT `fk_mantenimientos_equipos1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mantenimientos_tecnicos1` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
