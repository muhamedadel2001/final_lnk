class FinishingModel {
  List<Finishings>? finishings;

  FinishingModel({this.finishings});

  FinishingModel.fromJson(Map<String, dynamic> json) {
    if (json['finishings'] != null) {
      finishings = <Finishings>[];
      json['finishings'].forEach((v) {
        finishings!.add(new Finishings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.finishings != null) {
      data['finishings'] = this.finishings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Finishings {
  String? id;
  String? name;

  Finishings({this.id, this.name});

  Finishings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
