import '../error/error_handler.dart';

///
/// UseCase
/// [Type] is a generic response class from [UseCase]
/// [Params] is a generic parameter or request class to [UseCase],
/// if the [UseCase] don't have parameter, use [NoParams] class
///
/// You must implement [build] and [errorHandler] method when your class
/// inheritance from [UseCase]. [build] method is a executor logic of your
/// [UseCase]. [errorHandler] method is a error handling to centralized error
/// from [UseCase]
///
abstract class UseCase<Type, Params> {
  Future<Type> build(Params params);

  ErrorHandler errorHandler();

  Future<Type> execute(Params params) {
    return build(params).catchError((error) {
      onError(error);
      throw errorHandler().formatError(error);
    });
  }

  // Make this empty body so that use case that doesn't need this callback
  // doesn't have to override
  void onError(dynamic error) {}
}

///
/// [NoParams] is a default parameter that should used when [UseCase] don't
/// have parameter
///
class NoParams {
  List<Object> get props => [];
}