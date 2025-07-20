SET @apellidos = 'Administrador';
set @documento_busqueda = '978833237447969';
SET @nombre = 'Super';
set @tipoDocumento_busqueda = '1';

-- #region usuarios
delete from VigilanciaElectoral.Core_Usuario;
truncate table VigilanciaElectoral.Core_Usuario;
-- Inicio Insercion Core_Usuario 
-- Buscar documento
SELECT documento
INTO @documento
FROM VigilanciaElectoral.Core_Usuario
WHERE nombre COLLATE utf8mb4_unicode_ci = @nombre COLLATE utf8mb4_unicode_ci
  AND apellidos COLLATE utf8mb4_unicode_ci = @apellidos COLLATE utf8mb4_unicode_ci
LIMIT 1;

-- insertar Core_Usuario si no encuentra el documento
INSERT INTO VigilanciaElectoral.Core_Usuario (nombre, apellidos, documento, tipoDocumento)
SELECT @nombre, @apellidos, @documento_busqueda, @tipoDocumento_busqueda
FROM DUAL
WHERE @documento IS NULL;
-- Fin Insercion Core_Usuario 
-- #endregion

--limpieza sistema 
SET @apellidos = null;
set @documento_busqueda = null;
SET @nombre = null;
set @tipoDocumento_busqueda = null;