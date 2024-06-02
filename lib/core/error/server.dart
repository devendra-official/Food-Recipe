class ServerException implements Exception {
  final String message;
  ServerException([this.message = "something went wrong!"]);
}
