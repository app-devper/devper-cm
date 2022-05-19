import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:common/data/network/exception.dart';

class ErrorMapper {
  ErrorResponse toError(Exception e) {
    if (e is HttpException) {
      Map<String, dynamic> json = jsonDecode(e.response.body);
      return ErrorResponse(
        httpCode: e.response.statusCode,
        message: json['error'] ?? e.response.reasonPhrase,
        errorCode: json['code'] ?? "",
      );
    } else if (e is SocketException) {
      return ErrorResponse(
        httpCode: 0,
        message: "Connection error. Please try again.",
        errorCode: "N-001",
      );
    } else {
      return ErrorResponse(
        httpCode: 0,
        message: "Unexpected Error. Please try again.",
        errorCode: "000",
      );
    }
  }
}

class ErrorResponse {
  final int httpCode;
  final String errorCode;
  final String message;

  ErrorResponse({
    required this.httpCode,
    required this.errorCode,
    required this.message,
  });

  String getMessage() {
    return "$message";
  }
}
