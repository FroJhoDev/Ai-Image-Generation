import 'package:http/http.dart' show Client;

abstract class HttpClientService {
  Client getHttpClient();
}