
import 'exceptions.dart';

class Failure {
  late String error;

  Failure(Exception e) {
    if (e is AppException) {
      error = e.error;
    } else {
      error = e.toString();
    }
  }
}
