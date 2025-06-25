class OneSubAccountModel {
  SubAccountData? subAccountData;
  List<SubAccountActivity>? subAccountActivity;

  OneSubAccountModel({this.subAccountData, this.subAccountActivity});

  OneSubAccountModel.fromJson(Map<String, dynamic> json) {
    subAccountData =
        json['subAccountData'] != null
            ? new SubAccountData.fromJson(json['subAccountData'])
            : null;
    if (json['SubAccountActivity'] != null) {
      subAccountActivity = <SubAccountActivity>[];
      json['SubAccountActivity'].forEach((v) {
        subAccountActivity!.add(new SubAccountActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subAccountData != null) {
      data['subAccountData'] = this.subAccountData!.toJson();
    }
    if (this.subAccountActivity != null) {
      data['SubAccountActivity'] =
          this.subAccountActivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubAccountData {
  String? sId;
  String? phone;
  String? image;
  String? name;
  String? email;
  String? title;

  SubAccountData({
    this.sId,
    this.image,
    this.name,
    this.email,
    this.title,
    this.phone,
  });

  SubAccountData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['title'] = this.title;
    return data;
  }
}

class SubAccountActivity {
  String? sId;
  bool? isList;
  String? subAccountId;
  String? activityId;
  String? activiteModel;
  String? text;
  String? date;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SubAccountActivity({
    this.sId,
    this.isList,
    this.subAccountId,
    this.activityId,
    this.activiteModel,
    this.text,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  SubAccountActivity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isList = json['isList'];
    subAccountId = json['subAccountId'];
    activityId = json['activityId'];
    activiteModel = json['activiteModel'];
    text = json['text'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isList'] = this.isList;
    data['subAccountId'] = this.subAccountId;
    data['activityId'] = this.activityId;
    data['activiteModel'] = this.activiteModel;
    data['text'] = this.text;
    data['date'] = this.date;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
