class MyFavouriteModel {
  List<FavouritsLists>? favouritsLists;
  List<FavouritsRequests>? favouritsRequests;

  MyFavouriteModel({this.favouritsLists, this.favouritsRequests});

  MyFavouriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favouritsLists'] != null) {
      favouritsLists = <FavouritsLists>[];
      json['favouritsLists'].forEach((v) {
        favouritsLists!.add(new FavouritsLists.fromJson(v));
      });
    }
    if (json['favouritsRequests'] != null) {
      favouritsRequests = <FavouritsRequests>[];
      json['favouritsRequests'].forEach((v) {
        favouritsRequests!.add(new FavouritsRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favouritsLists != null) {
      data['favouritsLists'] =
          this.favouritsLists!.map((v) => v.toJson()).toList();
    }
    if (this.favouritsRequests != null) {
      data['favouritsRequests'] =
          this.favouritsRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavouritsLists {
  String? sId;
  String? type;
  String? title;
  Location? location;
  String? area;
  String? price;
  Location? apartment;
  String? images;
  UserIdList? userId;
  AgencyId? agencyId;
  String? createdAt;

  FavouritsLists({
    this.sId,
    this.type,
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

  FavouritsLists.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
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
        json['userId'] != null ? new UserIdList.fromJson(json['userId']) : null;
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

class UserIdList {
  String? sId;
  String? image;

  UserIdList({this.sId, this.image});

  UserIdList.fromJson(Map<String, dynamic> json) {
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

class FavouritsRequests {
  String? sId;
  String? titleOfUser;
  String? type;
  String? typeOfRequest;
  String? title;
  Location? location;
  String? area;
  String? minPrice;
  String? maxPrice;
  Location? finishing;
  String? createdAt;
  UserIdRequest? userId;
  AgencyId? agencyId;

  FavouritsRequests({
    this.sId,
    this.titleOfUser,
    this.type,
    this.typeOfRequest,
    this.title,
    this.location,
    this.area,
    this.minPrice,
    this.maxPrice,
    this.finishing,
    this.createdAt,
    this.userId,
    this.agencyId,
  });

  FavouritsRequests.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titleOfUser = json['titleOfUser'];
    type = json['type'];
    typeOfRequest = json['typeOfRequest'];
    title = json['title'];
    location =
        json['location'] != null
            ? new Location.fromJson(json['location'])
            : null;
    area = json['area'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
    finishing =
        json['finishing'] != null
            ? new Location.fromJson(json['finishing'])
            : null;
    createdAt = json['createdAt'];
    userId =
        json['userId'] != null
            ? new UserIdRequest.fromJson(json['userId'])
            : null;
    agencyId =
        json['AgencyId'] != null
            ? new AgencyId.fromJson(json['AgencyId'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['titleOfUser'] = this.titleOfUser;
    data['type'] = this.type;
    data['typeOfRequest'] = this.typeOfRequest;
    data['title'] = this.title;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['area'] = this.area;
    data['minPrice'] = this.minPrice;
    data['maxPrice'] = this.maxPrice;
    if (this.finishing != null) {
      data['finishing'] = this.finishing!.toJson();
    }
    data['createdAt'] = this.createdAt;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.agencyId != null) {
      data['AgencyId'] = this.agencyId!.toJson();
    }
    return data;
  }
}

class UserIdRequest {
  String? sId;
  String? image;
  String? name;

  UserIdRequest({this.sId, this.image, this.name});

  UserIdRequest.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
