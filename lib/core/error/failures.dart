
import 'dart:convert';
import 'dart:io';
import 'package:common/data/network/exception.dart';
import 'exceptions.dart';

class Failure {
  late String error;

  Failure(Exception e) {
    if (e is AppException) {
      error = e.error;
    } if (e is HttpException) {
      Map<String, dynamic> json = jsonDecode(e.response.body);
      error = json['error'] ?? e.response.reasonPhrase;
    } if (e is SocketException) {
      error = "Connection error. Please try again.";
    } else {
      error = e.toString();
    }
  }
}
