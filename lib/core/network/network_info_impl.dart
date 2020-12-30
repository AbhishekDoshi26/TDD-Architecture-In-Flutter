import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:number_trivia_tdd_architecture/core/network/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl({this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
