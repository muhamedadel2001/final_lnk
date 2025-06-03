class RequestModel {
  final String loginUser;
  final Request request;
  final List<SimilarList> similarLists;

  RequestModel({
    required this.loginUser,
    required this.request,
    required this.similarLists,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      loginUser: json['loginUser'],
      request: Request.fromJson(json['Request']),
      similarLists:
          (json['similarLists'] as List)
              .map((e) => SimilarList.fromJson(e))
              .toList(),
    );
  }
}

class Request {
  final String id;
  final String type;
  final String typeOfRequest;
  final NamedField apartment;
  final NamedField city;
  final NamedField location;
  final String floor;
  final String area;
  final String? rooms;
  final String? bathRooms;
  final String? reseptionPieces;
  final String? balcona;
  final NamedField finishing;
  final NamedField furnising;
  final NamedField typeOfRent;
  final String? minPrice;
  final String? maxPrice;
  final String? typeOfPay;
  final String? downPayment;
  final String? years;
  final List<NamedField> additional;
  final String title;
  final String description;
  final String whatsApp;
  final String phoneNumber;
  final String view;
  final String click;
  final String? typeOfPublish;
  final User userId;
  final Agency agencyId;
  final String createdAt;
  final String updatedAt;

  Request({
    required this.id,
    required this.type,
    required this.typeOfRequest,
    required this.apartment,
    required this.city,
    required this.location,
    required this.floor,
    required this.area,
    this.rooms,
    this.bathRooms,
    this.reseptionPieces,
    this.balcona,
    required this.finishing,
    required this.furnising,
    required this.typeOfRent,
    this.minPrice,
    this.maxPrice,
    this.typeOfPay,
    this.downPayment,
    this.years,
    required this.additional,
    required this.title,
    required this.description,
    required this.whatsApp,
    required this.phoneNumber,
    required this.view,
    required this.click,
    this.typeOfPublish,
    required this.userId,
    required this.agencyId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['_id'],
      type: json['type'],
      typeOfRequest: json['typeOfRequest'],
      apartment: NamedField.fromJson(json['apartment']),
      city: NamedField.fromJson(json['city']),
      location: NamedField.fromJson(json['location']),
      floor: json['floor'],
      area: json['area'],
      rooms: json['rooms'],
      bathRooms: json['bathRooms'],
      reseptionPieces: json['reseptionPieces'],
      balcona: json['balcona'],
      finishing: NamedField.fromJson(json['finishing']),
      furnising: NamedField.fromJson(json['furnising']),
      typeOfRent: NamedField.fromJson(json['typeOfRent']),
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      typeOfPay: json['typeOfPay'],
      downPayment: json['downPayment'],
      years: json['years'],
      additional:
          (json['additional'] as List)
              .map((e) => NamedField.fromJson(e))
              .toList(),
      title: json['title'],
      description: json['description'],
      whatsApp: json['whatsApp'],
      phoneNumber: json['phoneNumber'],
      view: json['view'],
      click: json['click'],
      typeOfPublish: json['typeOfPublish'],
      userId: User.fromJson(json['userId']),
      agencyId: Agency.fromJson(json['AgencyId']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class SimilarList {
  final String id;
  final String type;
  final String typeOfList;
  final String title;
  final NamedField location;
  final String area;
  final String price;
  final NamedField typeOfRent;
  final NamedField apartment;
  final String? images;
  final User userId;
  final Agency agencyId;
  final String createdAt;
  final int matchScore;

  SimilarList({
    required this.id,
    required this.type,
    required this.typeOfList,
    required this.title,
    required this.location,
    required this.area,
    required this.price,
    required this.typeOfRent,
    required this.apartment,
    required this.images,
    required this.userId,
    required this.agencyId,
    required this.createdAt,
    required this.matchScore,
  });

  factory SimilarList.fromJson(Map<String, dynamic> json) {
    return SimilarList(
      id: json['_id'],
      type: json['type'],
      typeOfList: json['typeOfList'],
      title: json['title'],
      location: NamedField.fromJson(json['location']),
      area: json['area'],
      price: json['price'],
      typeOfRent: NamedField.fromJson(json['typeOfRent']),
      apartment: NamedField.fromJson(json['apartment']),
      images: json['images'],
      userId: User.fromJson(json['userId']),
      agencyId: Agency.fromJson(json['AgencyId']),
      createdAt: json['createdAt'],
      matchScore: json['matchScore'],
    );
  }
}

class NamedField {
  final String? name;

  NamedField({this.name});

  factory NamedField.fromJson(Map<String, dynamic> json) {
    return NamedField(name: json['name']);
  }
}

class User {
  final String id;
  final String? image;
  final String? name;
  final String? typeOfUser;

  User({required this.id, this.image, this.name, this.typeOfUser});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      typeOfUser: json['typeOfUser'],
      image: json['image'],
      name: json['name'],
    );
  }
}

class Agency {
  final String? id;
  final String? image;
  final String? name;

  Agency({this.id, this.image, this.name});

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(id: json['_id'], image: json['image'], name: json['name']);
  }
}
