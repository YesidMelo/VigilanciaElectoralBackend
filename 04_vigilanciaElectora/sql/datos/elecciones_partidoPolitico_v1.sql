-- Solo borra si la tabla existe
SET @table_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'VigilanciaElectoral'
    AND TABLE_NAME = 'Elecciones_PartidoPolitico'
);

-- Ejecutar DELETE solo si la tabla existe
SET @sql = IF(@table_exists > 0,
    'DELETE FROM VigilanciaElectoral.Elecciones_PartidoPolitico;',
    'SELECT "Tabla no existe";'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

INSERT INTO VigilanciaElectoral.Elecciones_PartidoPolitico (nombre, descripcion)
VALUES
('Partido Liberal Colombiano', 'Uno de los partidos tradicionales de Colombia, de centroizquierda.'),
('Partido Conservador Colombiano', 'Partido tradicional de centroderecha.'),
('Centro Democrático', 'Partido de derecha fundado por Álvaro Uribe Vélez.'),
('Partido Verde - Alianza Verde', 'Partido ambientalista y de centroizquierda.'),
('Pacto Histórico', 'Coalición progresista de izquierda liderada por Gustavo Petro.'),
('Cambio Radical', 'Partido de centroderecha con enfoque liberal en economía.'),
('Partido de la U (Partido de la Unidad)', 'Partido de centro fundado para apoyar gobiernos anteriores.'),
('Colombia Humana', 'Movimiento liderado por Gustavo Petro, hace parte del Pacto Histórico.'),
('Coalición Centro Esperanza', 'Coalición de centro formada para elecciones recientes.'),
('Nuevo Liberalismo', 'Partido rescatado por los hijos de Luis Carlos Galán.'),
('Movimiento Salvación Nacional', 'Revivido recientemente, de ideología conservadora.'),
('Partido Comunes', 'Antiguo partido FARC, surgido tras el proceso de paz.'),
('Movimiento MAIS', 'Movimiento indígena y social con representación política.'),
('AICO (Autoridades Indígenas de Colombia)', 'Partido indígena con presencia regional.'),
('Partido En Marcha', 'Partido reciente liderado por Juan Fernando Cristo.')
;
