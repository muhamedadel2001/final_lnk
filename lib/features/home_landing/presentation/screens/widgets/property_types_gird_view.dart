import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/propery_type_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/property_model.dart';

class PropertyTypesGirdView extends StatefulWidget {
  const PropertyTypesGirdView({super.key});

  @override
  State<PropertyTypesGirdView> createState() => _PropertyTypesGirdViewState();
}

class _PropertyTypesGirdViewState extends State<PropertyTypesGirdView> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 158 / 72,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: addPropertyCubit.selectedPropertyTypesList.length + 1,
      itemBuilder: (context, index) {
        if (index == addPropertyCubit.selectedPropertyTypesList.length) {
          final isExpanded = addPropertyCubit.isShowingAllPropertyTypes;
          return GestureDetector(
            onTap: () {
              addPropertyCubit.viewMoreOrLess();
              addPropertyCubit.isShowingAllPropertyTypes = !isExpanded;
              addPropertyCubit.propertyType =
                  addPropertyCubit.selectedPropertyTypesList[0].id;
              addPropertyCubit.changeValue();
            },
            child: ProperyTypeBox(
              isApi: false,
              title: isExpanded ? LangKeys.showLess : LangKeys.showMore,
              imageUrl:
                  isExpanded
                      ? 'assets/imgs/add_feature_icons/arrow-circle-up.png'
                      : 'assets/imgs/add_feature_icons/arrow-circle-down.png', // صورة سهم أو أيقونة مناسبة
            ),
          );
        }

        final item = addPropertyCubit.selectedPropertyTypesList[index];

        return GestureDetector(
          onTap: () {
            addPropertyCubit.propertyType = item.id;
            addPropertyCubit.changeValue();
          },
          child: ProperyTypeBox(
            id: item.id,
            title: item.name,
            imageUrl: item.icon,
            isApi: true,
          ),
        );
      },
    );
  }
}
