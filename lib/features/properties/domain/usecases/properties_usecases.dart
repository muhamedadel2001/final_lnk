import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/domain/repositories/properties_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';

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
}
