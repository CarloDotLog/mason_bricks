import 'package:http/http.dart' as http;

abstract class NetworkClient {
  NetworkClient(String baseUrl);

  Future<http.Response> get(String endpoint);

  Future<http.Response> post(String endpoint, {dynamic body});

  Future<http.Response> put(String endpoint, {dynamic body});

  Future<http.Response> delete(String endpoint);
}