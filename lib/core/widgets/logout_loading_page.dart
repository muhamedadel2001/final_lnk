import 'package:flutter/material.dart';

import '../logic/resp_calc.dart';
import '../util/colors.dart';

class LogoutLoadingPage extends StatelessWidget {
  const LogoutLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: Center(
        child: SizedBox(
          width: RespCalc().minRation(100),
          height: RespCalc().minRation(100),
          child: CircularProgressIndicator(
            color: primaryClr,
          ),
        ),
      ),
    );
  }
}
