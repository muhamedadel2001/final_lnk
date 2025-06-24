class MyRequestModel {
  int? count;
  List<MyRequests>? requests;

  MyRequestModel({this.count, this.requests});

  MyRequestModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['requests'] != null) {
      requests = <MyRequests>[];
      json['requests'].forEach((v) {
        requests!.add(new MyRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyRequests {
  String? sId;
  String? type;
  String? typeOfRequest;
  String? title;
  Location? location;
  String? area;
  String? minPrice;
  String? maxPrice;
  Location? finishing;
  UserId? userId;
  AgencyId? agencyId;
  String? createdAt;

  MyRequests({
    this.sId,
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
  });

  MyRequests.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
        json['AgencyId'] != null
            ? new AgencyId.fromJson(json['AgencyId'])
            : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
