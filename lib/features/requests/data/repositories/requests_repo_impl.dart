import 'package:dartz/dartz.dart';
import 'package:final_lnk/core/errors/failure.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/requests/data/datasources/requests_local_data.dart';
import 'package:final_lnk/features/requests/data/datasources/requests_remote_data.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../core/connection/network_info.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../domain/repositories/requests_repo.dart';

class RequestsRepoImpl implements RequestsRepo {
  final NetworkInfo networkInfo;
  final RequestsRemoteData requestsRemoteData;
  final RequestsLocalData requestsLocalData;

  RequestsRepoImpl({
    required this.networkInfo,
    required this.requestsRemoteData,
    required this.requestsLocalData,
  });
  @override
  Future<Either<Failure, RequestsModel>> getRequestsData({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final remoteServices = await requestsRemoteData.fetchRequests(
          page: page,
          query: query,
          lang: lang,
          type: type,
        );
        requestsLocalData.cacheRequestsData(remoteServices);
        return Right(remoteServices);
      } else {
        final localBooks = await requestsLocalData.getLastRequestsData(context);
        return Right(localBooks);
      }
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, CitiesModel>> getCities({required String lang}) async {
    try {
      final result = await requestsRemoteData.getCities(lang: lang);
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
      final result = await requestsRemoteData.getAreas(lang: lang, id: id);
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
      final result = await requestsRemoteData.getRentType(lang: lang);
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
      final result = await requestsRemoteData.getFinishingType(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, RequestsModel>> getRequestsFilterData({
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
    try {
      final remoteServices = await requestsRemoteData.fetchFilterRequests(
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
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }
}
