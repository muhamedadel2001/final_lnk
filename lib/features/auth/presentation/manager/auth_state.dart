part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String error;
  LoginError(this.error);
}

class AccountTypeSelected extends AuthState {
  final AccountType selectedType;
  AccountTypeSelected(this.selectedType);
}

class GetCityLoading extends AuthState {}

class GetCitySuccess extends AuthState {}

class GetCityError extends AuthState {}

class FillForm extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  final String error;
  RegisterError(this.error);
}

class VerifyLoading extends AuthState {}

class VerifySuccess extends AuthState {}

class VerifyError extends AuthState {
  final String error;
  VerifyError(this.error);
}

class OtpLoading extends AuthState {}

class OtpSuccess extends AuthState {}

class OtpError extends AuthState {
  final String error;
  OtpError(this.error);
}

class ChangeLoading extends AuthState {}

class ChangeSuccess extends AuthState {}

class ChangeError extends AuthState {}

class ResendLoading extends AuthState {}

class ResendSuccess extends AuthState {}

class ResendError extends AuthState {
  final String error;
  ResendError(this.error);
}
