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
      itemCount: addPropertyCubit.selectedPropertyTypesList.length,
      itemBuilder: (context, index) {
        PropertyTypeModel propertyTypeModel =
            addPropertyCubit.selectedPropertyTypesList[index];
        return GestureDetector(
          onTap: () {
            index == addPropertyCubit.selectedPropertyTypesList.length - 1
                ? addPropertyCubit.viewMoreOrLess()
                : addPropertyCubit.propertyType = propertyTypeModel.title;
            setState(() {});
          },
          child: ProperyTypeBox(
            title: propertyTypeModel.title,
            imageUrl: propertyTypeModel.imageUrl,
          ),
        );
      },
    );
  }
}
