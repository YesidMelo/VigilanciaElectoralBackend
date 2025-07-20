
-- #region sesion_errores
-- estado sesion_Errores
truncate table VigilanciaElectoral.sesion_Error;

-- Solo borra si la tabla existe
SET @table_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'VigilanciaElectoral'
    AND TABLE_NAME = 'sesion_Error'
);

-- Ejecutar DELETE solo si la tabla existe
SET @sql = IF(@table_exists > 0,
    'DELETE FROM VigilanciaElectoral.sesion_Error;',
    'SELECT "Tabla no existe";'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Luego puedes hacer el INSERT sin problema si sabes que la tabla fue creada antes
INSERT INTO VigilanciaElectoral.sesion_Error (codigo, nombre)
VALUES
    ('0', 'Inicio de sesion exitosa'),
    ('1', 'Revisa tus credenciales'),
    ('2', 'La sesion esta vencida'),
    ('3', 'La sesion esta activa')
  ;
-- #endregion
