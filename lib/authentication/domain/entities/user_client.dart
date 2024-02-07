import 'package:flutter_application_5/authentication/infrastructure/models/user_client_model.dart';

class UserClient {
  final int id;
  final String nombre;
  final String estado;
  final String correo;
  final String telefono;
  final String movil;
  final String cedula;
  final String pasarela;
  final String codigo;
  final String direccionPrincipal;
  final bool mantenimiento;
  final String fechaSuspendido;
  final List<Servicio> servicios;
  final Facturacion facturacion;

  UserClient({
    required this.id,
    required this.nombre,
    required this.estado,
    required this.correo,
    required this.telefono,
    required this.movil,
    required this.cedula,
    required this.pasarela,
    required this.codigo,
    required this.direccionPrincipal,
    required this.mantenimiento,
    required this.fechaSuspendido,
    required this.servicios,
    required this.facturacion,
  });
}