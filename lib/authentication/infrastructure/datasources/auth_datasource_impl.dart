import 'package:dio/dio.dart';
import 'package:flutter_application_5/authentication/domain/domain.dart';
import 'package:flutter_application_5/authentication/infrastructure/mappers/user_client_mapper.dart';
import 'package:flutter_application_5/authentication/infrastructure/models/user_client_model.dart';
import 'package:flutter_application_5/config/config.dart';

class AuthDataSourceImpl extends AuthDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.mikrowispUrl,
    )
  );

  @override
  Future<UserClient> validateUser(String idClient, String codeActivation) async {

    final int id = int.parse(idClient);
    
    try {
      final response = await dio.post('/GetClientsDetails', data: {
      'token': Environment.mikrowispToken,
      'idcliente': id,
      'cedula': codeActivation
    });

    if(response.statusCode == 200) {

      final user = UserClientResponse.fromJson(response.data);
      UserClient userClient = UserClientMapper.userClientDataToEntity(user.datos.first);
      return userClient;

    } else {
      throw Exception('Failed to load cliente details');
    }
    
    } catch (e) {
      throw Exception('Failed to load cliente details: $e');
    }
  }


}