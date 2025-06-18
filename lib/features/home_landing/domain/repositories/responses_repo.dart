import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/home_landing/data/models/additional_model.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/data/models/create_property_model.dart';
import 'package:final_lnk/features/home_landing/data/models/furnishing_model.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../../auth/data/models/finishing_model.dart';
import '../../../auth/data/models/type_of_rent_model.dart';

abstract class ResponsesRepo {
  Future<Either<Failure, ListsModel>> getOneList({
    required String lang,
    required String id,
    required BuildContext context,
  });
  Future<Either<Failure, RequestModel>> getOneRequest({
    required String lang,
    required String id,
    required BuildContext context,
  });
  Future<Either<Failure, AreasModel>> getAreas({
    required String lang,
    required String id,
  });
  Future<Either<Failure, CitiesModel>> getCities({required String lang});
  Future<Either<Failure, TypeOfRentModel>> getRentType({required String lang});
  Future<Either<Failure, FinishingModel>> getFinishingType({
    required String lang,
  });
  Future<Either<Failure, FurnishingModel>> getFurnishingType({
    required String lang,
  });
  Future<Either<Failure, AdditionalModel>> getAdditionalType({
    required String lang,
  });
  Future<Either<Failure, ApartmentsModel>> getApartments({
    required String lang,
  });
  Future createProperty({
    required CreatePropertyModel model,
    required BuildContext context,
  });
}
