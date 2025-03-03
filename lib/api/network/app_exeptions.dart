class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'The request was invalid', url);
}

class AuthenticationError extends AppException {
  AuthenticationError([String? message, String? url])
      : super(
            message,
            'The request did not include an authentication token or the authentication token was expired',
            url);
}

class ServerError extends AppException {
  ServerError([String? message, String? url])
      : super(
            message,
            'The request was not completed due to an internal error on the server side.',
            url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}
