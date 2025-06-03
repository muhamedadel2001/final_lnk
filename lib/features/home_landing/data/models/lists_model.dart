class ListsModel {
  final String loginUser;
  final String title;
  final Listing list;
  final List<SimilarRequest> similarRequests;

  ListsModel({
    required this.loginUser,
    required this.title,
    required this.list,
    required this.similarRequests,
  });

  factory ListsModel.fromJson(Map<String, dynamic> json) {
    return ListsModel(
      loginUser: json['loginUser'],
      title: json['title'],
      list: Listing.fromJson(json['List']),
      similarRequests:
          (json['similarRequests'] as List)
              .map((e) => SimilarRequest.fromJson(e))
              .toList(),
    );
  }
}

class Listing {
  final String id;
  final String type;
  final String typeOfList;
  final Apartment apartment;
  final City city;
  final Location location;
  final String floor;
  final String area;
  final String? rooms;
  final String? bathRooms;
  final String? reseptionPieces;
  final String? balcona;
  final Finishing? finishing;
  final Furnising? furnising;
  final String price;
  final TypeOfRent? typeOfRent;
  final String? typeOfPay;
  final String? downpayment;
  final String? years;
  final String? insurance;
  final List<Additional> additional;
  final String title;
  final String description;
  final String whatsApp;
  final String phoneNumber;
  final List<String> images;
  final String? typeOfPublish;
  final User userId;
  final Agency agencyId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Listing({
    required this.id,
    required this.type,
    required this.typeOfList,
    required this.apartment,
    required this.city,
    required this.location,
    required this.floor,
    required this.area,
    this.rooms,
    this.bathRooms,
    this.reseptionPieces,
    this.balcona,
    this.finishing,
    this.furnising,
    required this.price,
    this.typeOfRent,
    this.typeOfPay,
    this.downpayment,
    this.years,
    required this.insurance,
    required this.additional,
    required this.title,
    required this.description,
    required this.whatsApp,
    required this.phoneNumber,
    required this.images,
    this.typeOfPublish,
    required this.userId,
    required this.agencyId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['_id'],
      type: json['type'],
      typeOfList: json['typeOfList'],
      apartment: Apartment.fromJson(json['apartment']),
      city: City.fromJson(json['city']),
      location: Location.fromJson(json['location']),
      floor: json['floor'],
      area: json['area'],
      rooms: json['rooms'],
      bathRooms: json['bathRooms'],
      reseptionPieces: json['reseptionPieces'],
      balcona: json['balcona'],
      finishing:
          json['finishing'] != null
              ? Finishing.fromJson(json['finishing'])
              : null,
      furnising:
          json['furnising'] != null
              ? Furnising.fromJson(json['furnising'])
              : null,
      price: json['price'],
      typeOfRent:
          json['typeOfRent'] != null
              ? TypeOfRent.fromJson(json['typeOfRent'])
              : null,
      typeOfPay: json['typeOfPay'],
      downpayment: json['Downpayment'],
      years: json['years'],
      insurance: json['insurance'],
      additional:
          (json['additional'] as List)
              .map((e) => Additional.fromJson(e))
              .toList(),
      title: json['title'],
      description: json['description'],
      whatsApp: json['whatsApp'],
      phoneNumber: json['phoneNumber'],
      images: List<String>.from(json['images']),
      typeOfPublish: json['typeOfPublish'],
      userId: User.fromJson(json['userId']),
      agencyId: Agency.fromJson(json['AgencyId']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Apartment {
  final String name;

  Apartment({required this.name});

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(name: json['name']);
  }
}

class City {
  final String name;

  City({required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(name: json['name']);
  }
}

class Location {
  final String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name']);
  }
}

class Finishing {
  final String name;

  Finishing({required this.name});

  factory Finishing.fromJson(Map<String, dynamic> json) {
    return Finishing(name: json['name']);
  }
}

class Furnising {
  final String? name;

  Furnising({required this.name});

  factory Furnising.fromJson(Map<String, dynamic> json) {
    return Furnising(name: json['name']);
  }
}

class TypeOfRent {
  final String? name;

  TypeOfRent({required this.name});

  factory TypeOfRent.fromJson(Map<String, dynamic> json) {
    return TypeOfRent(name: json['name']);
  }
}

class Additional {
  final String? name;

  Additional({required this.name});

  factory Additional.fromJson(Map<String, dynamic> json) {
    return Additional(name: json['name']);
  }
}

class User {
  final String id;
  final String? image;
  final String? name;
  final String? typeOfUser;

  User({
    required this.id,
    required this.image,
    required this.name,
    required this.typeOfUser,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
      typeOfUser: json['typeOfUser'],
    );
  }
}

class Agency {
  final String? id;
  final String? image;
  final String? name;

  Agency({required this.id, required this.image, required this.name});

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(id: json['_id'], image: json['image'], name: json['name']);
  }
}

class SimilarRequest {
  final String id;
  final String type;
  final String typeOfRequest;
  final String title;
  final Location location;
  final String area;
  final String minPrice;
  final String maxPrice;
  final Finishing? finishing;
  final User userId;
  final Agency agencyId;
  final DateTime createdAt;
  final int matchScore;

  SimilarRequest({
    required this.id,
    required this.type,
    required this.typeOfRequest,
    required this.title,
    required this.location,
    required this.area,
    required this.minPrice,
    required this.maxPrice,
    this.finishing,
    required this.userId,
    required this.agencyId,
    required this.createdAt,
    required this.matchScore,
  });

  factory SimilarRequest.fromJson(Map<String, dynamic> json) {
    return SimilarRequest(
      id: json['_id'],
      type: json['type'],
      typeOfRequest: json['typeOfRequest'],
      title: json['title'],
      location: Location.fromJson(json['location']),
      area: json['area'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      finishing:
          json['finishing'] != null
              ? Finishing.fromJson(json['finishing'])
              : null,
      userId: User.fromJson(json['userId']),
      agencyId: Agency.fromJson(json['AgencyId']),
      createdAt: DateTime.parse(json['createdAt']),
      matchScore: json['matchScore'],
    );
  }
}
