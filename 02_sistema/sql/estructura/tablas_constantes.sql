-- duracion sesion
CREATE table if not exists VigilanciaElectoral.Core_DuracionSesionUsuario(
    documento varchar(60),
    tipoDocumento varchar(2),
    fechaHoraInicio datetime,
    fechaHoraFin datetime
);

-- error
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_Error (
    codigo varchar (30) not null,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- estado rol
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_EstadoRolSistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- funciones rol
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_FuncionRolSistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- roles
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_RolSistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- tipo de documento
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_TipoDocumento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- Usuario
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_Usuario (
    nombre varchar(100) not null,
    apellidos varchar(250),
    documento varchar (60),
    tipoDocumento varchar (2)
);

-- Usuario_password
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_UsuarioContrasenia (
    documento varchar(60) not null,
    tipoDocumento varchar(2) not null,
    contraseniaActual varchar(256) not null,
    contraseniaAnterior varchar(256) null
);

-- Usuario_login
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_UsuarioLogin(
    documento varchar(60) not null,
    tipoDocumento varchar(2) not null,
    login varchar(60) not null
);

-- usuario_Rol
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Core_UsuarioRol (
    documento varchar(60) not null,
    tipoDocumento varchar(2) not null,
    rol varchar(2) not null,
    fechaInicio dateTime not null,
    fechaFin datetime
);