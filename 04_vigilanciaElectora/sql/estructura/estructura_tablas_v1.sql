-- Usuario fecha vigencia electoral
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Elecciones_FechaVigilanciaElectoral (
    fecha datetime not null,
    estadoVigilanciaElectoral int not null
);

-- estado fecha vigilancia
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Elecciones_EstadoFechaVigilanciaElectoral (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);
-- partidos politicos
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Elecciones_PartidoPolitico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);

-- tipo conteo votos
CREATE TABLE IF NOT EXISTS VigilanciaElectoral.Elecciones_TipoConteoVotos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) not null,
    descripcion varchar(250)
);