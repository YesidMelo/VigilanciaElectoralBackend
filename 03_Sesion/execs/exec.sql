-- valida sesion
/*
SET @codigoSalida = '';
set @login = 'superAdmin';
set @contrasenia = '8#qo6BLs2^J7YBn';
CALL sesion_validarSesion(@login, @codigoSalida);
SELECT @codigoSalida;
*/

-- iniciar sesion
/*
select * from sesion_duracionsesionusuario;
select * from sesion_error
select * from sesion_funcionrolsistema;
select * from sesion_rolsistema;
*/
/*
set @codigoSalida = '';
set @login = 'superAdmin';
set @contrasenia = '8#qo6BLs2^J7YBn';
CALL sesion_iniciarSesion(@login, @contrasenia, @codigoSalida);
select @codigoSalida;
*/

-- registrar funcion
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
