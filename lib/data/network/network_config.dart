
abstract class NetworkConfig {
  Map<String, String> getHeaders(Uri uri);

  bool isDebug();

  String getClientId();

  String getHostUm();

  String getHostApp();
}

