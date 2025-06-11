import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
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

  Future<CitiesModel> getCities({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.cityEndpoint,
      queryParameters: {"lang": lang},
    );
    return CitiesModel.fromJson(response);
  }

  Future<AreasModel> getAreas({
    required String lang,
    required String id,
  }) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      '${ApiConstants.areaEndpoint}$id',
      queryParameters: {"lang": lang},
    );
    return AreasModel.fromJson(response);
  }

  Future<TypeOfRentModel> getRentType({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.typeOfRentEndpoint,
      queryParameters: {"lang": lang},
    );
    return TypeOfRentModel.fromJson(response);
  }

  Future<FinishingModel> getFinishingType({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.finishingEndpoint,
      queryParameters: {"lang": lang},
    );
    return FinishingModel.fromJson(response);
  }

  Future<PropertiesModel> fetchFilterProperties({
    int page = 1,
    String? lang,
    String? type,
    String? typeOfList,
    String? city,
    String? typeOfRent,
    String? location,
    String? finishing,
    String? minArea,
    String? maxArea,
    String? minPrice,
    String? maxPrice,
  }) async {
    final response = await apiConsumer.get(
      ApiConstants.getPropertiesFilterEndpoint,
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      queryParameters: {
        'page': page,
        'lang': lang,
        "type": type,
        "typeOfList": typeOfList,
        "city": city,
        "typeOfRent": typeOfRent,
        "location": location,
        "finishing": finishing,
        "minArea": minArea,
        "maxArea": maxArea,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
      },
    );
    print(response);
    return PropertiesModel.fromJson(response);
  }
}
