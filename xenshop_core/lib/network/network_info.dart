import 'package:connectivity/connectivity.dart';

///
/// [NetworkInfo] is used for network connectivity utilities
///
abstract class NetworkInfo {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

///
/// [isConnected] to check your application is connected to WiFi/mobile
/// [connectivityResult] to get specific information about connectivity
/// [onConnectivityChanged] to listen connectivity state changed
class NetworkInfoImpl implements NetworkInfo {

  late final Connectivity connectivity;

  NetworkInfoImpl(){
    connectivity = Connectivity();
  }

  @override
  Future<bool> isConnected() async {
    final result = await connectivityResult;
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async =>
    await connectivity.checkConnectivity();

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
    connectivity.onConnectivityChanged;
}