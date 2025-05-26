/*
import 'dart:math';

import 'package:flutter/material.dart';

class RespCalc {
  double _height = 0;
  double _width = 0;

  RespCalc._privateConstructor();

  static RespCalc? _instance;

  factory RespCalc() {
    _instance ??= RespCalc._privateConstructor();
    return _instance!;
  }

  factory RespCalc.getInstance(BuildContext context) {
    if (_instance == null) {
      _instance = RespCalc._privateConstructor();
      _instance!.initResponsive(context);
    }
    return _instance!;
  }

  void initResponsive(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  double widthRatio(double widgetWidth) {
    return _width * widgetWidth / 360;
  }

  double heightRatio(double widgetHeight) {
    return _height * widgetHeight / 800;
  }

  double minRation(double edge) {
    double wid = _width * edge / 360;
    double hei = _height * edge / 800;
    return min(wid, hei);
  }

  double get getHeight => _height;
  double get getWidth => _width;
}
*/
