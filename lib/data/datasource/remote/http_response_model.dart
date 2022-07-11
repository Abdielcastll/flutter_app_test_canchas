class Success<T> {
  final T response;
  Success({
    required this.response,
  });
}

class Failure {
  final String message;
  final int statusCode;
  Failure({
    required this.message,
    required this.statusCode,
  });
}
