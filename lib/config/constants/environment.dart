import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  // Declaration of static environment variables for non-instance access of the class
  static String mikrowispUrl = dotenv.env['MIKROWISP_URL'] ?? 'Variable de entorno MIKROWISP_URL no configurada';
  static String mikrowispToken = dotenv.env['MIKROWISP_TOKEN'] ?? 'Variable de entorno MIKROWISP_TOKEN no configurada';

}