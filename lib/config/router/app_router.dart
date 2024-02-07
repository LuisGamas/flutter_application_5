import 'package:flutter_application_5/authentication/presentation/screens/auth_screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/validation',
  routes: [

    GoRoute(
      path: '/validation',
      builder: (context, state) => const ValidationScreen(),
    ),

    GoRoute(
      path: '/registerFinal',
      builder: (context, state) => const RegisterScreen(),
    ),

  ]
);