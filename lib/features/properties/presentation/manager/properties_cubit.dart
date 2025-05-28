import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/const.dart';

part 'properties_state.dart';

class PropertiesCubit extends Cubit<PropertiesState> {
  PropertiesCubit() : super(PropertiesInitial());
  static PropertiesCubit get(context) =>
      BlocProvider.of<PropertiesCubit>(context);
  String city = ourCities[0];
  String propertyCategory = 'residential';
  String propertyStatus = 'Sell';
  String? finishing;
  String? furnishing;
  TextEditingController price = TextEditingController();
  TextEditingController area = TextEditingController();
}
