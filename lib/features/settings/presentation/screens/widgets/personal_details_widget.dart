import 'package:final_lnk/core/logic/custom_alerts.dart';
import 'package:final_lnk/core/util/const_controllers.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/core/widgets/custom_text_field.dart';
import 'package:final_lnk/core/widgets/primary_button.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsTab extends StatelessWidget {
  const PersonalDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return Padding(
      padding: EdgeInsets.all(27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          CustomTextField(controller: name, keyboardType: TextInputType.name),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          Spacer(),

          BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) {
              if (state is UpdateLoading && cubit.profileImage != null) {
                CustomAlerts.showMyWaitingSnackBar(
                  context,
                  LangKeys.waitingMessage,
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: PrimaryButton(
                  callBack: () {
                    Validations.checkForUpdate(cubit, context);
                  },
                  text: state is UpdateLoading ? "..." : LangKeys.save,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
