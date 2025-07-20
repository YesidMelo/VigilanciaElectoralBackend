-- SET @resultado = '';
-- CALL CargarDetalleError('978833237447969', 'CC', 'mi_contraseña_segura', @resultado);
-- SELECT @resultado;

drop procedure if exists Core_iniciarSesion;

create procedure Core_iniciarSesion(
    IN  i_login varchar(60),
    IN  i_contrasenia varchar(60),
    OUT o_codigoSalida varchar(60)
)
begin
   select 'Hola mundo';
end