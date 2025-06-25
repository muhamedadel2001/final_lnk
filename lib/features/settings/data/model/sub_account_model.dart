class SubAccountModel {
  List<SubAccounts>? subAccounts;

  SubAccountModel({this.subAccounts});

  SubAccountModel.fromJson(Map<String, dynamic> json) {
    if (json['subAccounts'] != null) {
      subAccounts = <SubAccounts>[];
      json['subAccounts'].forEach((v) {
        subAccounts!.add(new SubAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subAccounts != null) {
      data['subAccounts'] = this.subAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubAccounts {
  String? sId;
  String? image;
  String? name;
  String? email;

  SubAccounts({this.sId, this.image, this.name, this.email});

  SubAccounts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
