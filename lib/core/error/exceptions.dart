class AppException implements Exception {
  String error;

  AppException(this.error);
}

class CacheException implements Exception {}
