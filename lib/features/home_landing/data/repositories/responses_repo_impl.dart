import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/home_landing/domain/repositories/responses_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
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
}
