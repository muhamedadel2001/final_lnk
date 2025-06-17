class ApartmentsModel {
  final List<ApartmentType> commercialApartments;
  final List<ApartmentType> residentialApartments;

  ApartmentsModel({
    required this.commercialApartments,
    required this.residentialApartments,
  });

  factory ApartmentsModel.fromJson(Map<String, dynamic> json) {
    return ApartmentsModel(
      commercialApartments:
          (json['CommercialApartments'] as List)
              .map((e) => ApartmentType.fromJson(e))
              .toList(),
      residentialApartments:
          (json['ResidentialApartments'] as List)
              .map((e) => ApartmentType.fromJson(e))
              .toList(),
    );
  }
}

class ApartmentType {
  final String id;
  final String name;
  final String icon;

  ApartmentType({required this.id, required this.name, required this.icon});

  factory ApartmentType.fromJson(Map<String, dynamic> json) {
    return ApartmentType(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }
}
