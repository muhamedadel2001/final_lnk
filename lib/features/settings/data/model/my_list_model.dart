class MyListModel {
  int? count;
  List<Listings>? listings;

  MyListModel({this.count, this.listings});

  MyListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['listings'] != null) {
      listings = <Listings>[];
      json['listings'].forEach((v) {
        listings!.add(new Listings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.listings != null) {
      data['listings'] = this.listings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listings {
  String? sId;
  String? type;
  String? typeOfList;
  String? title;
  Location? location;
  String? area;
  String? price;
  Location? apartment;
  String? images;
  UserId? userId;
  AgencyId? agencyId;
  String? createdAt;

  Listings({
    this.sId,
    this.type,
    this.typeOfList,
    this.title,
    this.location,
    this.area,
    this.price,
    this.apartment,
    this.images,
    this.userId,
    this.agencyId,
    this.createdAt,
  });

  Listings.fromJson(Map<String, dynamic> json) {
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
    apartment =
        json['apartment'] != null
            ? new Location.fromJson(json['apartment'])
            : null;
    images = json['images'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    agencyId =
        json['AgencyId'] != null
            ? new AgencyId.fromJson(json['AgencyId'])
            : null;
    createdAt = json['createdAt'];
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

class AgencyId {
  String? nId;
  String? image;

  AgencyId({this.nId, this.image});

  AgencyId.fromJson(Map<String, dynamic> json) {
    nId = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.nId;
    data['image'] = this.image;
    return data;
  }
}
