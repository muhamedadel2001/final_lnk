class UserSelection {
  String? city;
  String? cityId;
  String? area;
  String? areaId;
  String? finishing;
  String? finishingId;
  String? typeOfRentId;
  List<String>? serviceArea;
  List<String>? serviceAreaId;

  UserSelection({
    this.city,
    this.cityId,
    this.serviceArea,
    this.serviceAreaId,
    this.typeOfRentId,
    this.area,
    this.areaId,
    this.finishing,
    this.finishingId,
  });

  void resetData() {
    city = null;
    cityId = null;
    finishing = null;
    finishingId = null;
    serviceArea = null;
    serviceAreaId = null;
    typeOfRentId = null;
    area = null;
    areaId = null;
  }
}
