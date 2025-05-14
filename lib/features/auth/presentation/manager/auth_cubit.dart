import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/create_freelance_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/logic/start_model.dart';
import '../../data/models/user_selection.dart';
import '../../domain/usecases/signup_usecase.dart';
part 'auth_state.dart';

enum AccountType { none, agency, freelancer }

class AuthCubit extends Cubit<AuthState> {
  final SignupUseCase signupUseCase;
  AuthCubit({required this.signupUseCase}) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  AccountType selectedAccountType = AccountType.none;
  final appModel = AllStartModel();
  final userSelection = UserSelection();

  void selectAccountType(AccountType type) {
    selectedAccountType = type;
    emit(AccountTypeSelected(type));
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final Either<Failure, Unit> result = await signupUseCase.callLogin(
      email: email,
      password: password,
    );
    result.fold((failure) => emit(LoginError(failure.errMessage)), (_) {
      emit(LoginSuccess());
    });
  }

  getCities({required String lang}) async {
    emit(GetCityLoading());
    final result = await signupUseCase.getCitiesCall(lang: lang);
    result.fold((failure) => {emit(GetCityError())}, (success) {
      appModel.citiesModel = success;
      emit(GetCitySuccess());
    });
  }

  getAreas({required String lang}) async {
    emit(GetCityLoading());
    final result = await signupUseCase.gerAreas(
      lang: lang,
      id: userSelection.cityId!,
    );
    result.fold((failure) => {emit(GetCityError())}, (success) {
      appModel.areasModel = success;
      emit(GetCitySuccess());
    });
  }

  changeValue() {
    emit(FillForm());
  }

  void selectServiceAreas({
    required List<String> names,
    required List<String> ids,
  }) {
    userSelection.serviceArea = names;
    userSelection.serviceAreaId = ids;
    emit(FillForm());
  }

  Future<void> signup(CreateFreelancAccountModel userModel) async {
    emit(RegisterLoading());
    final Either<Failure, Unit> result = await signupUseCase
        .createFreeLanceAccount(model: userModel);
    result.fold(
      (failure) => emit(RegisterError(failure.errMessage)),
      (_) => emit(RegisterSuccess()),
    );
  }
}
