/*
import 'package:flutter/material.dart';
import 'package:lnk/core/logic/resp_calc.dart';
import 'package:lnk/core/util/colors.dart';
import 'package:lnk/core/util/const.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/core/util/screens.dart';
import 'package:lnk/core/widgets/primary_button.dart';
import 'package:lnk/generated/l10n.dart';

class SelectAccountTypeScreen extends StatelessWidget {
  const SelectAccountTypeScreen({super.key});
  final bool s = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(kLogo),
            SizedBox(height: RespCalc().heightRatio(30)),
            Text(S.of(context).select_your_account_type, style: style20),
            SizedBox(height: RespCalc().heightRatio(30)),
            Text(
              S.of(context).select_role_description,
              style: style16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: RespCalc().heightRatio(96)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: s,
                  onChanged: (val) {},
                  side: BorderSide(color: neutralClr2),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Agency', style: style20),
                      Text('For businesses and real estate agencies',
                          style: style16),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: RespCalc().heightRatio(42)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: s,
                  onChanged: (val) {},
                  side: BorderSide(color: neutralClr2),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Freelance Agent', style: style20),
                      Text('For independent real estate agents', style: style16),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            PrimaryButton(callBack: () {
              Navigator.of(context).pushNamed(kFreeLancerRegister);
            }, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
*/
