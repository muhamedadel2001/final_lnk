import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/cities_model.dart';
import '../../data/models/create_freelance_account_model.dart';

abstract class AuthRepositories {
  Future<Either<Failure, Unit>> forgetPassword({
    required TextEditingController text,
  });
  Future<Either<Failure, Unit>> verify();
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, CitiesModel>> getCities({required String lang});
  Future<Either<Failure, AreasModel>> getAreas({
    required String lang,
    required String id,
  });
  Future<Either<Failure, Unit>> changePassword();
  Future<Either<Failure, Unit>> createFreeLanceAccount({
    required CreateFreelancAccountModel model,
  });
}
