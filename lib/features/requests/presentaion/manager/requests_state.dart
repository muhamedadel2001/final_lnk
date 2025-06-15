part of 'requests_cubit.dart';

@immutable
sealed class RequestsState {}

final class RequestsInitial extends RequestsState {}

final class PropertyStatusChanged extends RequestsState {}

final class TabChanged extends RequestsState {}

final class PropertyCategoryChanged extends RequestsState {}

class LoadingMoreState extends RequestsState {}

class LoadedMoreState extends RequestsState {}

class GetInputsRequestsLoading extends RequestsState {}

class GetInputsRequestsFailure extends RequestsState {}

class GetInputsRequestsSuccess extends RequestsState {}

final class GetRequestsLoading extends RequestsState {}

final class GetRequestsSuccess extends RequestsState {
  final RequestsModel requestsModel;

  GetRequestsSuccess({required this.requestsModel});
}

final class GetRequestsFailure extends RequestsState {}

final class GetRequestsFilterDataLoading extends RequestsState {}

final class GetRequestsFilterDataSuccess extends RequestsState {}

class GetRequestsFilterDataFailure extends RequestsState {
  final String message;

  GetRequestsFilterDataFailure({required this.message});
}
