/*
set @codigoSalida = '';
set @login = 'superAdmin';
set @contrasenia = '8#qo6BLs2^J7YBn';
CALL Core_iniciarSesion(@login, @contrasenia, @codigoSalida);
select @codigoSalida;
*/
drop procedure if exists Core_iniciarSesion;

create procedure Core_iniciarSesion(
    IN  i_login varchar(60),
    IN  i_contrasenia varchar(60),
    OUT o_codigoSalida varchar(60)
)
begin
   -- #region variables
   declare w_contraseniaLimpia varchar(256);
   declare w_login varchar(60);
   declare w_contrasenia varchar(256);
   declare w_documento varchar(60);
   declare w_tipoDocumento varchar(2);
   -- #endregion

   -- Encriptar la contraseña de entrada
   set w_contraseniaLimpia = SHA2(i_contrasenia, 256);

   -- Buscar usuario y contraseña
   select 
      cul.login,
      cuc.contraseniaActual,
      cuc.documento,
      cuc.tipoDocumento
   into
      w_login,
      w_contrasenia,
      w_documento,
      w_tipoDocumento
   from 
      core_usuariologin cul
   join
      core_usuariocontrasenia cuc
      on cul.documento = cuc.documento
      and cul.tipoDocumento = cuc.tipoDocumento
   where
      cul.login = i_login;

   -- Comparar contraseñas
   if w_contrasenia = w_contraseniaLimpia then
   
       delete from
          core_duracionsesionusuario
       where
              documento = w_documento
          and tipoDocumento = w_tipoDocumento
          ;
          
       insert into Core_DuracionSesionUsuario(
          documento,
          tipoDocumento,
          fechaHoraInicio,
          fechaHoraFin
       )
       values(
          w_documento,
          w_tipoDocumento,
          now(),
          date_add(now(), interval 15 MINUTE)
       ) on duplicate key update
          fechaHoraInicio = now(),
          fechaHoraFin = date_add(now(), interval 15 MINUTE)
       ;
              
       set o_codigoSalida = '0'; -- Login correcto tabla core_error
   else
       set o_codigoSalida = '1'; -- revisa tus credenciales core_error
   end if;

end;