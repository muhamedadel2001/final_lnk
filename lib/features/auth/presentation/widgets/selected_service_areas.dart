import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/widgets/custom_chip.dart';
import 'areas_dialog.dart';

class SelectedServiceAreas extends StatelessWidget {
  const SelectedServiceAreas({super.key});

  @override
  Widget build(BuildContext context) {
    final regCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final result = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder:
                          (context) => BlocProvider.value(
                            value: regCubit,
                            child: AreasDialog(),
                          ),
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xffE0E0E0),
                      ),
                    ),
                    child: Container(
                      color: primaryClr,
                      child:
                          regCubit.userSelection.serviceAreaId == null ||
                                  regCubit.userSelection.serviceAreaId!.isEmpty
                              ? SizedBox.shrink()
                              : Icon(
                                Icons.check,
                                color: backgroundClr,
                                size: 25,
                              ),
                    ),
                  ),
                ),
                SizedBox(width: RespCalc().widthRatio(16)),
                Text('Select Service Areas', style: getStyle20(context)),
              ],
            ),
          ],
        );
      },
    );
  }
}
