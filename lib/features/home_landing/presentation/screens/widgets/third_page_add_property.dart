import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/titled_custom_text_field.dart';
import 'additional_features.dart';
import 'footer.dart';

class ThirdPageAddProperty extends StatelessWidget {
  const ThirdPageAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AdditionalFeatures', style: getStyle20(context)),
              const SizedBox(height: 5),
              const AdditionalFeatures(),
              const SizedBox(height: 33),
              Text('Title', style: getStyle20(context)),
              CustomTextField(
                controller: addPropertyCubit.title,
                maxLength: 50,
                maxLines: 2,
                hintText: 'Maximum Characters',
              ),
              const SizedBox(height: 0),
              Text('Property Descriptions', style: getStyle20(context)),
              CustomTextField(
                controller: addPropertyCubit.description,
                maxLength: 500,
                maxLines: 5,
                hintText: 'Maximum Characters',
              ),
              const SizedBox(height: 33),
              Text(
                'Please Enter Your Contact Details Bellow',
                style: getStyle20(context),
              ),
              const SizedBox(height: 14),
              TitledCustomTextField(
                title: ' Mobile Number',
                hintText: 'Enter Your Mobile Number',
                controller: addPropertyCubit.mobileNumber,
              ),
              const SizedBox(height: 22),
              TitledCustomTextField(
                title: 'WhatsApp Number',
                hintText: 'Enter Your WhatsApp Number',
                controller: addPropertyCubit.whatsAppNumber,
              ),
              const SizedBox(height: 40),
              const Footer(pageNom: 3),
              const SizedBox(height: 19),
            ],
          ),
        ),
      ),
    );
  }
}
