-- #region variables
set @contrasenia_inicial = '8#qo6BLs2^J7YBn';
set @documento_busqueda = '978833237447969';
set @tipoDocumento_busqueda = '1';
-- #endregion

delete from VigilanciaElectoral.sesion_UsuarioContrasenia;
truncate table VigilanciaElectoral.sesion_UsuarioContrasenia;

-- Inicio Insercion Contrasenia 
-- Buscar contrasenia
SELECT contraseniaActual
INTO @contraseniaActual
FROM VigilanciaElectoral.sesion_UsuarioContrasenia
WHERE CONVERT(documento USING utf8mb4) COLLATE utf8mb4_unicode_ci = 
      CONVERT(@documento_busqueda USING utf8mb4) COLLATE utf8mb4_unicode_ci
  AND CONVERT(tipoDocumento USING utf8mb4) COLLATE utf8mb4_unicode_ci =
      CONVERT(@tipoDocumento_busqueda USING utf8mb4) COLLATE utf8mb4_unicode_ci
LIMIT 1;

-- insertar constrasenia sesion_Usuario si no encuentra el documento
INSERT INTO VigilanciaElectoral.sesion_UsuarioContrasenia (documento, tipoDocumento, contraseniaActual)
SELECT @documento_busqueda, @tipoDocumento_busqueda, SHA2(@contrasenia_inicial, 256)
FROM DUAL
WHERE @contraseniaActual IS NULL;