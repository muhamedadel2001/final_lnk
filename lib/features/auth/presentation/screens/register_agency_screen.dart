import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/titled_custom_drop_down_button.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';
import '../widgets/bottom_app_bar.dart';

class RegisterAgencyScreen extends StatelessWidget {
  const RegisterAgencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        centerTitle: true,
        title: Text(LangKeys.createAcc, style: getStyle25(context)),
        bottom: BottomAppBarr(title: LangKeys.agency, widgetHeight: 15),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitledCustomTextField(
                title: LangKeys.agencyName,
                controller: TextEditingController(),
              ),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                title: LangKeys.email,
                controller: TextEditingController(),
              ),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                title: LangKeys.phoneNumber,
                controller: TextEditingController(),
              ),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                title: LangKeys.password,
                controller: TextEditingController(),
              ),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                title: LangKeys.password,
                controller: TextEditingController(),
              ),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomDropDownButton(
                value: '',
                title: LangKeys.city,
                callBack: (val) {},
                dropDownList: [],
                hintText: 'Select any of the following ',
              ),
              SizedBox(height: RespCalc().heightRatio(35)),
              // const SelectedServiceAreas(),
              SizedBox(height: RespCalc().heightRatio(18)),
              PrimaryButton(callBack: () {}, text: 'Continue'),
              SizedBox(height: RespCalc().heightRatio(50)),
            ],
          ),
        ),
      ),
    );
  }
}
