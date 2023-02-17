import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'errors/http_error.dart';
import 'network_client.dart';

class NetworkClientImpl extends NetworkClient {
  NetworkClientImpl(this._baseUrl) : super(_baseUrl);

  final String _baseUrl;

  @override
  Future<http.Response> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + endpoint));
      _checkForError(response);
      return response;
    } on HttpError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  @override
  Future<http.Response> post(String endpoint, {dynamic body}) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + endpoint), body: body);
      _checkForError(response);
      return response;
    } on HttpError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  @override
  Future<http.Response> put(String endpoint, {dynamic body}) async {
    try {
      final response = await http.put(Uri.parse(_baseUrl + endpoint), body: body);
      _checkForError(response);
      return response;
    } on HttpError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  @override
  Future<http.Response> delete(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + endpoint));
      _checkForError(response);
      return response;
    } on HttpError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  void _checkForError(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpError(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}
