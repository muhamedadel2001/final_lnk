import 'package:dartz/dartz.dart';
import 'package:final_lnk/core/errors/failure.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/properties/data/datasources/properties_local_data.dart';
import 'package:final_lnk/features/properties/data/datasources/properties_remote_data.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/domain/repositories/properties_repo.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../core/connection/network_info.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';

class PropertiesRepoImpl implements PropertiesRepo {
  final NetworkInfo networkInfo;
  final PropertiesRemoteData propertiesRemoteData;
  final PropertiesLocalData propertiesLocalData;

  PropertiesRepoImpl({
    required this.networkInfo,
    required this.propertiesRemoteData,
    required this.propertiesLocalData,
  });
  @override
  Future<Either<Failure, PropertiesModel>> getPropertiesData({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final remoteServices = await propertiesRemoteData.fetchProperties(
          page: page,
          query: query,
          lang: lang,
          type: type,
        );
        propertiesLocalData.cachePropertiesData(remoteServices);
        return Right(remoteServices);
      } else {
        final localBooks = await propertiesLocalData.getLastPropertiesData(
          context,
        );
        return Right(localBooks);
      }
    } catch (e) {
      print(e);
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, CitiesModel>> getCities({required String lang}) async {
    try {
      final result = await propertiesRemoteData.getCities(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, AreasModel>> getAreas({
    required String lang,
    required String id,
  }) async {
    try {
      final result = await propertiesRemoteData.getAreas(lang: lang, id: id);
      return Right(result);
    } catch (failure) {
      return Left(Failure(errMessage: 'Something went wrong !'));
    }
  }

  @override
  Future<Either<Failure, TypeOfRentModel>> getRentType({
    required String lang,
  }) async {
    try {
      final result = await propertiesRemoteData.getRentType(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, FinishingModel>> getFinishingType({
    required String lang,
  }) async {
    try {
      final result = await propertiesRemoteData.getFinishingType(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
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
  }) async {
    try {
      final remoteServices = await propertiesRemoteData.fetchFilterProperties(
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
      return Right(remoteServices);
    } catch (e) {
      print(e);
      return Left(Failure.handleError(e));
    }
  }
}
