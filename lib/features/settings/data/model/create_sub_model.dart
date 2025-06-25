class CreateSubModel {
  late String name;
  late String email;
  late String phone;
  CreateSubModel({
    required this.name,
    required this.email,
    required this.phone,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
