import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_5/config/config.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //Environment.initEnvironment();
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
  
}


class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}