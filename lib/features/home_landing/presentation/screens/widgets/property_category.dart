import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_types_gird_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/lang_keys.dart';
import 'option_box.dart';

class PropertyCategory extends StatefulWidget {
  const PropertyCategory({super.key});

  @override
  State<PropertyCategory> createState() => _PropertyCategoryState();
}

class _PropertyCategoryState extends State<PropertyCategory> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            GestureDetector(
              onTap: () {
                addPropertyCubit.changePropertyCategory(LangKeys.residential);
                addPropertyCubit.selectedPropertyTypesList = addPropertyCubit
                    .appModel
                    .apartmentsModel!
                    .residentialApartments
                    .sublist(0, 5);
                addPropertyCubit.propertyType =
                    addPropertyCubit.selectedPropertyTypesList[0].id;
                addPropertyCubit.isShowingAllPropertyTypes = false;
              },
              child: OptionBox(title: LangKeys.residential),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                addPropertyCubit.changePropertyCategory(LangKeys.commercial);
                addPropertyCubit.selectedPropertyTypesList = addPropertyCubit
                    .appModel
                    .apartmentsModel!
                    .commercialApartments
                    .sublist(0, 5);
                addPropertyCubit.propertyType =
                    addPropertyCubit.selectedPropertyTypesList[0].id;
                addPropertyCubit.isShowingAllPropertyTypes = false;
              },
              child: OptionBox(title: LangKeys.commercial),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                addPropertyCubit.changePropertyCategory(LangKeys.coastal);
                addPropertyCubit.selectedPropertyTypesList = addPropertyCubit
                    .appModel
                    .apartmentsModel!
                    .residentialApartments
                    .sublist(0, 5);
                addPropertyCubit.propertyType =
                    addPropertyCubit.selectedPropertyTypesList[0].id;
                addPropertyCubit.isShowingAllPropertyTypes = false;
              },
              child: OptionBox(title: LangKeys.coastal),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        PropertyTypesGirdView(),
        SizedBox(height: 10.h),
      ],
    );
  }
}
