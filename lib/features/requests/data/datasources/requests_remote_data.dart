import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';

class RequestsRemoteData {
  final ApiConsumer apiConsumer;

  RequestsRemoteData({required this.apiConsumer});

  Future<RequestsModel> fetchRequests({
    int page = 1,
    String? lang,
    String? query,
    String? type,
  }) async {
    final response = await apiConsumer.get(
      ApiConstants.getRequestsEndpoint,
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      queryParameters: {
        'page': page,
        'typeOfRequest': type,
        'lang': lang,
        'searchText': query,
      },
    );
    return RequestsModel.fromJson(response);
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

  Future<RequestsModel> fetchFilterRequests({
    int page = 1,
    String? lang,
    String? type,
    String? typeOfRequest,
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
      ApiConstants.getRequestsFilterEndpoint,
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      queryParameters: {
        'page': page,
        'lang': lang,
        "type": type,
        "typeOfRequest": typeOfRequest,
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
    return RequestsModel.fromJson(response);
  }
}
