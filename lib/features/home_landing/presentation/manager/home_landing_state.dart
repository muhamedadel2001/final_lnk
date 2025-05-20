part of 'home_landing_cubit.dart';

@immutable
sealed class HomeLandingState {}

final class HomeLandingInitial extends HomeLandingState {}

final class ScreenChanged extends HomeLandingState {}
