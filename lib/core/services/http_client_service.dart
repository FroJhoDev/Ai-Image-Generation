enum HttpError {
  badRequest,
  notFound,
  serverError,
  unauthorized,
  forbidden,
  invalidData,
}

abstract class HttpClientService {
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
    String? urlBase,
  });
}
