import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:final_lnk/features/auth/data/models/create_freelance_account_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../models/cities_model.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final ApiConsumer apiConsumer;

  AuthRepositoriesImpl({required this.apiConsumer});

  /*@override
  Future<Either<Failure, Unit>> forgetPassword(
      {required TextEditingController text}) async {
    try {
      await apiConsumer.post(
        ApiConstants.forgetPasswordEndpoint,
        data: {"email": text.text},
      );
      return const Right(unit); // Success case
    } on ServerException catch (serverException) {
      return Left(Failure(errMessage: serverException.errorModel.errorMessage));
    } on Failure catch (failure) {
      return Left(Failure(errMessage: failure.errMessage));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error occurred: $e'));
    }
  }*/

  /* @override
  Future<Either<Failure, Unit>> verify() async {
    try {
      await apiConsumer.post(
        ApiConstants.verifyEndpoint,
        data: {
          "email": emailSignupController.text,
          "otp": pinOtpController.text
        },
      );
      return const Right(unit); // Success case
    } on ServerException catch (serverException) {
      return Left(Failure(errMessage: serverException.errorModel.errorMessage));
    } on Failure catch (failure) {
      return Left(Failure(errMessage: failure.errMessage));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error occurred: $e'));
    }
  }*/
  @override
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await apiConsumer.post(
        ApiConstants.loginEndpoint,
        data: {"phone": email, "password": password},
      );
      MyCache.setString(key: MyCacheKeys.token, value: result['token']);
      print(MyCache.getString(key: MyCacheKeys.token));
      return const Right(unit); // Success case
    } on ServerException catch (serverException) {
      print('z');
      return Left(Failure(errMessage: serverException.errorModel.errorMessage));
    } on Failure catch (failure) {
      print('zz');
      print(email);
      print(password);
      return Left(Failure(errMessage: failure.errMessage));
    } catch (e) {
      print('zzz');
      print(email);
      print(password);
      return Left(Failure(errMessage: 'Unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, CitiesModel>> getCities({required String lang}) async {
    try {
      final response = await apiConsumer.get(
        ApiConstants.cityEndpoint,
        queryParameters: {"lang": lang},
      );
      return Right(CitiesModel.fromJson(response));
    } catch (failure) {
      return Left(Failure(errMessage: 'Something went wrong !'));
    }
  }

  @override
  Future<Either<Failure, AreasModel>> getAreas({
    required String lang,
    required String id,
  }) async {
    try {
      final response = await apiConsumer.get(
        '${ApiConstants.areaEndpoint}$id',
        queryParameters: {"lang": lang},
      );
      return Right(AreasModel.fromJson(response));
    } catch (failure) {
      return Left(Failure(errMessage: 'Something went wrong !'));
    }
  }

  @override
  Future<Either<Failure, Unit>> createFreeLanceAccount({
    required CreateFreelancAccountModel model,
  }) async {
    try {
      final Map<String, dynamic> jsonData = await model.toJson();
      final result = await apiConsumer.post(
        ApiConstants.signupEndpoint,
        data: jsonData,
      );
      return const Right(unit); // Success case
    } on ServerException catch (serverException) {
      return Left(Failure(errMessage: serverException.errorModel.errorMessage));
    } on Failure catch (failure) {
      return Left(Failure(errMessage: failure.errMessage));
    } catch (e) {
      print('zzz');
      return Left(Failure(errMessage: 'Unexpected error occurred: $e'));
    }
  }
}

/* @override
  Future<Either<Failure, Unit>> changePassword() async {
    try {
      await apiConsumer.post(
        ApiConstants.changePassEndpoint,
        data: {
          "email": writeEmailController.text,
          "newPassword": newPasswordController.text
        },
      );
      return const Right(unit); // Success case
    } on ServerException catch (serverException) {
      return Left(Failure(errMessage: serverException.errorModel.errorMessage));
    } on Failure catch (failure) {
      return Left(Failure(errMessage: failure.errMessage));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error occurred: $e'));
    }
  }
*/
/* @override
  Future<Either<Failure, Unit>> verifyChange() async {
    try {
      await apiConsumer.post(
        ApiConstants.verifyEndpoint,
        data: {
          "email": writeEmailController.text,
          "otp": pinOtpController.text
        },
      );
      return const Right(unit); // Success case
    } on ServerException catch (serverException) {
      return Left(Failure(errMessage: serverException.errorModel.errorMessage));
    } on Failure catch (failure) {
      return Left(Failure(errMessage: failure.errMessage));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error occurred: $e'));
    }
  }*/
