import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'http_client_service.dart';
import '../config/api_constants.dart';

class HttpClientServiceImp implements HttpClientService {

  final Client client;

  HttpClientServiceImp(this.client);

  @override
  Future<dynamic> request({required String url, required String method, Map? body, Map? headers, String? urlBase}) async {

    var baseUrl = urlBase ?? ApiConstants.baseUrl;
    
    final defaultHeaders = headers?.cast<String, String>() ?? {}..addAll({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.secretKey}'
    });

    final jsonBody = body != null ? jsonEncode(body) : null;

    var response = Response('', 500);

    Future<Response>? futureResponse;

    try {

      if (method == 'post') {
        futureResponse = client.post(Uri.parse(baseUrl + url), headers: defaultHeaders, body: jsonBody);
      } else if (method == 'get') {
        futureResponse = client.get(Uri.parse(baseUrl + url), headers: defaultHeaders);
      } else if (method == 'put') {
        futureResponse = client.put(Uri.parse(baseUrl + url), headers: defaultHeaders, body: jsonBody);
      }

      if (futureResponse != null) {
        response = await futureResponse;
      }
      
    } catch (error, stack) {
      log('Erro ao realizar requisição HTTP', error: error, stackTrace: stack);
      throw HttpError.serverError;
    }    
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200: return response.body.isEmpty ? null : jsonDecode(utf8.decode(response.bodyBytes));
      case 204: return null;
      case 400: throw HttpError.badRequest;
      case 401: throw HttpError.unauthorized;
      case 403: throw HttpError.forbidden;
      case 404: throw HttpError.notFound;
      default: throw HttpError.serverError;
    }
  }

}