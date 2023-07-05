import 'dart:convert';
import 'dart:io';
import 'package:common/core/error/exception.dart';
import 'package:common/data/network/exception.dart';

class Failure {
  late String error;
  late String errorCode;

  Failure(Exception e) {
    if (e is AppException) {
      errorCode = "A-500";
      error = e.error;
    } else if (e is HttpException) {
      Map<String, dynamic> json = jsonDecode(e.response.body);
      errorCode = "N-${e.response.statusCode}";
      error = json['error'] ?? e.response.reasonPhrase;
    } else if (e is SocketException) {
      errorCode = "N-000";
      error = "Connection error. Please try again.";
    } else {
      errorCode = "A-000";
      error = e.toString();
    }
  }

  String getMessage() {
    return "$error [$errorCode]";
  }
}
