import 'dart:convert';
import 'dart:io';

import 'package:common/core/network/exception.dart';

import 'exception.dart';
import 'failures.dart';

class ErrorMapper {
  Failure toFailure(Exception e) {
    if (e is AppException) {
      return Failure(
        errorCode: "A-500",
        error: e.error,
      );
    } else if (e is HttpException) {
      Map<String, dynamic> json = jsonDecode(e.response.body);
      final errorCode = "N-${e.response.statusCode}";
      final error = json['error'] ?? e.response.reasonPhrase;
      return Failure(
        errorCode: errorCode,
        error: error,
      );
    } else if (e is SocketException) {
      return Failure(
        errorCode: "N-000",
        error: "Connection error. Please try again.",
      );
    } else {
      return Failure(
        errorCode: "A-000",
        error: e.toString(),
      );
    }
  }
}
