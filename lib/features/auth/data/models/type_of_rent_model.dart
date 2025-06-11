class TypeOfRentModel {
  List<TypeOfRents>? typeOfRents;

  TypeOfRentModel({this.typeOfRents});

  TypeOfRentModel.fromJson(Map<String, dynamic> json) {
    if (json['typeOfRents'] != null) {
      typeOfRents = <TypeOfRents>[];
      json['typeOfRents'].forEach((v) {
        typeOfRents!.add(new TypeOfRents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.typeOfRents != null) {
      data['typeOfRents'] = this.typeOfRents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TypeOfRents {
  String? id;
  String? name;

  TypeOfRents({this.id, this.name});

  TypeOfRents.fromJson(Map<String, dynamic> json) {
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
