import 'dart:convert';
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
