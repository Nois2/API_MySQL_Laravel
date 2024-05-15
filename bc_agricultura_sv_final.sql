-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-04-2024 a las 16:07:22
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bc_agricultura_sv_final`
--

CREATE DATABASE IF NOT EXISTS `bc_agricultura_sv_final` CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `bc_agricultura_sv_final`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabancaria`
--

DROP TABLE IF EXISTS `cuentabancaria`;
CREATE TABLE IF NOT EXISTS `cuentabancaria` (
  `ID_Cuenta` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DUI_Persona` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Saldo` decimal(10,2) DEFAULT NULL,
  `Estado_cuenta` enum('Activa','Inactiva') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Cuenta`),
  KEY `fk_CuentaBancaria_Usuario` (`DUI_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cuentabancaria`
--

INSERT INTO `cuentabancaria` (`ID_Cuenta`, `DUI_Persona`, `Saldo`, `Estado_cuenta`) VALUES
('183745926', '096100543', '1500.00', 'Activa'),
('255704137', '075862001', '200.00', 'Activa'),
('294117830', '862453104', '0.00', 'Activa'),
('299647103', '085237013', '0.00', 'Activa'),
('395441020', '400782041', '471.20', 'Activa'),
('410879620', '790085177', '0.00', 'Activa'),
('426937815', '456322217', '2200.00', 'Activa'),
('543587553', '625893331', '0.00', 'Activa'),
('572916438', '100523488', '2000.00', 'Activa'),
('583831206', '017687994', '20.00', 'Activa'),
('635421325', '017687994', '32.00', 'Activa'),
('638495721', '017687994', '67.05', 'Activa'),
('684100035', '258004367', '231.00', 'Activa'),
('784349029', '109744453', '0.00', 'Activa'),
('819365247', '096100543', '1800.00', 'Activa'),
('876592812', '209994101', '0.00', 'Activa'),
('990530214', '239411165', '0.00', 'Activa'),
('997299141', '100005423', '0.00', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DUI_Persona` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Contrasenia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ID_Rol` int NOT NULL,
  `Estado` enum('Activo','Inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ID_Sucursal` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Empleado_Persona` (`DUI_Persona`),
  KEY `fk_Empleado_Rol` (`ID_Rol`),
  KEY `fk_Empleado_Sucursal` (`ID_Sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID`, `DUI_Persona`, `Contrasenia`, `ID_Rol`, `Estado`, `ID_Sucursal`) VALUES
(1, '654321987', 'contra123', 4, 'Activo', 'SUC456'),
(2, '321654987', 'contra123', 5, 'Activo', 'SUC567'),
(3, '987654321', 'contra123', 2, 'Activo', 'SUC234'),
(4, '456789123', 'contra123', 3, 'Activo', 'SUC345'),
(5, '123456789', 'contra123', 1, 'Activo', 'SUC123'),
(6, '562311052', 'contra123', 6, 'Activo', 'SUC678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientosbancarios`
--

DROP TABLE IF EXISTS `movimientosbancarios`;
CREATE TABLE IF NOT EXISTS `movimientosbancarios` (
  `ID` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ID_Tipo` int NOT NULL,
  `ID_cuenta_origen` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ID_cuenta_destino` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `ID_Empleado` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_MovimientosBancarios_CuentaBancaria_Origen` (`ID_cuenta_origen`),
  KEY `fk_MovimientosBancarios_CuentaBancaria_Destino` (`ID_cuenta_destino`),
  KEY `fk_MovimientosBancarios_TipoTransaccion` (`ID_Tipo`),
  KEY `fk_MovimientosBancarios_Empleado` (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `movimientosbancarios`
--

INSERT INTO `movimientosbancarios` (`ID`, `ID_Tipo`, `ID_cuenta_origen`, `ID_cuenta_destino`, `Fecha`, `Monto`, `ID_Empleado`) VALUES
('000001', 1, NULL, '819365247', '2024-01-22 14:48:11', '500.00', 3),
('000002', 2, '183745926', NULL, '2024-03-16 10:49:11', '300.00', 3),
('000003', 3, '572916438', '426937815', '2024-02-07 09:10:53', '100.00', 3),
('000004', 1, NULL, '819365247', '2024-03-16 10:49:11', '800.00', 3),
('000005', 2, '572916438', NULL, '2024-03-16 10:49:11', '200.00', 3),
('000006', 1, NULL, '426937815', '2019-11-06 15:07:41', '30.00', 3),
('000007', 1, NULL, '426937815', '2021-04-28 10:42:02', '52.00', 3),
('000008', 2, '426937815', NULL, '2019-12-21 09:32:11', '12.00', 3),
('000009', 3, '426937815', '572916438', '2020-01-16 11:32:00', '17.95', 3),
('000010', 3, '684100035', '426937815', '2020-02-14 23:11:11', '26.00', 3),
('000011', 2, '426937815', NULL, '2020-03-28 12:56:07', '20.00', 3),
('000012', 1, NULL, '638495721', '2019-11-06 15:07:41', '30.00', 3),
('000013', 1, NULL, '638495721', '2021-04-28 10:42:02', '52.00', 3),
('000014', 2, '638495721', NULL, '2019-12-21 09:32:11', '12.00', 3),
('000015', 3, '638495721', '572916438', '2020-01-16 11:32:00', '17.95', 3),
('000016', 3, '684100035', '638495721', '2024-02-14 23:11:11', '26.00', 3),
('000017', 2, '638495721', NULL, '2020-03-28 12:56:07', '20.00', 3),
('000018', 1, NULL, '583831206', '2021-11-06 15:07:41', '30.00', 3),
('000019', 1, NULL, '583831206', '2022-04-28 10:42:02', '52.00', 3),
('000020', 2, '583831206', NULL, '2022-12-21 09:32:11', '12.00', 3),
('000021', 3, '183745926', '583831206', '2023-01-16 11:32:00', '17.95', 3),
('000022', 3, '583831206', '819365247', '2023-02-14 23:11:11', '26.00', 3),
('000023', 2, '583831206', NULL, '2023-03-28 12:56:07', '20.00', 3),
('000024', 1, NULL, '635421325', '2021-10-06 15:07:41', '30.00', 3),
('000025', 1, NULL, '635421325', '2022-02-28 10:42:02', '52.00', 3),
('000026', 2, '635421325', NULL, '2022-11-21 09:32:11', '12.00', 3),
('000027', 3, '684100035', '635421325', '2023-02-16 11:32:00', '17.95', 3),
('000028', 3, '635421325', '183745926', '2023-03-14 23:11:11', '26.00', 3),
('000029', 2, '635421325', NULL, '2023-03-28 12:56:07', '20.00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `DUI` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `PrimerNombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `SegundoNombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `PrimerApellido` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `SegundoApellido` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Fechanac` date NOT NULL,
  `telefono` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Correo` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`DUI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`DUI`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Fechanac`, `telefono`, `Correo`, `Direccion`) VALUES
('017687994', 'Oscar', 'Darío', 'Gutiérrez', 'Bram', '1995-01-23', '77459000', 'dariogutierres@example.com', 'BO ESCALÓN, AV. AGUILARES, LOCAL #4'),
('075862001', 'Daniel', 'Armando', 'Osegueda', 'Mendoza', '2003-11-27', '68441732', 'dany.oz64@example.com', 'Barrio Concepción, Cedros verdes 3, CL PPAL, #142'),
('085237013', 'Oswaldo', 'Narciso', 'Orellana', 'Waldemar', '2003-08-16', '75426892', 'narcizorella@example.com', 'Barrio Menjívar Fuentes, Av. Sur, PSJ 3, #7'),
('096100543', 'Oscar', 'Ernesto', 'Lumes', 'Carranza', '2002-08-05', '72814544', 'oscar@example.com', 'Avenida Raúl Contreras #781'),
('100005423', 'Alba', 'Irene', 'Bonilla', 'Solis', '1984-10-06', '78439253', 'albasolis@example.com', 'COL. FUENTES, PSJ 16, POL 1, #4'),
('100523488', 'Federico', 'Daniel', 'Cortez', 'Menjivar', '1992-12-22', '22586116', 'fedecor@example.com', 'Avenida San Francisco #12'),
('109744453', 'Sophia', 'Natalia', 'Herrera', 'Maite', '1967-10-12', '61554230', 'sophia.nat@example.com', 'Col. Miramontes 3 casa 58 -F pasaje #2'),
('123456789', 'Juan', 'Carlos', 'Pérez', 'Gómez', '2005-02-22', '76842642', 'juan@example.com', 'Avenida Principal #123'),
('209994101', 'José', 'Alexander', 'Medina', 'Urquilla', '1983-03-11', '60238841', 'chepeurquilla@example.com', '4° Av. Raúl y Cardoza, CL La Palmas, #11'),
('239411165', 'Natanael', 'Alexis', 'Guardado', 'Recinos', '1998-05-26', '62004777', 'natarecinos96@example.com', 'BO San Nicolás, COL Fuentes 2, #10'),
('258004367', 'Rolando', 'Izmael', 'Portillo', 'López', '1992-09-09', '61421685', 'izmalopez1968@example.com', 'Bosques de la Escalón, CL PPAL, PSJ 8, Condominio Crown View, #72'),
('321654987', 'Luis', 'Alberto', 'Díaz', 'Sánchez', '2005-07-26', '62003097', 'luis@example.com', 'Calle Este #135'),
('400782041', 'Francisco', 'Ernesto', 'Calderon', 'Valladares', '2005-03-21', '71382045', 'francisc0cal73@example.com', 'Prados de Venecia, COL Villanueva, CL PPAL, POL 3, #122'),
('456322217', 'Ileana', 'Guadalupe', 'Díaz', 'Sosa', '1992-04-29', '63106289', 'ilesosa@example.com', 'Avenida Romero Oeste #45'),
('456789123', 'Pedro', 'Antonio', 'López', 'Hernández', '1999-05-11', '64550010', 'pedro@example.com', 'Calle Central #789'),
('562311052', 'Elena', 'Marcela', 'Hernández', 'Carrillo', '2001-03-16', '61420749', 'elecas@example.com', 'Avenida Norte #2'),
('625893331', 'Mauricio', 'Josue', 'Escalón', 'Duarte', '1955-02-17', '22436129', 'mausalarrue@example.com', 'Primera y ultima avenida Raúl Contreras #15'),
('654321987', 'Ana', 'Isabel', 'García', 'Fernández', '2004-07-01', '68992246', 'ana@example.com', 'Avenida Norte #246'),
('790085177', 'Emerson', 'Ernesto', 'Flores', 'Sandoval', '1996-08-14', '62849170', 'emerso.sandoval@example.com', 'Av. Los Pinos, PSJ 12, POL 1, #16'),
('862453104', 'Oscar', 'Alfredo', 'Maldonado', 'Arriaga', '1967-06-29', '61420093', 'oscararri@example.com', 'pasaje salinitas #2'),
('987654321', 'María', 'Elena', 'Rodríguez', 'Martínez', '2003-10-28', '23458871', 'maria@example.com', 'Calle Secundaria #456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE IF NOT EXISTS `prestamo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DUI_Persona` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `TasaInteres` decimal(10,2) NOT NULL,
  `Estado` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `FechaSolicitud` datetime NOT NULL,
  `CuotaMensual` decimal(10,2) NOT NULL,
  `PlazoPago` date NOT NULL,
  `ID_Solicitud` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Prestamo_Usuario` (`DUI_Persona`),
  KEY `fk_Prestamo_Solicitud` (`ID_Solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ID`, `DUI_Persona`, `Monto`, `TasaInteres`, `Estado`, `FechaSolicitud`, `CuotaMensual`, `PlazoPago`, `ID_Solicitud`) VALUES
(1, '096100543', '5000.00', '0.08', 'Espera', '2024-03-16 09:06:13', '450.00', '2025-03-16', 1),
(2, '100523488', '3000.00', '0.06', 'Rechazado', '2024-03-10 11:23:12', '88.33', '2027-03-10', 2),
(3, '456322217', '4000.00', '0.07', 'Rechazado', '2024-03-14 13:18:14', '178.33', '2026-03-14', 3),
(4, '096100543', '6000.00', '0.09', 'Rechazado', '2024-03-14 17:12:09', '136.25', '2028-03-14', 4),
(5, '100523488', '7000.00', '0.10', 'Aprobado', '2024-03-15 15:57:23', '106.94', '2030-04-16', 5),
(6, '017687994', '79000.00', '0.12', 'Espera', '2024-03-29 14:42:55', '1800.00', '2045-03-29', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Abreviatura` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID`, `Rol`, `Abreviatura`, `Descripcion`) VALUES
(1, 'Gerente General', 'GRG', 'Gefe absoluto.'),
(2, 'Cajero', 'CAJ', 'Empleado del banco que ingresa nuevos clientes o prestamistas y dependientes, ingresa y retira dinero de clientes y apertura préstamos.'),
(3, 'Contador', 'CTD', 'Empleado de administración contable.'),
(4, 'Dependiente del banco', 'DDB', 'Tipo de usuario especial, ingreso y retiro de efectivo a una cuenta de un usuario del banco.'),
(5, 'Asistente administrativo', 'AAD', 'Asistentes de gefes.'),
(6, 'Gerente Sucursal', 'GRS', 'Persona encargada de las actividades administrativas de la sucursal del banco.'),
(7, 'Cliente', 'CLT', 'Usuario del banco.'),
(8, 'Personal de limpieza', 'PDL', 'Personal encargado de los oficios higienicos dentro de las instalaciones.'),
(9, 'Secretari@s/Recepcionistas', 'SEC', 'Informates y/o asistentes de administración.'),
(10, 'Asesor Financiero', 'ASF', 'Asesor contable.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE IF NOT EXISTS `solicitud` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Asunto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ArgumentoDenegado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `FechaAprobacionRechazo` datetime DEFAULT NULL,
  `ID_Empleado` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Solicitud_Empleado` (`ID_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`ID`, `Asunto`, `Contenido`, `ArgumentoDenegado`, `FechaAprobacionRechazo`, `ID_Empleado`) VALUES
(1, 'Solicitud de préstamo', 'Solicitud de préstamo por emergencia médica.', NULL, NULL, 3),
(2, 'Solicitud de préstamo', 'Solicitud de préstamo para invertir en educación.', 'Esa Escuela no existe.', '2024-03-13 13:30:07', 3),
(3, 'Solicitud de préstamo', 'Solicitud de préstamo para compra de vehículo.', 'Vehiculo no cuenta con papeles legales.', '2024-03-16 10:37:02', 3),
(4, 'Solicitud de préstamo', 'Solicitud de préstamo para remodelación de vivienda.', 'Dueño de terrenos con credenciales falsificadas y no esta registrado en hacienda.', '2024-03-16 10:47:22', 3),
(5, 'Solicitud de préstamo', 'Solicitud de préstamo para gastos médicos.', NULL, '2024-03-16 10:50:16', 3),
(6, 'Solicitud de préstamo', 'Solicitud de prestamos para compra de vivienda.', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
  `ID` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Direccion` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`ID`, `Nombre`, `Direccion`) VALUES
('SUC123', 'Sucursal Principal', 'Avenida Libertad #789'),
('SUC234', 'Sucursal Central', 'Calle Independencia #456'),
('SUC345', 'Sucursal Norte', 'Avenida Reforma #123'),
('SUC456', 'Sucursal Sur', 'Calle Principe #246'),
('SUC567', 'Sucursal Este', 'Avenida Universidad #789'),
('SUC678', 'Sucursal Este 2', 'Avenida Don RUA #789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotransaccion`
--

DROP TABLE IF EXISTS `tipotransaccion`;
CREATE TABLE IF NOT EXISTS `tipotransaccion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tipotransaccion`
--

INSERT INTO `tipotransaccion` (`ID`, `Nombre`) VALUES
(1, 'Depósito'),
(2, 'Retiro'),
(3, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `Nombre_Usuario` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DUI_Persona` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Sueldo` decimal(10,2) NOT NULL,
  `Contrasenia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Verificado` enum('Si','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `EstadoUsuario` enum('Activo','Inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ID_Sucursal` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`Nombre_Usuario`),
  KEY `fk_Usuario_Persona` (`DUI_Persona`),
  KEY `fk_Usuario_Sucursal` (`ID_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Nombre_Usuario`, `DUI_Persona`, `Sueldo`, `Contrasenia`, `Verificado`, `EstadoUsuario`, `ID_Sucursal`) VALUES
('albabonillas2', '100005423', '958.00', 'Contra123_', 'Si', 'Activo', 'SUC123'),
('armendoza86', '075862001', '685.00', 'contra123', 'Si', 'Activo', 'SUC456'),
('calernesto28', '400782041', '1200.00', 'contra123', 'Si', 'Activo', 'SUC345'),
('chavegarcia10', '654321987', '2700.00', 'contraseña987', 'Si', 'Activo', 'SUC123'),
('elecar370', '562311052', '2700.00', 'contraseña321', 'Si', 'Activo', 'SUC456'),
('elenamart56', '987654321', '2000.00', 'contraseña456', 'Si', 'Activo', 'SUC345'),
('emerdoval15', '790085177', '345.00', 'contra123', 'Si', 'Activo', 'SUC678'),
('fedemenji045', '100523488', '2700.00', 'contraseña456', 'Si', 'Activo', 'SUC345'),
('ilesosa96', '456322217', '2700.00', 'contraseña789', 'Si', 'Activo', 'SUC678'),
('izmalopez16', '258004367', '4800.00', 'contra123', 'Si', 'Activo', 'SUC234'),
('juangomez21', '123456789', '2500.00', 'Contra123_', 'Si', 'Activo', 'SUC456'),
('luisans4089', '321654987', '2400.00', 'contraseña654', 'Si', 'Activo', 'SUC456'),
('maucalon101', '625893331', '450.00', 'contra123', 'Si', 'Activo', 'SUC234'),
('medinaurqui114', '209994101', '385.00', 'contra123', 'Si', 'Activo', 'SUC678'),
('natarecin2200', '239411165', '2500.00', 'contra123', 'Si', 'Activo', 'SUC456'),
('orewaldemar04', '085237013', '675.00', 'contra123', 'Si', 'Activo', 'SUC234'),
('oscarbram1742', '017687994', '155.00', 'contra123', 'Si', 'Activo', 'SUC123'),
('oscarluca19', '096100543', '2800.00', 'contraseña123', 'Si', 'Activo', 'SUC567'),
('oscarriaga108', '862453104', '4800.00', 'contra123', 'Si', 'Activo', 'SUC123'),
('pedrohernan02', '456789123', '2200.00', 'contraseña789', 'Si', 'Activo', 'SUC345'),
('sofmaite72', '109744453', '365.00', 'contra123', 'Si', 'Activo', 'SUC123');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  ADD CONSTRAINT `fk_CuentaBancaria_Usuario` FOREIGN KEY (`DUI_Persona`) REFERENCES `persona` (`DUI`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_Persona` FOREIGN KEY (`DUI_Persona`) REFERENCES `persona` (`DUI`),
  ADD CONSTRAINT `fk_Empleado_Rol` FOREIGN KEY (`ID_Rol`) REFERENCES `rol` (`ID`),
  ADD CONSTRAINT `fk_Empleado_Sucursal` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID`);

--
-- Filtros para la tabla `movimientosbancarios`
--
ALTER TABLE `movimientosbancarios`
  ADD CONSTRAINT `fk_MovimientosBancarios_CuentaBancaria_Destino` FOREIGN KEY (`ID_cuenta_destino`) REFERENCES `cuentabancaria` (`ID_Cuenta`),
  ADD CONSTRAINT `fk_MovimientosBancarios_CuentaBancaria_Origen` FOREIGN KEY (`ID_cuenta_origen`) REFERENCES `cuentabancaria` (`ID_Cuenta`),
  ADD CONSTRAINT `fk_MovimientosBancarios_Empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID`),
  ADD CONSTRAINT `fk_MovimientosBancarios_TipoTransaccion` FOREIGN KEY (`ID_Tipo`) REFERENCES `tipotransaccion` (`ID`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_Prestamo_Solicitud` FOREIGN KEY (`ID_Solicitud`) REFERENCES `solicitud` (`ID`),
  ADD CONSTRAINT `fk_Prestamo_Usuario` FOREIGN KEY (`DUI_Persona`) REFERENCES `persona` (`DUI`);

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `fk_Solicitud_Empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Persona` FOREIGN KEY (`DUI_Persona`) REFERENCES `persona` (`DUI`),
  ADD CONSTRAINT `fk_Usuario_Sucursal` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
