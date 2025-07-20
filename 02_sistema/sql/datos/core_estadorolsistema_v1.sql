-- #region Estado rol sistema
-- Solo borra si la tabla existe
SET @table_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'VigilanciaElectoral'
    AND TABLE_NAME = 'Core_EstadoRolSistema'
);

truncate table VigilanciaElectoral.Core_EstadoRolSistema;

-- Ejecutar DELETE solo si la tabla existe
SET @sql = IF(@table_exists > 0,
    'DELETE FROM VigilanciaElectoral.Core_EstadoRolSistema;',
    'SELECT "Tabla no existe";'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Luego puedes hacer el INSERT sin problema si sabes que la tabla fue creada antes
INSERT INTO VigilanciaElectoral.Core_EstadoRolSistema (nombre, descripcion)
VALUES
  ('Inactivo', 'El Rol no se encuentra operativo en la plataforma'),
  ('En Revision', 'El rol se encuentra en revision y pruebas para dejarlo operativo en la plataforma'),
  ('Activo', 'El rol se encuentra operativo en la plataforma');
-- #endregion
