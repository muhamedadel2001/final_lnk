import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';

class SettingsRemoteData {
  final ApiConsumer apiConsumer;

  SettingsRemoteData({required this.apiConsumer});

  Future<ProfileData> getMyProfileData() async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.profileEndpoint,
    );
    return ProfileData.fromJson(response);
  }

  Future updateProfile({required ProfileData model}) async {
    final jsonData = await model.toJsonUpdate();
    await apiConsumer.put(
      "${ApiConstants.profileEndpoint}",
      isFormData: true,
      data: jsonData,
    );
  }
}
