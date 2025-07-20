SET @apellidos = 'Administrador';
set @documento_busqueda = '978833237447969';
SET @nombre = 'Super';
set @tipoDocumento_busqueda = '1';

-- #region usuarios
delete from VigilanciaElectoral.sesion_Usuario;
truncate table VigilanciaElectoral.sesion_Usuario;
-- Inicio Insercion sesion_Usuario 
-- Buscar documento
SELECT 
   documento,
   tipoDocumento
INTO 
   @documento,
   @tipoDocumento
FROM 
   VigilanciaElectoral.sesion_Usuario
WHERE CONVERT(nombre USING utf8mb4) COLLATE utf8mb4_unicode_ci = 
      CONVERT(@nombre USING utf8mb4) COLLATE utf8mb4_unicode_ci
  AND CONVERT(apellidos USING utf8mb4) COLLATE utf8mb4_unicode_ci =
      CONVERT(@apellidos USING utf8mb4) COLLATE utf8mb4_unicode_ci
LIMIT 1;

-- insertar sesion_Usuario si no encuentra el documento
INSERT INTO VigilanciaElectoral.sesion_Usuario (nombre, apellidos, documento, tipoDocumento)
SELECT @nombre, @apellidos, @documento_busqueda, @tipoDocumento_busqueda
FROM DUAL
WHERE 
       @documento is null
   and @tipoDocumento is null
;

-- Fin Insercion sesion_Usuario 
-- #endregion

--limpia variables de sesion
SET @apellidos = null;
set @documento_busqueda = null;
SET @nombre = null;
set @tipoDocumento_busqueda = null;