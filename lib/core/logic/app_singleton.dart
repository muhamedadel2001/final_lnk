import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../connection/network_info.dart';
import '../databases/api/api_consumer.dart';
import '../databases/api/dio_consumer.dart';
import '../networking/api_constants.dart';

class AppSingletons {
  static final Dio dio =
      Dio()
        ..options = BaseOptions(
          connectTimeout: Duration(seconds: 80),
          receiveTimeout: Duration(seconds: 80),
          baseUrl: ApiConstants.baseUrl,
        );

  static final ApiConsumer apiConsumer = DioConsumer(dio: dio);

  static final NetworkInfo networkInfo = NetworkInfoImpl(
    DataConnectionChecker(),
  );
}
