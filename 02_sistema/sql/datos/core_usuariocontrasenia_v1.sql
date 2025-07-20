-- #region variables
set @contrasenia_inicial = '8#qo6BLs2^J7YBn';
set @documento_busqueda = '978833237447969';
set @tipoDocumento_busqueda = '1';
-- #endregion

delete from VigilanciaElectoral.Core_UsuarioContrasenia;
truncate table VigilanciaElectoral.Core_UsuarioContrasenia;

-- Inicio Insercion Contrasenia 
-- Buscar contrasenia
SELECT contraseniaActual
INTO @contraseniaActual
FROM VigilanciaElectoral.Core_UsuarioContrasenia
WHERE documento COLLATE utf8mb4_unicode_ci = @documento_busqueda COLLATE utf8mb4_unicode_ci
  AND tipoDocumento COLLATE utf8mb4_unicode_ci = @tipoDocumento_busqueda COLLATE utf8mb4_unicode_ci
LIMIT 1;

-- insertar constrasenia Core_Usuario si no encuentra el documento
INSERT INTO VigilanciaElectoral.Core_UsuarioContrasenia (documento, tipoDocumento, contraseniaActual)
SELECT @documento_busqueda, @tipoDocumento_busqueda, SHA2(@contrasenia_inicial, 256)
FROM DUAL
WHERE @contraseniaActual IS NULL;

-- limpiesa datos sesion
set @documento = null;
set @tipoDocumento =  null;
set @documento_busqueda = null;
set @login = null;
set @tipoDocumento_busqueda = null;