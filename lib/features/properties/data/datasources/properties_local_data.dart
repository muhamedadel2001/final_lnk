import 'dart:convert';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/logic/custom_alerts.dart';

class PropertiesLocalData {
  cachePropertiesData(PropertiesModel? propertiesModel) {
    if (propertiesModel != null) {
      MyCache.saveData(
        key: 'propertiesData',
        value: jsonEncode(propertiesModel.toJson()),
      );
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }

  Future<PropertiesModel> getLastPropertiesData(BuildContext context) {
    final jsonString = MyCache.getDataString(key: 'propertiesData');
    if (jsonString != null) {
      CustomAlerts.showMySnackBar(context, 'No Internet Connection !');
      return Future.value(PropertiesModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }
}
