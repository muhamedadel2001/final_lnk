import 'package:flutter/material.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({super.key, required this.width, required this.imageUrl});
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 4),
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(imageUrl, width: width, fit: BoxFit.cover),
    );
  }
}
