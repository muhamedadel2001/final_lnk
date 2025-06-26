import 'package:dartz/dartz.dart';
import 'package:final_lnk/core/logic/custom_alerts.dart';
import 'package:final_lnk/features/settings/data/model/create_sub_model.dart';
import 'package:final_lnk/features/settings/data/model/my_favourite_model.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/data/model/one_sub_account_model.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';
import 'package:final_lnk/features/settings/data/model/sub_account_model.dart';
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

  @override
  Future<Either<Failure, MyListModel>> getMyList({required String lang}) async {
    try {
      final remoteServices = await settingsRemoteData.getMyList(lang: lang);
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, MyRequestModel>> getMyRequest({
    required String lang,
  }) async {
    try {
      final remoteServices = await settingsRemoteData.getMyRequest(lang: lang);
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, SubAccountModel>> getMySubAccount({
    required String lang,
  }) async {
    try {
      final remoteServices = await settingsRemoteData.getMySubAccount(
        lang: lang,
      );
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, OneSubAccountModel>> getOneSubAccount({
    required String lang,
    required String id,
  }) async {
    try {
      final remoteServices = await settingsRemoteData.getOneSubAccount(
        lang: lang,
        id: id,
      );
      return Right(remoteServices);
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future deleteSubAccount({
    required String id,
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final result = await settingsRemoteData.deleteSubAccount(id: id);
        return Right(result);
      } else {
        CustomAlerts.showMySnackBar(context, 'No Internet Connection !');
        return Left(Failure.handleError('No Internet Connection !'));
      }
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createSubAccount({
    required CreateSubModel model,
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final result = await settingsRemoteData.createSubAccount(model: model);
        CustomAlerts.showMySuccessSnackBar(context, result['Message']);
        return Right(result);
      } else {
        CustomAlerts.showMySnackBar(context, 'No Internet Connection !');
        return Left(Failure.handleError('No Internet Connection !'));
      }
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, MyFavouriteModel>> getMyFavourite({
    required BuildContext context,
    required String lang,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final remoteServices = await settingsRemoteData.getMyFavouriteData(
          lang: lang,
        );
        settingsLocalData.cacheFavourite(remoteServices);
        return Right(remoteServices);
      } else {
        final localServices = await settingsLocalData.getLastMyFavourite(
          context,
        );
        return Right(localServices);
      }
    } catch (e) {
      return Left(Failure.handleError(e));
    }
  }
}
