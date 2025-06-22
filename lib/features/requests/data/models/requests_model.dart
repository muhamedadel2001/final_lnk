class RequestsModel {
  String? count;
  List<Requests>? requests;

  RequestsModel({this.count, this.requests});

  RequestsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['RequestsPage'] != null) {
      requests = <Requests>[];
      json['RequestsPage'].forEach((v) {
        requests!.add(new Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.requests != null) {
      data['RequestsPage'] = this.requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  String? sId;
  String? titleOfUser;
  bool? isMe;
  String? type;
  String? typeOfRequest;
  String? title;
  Location? location;
  String? area;
  String? minPrice;
  String? maxPrice;
  Location? finishing;
  UserId? userId;
  UserId? agencyId;
  String? createdAt;
  bool? isFavourite;

  Requests({
    this.sId,
    required this.isMe,
    this.titleOfUser,
    this.type,
    this.typeOfRequest,
    this.title,
    this.location,
    this.area,
    this.minPrice,
    this.maxPrice,
    this.finishing,
    this.userId,
    this.agencyId,
    this.createdAt,
    this.isFavourite,
  });

  Requests.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMe = json['isMe'];
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
    data['isMe'] = this.isMe;
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

class UserId {
  String? sId;
  String? image;
  String? name;

  UserId({this.sId, this.image, this.name});

  UserId.fromJson(Map<String, dynamic> json) {
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
