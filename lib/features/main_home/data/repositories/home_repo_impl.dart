import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/main_home/data/datasources/user_local_data.dart';
import 'package:final_lnk/features/main_home/data/datasources/user_remote_data.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:final_lnk/features/main_home/domain/repositories/home_repo.dart';
import 'package:flutter/material.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';

class HomeRepoImpl implements HomeRepo {
  final NetworkInfo networkInfo;
  final UserRemoteData userRemoteData;
  final UserLocalData userLocalData;
  HomeRepoImpl({
    required this.networkInfo,
    required this.userRemoteData,
    required this.userLocalData,
  });
  @override
  Future<Either<Failure, UserData>> getHomeData({
    required String lang,
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final remoteServices = await userRemoteData.getHomeData(lang: lang);
        userLocalData.cacheHomeData(remoteServices);
        return Right(remoteServices);
      } else {
        final localServices = await userLocalData.getLastHomeData(context);
        return Right(localServices);
      }
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }
}
