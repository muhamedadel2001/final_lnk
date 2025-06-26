import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/settings/data/model/create_sub_model.dart';
import 'package:final_lnk/features/settings/data/model/my_favourite_model.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/data/model/one_sub_account_model.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';
import 'package:final_lnk/features/settings/data/model/sub_account_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, ProfileData>> getMyProfile({
    required BuildContext context,
  });
  Future<Either<Failure, SubAccountModel>> getMySubAccount({
    required String lang,
  });
  Future<Either<Failure, OneSubAccountModel>> getOneSubAccount({
    required String lang,
    required String id,
  });
  Future deleteSubAccount({required String id, required BuildContext context});

  Future<Either<Failure, dynamic>> createSubAccount({
    required CreateSubModel model,
    required BuildContext context,
  });
  Future updateProfile({required ProfileData profileData});
  Future<Either<Failure, MyListModel>> getMyList({required String lang});
  Future<Either<Failure, MyRequestModel>> getMyRequest({required String lang});
  Future<Either<Failure, MyFavouriteModel>> getMyFavourite({
    required BuildContext context,
    required String lang,
  });
  // Future logout(BuildContext context);
}
