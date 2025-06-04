import 'package:dartz/dartz.dart';
import 'package:final_lnk/core/errors/failure.dart';
import 'package:final_lnk/features/properties/data/datasources/properties_local_data.dart';
import 'package:final_lnk/features/properties/data/datasources/properties_remote_data.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/domain/repositories/properties_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/connection/network_info.dart';

class PropertiesRepoImpl implements PropertiesRepo {
  final NetworkInfo networkInfo;
  final PropertiesRemoteData propertiesRemoteData;
  final PropertiesLocalData propertiesLocalData;

  PropertiesRepoImpl({
    required this.networkInfo,
    required this.propertiesRemoteData,
    required this.propertiesLocalData,
  });
  @override
  Future<Either<Failure, PropertiesModel>> getPropertiesData({
    required String lang,
    required String query,
    required String type,
    int page = 1,
    required BuildContext context,
  }) async {
    try {
      if (await networkInfo.isConnected!) {
        final remoteServices = await propertiesRemoteData.fetchProperties(
          page: page,
          query: query,
          lang: lang,
          type: type,
        );
        propertiesLocalData.cachePropertiesData(remoteServices);
        return Right(remoteServices);
      } else {
        final localBooks = await propertiesLocalData.getLastPropertiesData(
          context,
        );
        return Right(localBooks);
      }
    } catch (e) {
      print(e);
      return Left(Failure.handleError(e));
    }
  }
}
