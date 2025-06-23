import 'dart:convert';

import 'package:final_lnk/core/logic/custom_alerts.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/errors/exceptions.dart';

class SettingsLocalData {
  cacheProfile(ProfileData? profileModel) {
    if (profileModel != null) {
      MyCache.saveData(
        key: 'profile',
        value: jsonEncode(profileModel.toJson()),
      );
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }

  Future<ProfileData> getLastMyProfile(BuildContext context) {
    final jsonString = MyCache.getDataString(key: 'profile');
    if (jsonString != null) {
      CustomAlerts.showMySnackBar(context, 'No Internet Connection !');
      return Future.value(ProfileData.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }
}
