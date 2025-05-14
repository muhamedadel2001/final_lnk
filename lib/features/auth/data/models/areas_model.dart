class AreasModel {
  List<Locations>? locations;

  AreasModel({this.locations});

  AreasModel.fromJson(Map<String, dynamic> json) {
    if (json['Locations'] != null) {
      locations = <Locations>[];
      json['Locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locations != null) {
      data['Locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
  String? sId;
  String? name;

  Locations({this.sId, this.name});

  Locations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
