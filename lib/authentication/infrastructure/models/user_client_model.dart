
class UserClientResponse {
    final String estado;
    final List<UserClientDatos> datos;

    UserClientResponse({
        required this.estado,
        required this.datos,
    });

    factory UserClientResponse.fromJson(Map<String, dynamic> json) => UserClientResponse(
        estado: json["estado"],
        datos: List<UserClientDatos>.from(json["datos"].map((x) => UserClientDatos.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "datos": List<dynamic>.from(datos.map((x) => x.toJson())),
    };
}

class UserClientDatos {
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

    UserClientDatos({
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

    factory UserClientDatos.fromJson(Map<String, dynamic> json) => UserClientDatos(
        id: json["id"],
        nombre: json["nombre"],
        estado: json["estado"],
        correo: json["correo"],
        telefono: json["telefono"],
        movil: json["movil"],
        cedula: json["cedula"],
        pasarela: json["pasarela"],
        codigo: json["codigo"],
        direccionPrincipal: json["direccion_principal"],
        mantenimiento: json["mantenimiento"],
        fechaSuspendido: json["fecha_suspendido"],
        servicios: List<Servicio>.from(json["servicios"].map((x) => Servicio.fromJson(x))),
        facturacion: Facturacion.fromJson(json["facturacion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "estado": estado,
        "correo": correo,
        "telefono": telefono,
        "movil": movil,
        "cedula": cedula,
        "pasarela": pasarela,
        "codigo": codigo,
        "direccion_principal": direccionPrincipal,
        "mantenimiento": mantenimiento,
        "fecha_suspendido": fechaSuspendido,
        "servicios": List<dynamic>.from(servicios.map((x) => x.toJson())),
        "facturacion": facturacion.toJson(),
    };
}

class Facturacion {
    final int facturasNopagadas;
    final String totalFacturas;

    Facturacion({
        required this.facturasNopagadas,
        required this.totalFacturas,
    });

    factory Facturacion.fromJson(Map<String, dynamic> json) => Facturacion(
        facturasNopagadas: json["facturas_nopagadas"],
        totalFacturas: json["total_facturas"],
    );

    Map<String, dynamic> toJson() => {
        "facturas_nopagadas": facturasNopagadas,
        "total_facturas": totalFacturas,
    };
}

class Servicio {
    final int id;
    final int idperfil;
    final int nodo;
    final String costo;
    final String ipap;
    final String mac;
    final String ip;
    final DateTime instalado;
    final String pppuser;
    final String ppppass;
    final String emisor;
    final String tiposervicio;
    final String statusUser;
    final String coordenadas;
    final String direccion;
    final String snmpComunidad;
    final String firewallState;
    final String smartolt;
    final int limitado;
    final String pppRoutes;
    final String pppLocaladdress;
    final int idnap;
    final int portnap;
    final String onuSn;
    final String onuSsidWifi;
    final String onuPasswordWifi;
    final String personalizados;
    final int smartoltCatv;
    final String ipv6;
    final String ipv6Duid;
    final String lastConnected;
    final String perfil;

    Servicio({
        required this.id,
        required this.idperfil,
        required this.nodo,
        required this.costo,
        required this.ipap,
        required this.mac,
        required this.ip,
        required this.instalado,
        required this.pppuser,
        required this.ppppass,
        required this.emisor,
        required this.tiposervicio,
        required this.statusUser,
        required this.coordenadas,
        required this.direccion,
        required this.snmpComunidad,
        required this.firewallState,
        required this.smartolt,
        required this.limitado,
        required this.pppRoutes,
        required this.pppLocaladdress,
        required this.idnap,
        required this.portnap,
        required this.onuSn,
        required this.onuSsidWifi,
        required this.onuPasswordWifi,
        required this.personalizados,
        required this.smartoltCatv,
        required this.ipv6,
        required this.ipv6Duid,
        required this.lastConnected,
        required this.perfil,
    });

    factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        id: json["id"],
        idperfil: json["idperfil"],
        nodo: json["nodo"],
        costo: json["costo"],
        ipap: json["ipap"],
        mac: json["mac"],
        ip: json["ip"],
        instalado: DateTime.parse(json["instalado"]),
        pppuser: json["pppuser"],
        ppppass: json["ppppass"],
        emisor: json["emisor"],
        tiposervicio: json["tiposervicio"],
        statusUser: json["status_user"],
        coordenadas: json["coordenadas"],
        direccion: json["direccion"],
        snmpComunidad: json["snmp_comunidad"],
        firewallState: json["firewall_state"],
        smartolt: json["smartolt"],
        limitado: json["limitado"],
        pppRoutes: json["ppp_routes"],
        pppLocaladdress: json["ppp_localaddress"],
        idnap: json["idnap"],
        portnap: json["portnap"],
        onuSn: json["onu_sn"],
        onuSsidWifi: json["onu_ssid_wifi"],
        onuPasswordWifi: json["onu_password_wifi"],
        personalizados: json["personalizados"],
        smartoltCatv: json["smartolt_catv"],
        ipv6: json["ipv6"],
        ipv6Duid: json["ipv6_duid"],
        lastConnected: json["last_connected"],
        perfil: json["perfil"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idperfil": idperfil,
        "nodo": nodo,
        "costo": costo,
        "ipap": ipap,
        "mac": mac,
        "ip": ip,
        "instalado": "${instalado.year.toString().padLeft(4, '0')}-${instalado.month.toString().padLeft(2, '0')}-${instalado.day.toString().padLeft(2, '0')}",
        "pppuser": pppuser,
        "ppppass": ppppass,
        "emisor": emisor,
        "tiposervicio": tiposervicio,
        "status_user": statusUser,
        "coordenadas": coordenadas,
        "direccion": direccion,
        "snmp_comunidad": snmpComunidad,
        "firewall_state": firewallState,
        "smartolt": smartolt,
        "limitado": limitado,
        "ppp_routes": pppRoutes,
        "ppp_localaddress": pppLocaladdress,
        "idnap": idnap,
        "portnap": portnap,
        "onu_sn": onuSn,
        "onu_ssid_wifi": onuSsidWifi,
        "onu_password_wifi": onuPasswordWifi,
        "personalizados": personalizados,
        "smartolt_catv": smartoltCatv,
        "ipv6": ipv6,
        "ipv6_duid": ipv6Duid,
        "last_connected": lastConnected,
        "perfil": perfil,
    };
}
