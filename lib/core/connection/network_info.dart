import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker) {
    print('new object NetworkInfo');
  }

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
