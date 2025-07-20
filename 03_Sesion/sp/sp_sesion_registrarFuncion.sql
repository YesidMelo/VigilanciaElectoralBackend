/*
set @codigoSalida = '';
set @login = 'superAdmin';
set @nombreFuncion = 'registrarUsuario';
set @descripcionFuncion = 'descripcion';
CALL sesion_registrarFuncion(
   @login, 
   @nombreFuncion,
   @descripcionFuncion,
   @codigoSalida
 );
select @codigoSalida;
*/
drop procedure if exists sesion_registrarFuncion;

create procedure sesion_registrarFuncion(
    IN  i_login varchar(60),
    in  i_nombreFuncion varchar(60),
    in  i_descripcionFuncion varchar(250),
    OUT o_codigoSalida varchar(60)
)
begin
   -- #region variables
   declare w_codigoValidacion varchar(60);
   -- #endregion
   
   -- #region validacion sesion
   call sesion_validarSesion(i_login, w_codigoValidacion);
   
   if w_codigoValidacion <> '3' then -- '3' sesion activa
      set o_codigoSalida = w_codigoValidacion;
   end if;
   
   -- #endregion 
   if w_codigoValidacion = '3' then
      insert into sesion_funcionrolsistema (nombre, descripcion) values (i_nombreFuncion, i_descripcionFuncion);
      set o_codigoSalida = '4'; -- Registro exitoso de la función
   end if;
end;