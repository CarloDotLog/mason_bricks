import 'package:{{{full_path}}}network/errors/http_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HttpError', () {
    test('toString() should return the expected string', () {
      final error = HttpError(statusCode: 404, message: 'Not Found');
      expect(error.toString(), equals('HttpError{statusCode: 404, message: Not Found}'));
    });
  });
}