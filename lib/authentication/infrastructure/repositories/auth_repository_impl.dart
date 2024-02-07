import 'package:flutter_application_5/authentication/domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<UserClient> validateUser(String idClient, String codeActivation) {
    return authDataSource.validateUser(idClient, codeActivation);
  }

}