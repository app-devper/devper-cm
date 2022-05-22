import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;
  final String logo;
  final String name;
  final String system;
  final String home;

  AppConfig({
    required this.apiUrl,
    required this.logo,
    required this.name,
    required this.system,
    required this.home,
  });

  static Future<AppConfig> forEnvironment(String? env) async {
    // set default to dev if nothing was passed
    env = env ?? 'dev';

    // load the json file
    final contents = await rootBundle.loadString(
      'config/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(
      apiUrl: json['apiUrl'],
      logo: json['logo'],
      name: json['name'],
      system: json['system'],
      home: json['home'],
    );
  }
}
