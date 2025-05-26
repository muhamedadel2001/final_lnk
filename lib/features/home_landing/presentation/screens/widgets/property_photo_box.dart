import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/util/colors.dart';

class PropertyPhotoBox extends StatelessWidget {
  const PropertyPhotoBox({
    super.key,
    required this.imageXfile,
    required this.deleteAction,
  });
  final XFile imageXfile;
  final void Function() deleteAction;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            File(imageXfile.path),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              deleteAction();
            },
            child: Container(
              width: 30,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: primaryClr,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: backgroundClr),
            ),
          ),
        ),
      ],
    );
  }
}
