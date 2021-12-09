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
    } else {
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
    }
    return UnhandledException(message: error.toString());
  }
}
