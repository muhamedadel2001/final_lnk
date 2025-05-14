class UserSelection {
  String? city;
  String? cityId;
  List<String>? serviceArea;
  List<String>? serviceAreaId;

  UserSelection({this.city, this.cityId, this.serviceArea, this.serviceAreaId});

  void resetData() {
    city = null;
    cityId = null;
    serviceArea = null;
    serviceAreaId = null;
  }
}
