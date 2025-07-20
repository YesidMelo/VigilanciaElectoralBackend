-- #region variables
set @contrasenia_inicial = '8#qo6BLs2^J7YBn';
set @documento_busqueda = '978833237447969';
set @login = 'superAdmin';
set @idRol = '1'; -- superAdmin
set @tipoDocumento_busqueda = '1';
-- #endregion

-- #region usuariorol
-- insercion del rol del usuario de sistema
insert into VigilanciaElectoral.sesion_UsuarioRol
  (documento, tipoDocumento, rol, fechaInicio, fechaFin)
values 
  (@documento_busqueda, @tipoDocumento_busqueda, @idRol, now(), null);
-- Fin Insercion Contrasenia 

-- inicio insercion del login de usuario
insert into VigilanciaElectoral.sesion_UsuarioLogin(documento, tipoDocumento, login)
values (@documento_busqueda, @tipoDocumento_busqueda, @login);
-- fin insersion del login de usuario

-- #endregion
-- limpia variables de sesion
set @contrasenia_inicial = null;
set @documento_busqueda = null;
set @login = null;
set @idRol = null;
set @tipoDocumento_busqueda = null;