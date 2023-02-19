class ServerException implements Exception {}


class CustomException implements Exception{
  final String msg;

  CustomException(this.msg);
}
