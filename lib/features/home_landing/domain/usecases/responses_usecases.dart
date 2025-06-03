import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/home_landing/domain/repositories/responses_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';

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
}
