import 'package:http/http.dart' as http;
import 'http_client_service.dart';

class HttpClientServiceImp extends http.BaseClient implements HttpClientService {

  @override
  getHttpClient() {
    return http.Client();
  }
  
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw UnimplementedError();
  }
}
