/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lnk/core/util/colors.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/features/auth/manager/select_service_area_cubit.dart';

class AreasDialog extends StatelessWidget {
  const AreasDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SelectServiceAreaCubit>(context);
    return AlertDialog(
      
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select Service Areas',
              style: style20,
              textAlign: TextAlign.left,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context, cubit.areas),
              child: const Icon(Icons.close),
            ),
          ],
        ),
        content: BlocBuilder<SelectServiceAreaCubit, Map<String, bool>>(
          builder: (context, selectedAreas) {
            return Wrap(
              children: selectedAreas.keys.map((area) {
                final isSelected = selectedAreas[area]!;
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.selectArea(area);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          clipBehavior: Clip.hardEdge,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff7B7B7B), // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: isSelected
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: primaryClr,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                      Text(' $area', style: style13),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
*/
