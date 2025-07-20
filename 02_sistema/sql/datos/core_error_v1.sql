
-- #region core_errores
-- estado Core_Errores
truncate table VigilanciaElectoral.Core_Error;

-- Solo borra si la tabla existe
SET @table_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'VigilanciaElectoral'
    AND TABLE_NAME = 'Core_Error'
);

-- Ejecutar DELETE solo si la tabla existe
SET @sql = IF(@table_exists > 0,
    'DELETE FROM VigilanciaElectoral.Core_Error;',
    'SELECT "Tabla no existe";'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Luego puedes hacer el INSERT sin problema si sabes que la tabla fue creada antes
INSERT INTO VigilanciaElectoral.Core_Error (codigo, nombre)
VALUES
    ('0', 'Inicio de sesion exitosa'),
    ('1', 'Revisa tus credenciales'),
    ('2', 'La sesion esta vencida'),
    ('3', 'La sesion esta activa'),
    ('4', 'Registro exitoso de la función')
  ;
-- #endregion
