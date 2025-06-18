import 'dart:io';
import 'package:dio/dio.dart';

class CreatePropertyModel {
  final String type;
  final String typeOfList;
  final String apartment;
  final String city;
  final String location;
  final String floor;
  final String area;
  final String? rooms;
  final String? bathRooms;
  final String? balcona;
  final String? reseptionPieces;
  final String finishing;
  final String furnising;
  final String price;
  final String? typeOfPay;
  final String? downpayment;
  final String? years;
  final String? typeOfRent;
  final String? insurance;
  final List<String> additional;
  final String title;
  final String description;
  final String whatsApp;
  final String phoneNumber;
  final List<dynamic>? images;
  CreatePropertyModel({
    required this.type,
    required this.typeOfList,
    required this.apartment,
    required this.city,
    required this.location,
    required this.floor,
    required this.area,
    this.rooms,
    this.bathRooms,
    this.balcona,
    this.reseptionPieces,
    required this.finishing,
    required this.furnising,
    required this.price,
    this.typeOfPay,
    this.downpayment,
    this.years,
    this.typeOfRent,
    this.insurance,
    required this.additional,
    required this.title,
    required this.description,
    required this.whatsApp,
    required this.phoneNumber,
    this.images,
  });

  Future<Map<String, dynamic>> toJson() async => {
    'type': type,
    'typeOfList': typeOfList,
    'apartment': apartment,
    'city': city,
    'location': location,
    'floor': floor,
    'area': area,
    if (rooms != null) 'rooms': rooms,
    if (bathRooms != null) 'bathRooms': bathRooms,
    if (balcona != null) 'balcona': balcona,
    if (reseptionPieces != null) 'reseptionPieces': reseptionPieces,
    'finishing': finishing,
    'furnising': furnising,
    'price': price,
    if (typeOfPay != null) 'typeOfPay': typeOfPay,
    if (downpayment != null) 'Downpayment': downpayment,
    if (years != null) 'years': years,
    if (typeOfRent != null) 'typeOfRent': typeOfRent,
    if (insurance != null) 'insurance': insurance,
    'additional': additional,
    'title': title,
    'description': description,
    'whatsApp': whatsApp,
    'phoneNumber': phoneNumber,
    if (images != null)
      'images': await Future.wait(
        images!.map(
          (image) async => await MultipartFile.fromFile(
            image,
            filename: image.split('/').last,
          ),
        ),
      ),
  };
}
