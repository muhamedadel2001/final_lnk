class UserModel {
  String? id;
  late String typeofUser;
  late String name;
  late String email;
  late String phone;
  late String password;
  late String city;
  late String address;
  late List places;
  late bool? approved;
  late bool? activated;
  late int? credits;
  late int? otp;
  late int? received;
  UserModel({
    required this.typeofUser,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.city,
    required this.address,
    required this.places,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    typeofUser = json['typeofUser'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    password = json['password'] ?? '';
    city = json['city'] ?? '';
    address = json['address'] ?? '';
    places = json['place'] ?? [];
    approved = json['approve'] ?? false;
    activated = json['activation'] ?? false;
    credits = json['credits'] ?? 0;
    otp = json['otp'] ?? 0;
    received = json['received'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeofUser'] = typeofUser;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['city'] = city;
    data['address'] = address;
    data['place'] = places;
    return data;
  }
}
