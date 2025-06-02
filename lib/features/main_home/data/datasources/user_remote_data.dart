import 'package:final_lnk/features/auth/data/models/user_model.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';

import '../../../../../core/databases/api/api_consumer.dart';
import '../../../../../core/databases/cache/my_cache.dart';
import '../../../../../core/databases/cache/my_cache_keys.dart';
import '../../../../core/networking/api_constants.dart';

class UserRemoteData {
  final ApiConsumer apiConsumer;
  UserRemoteData({required this.apiConsumer});
  Future<UserData> getHomeData({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.homeEndpoint,
      queryParameters: {"lang": lang},
    );
    return UserData.fromJson(response);
  }
}
