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
