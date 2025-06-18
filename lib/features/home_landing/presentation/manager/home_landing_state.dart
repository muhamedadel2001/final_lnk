part of 'home_landing_cubit.dart';

@immutable
sealed class HomeLandingState {}

final class HomeLandingInitial extends HomeLandingState {}

final class ScreenChanged extends HomeLandingState {}

final class GetOneFailure extends HomeLandingState {}

final class GetOneSuccess extends HomeLandingState {}

final class GetOneLoading extends HomeLandingState {}

final class PropertyStatusChanged extends HomeLandingState {}

final class PropertyCategoryChanged extends HomeLandingState {}

final class PropertyPriceChanged extends HomeLandingState {}

final class GetInputsLoadingCreate extends HomeLandingState {}

final class GetInputsFailureCreate extends HomeLandingState {}

final class GetInputsSuccessCreate extends HomeLandingState {}

final class ChangeValue extends HomeLandingState {}

final class CreateLoading extends HomeLandingState {}

final class CreateSuccess extends HomeLandingState {}

final class CreateFailure extends HomeLandingState {}
