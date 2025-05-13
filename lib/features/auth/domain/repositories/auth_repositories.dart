import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepositories {
  //Future<Either<Failure, Unit>> signupUser({required UserModel userModel});
  // Future<Either<Failure, Unit>> forgetPassword({required TextEditingController text});
  // Future<Either<Failure, Unit>> verify();
  // Future<Either<Failure, Unit>> verifyChange();
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });
  // Future<Either<Failure, Unit>> changePassword();
}
