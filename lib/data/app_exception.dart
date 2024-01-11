

class AppException implements Exception {

  final _message;
  final _prefix;

  AppException([this._message,this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException{
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeOut extends AppException{
  RequestTimeOut([String? message]) : super(message, "Request Time out");
}

class ServerException extends AppException{
  ServerException([String? message]) : super(message, "Internal Server Exception");
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, "Invalid or Bad Request");
}

class DataNotFoundException extends AppException{
  DataNotFoundException([String? message]) : super(message, "404 Not Found");
}

class ApiException extends AppException{
  ApiException([String? message]) : super(message, "Unexpected error occurred");
}

