import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';

abstract class PropertiesRepo {
  Future<Either<Failure, PropertiesModel>> getPropertiesData({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  });
}
