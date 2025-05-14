import '../../features/auth/data/models/areas_model.dart';
import '../../features/auth/data/models/cities_model.dart';

class AllStartModel {
  CitiesModel? citiesModel;
  AreasModel? areasModel;

  AllStartModel({this.citiesModel, this.areasModel});

  AllStartModel copyWith({CitiesModel? citiesModel, AreasModel? areasModel}) {
    return AllStartModel(
      citiesModel: citiesModel ?? this.citiesModel,
      areasModel: areasModel ?? this.areasModel,
    );
  }
}
