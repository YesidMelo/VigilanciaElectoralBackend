-- #region variables
set @documento = null;
set @tipoDocumento =  null;
set @documento_busqueda = '978833237447969';
set @login = 'superAdmin';
set @tipoDocumento_busqueda = '1';

-- inicio insercion del login de usuario
delete from VigilanciaElectoral.sesion_UsuarioLogin;
truncate table VigilanciaElectoral.sesion_UsuarioLogin;

-- Buscar documento
SELECT 
   documento,
   tipoDocumento
INTO 
   @documento,
   @tipoDocumento
FROM VigilanciaElectoral.sesion_UsuarioLogin
WHERE 
       documento = @documento_busqueda
   and tipoDocumento = @tipoDocumento_busqueda
LIMIT 1;

select @documento, @tipoDocumento;

INSERT INTO VigilanciaElectoral.sesion_UsuarioLogin(documento, tipoDocumento, login)
SELECT @documento_busqueda, @tipoDocumento_busqueda, @login
WHERE @documento IS NULL AND @tipoDocumento IS NULL;

-- limpia variables de sesion
set @documento = null;
set @tipoDocumento =  null;
set @documento_busqueda = null;
set @login = null;
set @tipoDocumento_busqueda = null;