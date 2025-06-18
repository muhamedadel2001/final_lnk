import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/home_landing/data/models/additional_model.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/data/models/furnishing_model.dart';

import '../../features/auth/data/models/areas_model.dart';
import '../../features/auth/data/models/cities_model.dart';

class AllStartModel {
  CitiesModel? citiesModel;
  AreasModel? areasModel;
  FinishingModel? finishingModel;
  ApartmentsModel? apartmentsModel;
  FurnishingModel? furnishingModel;
  AdditionalModel? additionalModel;
  AllStartModel({
    this.citiesModel,
    this.areasModel,
    this.finishingModel,
    this.apartmentsModel,
    this.furnishingModel,
    this.additionalModel,
  });

  AllStartModel copyWith({
    CitiesModel? citiesModel,
    ApartmentsModel? apartmentsModel,
    AreasModel? areasModel,
    FinishingModel? finishingModel,
    FurnishingModel? furnishingModel,
    AdditionalModel? additionalModel,
  }) {
    return AllStartModel(
      citiesModel: citiesModel ?? this.citiesModel,
      apartmentsModel: apartmentsModel ?? this.apartmentsModel,
      areasModel: areasModel ?? this.areasModel,
      finishingModel: finishingModel ?? this.finishingModel,
      furnishingModel: furnishingModel ?? this.furnishingModel,
      additionalModel: additionalModel ?? this.additionalModel,
    );
  }
}
