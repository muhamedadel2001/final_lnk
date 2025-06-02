import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:final_lnk/features/main_home/domain/repositories/home_repo.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failure.dart';

class GetHomeUseCase {
  final HomeRepo homeRepo;

  GetHomeUseCase({required this.homeRepo});

  Future<Either<Failure, UserData>> getHomeCall({
    required String lang,
    required BuildContext context,
  }) {
    return homeRepo.getHomeData(lang: lang, context: context);
  }
}
