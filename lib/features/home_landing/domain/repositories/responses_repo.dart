import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';

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
}
