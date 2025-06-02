import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserData>> getHomeData({
    required String lang,
    required BuildContext context,
  });
}
