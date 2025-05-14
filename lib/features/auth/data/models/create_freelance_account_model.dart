class CreateFreelancAccountModel {
  final String name;
  final String typeOfUser;
  final String email;
  final String phone;
  final String? password;
  final String? city;
  final List<String>? locations;
  CreateFreelancAccountModel({
    required this.typeOfUser,
    required this.password,
    required this.locations,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
  });
  Future<Map<String, dynamic>> toJson() async => {
    'name': name,
    'email': email,
    'phone': phone,
    'city': city,
    'typeOfUser': typeOfUser,
    'password': password,
    'locations': locations,
  };
}
