part of 'home_landing_cubit.dart';

@immutable
sealed class HomeLandingState {}

final class HomeLandingInitial extends HomeLandingState {}

final class ScreenChanged extends HomeLandingState {}

final class GetOneFailure extends HomeLandingState {}

final class GetOneSuccess extends HomeLandingState {}

final class GetOneLoading extends HomeLandingState {}
