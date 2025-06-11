import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/areas_model.dart';

abstract class PropertiesRepo {
  Future<Either<Failure, PropertiesModel>> getPropertiesData({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  });

  Future<Either<Failure, PropertiesModel>> getPropertiesFilterData({
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
}
