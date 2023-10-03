import 'dart:async';

import 'package:http/http.dart';

abstract class Interceptor {
  FutureOr<Request> onRequest(Request request);
  FutureOr<Response> onResponse(Response response);
}
