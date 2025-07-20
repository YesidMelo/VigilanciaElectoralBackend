-- duracion sesion
CREATE table if not exists VigilanciaElectoral.Sesion_DuracionSesionUsuario(
    documento varchar(60),
    tipoDocumento varchar(2),
    fechaHoraInicio datetime,
    fechaHoraFin datetime
);

-- error
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_Error (
    codigo varchar (30) not null,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- estado rol
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_EstadoRolSistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- funciones rol
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_FuncionRolSistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- roles
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_RolSistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- tipo de documento
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_TipoDocumento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- Usuario
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_Usuario (
    nombre varchar(100) not null,
    apellidos varchar(250),
    documento varchar (60),
    tipoDocumento varchar (2)
);

-- Usuario_password
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_UsuarioContrasenia (
    documento varchar(60) not null,
    tipoDocumento varchar(2) not null,
    contraseniaActual varchar(256) not null,
    contraseniaAnterior varchar(256) null
);

-- Usuario_login
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_UsuarioLogin(
    documento varchar(60) not null,
    tipoDocumento varchar(2) not null,
    login varchar(60) not null
);

-- usuario_Rol
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Sesion_UsuarioRol (
    documento varchar(60) not null,
    tipoDocumento varchar(2) not null,
    rol varchar(2) not null,
    fechaInicio dateTime not null,
    fechaFin datetime
);