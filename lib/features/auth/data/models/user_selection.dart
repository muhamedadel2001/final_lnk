class UserSelection {
  String? city;
  String? cityId;
  String? area;
  String? areaId;
  String? finishing;
  String? finishingId;
  String? furnishing;
  String? furnishingId;
  String? typeOfRentId;
  List<String>? serviceArea;
  List<String>? serviceAreaId;
  List<String>? typeOfCategory;
  String? typeOfCategoryId;
  String? floorNom;
  String roomsNom;
  String bathroomsNom;
  String balaconsNom;
  String receptionPieces;
  String installmentYears;
  List<String>? additionalFeatures;
  UserSelection({
    this.additionalFeatures,
    this.installmentYears = '1',
    this.roomsNom = '1',
    this.bathroomsNom = '1',
    this.balaconsNom = '1',
    this.receptionPieces = '1',
    this.city,
    this.cityId,
    this.floorNom,
    this.typeOfCategory,
    this.typeOfCategoryId,
    this.serviceArea,
    this.serviceAreaId,
    this.typeOfRentId,
    this.area,
    this.areaId,
    this.finishing,
    this.finishingId,
    this.furnishing,
    this.furnishingId,
  });

  void resetData() {
    city = null;
    installmentYears = '1';
    floorNom = null;
    cityId = null;
    finishing = null;
    finishingId = null;
    serviceArea = null;
    serviceAreaId = null;
    typeOfRentId = null;
    area = null;
    areaId = null;
    typeOfCategoryId = null;
    typeOfCategory = null;
    furnishing = null;
    furnishingId = null;
    receptionPieces = '1';
    balaconsNom = '1';
    bathroomsNom = '1';
    roomsNom = '1';
    additionalFeatures = null;
  }
}
