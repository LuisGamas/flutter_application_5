import 'package:flutter_application_5/authentication/domain/domain.dart';
import 'package:flutter_application_5/authentication/infrastructure/models/user_client_model.dart';

class UserClientMapper {
  static UserClient userClientDataToEntity(UserClientDatos userClientData) => UserClient(
    id: userClientData.id,
    nombre: userClientData.nombre,
    estado: userClientData.estado,
    correo: userClientData.correo,
    telefono: userClientData.telefono,
    movil: userClientData.movil,
    cedula: userClientData.cedula,
    pasarela: userClientData.pasarela,
    codigo: userClientData.codigo,
    direccionPrincipal: userClientData.direccionPrincipal,
    mantenimiento: userClientData.mantenimiento, 
    fechaSuspendido: userClientData.fechaSuspendido,
    servicios: userClientData.servicios,
    facturacion: userClientData.facturacion, 
  );
}