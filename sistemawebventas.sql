-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2021 a las 01:09:32
-- Versión del servidor: 8.0.26
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemawebventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int NOT NULL,
  `idcategoria` int NOT NULL,
  `idunidad_medida` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `imagen` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `idunidad_medida`, `nombre`, `descripcion`, `imagen`, `estado`) VALUES
(4561, 17, 1, 'Proyector Epson x12', 'Proyector Epson x12', 'Files/Articulo/Proyector Epson.jpg', 'A'),
(4562, 2, 1, 'Impresora Epson', 'Impresora Epson', 'Files/Articulo/Impresora Epson.jpg', 'N'),
(4564, 19, 1, 'TROFEO', 'Un trofeo de oro', 'Files/Articulo/copas.jpg', 'A'),
(4565, 19, 1, 'TROFEO', 'medalala', 'Files/Articulo/guitarras.jpg', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `estado`) VALUES
(2, 'Impresoras', 'A'),
(17, 'Proyectores', 'A'),
(19, 'TROFEO', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `idcredito` int NOT NULL,
  `idventa` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `total_pago` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `credito`
--

INSERT INTO `credito` (`idcredito`, `idventa`, `fecha_pago`, `total_pago`) VALUES
(2, 9, '2021-11-30', '100.00'),
(3, 9, '2021-11-30', '80.00'),
(4, 11, '2021-11-30', '0.00'),
(5, 11, '2021-11-30', '0.00'),
(6, 13, '2021-11-30', '100.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_documento_sucursal`
--

CREATE TABLE `detalle_documento_sucursal` (
  `iddetalle_documento_sucursal` int NOT NULL,
  `idsucursal` int NOT NULL,
  `idtipo_documento` int NOT NULL,
  `ultima_serie` varchar(7) NOT NULL,
  `ultimo_numero` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_documento_sucursal`
--

INSERT INTO `detalle_documento_sucursal` (`iddetalle_documento_sucursal`, `idsucursal`, `idtipo_documento`, `ultima_serie`, `ultimo_numero`) VALUES
(1, 1, 3, '001', '00002'),
(2, 1, 6, '001', '0007'),
(3, 1, 7, '001', '0004'),
(4, 1, 9, '001', '00001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int NOT NULL,
  `idingreso` int NOT NULL,
  `idarticulo` int NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `descripcion` varchar(1024) DEFAULT NULL,
  `stock_ingreso` int NOT NULL,
  `stock_actual` int NOT NULL,
  `precio_compra` decimal(8,2) NOT NULL,
  `utilidad` decimal(8,2) NOT NULL,
  `precio_ventadistribuidor` decimal(8,2) NOT NULL,
  `precio_ventapublico` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `codigo`, `serie`, `descripcion`, `stock_ingreso`, `stock_actual`, `precio_compra`, `utilidad`, `precio_ventadistribuidor`, `precio_ventapublico`) VALUES
(6, 5, 4564, '', '', '', 100, 93, '100.00', '1.00', '160.00', '180.00'),
(7, 6, 4564, '123456', 'asa12', 'es grande', 15, 13, '100.00', '600.00', '300.00', '700.00'),
(8, 7, 4561, '200', 'dsa321', 'cdwlñfkwel', 10, 10, '500.00', '200.00', '600.00', '700.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `iddetalle_pedido` int NOT NULL,
  `idpedido` int NOT NULL,
  `iddetalle_ingreso` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`iddetalle_pedido`, `idpedido`, `iddetalle_ingreso`, `cantidad`, `precio_venta`, `descuento`) VALUES
(8, 7, 6, 1, '180.00', '0.00'),
(9, 8, 7, 2, '700.00', '0.00'),
(10, 9, 6, 1, '180.00', '0.00'),
(11, 10, 6, 1, '180.00', '0.00'),
(13, 12, 6, 1, '180.00', '0.00'),
(14, 13, 6, 1, '180.00', '0.00'),
(15, 14, 6, 1, '180.00', '0.00'),
(16, 15, 6, 1, '180.00', '0.00'),
(17, 16, 6, 1, '180.00', '0.00'),
(18, 17, 6, 1, '180.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `foto` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `apellidos`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `fecha_nacimiento`, `foto`, `login`, `clave`, `estado`) VALUES
(1, 'Solis', 'Jonathan', 'DNI', '47715777', 'Asuncion', '41347446', 'ventassetsasolutions@gmail.com', '2021-11-11', 'Files/Empleado/carlos.jpg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'S'),
(3, 'cruz', 'Ivan', 'DNI', '48771577', 'Iquitos 1345', '987459344', 'ivancruz@incanatoit.com', '2016-12-02', 'Files/Empleado/ivan.jpg', 'cruz', '202cb962ac59075b964b07152d234b70', 'A'),
(4, 'solis', 'Nelson', 'CEDULA', '5724074', 'San Lorenzo', '0971226160', 'nelson.solis@uds.edu.py', '1999-11-12', '', '123', '202cb962ac59075b964b07152d234b70', 'A'),
(5, 'MATU', 'JORGE', 'RUC', '3434343', 'NO HAY', '46164646', 'marialujan@uds.edu.com', '2021-11-24', '', 'vendedor1', '22981ee8bebef1155b820e13b18f0e53', 'A'),
(9, 'torres', 'osvaldo', 'CEDULA', '4646511564', 'asuncion', '65191659', 'osvaldo@gmail.com', '1970-11-08', '', '1234', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
(10, 'solis', 'mathi', 'CEDULA', '5479498', 'ÑEMBY', '0979226642', 'XSCASCW821@gmail.com', '2021-12-14', '', 'vendedor', '0407e8c8285ab85509ac2884025dcf42', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global`
--

CREATE TABLE `global` (
  `idglobal` int NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `nombre_impuesto` varchar(5) NOT NULL,
  `porcentaje_impuesto` decimal(5,2) NOT NULL,
  `simbolo_moneda` varchar(5) NOT NULL,
  `logo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `global`
--

INSERT INTO `global` (`idglobal`, `empresa`, `nombre_impuesto`, `porcentaje_impuesto`, `simbolo_moneda`, `logo`) VALUES
(1, 'EL Club de los trofeos', 'IVA', '10.00', 'GS/', 'Files/Global/copitas.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int NOT NULL,
  `idusuario` int NOT NULL,
  `idsucursal` int NOT NULL,
  `idproveedor` int NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) NOT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `impuesto` decimal(8,2) NOT NULL,
  `utilidad` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idusuario`, `idsucursal`, `idproveedor`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha`, `impuesto`, `utilidad`, `total`, `estado`) VALUES
(4, 25, 1, 4, 'TICKET', '34343', '34343', '2021-11-27', '10.00', '300.00', '250.00', 'A'),
(5, 25, 1, 4, 'TICKET', '4334', '3343', '2021-11-27', '10.00', '80.00', '10000.00', 'A'),
(6, 25, 1, 1, 'FACTURA', '456', '3343', '2021-11-27', '10.00', '600.00', '1500.00', 'A'),
(7, 23, 1, 4, 'FACTURA', '001', '066', '2021-11-30', '10.00', '200.00', '5000.00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` int NOT NULL,
  `idcliente` int NOT NULL,
  `idusuario` int NOT NULL,
  `idsucursal` int NOT NULL,
  `tipo_pedido` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `numero` int DEFAULT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `idcliente`, `idusuario`, `idsucursal`, `tipo_pedido`, `fecha`, `numero`, `estado`) VALUES
(7, 2, 25, 1, 'Venta', '2021-11-27', 1, 'A'),
(8, 2, 25, 1, 'Venta', '2021-11-27', 2, 'A'),
(9, 2, 25, 1, 'Venta', '2021-11-29', 3, 'A'),
(10, 2, 22, 1, 'Venta', '2021-11-29', 4, 'A'),
(12, 5, 22, 1, 'Venta', '2021-11-30', 6, 'A'),
(13, 5, 22, 1, 'Venta', '2021-11-30', 7, 'A'),
(14, 5, 22, 1, 'Venta', '2021-11-30', 8, 'C'),
(15, 5, 22, 1, 'Venta', '2021-11-30', 9, 'A'),
(16, 2, 22, 1, 'Venta', '2021-11-30', 10, 'A'),
(17, 2, 22, 1, 'Venta', '2021-12-02', 11, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion_departamento` varchar(45) DEFAULT NULL,
  `direccion_provincia` varchar(45) DEFAULT NULL,
  `direccion_distrito` varchar(45) DEFAULT NULL,
  `direccion_calle` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `numero_cuenta` varchar(32) DEFAULT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion_departamento`, `direccion_provincia`, `direccion_distrito`, `direccion_calle`, `telefono`, `email`, `numero_cuenta`, `estado`) VALUES
(1, 'Proveedor', 'Importaciones Santa Ana S.A.C.', 'NIC', '12581369852', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Chiclayo', '257896', 'carlos@gmail.com', '305871596336', 'A'),
(2, 'Cliente', 'Juan Carlos Arcila Diaz', 'DNI', '75489623', 'Chiclayo', 'Chiclayo', 'Chiclayo', 'Chiclayo', '245862', 'jcarlos.ad7@gmail.com', '', 'A'),
(3, 'Proveedor', 'Inversiones Nuevo LeÃ³n S.A.C.', 'RUC', '2', 'Mexico', 'Guadalajara', 'Jalisco', 'Nuevo leon 1351', '9874565889', 'nuevomexico@gmail.com', '678646546546546548', 'A'),
(4, 'Proveedor', 'EMPRESA DE BOMBONES SA', 'RUC', '46467646', 'GUATEMALA', 'ESCUINTLA', 'SANTA LUCIA', '4TA CALLE 5206', '464634616', 'TROFEOSSPORT@GMAIL.COM', '34994839493', 'A'),
(5, 'Cliente', 'Nelson', 'CEDULA', '5724074', 'San Lorenzo', 'Central', 'ñññ', 'los naranjos', '0982286379', 'solisjonathan821@gmail.com', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idsucursal` int NOT NULL,
  `razon_social` varchar(150) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(70) DEFAULT NULL,
  `representante` varchar(150) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idsucursal`, `razon_social`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `representante`, `logo`, `estado`) VALUES
(1, 'Soluciones Empresariales ', 'RUC', '555555555-8', 'ASUNCION', '02178526', 'ventassetsasolutions@gmail.com', 'GUILLERMO VELASCO', 'Files/Sucursal/setsaop1.png', 'A'),
(2, 'El Club de los trofeos1', 'RUC', '572474-4', 'SAN LORENZO', '0971226160', 'TROFEOSSPORT@GMAIL.COM', 'Milciades Portillo', 'Files/Sucursal/copas.jpg', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `idtipo_documento` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `operacion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`idtipo_documento`, `nombre`, `operacion`) VALUES
(1, 'RUC', 'Persona'),
(2, 'DNI', 'Persona'),
(3, 'TICKET', 'Comprobante'),
(5, 'NIC', 'Persona'),
(6, 'FACTURA', 'Comprobante'),
(7, 'BOLETA', 'Comprobante'),
(8, 'CEDULA', 'Persona'),
(9, 'GUIA-REMISION', 'Comprobante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `idunidad_medida` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `prefijo` varchar(5) NOT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`idunidad_medida`, `nombre`, `prefijo`, `estado`) VALUES
(1, 'Unidad', 'Und', 'A'),
(2, 'Caja', 'Cja', 'A'),
(3, 'Paquete', 'Pqt', 'A'),
(4, 'Metro', 'Mt', 'A'),
(5, 'Docena', 'Doc', 'A'),
(6, 'Decena', 'Dec', 'A'),
(7, 'Ciento', 'Cto', 'A'),
(8, 'Tableta', 'Tab', 'A'),
(9, 'Paquete x 10', 'PQ10', 'A'),
(10, 'TROFEO', 'uni', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `idsucursal` int NOT NULL,
  `idempleado` int NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  `mnu_almacen` varchar(1) NOT NULL,
  `mnu_compras` varchar(1) NOT NULL,
  `mnu_ventas` varchar(1) NOT NULL,
  `mnu_mantenimiento` varchar(1) NOT NULL,
  `mnu_seguridad` varchar(1) NOT NULL,
  `mnu_consulta_compras` varchar(1) NOT NULL,
  `mnu_consulta_ventas` varchar(1) NOT NULL,
  `mnu_admin` varchar(1) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `idsucursal`, `idempleado`, `tipo_usuario`, `fecha_registro`, `mnu_almacen`, `mnu_compras`, `mnu_ventas`, `mnu_mantenimiento`, `mnu_seguridad`, `mnu_consulta_compras`, `mnu_consulta_ventas`, `mnu_admin`, `estado`) VALUES
(22, 1, 1, 'Administrador', '2016-03-03', '1', '1', '1', '1', '1', '1', '1', '1', 'A'),
(23, 2, 3, 'Administrador', '2021-11-27', '1', '1', '1', '1', '1', '1', '1', '1', 'A'),
(24, 2, 4, 'Administrador', '2021-11-27', '1', '1', '1', '1', '1', '1', '1', '1', 'A'),
(25, 1, 5, 'Empleado', '2021-11-27', '1', '1', '1', '1', '0', '1', '1', '0', 'A'),
(26, 1, 4, 'Cliente', '2021-11-30', '0', '0', '0', '0', '0', '0', '0', '0', 'A'),
(27, 1, 9, 'Administrador', '2021-11-30', '1', '1', '1', '0', '0', '1', '1', '1', 'A'),
(28, 2, 9, 'Administrador', '2021-11-30', '1', '1', '1', '0', '0', '1', '1', '1', 'A'),
(29, 2, 10, 'Empleado', '2021-12-02', '1', '1', '1', '1', '0', '1', '1', '1', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int NOT NULL,
  `idpedido` int NOT NULL,
  `idusuario` int NOT NULL,
  `tipo_venta` varchar(20) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) NOT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `impuesto` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idpedido`, `idusuario`, `tipo_venta`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha`, `impuesto`, `total`, `estado`) VALUES
(5, 7, 25, 'Contado', 'TICKET', '001', '00001', '2021-11-27', '10.00', '180.00', 'A'),
(6, 8, 25, 'Contado', 'FACTURA', '001', '0001', '2021-11-27', '10.00', '1400.00', 'A'),
(7, 9, 25, 'Contado', 'FACTURA', '001', '0002', '2021-11-29', '10.00', '180.00', 'A'),
(8, 10, 22, 'Contado', 'BOLETA', '001', '0001', '2021-11-29', '10.00', '180.00', 'A'),
(9, 12, 22, 'Credito', 'FACTURA', '001', '0003', '2021-11-30', '10.00', '180.00', 'A'),
(10, 13, 22, 'Contado', 'FACTURA', '001', '0004', '2021-11-30', '10.00', '180.00', 'A'),
(11, 14, 22, 'Credito', 'FACTURA', '001', '0005', '2021-11-30', '0.00', '0.00', 'A'),
(12, 15, 22, 'Contado', 'BOLETA', '001', '0002', '2021-11-30', '10.00', '180.00', 'A'),
(13, 16, 22, 'Credito', 'BOLETA', '001', '0003', '2021-11-30', '10.00', '180.00', 'A'),
(14, 17, 22, 'Contado', 'FACTURA', '001', '0006', '2021-12-02', '0.00', '0.00', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`),
  ADD KEY `fk_articulo_unidad_medida_idx` (`idunidad_medida`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`idcredito`),
  ADD KEY `fk_credito_venta1_idx` (`idventa`);

--
-- Indices de la tabla `detalle_documento_sucursal`
--
ALTER TABLE `detalle_documento_sucursal`
  ADD PRIMARY KEY (`iddetalle_documento_sucursal`),
  ADD KEY `fk_documento_sucursal_idx` (`idtipo_documento`),
  ADD KEY `fk_detalle_sucursal_idx` (`idsucursal`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_articulo_idx` (`idarticulo`),
  ADD KEY `fk_detalle_ingreso_idx` (`idingreso`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`iddetalle_pedido`),
  ADD KEY `fk_detalle_venta_ingreso_idx` (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_venta_idx` (`idpedido`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `global`
--
ALTER TABLE `global`
  ADD PRIMARY KEY (`idglobal`),
  ADD UNIQUE KEY `empresa_UNIQUE` (`empresa`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_proveedor_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`),
  ADD KEY `fk_ingreso_sucursal_idx` (`idsucursal`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `fk_venta_cliente_idx` (`idcliente`),
  ADD KEY `fk_venta_trabajador_idx` (`idusuario`),
  ADD KEY `fk_pedido_sucursal_idx` (`idsucursal`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idsucursal`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`idtipo_documento`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`idunidad_medida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_empleado_idx` (`idempleado`),
  ADD KEY `fk_usuario_sucursal_idx` (`idsucursal`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_pedido_idx` (`idpedido`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4566;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `idcredito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_documento_sucursal`
--
ALTER TABLE `detalle_documento_sucursal`
  MODIFY `iddetalle_documento_sucursal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `iddetalle_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `global`
--
ALTER TABLE `global`
  MODIFY `idglobal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idsucursal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `idtipo_documento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `idunidad_medida` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `fk_articulo_unidad_medida` FOREIGN KEY (`idunidad_medida`) REFERENCES `unidad_medida` (`idunidad_medida`);

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `fk_credito_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`);

--
-- Filtros para la tabla `detalle_documento_sucursal`
--
ALTER TABLE `detalle_documento_sucursal`
  ADD CONSTRAINT `fk_detalle_sucursal` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  ADD CONSTRAINT `fk_documento_sucursal` FOREIGN KEY (`idtipo_documento`) REFERENCES `tipo_documento` (`idtipo_documento`);

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`),
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`),
  ADD CONSTRAINT `fk_detalle_pedido_ingreso` FOREIGN KEY (`iddetalle_ingreso`) REFERENCES `detalle_ingreso` (`iddetalle_ingreso`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `fk_ingreso_sucursal` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `fk_pedido_sucursal` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  ADD CONSTRAINT `fk_pedido_trabajador` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`),
  ADD CONSTRAINT `fk_usuario_sucursal` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`),
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
