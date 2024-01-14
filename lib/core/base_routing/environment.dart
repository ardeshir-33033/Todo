import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> initEnvironment() async {
    await dotenv.load(fileName: "production.env");
  }

  static String get baseUrl {
    return dotenv.get("RunMockyBaseUrl");
  }
}
