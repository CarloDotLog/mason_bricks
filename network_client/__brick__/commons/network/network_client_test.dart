import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:{{{full_path}}}network/network_client.dart';
import 'package:{{{full_path}}}network/network_client_impl.dart';

void main() {
  group('NetworkClient', () {
    late NetworkClient networkClient;
    setUp(() {
      networkClient = NetworkClientImpl("https://jsonplaceholder.typicode.com");
    });

    test('GET', () async {
      final response = await networkClient.get("/posts/1");
      expect(response.statusCode, 200);
      final post = jsonDecode(response.body);
      expect(post['id'], 1);
    });

    test('POST', () async {
      final response = await networkClient.post("/posts", body: {
        "title": "foo",
        "body": "bar",
        "userId": "1"
      });
      expect(response.statusCode, 201);
      final post = jsonDecode(response.body);
      expect(post['title'], 'foo');
    });

    test('PUT', () async {
      final response = await networkClient.put("/posts/1", body: {
        "id": "1",
        "title": "foo",
        "body": "bar",
        "userId": "1"
      });
      expect(response.statusCode, 200);
      final post = jsonDecode(response.body);
      expect(post['title'], 'foo');
    });

    test('DELETE', () async {
      final response = await networkClient.delete("/posts/1");
      expect(response.statusCode, 200);
    });
  });
}
