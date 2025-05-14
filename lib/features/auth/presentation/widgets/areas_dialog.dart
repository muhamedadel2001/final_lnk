import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/get_inputs_list.dart';
import '../../../../core/util/colors.dart';

class AreasDialog extends StatefulWidget {
  const AreasDialog({super.key});
  @override
  State<AreasDialog> createState() => _AreasDialogState();
}

class _AreasDialogState extends State<AreasDialog> {
  List<String> selectedAreas = [];
  List<String> selectedAreasId = [];

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<AuthCubit>(context, listen: false);
    selectedAreas = List<String>.from(cubit.userSelection.serviceArea ?? []);
    selectedAreasId = List<String>.from(
      cubit.userSelection.serviceAreaId ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    final areaNames = GetLists.getAreasNames(cubit.appModel).cast<String>();
    final areaIds = GetLists.getAreasId(cubit.appModel).cast<String>();

    final Map<String, String> areaMap = {
      for (int i = 0; i < areaNames.length; i++) areaNames[i]: areaIds[i],
    };

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select Service Areas',
            style: getStyle20(context),
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              areaMap.entries.map((entry) {
                final area = entry.key;
                final id = entry.value;
                final isSelected = selectedAreas.contains(area);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedAreas.remove(area);
                        selectedAreasId.remove(id);
                      } else {
                        selectedAreas.add(area);
                        selectedAreasId.add(id);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryClr : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryClr),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                          child:
                              isSelected
                                  ? Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  )
                                  : null,
                        ),
                        Text(area, style: getStyle13(context)),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            cubit.selectServiceAreas(
              names: selectedAreas,
              ids: selectedAreasId,
            );
            print(cubit.userSelection.serviceAreaId);
            Navigator.pop(context);
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}
