import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/usecases/signup_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignupUseCase signupUseCase;
  AuthCubit({required this.signupUseCase}) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  /*bool isVisible = true;
  bool isVisibleConfirm = true;
  CountryCode? selectedCountryCode;*/
  /*int _countdownTime = 60; // إعداد الوقت لبداية العد التنازلي
  Timer? _timer;*/

  /*void startCountdown() {
    _countdownTime = 60;
    emit(AuthCountdownStarted(countdownTime: _countdownTime));
    _startTimer();
  }*/

  /* void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdownTime > 0) {
        _countdownTime--;
        emit(AuthCountdownUpdated(countdownTime: _countdownTime));
      } else {
        _timer?.cancel();
      }
    });
  }*/

  /* void cancelCountdown() {
    _timer?.cancel();
    _countdownTime = 0;
    emit(AuthCountdownCancelled());
  }*/

  /* isVisibleFirstMethod() {
    isVisible = !isVisible;
    emit(AuthShowPassword());
  }

  isVisibleSecondMethod() {
    isVisibleConfirm = !isVisibleConfirm;
    emit(AuthShowPassword());
  }

  changeCountryCode(val) {
    selectedCountryCode = val;
    emit(AuthChangeCode());
  }*/

  /*Future<void> signup(UserModel userModel) async {
    emit(AuthLoading());
    final Either<Failure, Unit> result =
    await signupUseCase.callSignupUser(userModel: userModel);
    result.fold(
          (failure) => emit(AuthError(failure.errMessage)),
          (_) => emit(AuthSuccess()),
    );
  }*/

  /* Future<void> forgetPassword({required TextEditingController text}) async {
    emit(OtpLoading());
    final Either<Failure, Unit> result =
    await forgetPasswordUseCase.callForgetPassword(text: text);
    result.fold(
          (failure) => emit(OtpError(failure.errMessage)),
          (_) => emit(OtpSuccess()),
    );
  }

  Future<void> verify() async {
    emit(VerifyLoading());
    final Either<Failure, Unit> result =
    await forgetPasswordUseCase.callVerify();
    result.fold(
          (failure) => emit(VerifyError(failure.errMessage)),
          (_) => emit(VerifySuccess()),
    );
  }*/

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

  /*Future<void> changePass() async {
    emit(ChangeLoading());
    final Either<Failure, Unit> result =
    await forgetPasswordUseCase.callChangePass();
    result.fold(
          (failure) => emit(ChangeError()),
          (_) => emit(ChangeSuccess()),
    );
  }

  Future<void> verifyChange() async {
    emit(VerifyLoading());
    final Either<Failure, Unit> result =
    await forgetPasswordUseCase.callVerifyChange();
    result.fold(
          (failure) => emit(VerifyError(failure.errMessage)),
          (_) => emit(VerifySuccess()),
    );
  }*/
}
