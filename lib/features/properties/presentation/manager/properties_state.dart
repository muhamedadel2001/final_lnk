part of 'properties_cubit.dart';

@immutable
sealed class PropertiesState {}

final class PropertiesInitial extends PropertiesState {}

final class GetPropertiesLoading extends PropertiesState {}

final class GetPropertiesSuccess extends PropertiesState {
  final PropertiesModel propertiesModel;

  GetPropertiesSuccess({required this.propertiesModel});
}

final class GetPropertiesFailure extends PropertiesState {}

final class TabChanged extends PropertiesState {}

class LoadingMoreState extends PropertiesState {}

class LoadedMoreState extends PropertiesState {}
