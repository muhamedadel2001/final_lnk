import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/repositories/settings/control_settings_repo.dart';
import '../../datasources/settings_local_data.dart';
import '../../datasources/settings_remote_data.dart';

class SettingsRepoImpl implements SettingsRepo {
  final NetworkInfo networkInfo;
  final SettingsRemoteData settingsRemoteData;
  final SettingsLocalData settingsLocalData;
  SettingsRepoImpl({
    required this.networkInfo,
    required this.settingsRemoteData,
    required this.settingsLocalData,
  });
  @override
  Future<Either<Failure, ProfileData>> getMyProfile({
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final remoteServices = await settingsRemoteData.getMyProfileData();
        settingsLocalData.cacheProfile(remoteServices);
        return Right(remoteServices);
      } else {
        final localServices = await settingsLocalData.getLastMyProfile(context);
        return Right(localServices);
      }
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future updateProfile({required ProfileData profileData}) async {
    try {
      final result = await settingsRemoteData.updateProfile(model: profileData);
      return result;
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }
}
