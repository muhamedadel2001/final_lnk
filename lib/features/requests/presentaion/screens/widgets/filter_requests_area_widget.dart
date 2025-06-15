import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/fonts.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class FilterRequestsAreaWidget extends StatelessWidget {
  final TextEditingController fromAreaController;
  final TextEditingController toAreaController;
  const FilterRequestsAreaWidget({
    super.key,
    required this.fromAreaController,
    required this.toAreaController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.area,
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: fromAreaController,
                hintText: LangKeys.from,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 35.w),
            Expanded(
              child: CustomTextField(
                controller: toAreaController,
                hintText: LangKeys.to,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
