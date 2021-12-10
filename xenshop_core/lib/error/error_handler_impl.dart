import 'package:dio/dio.dart';
import '../network/network_error.dart';
import '../network/network_info.dart';
import 'app_error.dart';
import 'error_handler.dart';

/* Handle unexpected error */

class ErrorHandlerImpl implements ErrorHandler {
  ErrorHandlerImpl({required NetworkInfo networkInfo})
      : _networkInfo = networkInfo;

  final NetworkInfo _networkInfo;

  @override
  AppError formatError(dynamic error) {
    if (error is AppError) {
      return error;
    } else if (error is DioError) {
      if (error.isUnauthorized()) {
        return UnauthorizedException(
          title: 'Authorization Not Available',
          message: 'Your authorization is restricted',
        );
      } else if (error.isForbidden()) {
        return ForbiddenException(
          title: 'No Access',
          message: 'You doesn\'t have access',
        );
      } else if (error.isServerProblem()) {
        return ServerException(
          json: error.toJson(),
          message: 'Sorry, our service have a problem.',
          title: 'Please Wait',
        );
      } else if (error.isBadRequest()) {
        return BadRequestException(
          json: error.toJson(),
          message: 'Found problem from your request',
          title: 'Request Problem',
        );
      } else if (error.isNotFound()) {
        return NotFoundException(
          json: error.toJson(),
          message: 'Please try again with another request',
          title: 'Not Found',
        );
      }

      /// When error type is no internet connection or application can't
      /// communicate with server
      else if (error.type == DioErrorType.other) {
        _networkInfo.isConnected().then((isConnected) {
          if (isConnected) {
            return UnhandledException();
          } else {
            return NoInternetConnectionException(
              title: 'Oops!',
              message: 'No Internet Connection',
            );
          }
        });
      } else {
        return UnhandledException(message: error.toString());
      }
    }
    return UnhandledException(message: error.toString());
  }
}
