import 'package:final_lnk/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingLanguageItem extends StatelessWidget {
  final IconData icon;
  final String language;
  final String value;
  final String flagPath;
  final bool isSelected;
  final void Function()? onTap;
  const SettingLanguageItem({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.language,
    required this.value,
    required this.flagPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? primaryClr.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryClr.withOpacity(0.1) : Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(flagPath, width: 40, height: 40),
            const SizedBox(width: 16),
            Text(
              language,
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            const Spacer(),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? primaryClr : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
