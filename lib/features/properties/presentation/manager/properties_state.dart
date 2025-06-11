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

class GetInputsLoading extends PropertiesState {}

class GetInputsSuccess extends PropertiesState {}

class GetInputsFailure extends PropertiesState {}

class PropertyStatusChanged extends PropertiesState {}

class PropertyCategoryChanged extends PropertiesState {}

class GetPropertiesFilterDataLoading extends PropertiesState {}

class GetPropertiesFilterDataSuccess extends PropertiesState {}

class GetPropertiesFilterDataFailure extends PropertiesState {
  final String message;

  GetPropertiesFilterDataFailure({required this.message});
}
