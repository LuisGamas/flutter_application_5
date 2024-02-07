import 'package:flutter_application_5/authentication/domain/entities/user_client.dart';

abstract class AuthDataSource {
  Future<UserClient> validateUser(String idClient, String codeActivation);
}