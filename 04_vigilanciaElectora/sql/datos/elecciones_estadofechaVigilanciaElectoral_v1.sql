-- Solo borra si la tabla existe
SET @table_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'VigilanciaElectoral'
    AND TABLE_NAME = 'Elecciones_EstadoFechaVigilanciaElectoral'
);

-- Ejecutar DELETE solo si la tabla existe
SET @sql = IF(@table_exists > 0,
    'DELETE FROM VigilanciaElectoral.Elecciones_EstadoFechaVigilanciaElectoral;',
    'SELECT "Tabla no existe";'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Luego puedes hacer el INSERT sin problema si sabes que la tabla fue creada antes
INSERT INTO VigilanciaElectoral.Elecciones_EstadoFechaVigilanciaElectoral (nombre, descripcion)
VALUES
  ('Inicio Vigilancia', 'Indica que se inicio la vigilancia de la Jornada electoral'),
  ('Fin Vigilancia', 'Indica que se finalizo la vigilancia de la jornada electoral'),
  ('Inicio Jornada Electoral', 'Inicio de la jornada electoral'),
  ('Fin Jornada Electoral', 'Fin de la jornada electoral'),
  ('Fecha Minima Registro Testigo Electoral', 'Indica el inicio del registro de los testigos electorales'),
  ('Fecha Maxima Registro Testigo Electoral', 'Indica el fin del registro de los testigos electorales'),
  ('Fecha Minimo Registro Partido politico', 'Indica el inicio del registro de los partidos politicos'),
  ('Fecha Maximo Registro Partido politico', 'Indica el fin del registro de los partidos politicos'),
  ('Fecha Minimo Habilitar testigo Electoral', 'Indica el inicio de la habilitacion del rol de testigo electoral'),
  ('Fecha Maximo Habilitar testigo Electoral', 'Indica el fin de la habilitacion del rol de testigo electoral'),
  ('Fecha Minimo Habilitar Reconteo de votos', 'Indica el inicio del reconteo de votos'),
  ('Fecha Maximo Habilitar Reconteo de votos', 'Indica el fin del reconteo de votos')
  ;