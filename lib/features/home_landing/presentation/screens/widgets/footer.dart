import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/primary_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.pageNom, this.title});
  final int pageNom;
  final String? title;
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 66, // Change height and width to adjust the oval shape
            decoration: BoxDecoration(
              color: backgroundClr,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: -5,
                  blurRadius: 10,
                  offset: Offset(-2, 9),
                ),
              ],
            ),
            child: Center(
              child: Text('$pageNom / 4', style: getStyleBold13(context)),
            ),
          ),
          const SizedBox(width: 19),
          Expanded(
            child: PrimaryButton(
              callBack: () {
                pageNom == 1
                    ? Navigator.pushNamed(
                      context,
                      screens.secondAddPropertyScreen,
                      arguments: addPropertyCubit,
                    )
                    : pageNom == 2
                    ? Navigator.pushNamed(
                      context,
                      screens.thirdAddPropertyScreen,
                      arguments: addPropertyCubit,
                    )
                    : pageNom == 3
                    ? Navigator.pushNamed(
                      context,
                      screens.fourthAddPropertyScreen,
                      arguments: addPropertyCubit,
                    )
                    : print('send');
              },
              width: 50,
              text: title ?? 'Next',
            ),
          ),
        ],
      ),
    );
  }
}
