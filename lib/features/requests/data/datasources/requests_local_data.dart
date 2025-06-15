import 'dart:convert';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/logic/custom_alerts.dart';
import '../models/requests_model.dart';

class RequestsLocalData {
  cacheRequestsData(RequestsModel? requestsModel) {
    if (requestsModel != null) {
      MyCache.saveData(
        key: 'requestsModel',
        value: jsonEncode(requestsModel.toJson()),
      );
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }

  Future<RequestsModel> getLastRequestsData(BuildContext context) {
    final jsonString = MyCache.getDataString(key: 'requestsModel');
    if (jsonString != null) {
      CustomAlerts.showMySnackBar(context, 'No Internet Connection !');
      return Future.value(RequestsModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }
}
