import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:final_lnk/features/auth/data/models/create_freelance_account_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/cities_model.dart';
import '../repositories/auth_repositories.dart';

class SignupUseCase {
  final AuthRepositories authRepositories;
  SignupUseCase({required this.authRepositories});

  Future<Either<Failure, Unit>> callLogin({
    required String email,
    required String password,
  }) {
    return authRepositories.login(email: email, password: password);
  }

  Future<Either<Failure, CitiesModel>> getCitiesCall({required String lang}) {
    return authRepositories.getCities(lang: lang);
  }

  Future<Either<Failure, AreasModel>> gerAreas({
    required String lang,
    required String id,
  }) {
    return authRepositories.getAreas(lang: lang, id: id);
  }

  Future<Either<Failure, Unit>> createFreeLanceAccount({
    required CreateFreelancAccountModel model,
  }) {
    return authRepositories.createFreeLanceAccount(model: model);
  }

  Future<Either<Failure, Unit>> callVerify() {
    return authRepositories.verify();
  }

  Future<Either<Failure, Unit>> callForgetPassword({
    required TextEditingController text,
  }) {
    return authRepositories.forgetPassword(text: text);
  }
  Future<Either<Failure, Unit>> callChangePass() {
    return authRepositories.changePassword();
  }
}
