import 'dart:convert';
import 'dart:typed_data';

import 'package:common/data/network/interceptor.dart';
import 'package:http/http.dart';

class CustomClient implements Client {
  final List<Interceptor> _interceptors = [];

  void addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
  }

  void clearInterceptor() {
    _interceptors.clear();
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) => _sendUnstreamed('HEAD', url, headers);

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) => _sendUnstreamed('GET', url, headers);

  @override
  Future<Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => _sendUnstreamed('POST', url, headers, body, encoding);

  @override
  Future<Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => _sendUnstreamed('PUT', url, headers, body, encoding);

  @override
  Future<Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => _sendUnstreamed('PATCH', url, headers, body, encoding);

  @override
  Future<Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => _sendUnstreamed('DELETE', url, headers, body, encoding);

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) async {
    final response = await get(url, headers: headers);
    _checkResponseSuccess(url, response);
    return response.body;
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) async {
    final response = await get(url, headers: headers);
    _checkResponseSuccess(url, response);
    return response.bodyBytes;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return request.send();
  }

  /// Sends a non-streaming [Request] and returns a non-streaming [Response].
  Future<Response> _sendUnstreamed(String method, Uri url, Map<String, String>? headers, [body, Encoding? encoding]) async {
    var request = Request(method, url);
    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    request = await _interceptRequest(request);
    Response response = await Response.fromStream(await send(request));
    return await _interceptResponse(response);
  }

  /// Throws an error if [response] is not successful.
  void _checkResponseSuccess(Uri url, Response response) {
    if (response.statusCode < 400) return;
    var message = 'Request to $url failed with status ${response.statusCode}';
    if (response.reasonPhrase != null) {
      message = '$message: ${response.reasonPhrase}';
    }
    throw ClientException('$message.', url);
  }

  Future<Request> _interceptRequest(Request req) async {
    final body = req.body;
    for (final i in _interceptors) {
      req = await i.onRequest(req);
    }
    assert(
      body == req.body,
      'Interceptors should not transform the body of the request'
      'Use Request converter instead',
    );
    return req;
  }

  Future<Response> _interceptResponse(Response res) async {
    final body = res.body;
    for (final i in _interceptors) {
      res = await i.onResponse(res);
    }
    assert(
      body == res.body,
      'Interceptors should not transform the body of the response'
      'Use Response converter instead',
    );
    return res;
  }

  @override
  void close() {}
}
