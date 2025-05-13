/*
import 'package:flutter/material.dart';
import 'package:lnk/core/logic/resp_calc.dart';
import 'package:lnk/core/util/colors.dart';
import 'package:lnk/core/util/const.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/core/widgets/primary_button.dart';
import 'package:lnk/core/widgets/titled_custom_drop_down_button.dart';
import 'package:lnk/features/auth/presentation/widgets/bottom_app_bar.dart';
import 'package:lnk/core/widgets/titled_custom_text_field.dart';
import 'package:lnk/features/auth/presentation/widgets/selected_service_areas.dart';
import 'package:lnk/generated/l10n.dart';

import '../../../../core/util/screens.dart';

class RegisterFreelancerScreen extends StatelessWidget {
  const RegisterFreelancerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        centerTitle: true,
        title: Text('Create Your Account', style: style25),
        bottom: const BottomAppBarr(title: 'Freelancer', widgetHeight: 15),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitledCustomTextField(
                  title: S.of(context).full_name,
                  controller: TextEditingController()),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                  title: S.of(context).email,
                  controller: TextEditingController()),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                  title: S.of(context).PhoneNom,
                  controller: TextEditingController()),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomTextField(
                  title: S.of(context).Password,
                  controller: TextEditingController()),
              SizedBox(height: RespCalc().heightRatio(18)),
              TitledCustomDropDownButton(
                  title: 'City',
                  callBack: (String? val) {},
                  dropDownList: cities,
                  hintText: 'Select any of the following'),
              SizedBox(height: RespCalc().heightRatio(35)),
              const SelectedServiceAreas(),
              SizedBox(height: RespCalc().heightRatio(18)),
              PrimaryButton(callBack: () {  Navigator.of(context).pushNamed(kOtp,arguments: {'isReg':true});}, text: 'Continue'),
              SizedBox(height: RespCalc().heightRatio(35)),
            ],
          ),
        ),
      ),
    );
  }
}
*/
