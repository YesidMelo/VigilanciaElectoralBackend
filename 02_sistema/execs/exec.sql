-- valida sesion
/*
SET @codigoSalida = '';
set @login = 'superAdmin';
set @contrasenia = '8#qo6BLs2^J7YBn';
CALL Core_validarSesion(@login, @codigoSalida);
SELECT @codigoSalida;
*/

-- iniciar sesion
/*
select * from core_duracionsesionusuario;
select * from core_error
select * from core_funcionrolsistema;
select * from core_rolsistema;
*/
/*
set @codigoSalida = '';
set @login = 'superAdmin';
set @contrasenia = '8#qo6BLs2^J7YBn';
CALL Core_iniciarSesion(@login, @contrasenia, @codigoSalida);
select @codigoSalida;
*/

-- registrar funcion
/*
set @codigoSalida = '';
set @login = 'superAdmin';
set @nombreFuncion = 'registrarUsuario';
set @descripcionFuncion = 'descripcion';
CALL Core_registrarFuncion(
   @login, 
   @nombreFuncion,
   @descripcionFuncion,
   @codigoSalida
 );
select @codigoSalida;
*/
