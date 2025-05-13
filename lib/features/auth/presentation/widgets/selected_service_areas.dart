/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lnk/core/logic/resp_calc.dart';
import 'package:lnk/core/util/colors.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/core/widgets/custom_chip.dart';
import 'package:lnk/features/auth/manager/register_cubit.dart';
import 'package:lnk/features/auth/manager/select_service_area_cubit.dart';
import 'package:lnk/features/auth/presentation/widgets/areas_dialog.dart';

class SelectedServiceAreas extends StatelessWidget {
  const SelectedServiceAreas({super.key});

  @override
  Widget build(BuildContext context) {
    final regCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, ReqState>(
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
                        builder: (context) => BlocProvider(
                            create: (context) =>
                                SelectServiceAreaCubit(regCubit.areas),
                            child: const AreasDialog()));
                    regCubit.recievingUpdatedData(result);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xffE0E0E0))),
                    child: regCubit.isSelected()
                        ? Container(
                            color: primaryClr,
                            child: Icon(
                              Icons.check,
                              color: backgroundClr,
                              size: 25,
                            ),
                          )
                        : Container(),
                  ),
                ),
                SizedBox(width: RespCalc().widthRatio(16)),
                Text(
                  'Select Service Areas',
                  style: style20,
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                children: regCubit.areas.keys.map((e) {
                  return regCubit.areas[e]!
                      ? CustomChip(label: e, deleteCallBack: () {})
                      : const SizedBox(height: 0, width: 0);
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
*/
/* regCubit.areas.keys.map((e) {
                    return regCubit.areas[e]!
                        ? CustomChip(label: e, deleteCallBack: () {})
                        : Container();
                  }).toList(),*/
