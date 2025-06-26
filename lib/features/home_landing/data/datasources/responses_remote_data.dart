import 'package:final_lnk/features/home_landing/data/models/additional_model.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/data/models/create_property_model.dart';
import 'package:final_lnk/features/home_landing/data/models/furnishing_model.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../../auth/data/models/finishing_model.dart';
import '../../../auth/data/models/type_of_rent_model.dart';

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

  Future<ApartmentsModel> getApartments({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.apartmentEndpoint,
      queryParameters: {"lang": lang},
    );
    return ApartmentsModel.fromJson(response);
  }

  Future<FurnishingModel> getFurnishingType({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.furnisingEndpoint,
      queryParameters: {"lang": lang},
    );
    return FurnishingModel.fromJson(response);
  }

  Future<AdditionalModel> getAdditionalsType({required String lang}) async {
    final response = await apiConsumer.get(
      headers: {
        "Cookie": "accessToken=${MyCache.getString(key: MyCacheKeys.token)}",
      },
      ApiConstants.additionalEndpoint,
      queryParameters: {"lang": lang},
    );
    return AdditionalModel.fromJson(response);
  }

  Future createProperty({
    required dynamic model,
    required String endPoint,
  }) async {
    final jsonData = await model.toJson();
    await apiConsumer.post(endPoint, isFormData: true, data: jsonData);
  }

  Future deleteProperty({required String endPoint, required String id}) async {
    await apiConsumer.delete("$endPoint/${id}");
  }

  Future addToFav({required String id}) async {
    await apiConsumer.post("${ApiConstants.favouriteEndpoint}${id}");
  }
}
