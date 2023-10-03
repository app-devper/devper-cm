class Failure {
  late String error;
  late String errorCode;

  Failure({
    required this.errorCode,
    required this.error,
  });

  String getMessage() {
    return "$error [$errorCode]";
  }
}
