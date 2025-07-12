import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import 'package:final_lnk/features/requests/domain/repositories/requests_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/areas_model.dart';

class RequestsUseCases {
  final RequestsRepo requestsRepo;

  RequestsUseCases({required this.requestsRepo});

  Future<Either<Failure, RequestsModel>> getRequestsCall({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  }) {
    return requestsRepo.getRequestsData(
      page: page,
      query: query,
      context: context,
      lang: lang,
      type: type,
    );
  }

  Future<Either<Failure, RequestsModel>> getRequestsFilterCall({
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
  }) {
    return requestsRepo.getRequestsFilterData(
      page: page,
      lang: lang,
      type: type,
      typeOfRequest: typeOfRequest,
      city: city,
      typeOfRent: typeOfRent,
      location: location,
      finishing: finishing,
      minArea: minArea,
      maxArea: maxArea,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }

  Future<Either<Failure, AreasModel>> getAreasCall({
    required String lang,
    required String id,
  }) {
    return requestsRepo.getAreas(lang: lang, id: id);
  }

  Future<Either<Failure, CitiesModel>> getCitiesCall({required String lang}) {
    return requestsRepo.getCities(lang: lang);
  }

  Future<Either<Failure, FinishingModel>> getFinishingTypeCall({
    required String lang,
  }) {
    return requestsRepo.getFinishingType(lang: lang);
  }

  Future<Either<Failure, TypeOfRentModel>> getTypeOfRentCall({
    required String lang,
  }) {
    return requestsRepo.getRentType(lang: lang);
  }
}
