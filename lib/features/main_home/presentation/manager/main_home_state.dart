part of 'main_home_cubit.dart';

@immutable
sealed class MainHomeState {}

final class MainHomeInitial extends MainHomeState {}

final class GetHomeFailure extends MainHomeState {
  final String err;

  GetHomeFailure({required this.err});
}

final class GetHomeSuccess extends MainHomeState {}

final class GetHomeLoading extends MainHomeState {}

final class BannerChanged extends MainHomeState {}

final class MainHomeUpdated extends MainHomeState {}
