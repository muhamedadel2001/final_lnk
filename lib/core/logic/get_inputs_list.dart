import 'package:final_lnk/core/logic/start_model.dart';

class GetLists {
  static List getCityNames(AllStartModel appModel) {
    return appModel.citiesModel?.cities?.map((city) => city.name).toList() ??
        [];
  }

  static List getCityIds(AllStartModel appModel) {
    return appModel.citiesModel?.cities?.map((city) => city.id).toList() ?? [];
  }

  static List getAreasNames(AllStartModel appModel) {
    return appModel.areasModel?.locations?.map((name) => name.name).toList() ??
        [];
  }

  static List getAreasId(AllStartModel appModel) {
    return appModel.areasModel?.locations?.map((id) => id.sId).toList() ?? [];
  }

  static List getFinishingNames(AllStartModel appModel) {
    return appModel.finishingModel?.finishings
            ?.map((finshing) => finshing.name)
            .toList() ??
        [];
  }

  static List getFinishingIds(AllStartModel appModel) {
    return appModel.finishingModel?.finishings
            ?.map((finshing) => finshing.id)
            .toList() ??
        [];
  }
}
