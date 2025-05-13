import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.callBack,
    required this.buttonText,
    required this.buttonClr,
  });
  final String title;
  final String imageUrl;
  final void Function() callBack;
  final String buttonText;
  final Color buttonClr;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
          const Spacer(),
        ],
      ),
      title: Text(title, style: getStyleBold16(context)),
      actions: [
        Row(
          children: [
            const SizedBox(width: 25),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  backgroundColor: buttonClr,
                ),
                child: Text(
                  buttonText,
                  style: getStyleBold13(context).copyWith(color: backgroundClr),
                ),
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
      ],
      content: Image.asset(imageUrl, height: 100),
    );
  }
}
