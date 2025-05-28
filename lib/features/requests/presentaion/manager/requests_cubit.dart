import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart' show TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/const.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());
  static RequestsCubit get(context) => BlocProvider.of<RequestsCubit>(context);
  String city = ourCities[0];
  String propertyCategory = 'residential';
  String propertyStatus = 'Sell';
  String? finishing;
  String? furnishing;
  TextEditingController price = TextEditingController();
  TextEditingController area = TextEditingController();
}
