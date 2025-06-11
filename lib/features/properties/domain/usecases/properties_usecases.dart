import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/domain/repositories/properties_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/areas_model.dart';

class PropertiesUseCases {
  final PropertiesRepo propertiesRepo;

  PropertiesUseCases({required this.propertiesRepo});

  Future<Either<Failure, PropertiesModel>> getPropertiesCall({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  }) {
    return propertiesRepo.getPropertiesData(
      page: page,
      query: query,
      context: context,
      lang: lang,
      type: type,
    );
  }

  Future<Either<Failure, PropertiesModel>> getPropertiesFilterCall({
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
  }) {
    return propertiesRepo.getPropertiesFilterData(
      page: page,
      lang: lang,
      type: type,
      typeOfList: typeOfList,
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
    return propertiesRepo.getAreas(lang: lang, id: id);
  }

  Future<Either<Failure, CitiesModel>> getCitiesCall({required String lang}) {
    return propertiesRepo.getCities(lang: lang);
  }

  Future<Either<Failure, FinishingModel>> getFinishingTypeCall({
    required String lang,
  }) {
    return propertiesRepo.getFinishingType(lang: lang);
  }

  Future<Either<Failure, TypeOfRentModel>> getTypeOfRentCall({
    required String lang,
  }) {
    return propertiesRepo.getRentType(lang: lang);
  }
}
