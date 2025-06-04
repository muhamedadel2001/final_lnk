import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';

class PropertiesRemoteData {
  final ApiConsumer apiConsumer;

  PropertiesRemoteData({required this.apiConsumer});

  Future<PropertiesModel> fetchProperties({
    int page = 1,
    String? lang,
    String? query,
    String? type,
  }) async {
    final response = await apiConsumer.get(
      ApiConstants.getPropertiesEndpoint,
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      queryParameters: {
        'page': page,
        'typeOfList': type,
        'lang': lang,
        'searchText': query,
      },
    );
    print(response);
    return PropertiesModel.fromJson(response);
  }
}
