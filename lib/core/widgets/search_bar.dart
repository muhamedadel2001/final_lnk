import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/fonts.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({
    super.key,
    this.style,
    required this.controller,
    this.keyboardType,
    required this.onChange,
  });

  final TextStyle? style;

  final void Function(String text) onChange;

  final TextEditingController controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      style: getStyle16(context).copyWith(color: textSecondaryClr),
      enableSuggestions: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintStyle: getStyle13(context).copyWith(color: neutralClr2),
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search, color: Color(0xff9F9F9F)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChange,
    );
  }
}
