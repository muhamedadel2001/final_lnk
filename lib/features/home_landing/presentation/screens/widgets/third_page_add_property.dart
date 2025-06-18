import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/titled_custom_text_field.dart';
import 'additional_features.dart';
import 'footer.dart';

class ThirdPageAddProperty extends StatelessWidget {
  const ThirdPageAddProperty({super.key});
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(scrolledUnderElevation: 0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: SingleChildScrollView(
            child: BlocBuilder<HomeLandingCubit, HomeLandingState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LangKeys.additionalFeatures,
                      style: getStyle20(context).copyWith(fontSize: 16.sp),
                    ),
                    const SizedBox(height: 5),
                    AdditionalFeatures(),
                    const SizedBox(height: 33),
                    Text(
                      LangKeys.title,
                      style: getStyle20(context).copyWith(fontSize: 16.sp),
                    ),
                    CustomTextField(
                      controller: titleController,
                      maxLength: 50,
                      maxLines: 2,
                      hintText: LangKeys.titlePlaceHolder,
                    ),
                    const SizedBox(height: 0),
                    Text(
                      LangKeys.description,
                      style: getStyle20(context).copyWith(fontSize: 16.sp),
                    ),
                    CustomTextField(
                      controller: descriptionController,
                      maxLength: 500,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 33),
                    Text(
                      LangKeys.contactInfo,
                      style: getStyle20(context).copyWith(fontSize: 20.sp),
                    ),
                    const SizedBox(height: 14),
                    TitledCustomTextField(
                      title: LangKeys.phoneNumber,
                      controller: phoneController,
                    ),
                    const SizedBox(height: 22),
                    TitledCustomTextField(
                      title: LangKeys.whatsNumber,
                      controller: whatsController,
                    ),
                    const SizedBox(height: 40),
                    Footer(
                      pageNom: 3,
                      callBack: () {
                        Validations.checkThirdCreate(addPropertyCubit, context);
                      },
                    ),
                    const SizedBox(height: 19),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
