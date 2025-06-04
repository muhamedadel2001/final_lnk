class PropertiesModel {
  List<Properties>? properties;
  String? count;

  PropertiesModel({this.properties, this.count});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Properties {
  String? sId;
  String? type;
  String? typeOfList;
  String? title;
  Location? location;
  String? area;
  String? price;
  TypeOfRent? typeOfRent;
  Location? apartment;
  String? images;
  UserId? userId;
  UserId? agencyId;
  String? createdAt;
  bool? isFavourite;
  Properties({
    this.sId,
    this.type,
    this.typeOfList,
    this.title,
    this.location,
    this.area,
    this.price,
    this.typeOfRent,
    this.apartment,
    this.images,
    this.userId,
    this.agencyId,
    this.createdAt,
    this.isFavourite,
  });
  Properties.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    typeOfList = json['typeOfList'];
    title = json['title'];
    location =
        json['location'] != null
            ? new Location.fromJson(json['location'])
            : null;
    area = json['area'];
    price = json['price'];
    typeOfRent =
        json['typeOfRent'] != null
            ? new TypeOfRent.fromJson(json['typeOfRent'])
            : null;
    apartment =
        json['apartment'] != null
            ? new Location.fromJson(json['apartment'])
            : null;
    images = json['images'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    agencyId =
        json['AgencyId'] != null ? new UserId.fromJson(json['AgencyId']) : null;
    createdAt = json['createdAt'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['typeOfList'] = this.typeOfList;
    data['title'] = this.title;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['area'] = this.area;
    data['price'] = this.price;
    if (this.typeOfRent != null) {
      data['typeOfRent'] = this.typeOfRent!.toJson();
    }
    if (this.apartment != null) {
      data['apartment'] = this.apartment!.toJson();
    }
    data['images'] = this.images;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.agencyId != null) {
      data['AgencyId'] = this.agencyId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}

class Location {
  String? name;

  Location({this.name});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class TypeOfRent {
  String? name;

  TypeOfRent({this.name});

  TypeOfRent.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class UserId {
  String? sId;
  String? image;

  UserId({this.sId, this.image});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    return data;
  }
}
