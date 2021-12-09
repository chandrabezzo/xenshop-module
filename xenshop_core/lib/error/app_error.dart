import 'custom_error.dart';

const String noInternetConnectionTitle = 'No Internet Connection';
const String noInternetConnectionMessage =
    'Make sure you are connected to internet';
const String unauthorizedTitle = 'Unauthorized';
const String unauthorizedMessage = "You don't have access";
const String serverErrorTitle = 'Server Error';
const String serverErrorMessage = 'Sorry we have problem in our server';
const String badRequestTitle = 'Bad Request';
const String badRequestMessage = 'Wrong request to server';
const String notFoundTitle = 'Not Found';
const String notFoundMessage = 'Bad request to server';

class AppError implements CustomError {
  AppError._(
      {this.message = serverErrorMessage, this.title = serverErrorTitle});

  @override
  // this is to understand original error message only
  StackTrace get stackTrace => StackTrace.fromString(message);

  final String message;
  final String title;

  String get formattedMessage => message;

  String get formattedTitle => title;
}

///
/// [UnhandledException] for centralized error as unhandled exception
///
class UnhandledException extends AppError {
  UnhandledException(
      {String message = serverErrorMessage, String title = serverErrorTitle})
      : super._(message: message, title: title);

  @override
  String get formattedMessage => message;

  @override
  String get formattedTitle => title;
}

///
/// [NoInternetConnectionException] for centralized error because no internet
/// connection
///
class NoInternetConnectionException extends AppError {
  NoInternetConnectionException(
      {String message = noInternetConnectionMessage,
      String title = noInternetConnectionTitle})
      : super._(message: message, title: title);

  @override
  String get formattedMessage => message;

  @override
  String get formattedTitle => title;
}

///
/// [UnauthorizedException] for centralized error because authentication
/// invalid or account forbidden
///
class UnauthorizedException extends AppError {
  UnauthorizedException(
      {String message = unauthorizedMessage, String title = unauthorizedTitle})
      : super._(message: message, title: title);

  @override
  String get formattedMessage => message;

  @override
  String get formattedTitle => title;
}

///
/// [ForbiddenException] for centralized error because authentication
/// invalid or account unauthorized
///
class ForbiddenException extends AppError {
  ForbiddenException(
      {String message = unauthorizedMessage, String title = unauthorizedTitle})
      : super._(message: message, title: title);

  @override
  String get formattedMessage => message;

  @override
  String get formattedTitle => title;
}

///
/// [ServerException[ for centralized error because got error response from
/// REST API service
///
class ServerException extends AppError {
  ServerException(
      {required this.json,
      String message = serverErrorMessage,
      String title = serverErrorTitle})
      : super._(message: message, title: title);

  final Map<String, dynamic>? json;

  @override
  String get formattedMessage => message;

  @override
  String get formattedTitle => title;
}

///
/// [BadRequestException] for centralized error because wrong request to
/// REST API
///
class BadRequestException extends AppError {
  BadRequestException(
      {required this.json,
      String message = badRequestMessage,
      String title = badRequestTitle})
      : super._(message: message, title: title);

  final Map<String, dynamic> json;
}

///
/// [NotFoundException] for centralized error because request not found
///
class NotFoundException extends AppError {
  NotFoundException(
      {required this.json,
      String message = badRequestMessage,
      String title = badRequestTitle})
      : super._(message: message, title: title);

  final Map<String, dynamic> json;
}
