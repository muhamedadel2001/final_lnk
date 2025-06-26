import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/home_landing/data/models/additional_model.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/data/models/create_property_model.dart';
import 'package:final_lnk/features/home_landing/data/models/furnishing_model.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/home_landing/domain/repositories/responses_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../../auth/data/models/finishing_model.dart';
import '../../../auth/data/models/type_of_rent_model.dart';

class ResponsesUseCase {
  final ResponsesRepo responsesRepo;

  ResponsesUseCase({required this.responsesRepo});
  Future<Either<Failure, ListsModel>> getOneListCall({
    required String lang,
    required String id,
    required BuildContext context,
  }) {
    return responsesRepo.getOneList(lang: lang, context: context, id: id);
  }

  Future<Either<Failure, RequestModel>> getOneRequestCall({
    required String lang,
    required String id,
    required BuildContext context,
  }) {
    return responsesRepo.getOneRequest(lang: lang, context: context, id: id);
  }

  Future<Either<Failure, AreasModel>> getAreasCall({
    required String lang,
    required String id,
  }) {
    return responsesRepo.getAreas(lang: lang, id: id);
  }

  Future<Either<Failure, CitiesModel>> getCitiesCall({required String lang}) {
    return responsesRepo.getCities(lang: lang);
  }

  Future<Either<Failure, FinishingModel>> getFinishingTypeCall({
    required String lang,
  }) {
    return responsesRepo.getFinishingType(lang: lang);
  }

  Future<Either<Failure, FurnishingModel>> getFurnishingTypeCall({
    required String lang,
  }) {
    return responsesRepo.getFurnishingType(lang: lang);
  }

  Future<Either<Failure, AdditionalModel>> getAdditionalTypeCall({
    required String lang,
  }) {
    return responsesRepo.getAdditionalType(lang: lang);
  }

  Future<Either<Failure, ApartmentsModel>> getApartmentsCall({
    required String lang,
  }) {
    return responsesRepo.getApartments(lang: lang);
  }

  Future<Either<Failure, TypeOfRentModel>> getTypeOfRentCall({
    required String lang,
  }) {
    return responsesRepo.getRentType(lang: lang);
  }

  Future create({
    required dynamic model,
    required BuildContext context,
    required String endPoint,
  }) {
    return responsesRepo.createProperty(
      context: context,
      model: model,
      endPoint: endPoint,
    );
  }

  Future deleteProperty({
    required String endPoint,
    required String id,
    required BuildContext context,
  }) {
    return responsesRepo.deleteProperty(
      endPoint: endPoint,
      id: id,
      context: context,
    );
  }

  Future addToFav({required String id, required BuildContext context}) {
    return responsesRepo.addToFav(id: id, context: context);
  }
}
