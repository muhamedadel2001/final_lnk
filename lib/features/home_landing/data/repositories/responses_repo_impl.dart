import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/data/models/furnishing_model.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/home_landing/domain/repositories/responses_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../../auth/data/models/finishing_model.dart';
import '../../../auth/data/models/type_of_rent_model.dart';
import '../datasources/responses_remote_data.dart';

class ResponsesRepoImpl implements ResponsesRepo {
  final ResponsesRemoteData responsesRemoteData;

  ResponsesRepoImpl({required this.responsesRemoteData});
  @override
  Future<Either<Failure, ListsModel>> getOneList({
    required String lang,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final remoteServices = await responsesRemoteData.getOneList(
        lang: lang,
        id: id,
      );
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, RequestModel>> getOneRequest({
    required String lang,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final remoteServices = await responsesRemoteData.getOneRequest(
        lang: lang,
        id: id,
      );
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, CitiesModel>> getCities({required String lang}) async {
    try {
      final result = await responsesRemoteData.getCities(lang: lang);
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
      final result = await responsesRemoteData.getAreas(lang: lang, id: id);
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
      final result = await responsesRemoteData.getRentType(lang: lang);
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
      final result = await responsesRemoteData.getFinishingType(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, ApartmentsModel>> getApartments({
    required String lang,
  }) async {
    try {
      final result = await responsesRemoteData.getApartments(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, FurnishingModel>> getFurnishingType({
    required String lang,
  }) async {
    try {
      final result = await responsesRemoteData.getFurnishingType(lang: lang);
      return Right(result);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }
}
