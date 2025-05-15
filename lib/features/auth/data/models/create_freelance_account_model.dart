class CreateFreelancAccountModel {
  final String name;
  final String typeOfUser;
  final String email;
  final String phone;
  final String? password;
  final String? city;
  final String? address;
  final List<String>? locations;
  CreateFreelancAccountModel(
     {
    required this.typeOfUser,
     this.address,
    required this.password,
    required this.locations,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
  });
  Future<Map<String, dynamic>> toJson() async => {
    'name': name,
    'address': address,
    'email': email,
    'phone': phone,
    'city': city,
    'typeOfUser': typeOfUser,
    'password': password,
    'locations': locations,
  };
}
