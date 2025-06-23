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
