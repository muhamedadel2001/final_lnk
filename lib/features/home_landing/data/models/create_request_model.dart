import 'dart:io';
import 'package:dio/dio.dart';

class CreateRequestModel {
  final String type;
  final String typeOfRequest;
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
  final String maxPrice;
  final String minPrice;
  final String? typeOfPay;
  final String? typeOfRent;
  final List<String> additional;
  final String title;
  final String description;

  CreateRequestModel({
    required this.type,
    required this.typeOfRequest,
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
    required this.maxPrice,
    required this.minPrice,
    this.typeOfPay,
    this.typeOfRent,
    required this.additional,
    required this.title,
    required this.description,
  });

  Future<Map<String, dynamic>> toJson() async => {
    'type': type,
    'typeOfRequest': typeOfRequest,
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
    'maxPrice': maxPrice,
    'minPrice': minPrice,
    if (typeOfPay != null) 'typeOfPay': typeOfPay,
    if (typeOfRent != null) 'typeOfRent': typeOfRent,
    'additional': additional,
    'title': title,
    'description': description,
  };
}
