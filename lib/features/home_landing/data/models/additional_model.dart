class AdditionalModel {
  List<Addionals>? additionals;

  AdditionalModel({this.additionals});

  AdditionalModel.fromJson(Map<String, dynamic> json) {
    if (json['Additionals'] != null) {
      additionals = <Addionals>[];
      json['Additionals'].forEach((v) {
        additionals!.add(new Addionals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.additionals != null) {
      data['Additionals'] = this.additionals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addionals {
  String? id;
  String? name;

  Addionals({this.id, this.name});

  Addionals.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
