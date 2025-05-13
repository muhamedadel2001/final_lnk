import 'package:dio/dio.dart';
import '../../errors/exceptions.dart';
import '../../networking/api_constants.dart';
import '../cache/my_cache.dart';
import '../cache/my_cache_keys.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseUrl;
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Cookie":
                "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
            'Content-Type':
                isFormData ? 'multipart/form-data' : 'application/json',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      print('Dio error: ${e.response?.statusCode}');
      print('Error message: ${e.response?.data}');
      handleDioException(e);
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return res.data;
    } on DioException catch (e) {
      print('Dio error: ${e.response?.statusCode}');
      print('Error message: ${e.response?.data}');
      handleDioException(e);
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Cookie":
                "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
          },
        ),
      );
      return res.data;
    } on DioException catch (e) {
      print('Dio error: ${e.response?.statusCode}');
      print('Error message: ${e.response?.data}');
      handleDioException(e);
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      var res = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Cookie":
                "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
          },
        ),
      );
      print(res.statusCode);
      return res.data;
    } on DioException catch (e) {
      print('Dio error: ${e.response?.statusCode}');
      print('Error message: ${e.response?.data}');
      handleDioException(e);
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
