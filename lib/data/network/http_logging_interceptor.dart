import 'dart:async';

import 'package:common/core/log/logger.dart';
import 'package:common/data/network/interceptor.dart';
import 'package:http/http.dart';

class HttpLoggingInterceptor implements Interceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final base = request;
    log.info('--> ${base.method} ${base.url}');
    base.headers.forEach((k, v) => log.info('$k: $v'));

    var bytes = '';
    final body = base.body;
    if (body.isNotEmpty) {
      log.info(body);
      bytes = ' (${base.contentLength}-byte body)';
    }
    log.info('--> END ${base.method}$bytes');
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    final base = response.request;
    log.info('<-- ${response.statusCode} ${base!.url}');

    response.headers.forEach((k, v) => log.info('$k: $v'));

    var bytes = "";
    if (response.body.isNotEmpty) {
      log.info(response.body);
      bytes = ' (${response.bodyBytes.length}-byte body)';
    }
    log.info('<-- END ${base.method}$bytes');
    return response;
  }
}
