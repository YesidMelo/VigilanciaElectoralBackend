
-- #region tipo documento 
-- Solo borra si la tabla existe
SET @table_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'VigilanciaElectoral'
    AND TABLE_NAME = 'sesion_TipoDocumento'
);

-- Ejecutar DELETE solo si la tabla existe
SET @sql = IF(@table_exists > 0,
    'DELETE FROM VigilanciaElectoral.sesion_TipoDocumento;',
    'SELECT "Tabla no existe";'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

truncate table VigilanciaElectoral.sesion_TipoDocumento;

-- Luego puedes hacer el INSERT sin problema si sabes que la tabla fue creada antes
INSERT INTO VigilanciaElectoral.sesion_TipoDocumento (nombre, descripcion)
VALUES
  ('Cédula de Ciudadanía', 'Documento nacional de identificación'),
  ('Tarjeta de Identidad', 'Identificación para menores de edad'),
  ('Cédula de Extranjería', 'Documento para ciudadanos extranjeros');

-- #endregion
