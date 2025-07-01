import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/widgets/custom_dialog.dart';
import 'package:final_lnk/features/settings/data/model/create_sub_model.dart';
import 'package:final_lnk/features/settings/data/model/my_favourite_model.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/data/model/sub_account_model.dart';
import 'package:final_lnk/features/settings/domain/usecases/settings/settings_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../../core/logic/file_utils.dart';
import '../../data/model/one_sub_account_model.dart';
import '../../data/model/profile_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsUseCase settingsUseCase;
  SettingsCubit(this.settingsUseCase) : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);
  String? language;
  String? myImage;
  String? myTitle;
  MyListModel? myListModel;
  MyFavouriteModel? myFavouriteModel;
  SubAccountModel? subAccountModel;
  OneSubAccountModel? oneSubAccountModel;
  MyRequestModel? myRequestModel;
  File? profileImage;
  void update() {
    emit(Updated());
  }

  getMyProfile({required BuildContext context}) async {
    emit(ProfileLoading());
    final result = await settingsUseCase.getMyProfileCall(context: context);
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(ProfileFailure());
      },
      (success) {
        emit(ProfileSuccess());
        myTitle = success.titleOfUser;
        myImage = success.image;
        name.text = success.userName!;
        phoneController.text = success.phone;
        emailController.text = success.email;
      },
    );
  }

  getMyList({required String lang}) async {
    emit(GetMyListLoading());
    final result = await settingsUseCase.getMyListCall(lang: lang);
    result.fold(
      (failure) {
        emit(GetMyListFailure());
      },
      (success) {
        myListModel = success;
        emit(GetMyListSuccess());
      },
    );
  }

  getMyRequest({required String lang}) async {
    emit(GetMyRequestLoading());
    final result = await settingsUseCase.getMyRequestCall(lang: lang);
    result.fold(
      (failure) {
        emit(GetMyRequestFailure());
      },
      (success) {
        myRequestModel = success;
        emit(GetMyRequestSuccess());
      },
    );
  }

  updateProfile({
    required BuildContext context,
    required ProfileData profileData,
  }) async {
    emit(UpdateLoading());
    try {
      await settingsUseCase.updateProfile(profileData: profileData);
      getMyProfile(context: context);
    } catch (err) {
      emit(UpdateFailure());
    }
  }

  Future<void> updateImageMethod() async {
    profileImage = await FileUtils.pickImage(ImageSource.gallery);
    emit(ProfileSuccess());
  }

  getMySubAccount({required String lang}) async {
    emit(GetMySubAccountLoading());
    final result = await settingsUseCase.getMySubAccountCall(lang: lang);
    result.fold(
      (failure) {
        emit(GetMySubAccountFailure());
      },
      (success) {
        subAccountModel = success;
        emit(GetMySubAccountSuccess());
      },
    );
  }

  getOneSubAccount({required String lang, required String id}) async {
    emit(GetOneSubAccountLoading());
    final result = await settingsUseCase.getOneSubAccountCall(
      lang: lang,
      id: id,
    );
    result.fold(
      (failure) {
        emit(GetOneSubAccountFailure());
      },
      (success) {
        oneSubAccountModel = success;
        emit(GetOneSubAccountSuccess());
      },
    );
  }

  deleteSubAccount({required String id, required BuildContext context}) async {
    emit(DeleteSubAccountLoading());
    try {
      final result = await settingsUseCase.deleteSubAccount(
        id: id,
        context: context,
      );
      result.fold(
        (failure) {
          emit(DeleteSubAccountFailure(null));
        },
        (success) {
          emit(DeleteSubAccountSuccess());
        },
      );
    } catch (err) {
      emit(DeleteSubAccountFailure(null));
    }
  }

  createSubAccount({
    required CreateSubModel model,
    required BuildContext context,
  }) async {
    emit(DeleteSubAccountLoading());

    final result = await settingsUseCase.createSubAccount(
      context: context,
      model: model,
    );
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(DeleteSubAccountFailure(failure.errMessage));
      },
      (success) {
        emit(DeleteSubAccountSuccess());
      },
    );
  }

  List<FavouritsLists> myFavouriteList = [];
  List<FavouritsRequests> myFavouriteRequest = [];

  getMyFavourite({required BuildContext context, required String lang}) async {
    emit(GetFavouriteLoading());
    final result = await settingsUseCase.getMyFavouriteCall(
      context: context,
      lang: lang,
    );
    result.fold(
      (failure) {
        emit(GetFavouriteFailure());
      },
      (success) {
        myFavouriteModel = success;
        myFavouriteList = success.favouritsLists!;
        myFavouriteRequest = success.favouritsRequests!;
        emit(GetFavouriteSuccess());
      },
    );
  }

  void toggleFavoriteLocally(String id) {
    emit(GetFavouriteSuccess());
  }

  logout(BuildContext context) async {
    emit(LogoutLoading());
    try {
      final result = await settingsUseCase.logout(context);
      result.fold(
        (failure) {
          emit(LogoutFailure());
        },
        (success) {
          emit(LogoutSuccess());
        },
      );
    } catch (err) {
      emit(LogoutFailure());
    }
  }

  deleteAcc(BuildContext context) async {
    emit(LogoutLoading());
    try {
      final result = await settingsUseCase.deleteAcc(context);
      result.fold(
        (failure) {
          emit(LogoutFailure());
        },
        (success) {
          emit(LogoutSuccess());
        },
      );
    } catch (err) {
      emit(LogoutFailure());
    }
  }
}
