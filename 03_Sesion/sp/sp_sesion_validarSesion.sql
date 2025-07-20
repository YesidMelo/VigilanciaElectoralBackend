/*
set @codigoSalida = '';
set @login = 'superAdmin';
set @contrasenia = '8#qo6BLs2^J7YBn';
CALL sesion_validarSesion(@login, @contrasenia, @codigoSalida);
select @codigoSalida;
*/
drop procedure if exists sesion_validarSesion;

create procedure sesion_validarSesion(
    IN  i_login varchar(60),
    OUT o_codigoSalida varchar(60)
)
begin
   -- #region variables
   declare w_documento         varchar(60);
   declare w_fechaHoraInicio   datetime;
   declare w_fechaHoraFin      datetime;
   declare w_tipoDocumento     varchar(2);
   -- #endregion

   select 
      cul.documento,
      cul.tipoDocumento,
      dsu.fechaHoraInicio,
      dsu.fechaHoraFin
   into
      w_documento,
      w_tipoDocumento,
      w_fechaHoraInicio,
      w_fechaHoraFin
   from 
      sesion_usuariologin cul,
      sesion_duracionsesionusuario dsu
   where
         login             = i_login
     and dsu.documento     = cul.documento
     and dsu.tipoDocumento = cul.tipoDocumento
   ;
   
   if w_fechaHoraFin > now() then
      set o_codigoSalida = '3'; -- la sesion esta activa
   else  
      set o_codigoSalida = '2'; -- la sesion esta vencida
   end if;
end;