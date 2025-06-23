import 'package:dio/dio.dart';

class ProfileData {
  final String? userName;
  final String? image; // ده مسار الصورة (file path)
  final String? titleOfUser;
  final String phone;
  final String email;

  ProfileData({
    required this.userName,
    this.image,
    this.titleOfUser,
    required this.phone,
    required this.email,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      userName: json['name'],
      image: json['image'],
      phone: json['phone'],
      email: json['email'],
      titleOfUser: json['titleOfUser'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.userName;
    data['titleOfUser'] = this.titleOfUser;
    data['phone'] = this.phone; // اسم الصورة فقط
    data['email'] = this.email; // اسم الصورة فقط
    data['image'] = this.image; // اسم الصورة فقط
    return data;
  }

  Future<Map<String, dynamic>> toJsonUpdate() async {
    final Map<String, dynamic> data = {};
    data['name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    if (image != null && image != '') {
      print('hi');
      data['image'] = await MultipartFile.fromFile(
        image!,
        filename: image!.split('/').last,
      );
    }
    return data;
  }
}
