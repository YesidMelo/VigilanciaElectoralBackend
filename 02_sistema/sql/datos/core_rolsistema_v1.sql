
-- #region roles
delete from VigilanciaElectoral.Core_RolSistema;
truncate table VigilanciaElectoral.Core_RolSistema;

insert into VigilanciaElectoral.Core_RolSistema(nombre, descripcion)
values ("Super Administrador", "Es el que gestiona todos los accesos al sistema");
-- #endregion
