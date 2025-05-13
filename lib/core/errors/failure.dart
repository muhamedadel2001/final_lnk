import 'exceptions.dart';

class Failure {
  final String errMessage;
  static Failure handleError(dynamic e) {
    if (e is ServerException)
      return Failure(errMessage: e.errorModel.errorMessage);
    if (e is CacheException) return Failure(errMessage: e.errorMessage);
    if (e is Failure) return Failure(errMessage: e.errMessage);
    return Failure(errMessage: 'Unexpected error occurred: $e');
  }
  Failure({required this.errMessage});
}
