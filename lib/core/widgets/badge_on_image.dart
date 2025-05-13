import 'package:flutter/material.dart';

import '../util/fonts.dart';

class BadgeOnImage extends StatelessWidget {
  const BadgeOnImage({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3, bottom: 3),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xABF2E8D9),
      ),
      child: Text(price, style: getStyleBold13(context)),
    );
  }
}
