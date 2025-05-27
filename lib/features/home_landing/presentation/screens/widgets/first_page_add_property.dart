import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_category.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/const.dart';
import '../../../../../core/widgets/custom_drop_down_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'footer.dart';

class FirstPageAddProperty extends StatelessWidget {
  const FirstPageAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    print(addPropertyCubit.isRequest);
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: addPropertyCubit.keys[0],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose your post type', style: getStyle20(context)),
                SizedBox(height: 10.h),
                const PropertyStatus(),
                SizedBox(height: 20.h),
                Text('property category', style: getStyle20(context)),
                SizedBox(height: 10.h),
                const PropertyCategory(),
                Text('city', style: getStyle20(context)),
                const SizedBox(height: 19),
                CustomDropDownButton(
                  value: addPropertyCubit.city,
                  dropDownList: ourCities,
                  callBack: (dynamic newValue) {
                    if (newValue == null) return;
                    addPropertyCubit.city = newValue;
                  },
                  hintText: 'selelct city',
                  title: '',
                ),
                const SizedBox(height: 12),
                Text('location', style: getStyle20(context)),
                const SizedBox(height: 19),
                CustomDropDownButton(
                  value: addPropertyCubit.city,
                  dropDownList: ourCities,
                  callBack: (dynamic newValue) {
                    if (newValue == null) return;
                    addPropertyCubit.city = newValue;
                  },
                  hintText: 'selelct city',
                  title: '',
                ),
                const SizedBox(height: 28),
                const Footer(pageNom: 1),
                const SizedBox(height: 19),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
