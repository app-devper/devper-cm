import 'dart:convert';
import 'dart:io';
import 'package:common/core/error/exception.dart';
import 'package:common/data/network/exception.dart';

class Failure {
  late String error;

  Failure(Exception e) {
    if (e is AppException) {
      error = e.error;
    } else if (e is HttpException) {
      Map<String, dynamic> json = jsonDecode(e.response.body);
      error = json['error'] ?? e.response.reasonPhrase;
    } else if (e is SocketException) {
      error = "Connection error. Please try again.";
    } else {
      error = e.toString();
    }
  }
}
