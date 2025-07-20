
-- #region roles
delete from VigilanciaElectoral.sesion_RolSistema;
truncate table VigilanciaElectoral.sesion_RolSistema;

insert into VigilanciaElectoral.sesion_RolSistema(nombre, descripcion)
values 
   ("Super Administrador", "Gestiona los permisos para el administrador de partidos"),
   ("Administrador Partido Politico", "Es el encargado de gestionar los roles a nivel nacional"),
   ("Administrador Partido Politico Regional", "Es el encargado de gestionar los roles a nivel regional"),
   ("Gestor de permisos y funciones", "Encargado de gestionar permisos y funciones de la plataforma"),
   ("Suplente testigo electoral", "Tiene los accesos para las elecciones"),
   ("Testigo electoral", "Tiene acceso para las elecciones"),
   ("Visitante", "Es observador de los resultados en tiempo real")
   ;
-- #endregion
