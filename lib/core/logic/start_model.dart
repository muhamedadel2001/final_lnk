import 'package:final_lnk/features/auth/data/models/finishing_model.dart';

import '../../features/auth/data/models/areas_model.dart';
import '../../features/auth/data/models/cities_model.dart';

class AllStartModel {
  CitiesModel? citiesModel;
  AreasModel? areasModel;
  FinishingModel? finishingModel;
  AllStartModel({this.citiesModel, this.areasModel, this.finishingModel});

  AllStartModel copyWith({
    CitiesModel? citiesModel,
    AreasModel? areasModel,
    FinishingModel? finishingModel,
  }) {
    return AllStartModel(
      citiesModel: citiesModel ?? this.citiesModel,
      areasModel: areasModel ?? this.areasModel,
      finishingModel: finishingModel ?? this.finishingModel,
    );
  }
}
