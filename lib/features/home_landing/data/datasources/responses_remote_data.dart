import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';
import '../../../../core/networking/api_constants.dart';

class ResponsesRemoteData {
  final ApiConsumer apiConsumer;
  ResponsesRemoteData({required this.apiConsumer});
  Future<ListsModel> getOneList({
    required String lang,
    required String id,
  }) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      "${ApiConstants.oneListEndpoint}$id",
      queryParameters: {"lang": lang},
    );
    return ListsModel.fromJson(response);
  }

  Future<RequestModel> getOneRequest({
    required String lang,
    required String id,
  }) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      "${ApiConstants.oneRequestEndpoint}$id",
      queryParameters: {"lang": lang},
    );
    print(response);
    return RequestModel.fromJson(response);
  }
}
