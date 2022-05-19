
abstract class LocalDataSource {
  Future<String> getLastToken();

  Future<void> cacheToken(String accessToken);

  Future<bool> clearToken();
}