create database `bd_intec`;

use `bd_intec`;


CREATE TABLE `catalogoestatusorden` (
  `IdEstatusOrden` int(11) NOT NULL,
  `DescripcionEstatusOrden` varchar(50) COLLATE latin1_spanish_ci NOT NULL
);


CREATE TABLE `catalogoestatuspaquetes` (
  `IdEstatusPaquete` int(11) NOT NULL,
  `DescripcionEstatusPaquete` varchar(40) COLLATE latin1_spanish_ci NOT NULL
);

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `NombreCompania` varchar(50) DEFAULT NULL,
  `NombreContacto` varchar(50) DEFAULT NULL,
  `Domicilio` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL
);

CREATE TABLE `catalogoperiodos` (
	`IdPeriodo` int(11) auto_increment primary key NOT NULL,
    `TipoPeriodo` varchar(20) not null
);

CREATE TABLE `equipo` (
  `IdEquipo` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `NumService` varchar(20) DEFAULT NULL,
  `ClaveId` varchar(50) DEFAULT NULL,
  `AlcanceMedicion` varchar(100) DEFAULT NULL,
  `DivisionMedicion` varchar(100) DEFAULT NULL,
  `IdPeriodo` int,
  `MesInicio` int,
  `MesUltimoServicio` int,
  `IdCliente` int(11) DEFAULT NULL,
	FOREIGN KEY (IdPeriodo) REFERENCES catalogoperiodos (IdPeriodo)
);

CREATE TABLE `equipo_orden` (
  `IdEquipoOrden` int(11) NOT NULL,
  `IdOrden` int(11) DEFAULT NULL,
  `IdEquipo` int(11) DEFAULT NULL,
  `IdPaqueteEnvio` int(11) DEFAULT NULL,
  `FechaFinCalLab` date DEFAULT NULL,
  `FechaRetLab` date DEFAULT NULL,
  `FechaRecIntecLab` date DEFAULT NULL,
  `FechaEstFinCal` date DEFAULT NULL,
  `Etiqueta` tinyint(1) DEFAULT NULL,
  `FechaEtiqueta` date DEFAULT NULL,
  `Factura` int(11) DEFAULT NULL,
  `Certificado` text NOT NULL,
  `IdEstatusPaquete` int(11) DEFAULT NULL
);

CREATE TABLE `estatusequipo` (
  `IdEquipoOrden` int(11) NOT NULL,
  `IdEstatusPaquetes` int(11) NOT NULL,
  `FechaEstatus` date NOT NULL
);

CREATE TABLE `facturacliente` (
  `IdFactura` int(11) NOT NULL,
  `NumFactura` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `FechaFactura` date NOT NULL,
  `IdCliente` int(11) NOT NULL
);

CREATE TABLE `laboratorio` (
  `IdLaboratorio` int(11) NOT NULL,
  `Descripcion_lab` varchar(100) DEFAULT NULL,
  `Domicilio` varchar(200) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `diasServicios` tinyint(4) NOT NULL
);

CREATE TABLE `orden_servicio` (
  `IdOrden` int(11) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `FechaEnvio` date DEFAULT NULL,
  `FechaRecibo` date DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `IdEstatusOrden` int(11) DEFAULT NULL
);

CREATE TABLE `paquete_envio` (
  `IdPaqueteEnvio` int(11) NOT NULL,
  `IdLaboratorio` int(11) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `FechaEnv` date DEFAULT NULL,
  `FechaRecLab` date DEFAULT NULL,
  `IdEstatusPaquete` int(11) DEFAULT '0',
  `NumeroGuia` varchar(30) DEFAULT NULL,
  `CostoEnvio` decimal(10,2) DEFAULT NULL
);

CREATE TABLE `perfil` (
  `IdPerfil` int(11) NOT NULL,
  `DescripcionPerfil` varchar(40) COLLATE latin1_spanish_ci NOT NULL
);

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `ApellidosUsuario` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `contrasena` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `IdPerfil` int(11) NOT NULL,
  `fechaActualizado` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fechaCaducidad` datetime DEFAULT NULL,
  `creacion` tinyint(1) NOT NULL DEFAULT '0'
);




INSERT INTO `catalogoestatusorden` (`IdEstatusOrden`, `DescripcionEstatusOrden`) VALUES
(1, 'CREADA'),
(2, 'EN SERVICIO'),
(3, 'CERRADA');
INSERT INTO `catalogoestatuspaquetes` (`IdEstatusPaquete`, `DescripcionEstatusPaquete`) VALUES
(1, 'Creado'),
(2, 'Enviado a Laboratorio'),
(3, 'Recibido Laboratorio'),
(4, 'Calibración Terminada'),
(5, 'En Retorno'),
(6, 'Recibido Intec'),
(7, 'Terminado');
INSERT INTO `cliente` (`IdCliente`, `NombreCompania`, `NombreContacto`, `Domicilio`, `Correo`, `Telefono`) VALUES
(1, 'Vianney', 'Vianney', '', '', ''),
(2, 'TK', 'TK', '', '', ''),
(3, 'HOWA', 'HOWA', '', '', ''),
(4, 'QUAGSA', 'QUAGSA', NULL, NULL, NULL),
(5, 'SANOH', 'SANOH', NULL, NULL, NULL),
(6, 'ITW', 'ITW', NULL, NULL, NULL),
(7, 'OSHITANI', 'OSHITANI', NULL, NULL, NULL),
(8, 'Centro Diesel Profesional SA de CV', 'Armando Delgado', 'Carr. Salida a Durango, Plan de Ayal S/N', 'armando.delgado.silva@gmail.com', NULL),
(9, 'Quality Bolca S.A de C.V', '', 'Av. Independencia  203 Paseos de Aguascalientes C.', '\r', '9139955'),
(10, 'Ditromexico S.A. de C.V.', '', 'PABELLON DE ARTEAGA 114 PARQUE INDUSTRIAL DEL VALL', '\r', '01 (449) 9734300'),
(11, 'Grupo FARSANMAR S.A. de C.V.', 'Andres Ramirez', 'Avenida Circuito Aguascalientes 142-D Parque Indus', 'andres.ramirez@farmaciastamaria.com\r', '(449) 1-58-24-00'),
(12, 'SIA AUTOMATION S. DE R.L DE C.V', 'Israel Bueno ', 'AV. PASEO DE LOS INSURGENTES 304 INT. 20 JARDINES ', 'i.bueno@sia-automation.com.mx\r', '9711951'),
(13, 'SANDRA ELISA HERNANDEZ', 'oscar calzada rodriguez ', 'Jesus Rivera Franco 301 Cd. Industrial Aguascalien', 'oscarespmec@outlook.com\r', '9712479 - 9712353-68'),
(14, 'QUALITY DE AGUASCALIENTES S.A. DE C.V.', 'Marisol Haro', 'Av. Canal interceptor 703 Int. 5 Las arboledas Agu', 'marisol.haro@quagsa.com.mx\r', '1759823'),
(15, 'TF-METAL MEXICO SA DE CV', 'salvador Duenas ', 'Circuito Cerezos Sur No 105 san Francisco de los R', 's-duenas@tf-metal.mx\r', '52 449 922 40 00 ext'),
(16, 'VITECHMEX NONWOVENS SA DE CV', 'Nancy Martinez ', 'CARRETERA 45 NORTE KM 14.3 325-B J. Gomez Portugal', 'nmartinez@vitechmfgmx.com\r', '1535700- 1535711'),
(17, 'METALISTIK SA DE CV', 'Javier Delgado ', 'CARRETERA PANAMERICANA NORTE KM 14 INT. 15 PASEOS ', 'javier.delgado@metalistik.com\r', '449 188 42 19'),
(18, 'MGM NUTRICION ANIMAL SA DE CV', 'Ing. Cuahutemoc Sanchez', 'Carretera a San Luis Potosi km 14.5 El Retono Agua', 'csanchez@mgmnutricionanimal.com\r', '9711914'),
(19, 'MEXICO MURATA SPRING CORPORATION S.A DE C.V', 'Jose Haro ', 'PROLONGACION CONSTITUCION 802 EL PUERTECITO DE LA ', 'jharo@mexicomsc.com\r', '449 412 36 33'),
(20, 'SHOSHIBA MEXICANA SA DE CV', 'Adan Murillo ', 'CARRETERA 45 NORTE KM 14.3 325 A JESUS MARIA PORTU', 'adan.murillo@shoshiba.com.mx\r', '929 5434'),
(21, 'INDUSTRIAS DMU S.A DE C.V.', 'Refugio Rangel ', 'JOSE BARBA ALONSO 105 CD. INDUSTRIAL AGUASCALIENTE', 'rrangel@ind-dmu.com\r', '9712587'),
(22, 'J&R MAQUINADOS INDUSTRIALES S.A. DE C.V.', '', 'HEROE DE NACOZARI NTE 2905 INT. 3 LAS HADAS AGUASC', '\r', '912 11 85'),
(23, 'MAQUINADOS Y SERVICIOS ESPECIALIZADOS, S.A. DE C.V', '', 'AV. SIGLO XIX 109 LOMAS DE SANTA ANITA AGUASCALIEN', '\r', '9755502'),
(24, 'KUROTA MEXICO S.A. DE C.V.', 'Esmeralda Montes ', 'CIRCUITO CEREZO SUR 108 PARQUE INDUSTRIAL SAN FCO.', 'compras1@kurota-mx.com\r', '478-31-03'),
(25, 'Gestamp Aguascalientes S.A. de C.V.', 'Edgar Duron', 'AVDA. DE JAPON 124 PARQUE INDUSTRIAL SAN FRANCISCO', '\r', '449 910 9140 Ext. 19'),
(26, 'COMPANIA ALIMENTICIA RIVERA ROMO SA DE CV', '', 'Av. Independencia 502 Fracc. El sol Aguascalientes', 'calidad.ags@galletasvanessa.com.mxoffice@bccbi.bg\r', '9 15 55 45. Ext. 108'),
(27, 'IMPULSORA DE HERRAMIENTAS DEL CENTRO S. de R.L de ', 'Roberto Diaz', 'Altena 105 Ejido Cumbres Aguascalientes C.P 20175', 'ihc.ags@hotmail.com\r', '01 449 9725314'),
(28, 'TST NIKKEI METALES S. DE RL. DE CV.', 'Miguel Reyes ', 'CARRETERA LOS ARELLANOS P4 ARELLANO AGUASCALIENTES', 'mreyes@tstnikkei.com\r', ' 449 929 5517'),
(29, 'PARKER-TRUTEC MEXICANA S.A. DE C.V', 'Karla Rodriguez ', 'CAROLINA VILLANUEVA 408 CD. INDUSTRIAL AGUASCALIEN', 'krodriguez@parkertrutec.com\r', '449 9711436'),
(30, 'JIDOHKA SMART S.A. DE C.V.', 'Alejandra Robles', 'AV. MAHATMA GANDHI 814 COL SAN FRANCISCO DEL ARENA', 'compras@jidohkasmart.com.mx\r', '929-51-63 ext. 102'),
(31, 'Mahle Componentes de Motor de Mexico S. de R.L. de', 'Ana Mcias', 'KM. 0.3 carr. Maravillas- Jesus Maria 1176 Aguasca', 'ana.macias@mx.mahle.com\r', '(449) 9108244'),
(32, 'O-Tek Mexico S.A de C.V', 'Carolina Lizbeth Ayala Mata ', 'Carretera Aguascalientes - Zacatecas km. 17.5 parq', 'carolina.ayala@o-tek.com.mx\r', '139-39-60'),
(33, 'Smeltek S.A de C.V', 'Fernando Camacho ', 'Av. Julio Diaz Torre 112 CD Industrial Aguascalien', 'fernando.camacho@smeltek.mx\r', '9710910'),
(34, 'Texas Instruments de Mexico S de RL de CV', 'Rodriguez, Bety ', 'Jesus Rivera Franco 507 Cd. Industrial C.P20290 Ag', 'b-rodriguez2@ti.com\r', '175 1474'),
(35, 'Guadalupe del Rocio Lira Guerra', '', 'quirigua 603 Lomas de Jesus Maria Aguascalientes ', '\r', ''),
(36, 'S&C ELECTRIC MEXICANA S. DE R .L. DE C .V.', 'Castorena, Carlos', 'JESUS MARIA ROMO N. 143 CD. INDUSTRIAL AGUASCALIEN', ' Carlos.Castorena@sandc.com\r', '149-23-73'),
(37, 'CONEXIONES PLASTICAS DE AGUASCALIENTES SA DE CV', 'Norma Gloria', '20 de Noviembre N. 1604 Morelos Aguascalientes C.P', 'n.gloria@conplasa.com.mx\r', '9120122'),
(38, 'Operadora MPK S A P I de CV', 'Isabel Castorena ', 'Aguascalientes Sur 2729 Lote 12 Manzana jardines d', 'icastorena@miraplastek.com.mx\r', '9106620'),
(39, 'Cymesa S.A. de C.V.', 'ANTONIO PLASCENCIA ', 'Lerma 2111 Colonia Mitras Centro Nuevo Leon Monter', 'pagj670520@gmail.com\r', '9711488'),
(40, 'SANS MEXICANA S.A DE C.V.', '', 'Av. Mexico 204 Parque Industrial San Francisco Agu', 'calidad@sansmex.com.mx\r', '449 9109350'),
(41, 'POLICH INDUSTRIES S.A DE .C.V', 'Compras Polich Industries ', 'CIRCUITO IGNACIO AYALA 104 NORIAS DE PASO HONDO 23', 'compras@polich.us\r', '9141260'),
(42, 'SAKAIYA DE MEXICO S.A DE C.V', 'Magdalena Mendez Lara', 'Av.Muebleros 210 Chichimico C.P 20916 Jesus Maria ', 'Metrologia.chichimeco@sakaiya.com.mx\r', '9730010'),
(43, 'OROTEX INDUSTRIAL DE AGUASCALIENTES S DE RL DE CV', 'Claudia Ivonne V. ', 'JOSE BARBA ALONSO 215 CD INDUSTRIAL AGUASCALIENTES', 'cxp@orotexmx.com\r', '971-0484'),
(44, 'Advanced Carrier Products Mexico SA de CV', 'Eng. Miguel Angel Martinez', 'Carr. Panamericana Km 8.5 108-B Parque Industrial ', 'acp.calidad@acp-mex.com\r', '9295451'),
(45, 'TEKLAS AUTOMOTIVE MEXICO, S.A de C.V.', 'Brenda MASCORRO ', 'MEZQUITE 106 PARQUE INDUSTRIAL SAN FRANCISCO  C.P ', 'bmascorro@teklas.com.tr\r', '52 1 449 494 2445'),
(46, 'Fabrica Nacional De Herramientas S.A De C.V.', 'Ing. Oscar Alberto Macias Roman', 'Arturo Romo de Vivar 1 Parque Industrial  Chichime', 'calidad1@fandher.com.mx\r', '5000050 ext 114'),
(47, 'Productos Doblados de Mexico S.A de C.V.', 'Alberto Cortes R.', 'Av. Estados Unidos de America 114 Parque Industria', ' alberto.cortes@prodomex.com.mx\r', '(449) 929-20-94'),
(48, 'SERVICIOS TECNICOS PROFESIONALES MARISA SA DE CV.', '', 'PAPATZIN MANZA 26 LOTE 29 AJUSTO Ciudad de Mexico ', '\r', '15553386385'),
(49, 'Ma. Guadalupe Montoya Rubalcava', '', 'Conjunto Villa Hidalgo', '\r', '');
INSERT INTO `catalogoperiodos` (`TipoPeriodo`) VALUES
('Mensual'),('Trimestral'),('Semestral'),('Anual');
INSERT INTO `laboratorio` (`IdLaboratorio`, `Descripcion_lab`, `Domicilio`, `Telefono`, `diasServicios`) VALUES
(4, 'HSM Sistemas Metrológicos SA de CV', 'Blvd. Bernardo Quintana No. 630 Local 21 Col. Desarrollo San Pablo, C.P. 76125', '462 1959668', 10);
INSERT INTO `perfil` (`IdPerfil`, `DescripcionPerfil`) VALUES
(1, 'Administrador');
INSERT INTO `usuarios` (`IdUsuario`, `NombreUsuario`, `ApellidosUsuario`, `usuario`, `contrasena`, `IdPerfil`, `fechaActualizado`, `fechaCreacion`, `fechaCaducidad`, `creacion`) VALUES
(1, 'David', 'Parrito', 'david.parrito', 'f182bb4f7003792e4b027d4fe5fbd9b3', 1, '2019-06-17 17:13:48', '2019-06-17 17:02:22', '2019-12-14 17:10:28', 1);


ALTER TABLE `catalogoestatusorden`
  ADD PRIMARY KEY (`IdEstatusOrden`);

--
-- Indices de la tabla `catalogoestatuspaquetes`
--
ALTER TABLE `catalogoestatuspaquetes`
  ADD PRIMARY KEY (`IdEstatusPaquete`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`IdEquipo`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `equipo_orden`
--
ALTER TABLE `equipo_orden`
  ADD PRIMARY KEY (`IdEquipoOrden`),
  ADD KEY `IdOrden` (`IdOrden`),
  ADD KEY `IdEquipo` (`IdEquipo`),
  ADD KEY `IdPaqueteEnvio` (`IdPaqueteEnvio`),
  ADD KEY `equipo_orden_ibfk_4` (`IdEstatusPaquete`),
  ADD KEY `equipo_orden_ibfk5` (`Factura`);

--
-- Indices de la tabla `estatusequipo`
--
ALTER TABLE `estatusequipo`
  ADD PRIMARY KEY (`IdEquipoOrden`,`IdEstatusPaquetes`),
  ADD KEY `EstatusPaquete_ibfk2` (`IdEstatusPaquetes`);

--
-- Indices de la tabla `facturacliente`
--
ALTER TABLE `facturacliente`
  ADD PRIMARY KEY (`IdFactura`),
  ADD KEY `facturacliente_ibfk1` (`IdCliente`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`IdLaboratorio`);

--
-- Indices de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD PRIMARY KEY (`IdOrden`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `orden_servicio_ibfk2` (`IdEstatusOrden`);

--
-- Indices de la tabla `paquete_envio`
--
ALTER TABLE `paquete_envio`
  ADD PRIMARY KEY (`IdPaqueteEnvio`),
  ADD KEY `IdLaboratorio` (`IdLaboratorio`),
  ADD KEY `paquete_envio_ibfk_2` (`IdEstatusPaquete`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`IdPerfil`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD KEY `usuario_ibfk1` (`IdPerfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogoestatusorden`
--
ALTER TABLE `catalogoestatusorden`
  MODIFY `IdEstatusOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `catalogoestatuspaquetes`
--
ALTER TABLE `catalogoestatuspaquetes`
  MODIFY `IdEstatusPaquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `IdEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `equipo_orden`
--
ALTER TABLE `equipo_orden`
  MODIFY `IdEquipoOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `facturacliente`
--
ALTER TABLE `facturacliente`
  MODIFY `IdFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `IdLaboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  MODIFY `IdOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `paquete_envio`
--
ALTER TABLE `paquete_envio`
  MODIFY `IdPaqueteEnvio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `IdPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`);

--
-- Filtros para la tabla `equipo_orden`
--
ALTER TABLE `equipo_orden`
  ADD CONSTRAINT `equipo_orden_ibfk5` FOREIGN KEY (`Factura`) REFERENCES `facturacliente` (`IdFactura`),
  ADD CONSTRAINT `equipo_orden_ibfk_1` FOREIGN KEY (`IdOrden`) REFERENCES `orden_servicio` (`IdOrden`),
  ADD CONSTRAINT `equipo_orden_ibfk_2` FOREIGN KEY (`IdPaqueteEnvio`) REFERENCES `paquete_envio` (`IdPaqueteEnvio`),
  ADD CONSTRAINT `equipo_orden_ibfk_3` FOREIGN KEY (`IdEquipo`) REFERENCES `equipo` (`IdEquipo`),
  ADD CONSTRAINT `equipo_orden_ibfk_4` FOREIGN KEY (`IdEstatusPaquete`) REFERENCES `catalogoestatuspaquetes` (`IdEstatusPaquete`);

--
-- Filtros para la tabla `estatusequipo`
--
ALTER TABLE `estatusequipo`
  ADD CONSTRAINT `EstatusPaquete_ibfk1` FOREIGN KEY (`IdEquipoOrden`) REFERENCES `equipo_orden` (`IdEquipoOrden`),
  ADD CONSTRAINT `EstatusPaquete_ibfk2` FOREIGN KEY (`IdEstatusPaquetes`) REFERENCES `catalogoestatuspaquetes` (`IdEstatusPaquete`);

--
-- Filtros para la tabla `facturacliente`
--
ALTER TABLE `facturacliente`
  ADD CONSTRAINT `facturacliente_ibfk1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`);

--
-- Filtros para la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD CONSTRAINT `orden_servicio_ibfk2` FOREIGN KEY (`IdEstatusOrden`) REFERENCES `catalogoestatusorden` (`IdEstatusOrden`),
  ADD CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`);

--
-- Filtros para la tabla `paquete_envio`
--
ALTER TABLE `paquete_envio`
  ADD CONSTRAINT `paquete_envio_ibfk_1` FOREIGN KEY (`IdLaboratorio`) REFERENCES `laboratorio` (`IdLaboratorio`),
  ADD CONSTRAINT `paquete_envio_ibfk_2` FOREIGN KEY (`IdEstatusPaquete`) REFERENCES `catalogoestatuspaquetes` (`IdEstatusPaquete`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_ibfk1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfil` (`IdPerfil`);
