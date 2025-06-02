class UserData {
  final String name;
  final String? image;
  final List<HomeListing> homeListing;
  final List<HomeRequest> homeRequests;

  UserData({
    required this.name,
    this.image,
    required this.homeListing,
    required this.homeRequests,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    name: json['name'],
    image: json['image'],
    homeListing:
        (json['HomeListing'] as List)
            .map((e) => HomeListing.fromJson(e))
            .toList(),
    homeRequests:
        (json['HomeRequests'] as List)
            .map((e) => HomeRequest.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'HomeListing': homeListing.map((e) => e.toJson()).toList(),
    'HomeRequests': homeRequests.map((e) => e.toJson()).toList(),
  };
}

class HomeListing {
  final String id;
  final String title;
  final NamedField location;
  final String area;
  final String price;
  final NamedField apartment;
  final String? images;
  final ImageField userId;
  final ImageField agencyId;
  final String createdAt;
  final bool isFavourite;

  HomeListing({
    required this.id,
    required this.title,
    required this.location,
    required this.area,
    required this.price,
    required this.apartment,
    this.images,
    required this.userId,
    required this.agencyId,
    required this.createdAt,
    required this.isFavourite,
  });

  factory HomeListing.fromJson(Map<String, dynamic> json) => HomeListing(
    id: json['_id'],
    title: json['title'],
    location: NamedField.fromJson(json['location']),
    area: json['area'],
    price: json['price'],
    apartment: NamedField.fromJson(json['apartment']),
    images: json['images'],
    userId: ImageField.fromJson(json['userId']),
    agencyId: ImageField.fromJson(json['AgencyId']),
    createdAt: json['createdAt'],
    isFavourite: json['isFavourite'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'location': location.toJson(),
    'area': area,
    'price': price,
    'apartment': apartment.toJson(),
    'images': images,
    'userId': userId.toJson(),
    'AgencyId': agencyId.toJson(),
    'createdAt': createdAt,
    'isFavourite': isFavourite,
  };
}

class HomeRequest {
  final String id;
  final String type;
  final String typeOfRequest;
  final String title;
  final NamedField location;
  final String area;
  final String minPrice;
  final String maxPrice;
  final NamedField finishing;
  final ImageField userId;
  final ImageField agencyId;
  final String createdAt;
  final bool isFavourite;

  HomeRequest({
    required this.id,
    required this.type,
    required this.typeOfRequest,
    required this.title,
    required this.location,
    required this.area,
    required this.minPrice,
    required this.maxPrice,
    required this.finishing,
    required this.userId,
    required this.agencyId,
    required this.createdAt,
    required this.isFavourite,
  });

  factory HomeRequest.fromJson(Map<String, dynamic> json) => HomeRequest(
    id: json['_id'],
    type: json['type'],
    typeOfRequest: json['typeOfRequest'],
    title: json['title'],
    location: NamedField.fromJson(json['location']),
    area: json['area'],
    minPrice: json['minPrice'],
    maxPrice: json['maxPrice'],
    finishing: NamedField.fromJson(json['finishing']),
    userId: ImageField.fromJson(json['userId']),
    agencyId: ImageField.fromJson(json['AgencyId']),
    createdAt: json['createdAt'],
    isFavourite: json['isFavourite'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'type': type,
    'typeOfRequest': typeOfRequest,
    'title': title,
    'location': location.toJson(),
    'area': area,
    'minPrice': minPrice,
    'maxPrice': maxPrice,
    'finishing': finishing.toJson(),
    'userId': userId.toJson(),
    'AgencyId': agencyId.toJson(),
    'createdAt': createdAt,
    'isFavourite': isFavourite,
  };
}

class NamedField {
  final String name;

  NamedField({required this.name});

  factory NamedField.fromJson(Map<String, dynamic> json) =>
      NamedField(name: json['name']);

  Map<String, dynamic> toJson() => {'name': name};
}

class ImageField {
  final String? id;
  final String? image;

  ImageField({this.id, this.image});

  factory ImageField.fromJson(Map<String, dynamic> json) =>
      ImageField(id: json['_id'], image: json['image']);

  Map<String, dynamic> toJson() => {'_id': id, 'image': image};
}
