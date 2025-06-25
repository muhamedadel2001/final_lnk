part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class Updated extends SettingsState {}

final class ProfileLoading extends SettingsState {}

final class ProfileFailure extends SettingsState {}

final class ProfileSuccess extends SettingsState {}

final class UpdateLoading extends SettingsState {}

final class UpdateFailure extends SettingsState {}

final class GetMyListLoading extends SettingsState {}

final class GetMyListSuccess extends SettingsState {}

final class GetMyListFailure extends SettingsState {}

final class GetMyRequestLoading extends SettingsState {}

final class GetMyRequestSuccess extends SettingsState {}

final class GetMyRequestFailure extends SettingsState {}

final class GetMySubAccountLoading extends SettingsState {}

final class GetMySubAccountSuccess extends SettingsState {}

final class GetMySubAccountFailure extends SettingsState {}

final class GetOneSubAccountLoading extends SettingsState {}

final class GetOneSubAccountSuccess extends SettingsState {}

final class GetOneSubAccountFailure extends SettingsState {}

final class DeleteSubAccountFailure extends SettingsState {}

final class DeleteSubAccountLoading extends SettingsState {}

final class DeleteSubAccountSuccess extends SettingsState {}
