/// Represents an HTTP error, which is thrown when an HTTP request results in a
/// response with an error status code.
class HttpError {
  /// The status code of the HTTP response that caused the error.
  final int statusCode;

  /// The error message returned by the HTTP response that caused the error.
  final String message;

  /// Creates a new instance of [HttpError] with the specified status code and
  /// error message.
  HttpError({required this.statusCode, required this.message});

  @override
  String toString() {
    return 'HttpError{statusCode: $statusCode, message: $message}';
  }
}
