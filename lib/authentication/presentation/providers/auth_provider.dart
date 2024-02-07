import 'package:flutter_application_5/authentication/domain/domain.dart';
import 'package:flutter_application_5/authentication/infrastructure/datasources/auth_datasource_impl.dart';
import 'package:flutter_application_5/authentication/infrastructure/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//! ###################### <SateNotifierProvider>
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {

  final authDataSource = AuthDataSourceImpl();
  // Our RepositoryImpl is used to call the DataSource
  final authRepository = AuthRepositoryImpl(authDataSource);

  return AuthNotifier(
    authRepository: authRepository,
  );
});

//! ###################### <Notifier Implement>
class AuthNotifier extends StateNotifier<AuthState> {


  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }): super(AuthState());


  Future<void> validationUser(String idUser, String cedula) async {

    try {
      final response = await authRepository.validateUser(idUser, cedula);

      _setLoggedUser(userClient: response);
    } catch (e) {
      throw UnimplementedError('$e');
    }
    
  }

  void _setLoggedUser({UserClient? userClient}) async {
    
    // The status is updated
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      userClient: userClient,
      errorMessage: '',
    );

  }


}

enum AuthStatus { checking, authenticated, notAuthenticated }

//! ###################### <Provider State>
class AuthState {
  final AuthStatus authStatus;
  final UserClient? userClient;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.userClient,
    this.errorMessage = ''
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    UserClient? userClient,
    String? errorMessage,
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    userClient: userClient ?? this.userClient,
    errorMessage: errorMessage ?? this.errorMessage
  );
}
