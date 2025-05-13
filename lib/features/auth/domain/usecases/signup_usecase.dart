import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/auth_repositories.dart';

class SignupUseCase {
  final AuthRepositories authRepositories;
  SignupUseCase({required this.authRepositories});
  /*Future<Either<Failure, Unit>> callSignupUser({required UserModel userModel}) {
    return authRepositories.signupUser(userModel: userModel);
  }*/

  Future<Either<Failure, Unit>> callLogin({
    required String email,
    required String password,
  }) {
    return authRepositories.login(email: email, password: password);
  }
}
