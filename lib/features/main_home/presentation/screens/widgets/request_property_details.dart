import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/fonts.dart';
import '../../../../../core/util/lang_keys.dart';

class RequestPropertyDetails extends StatelessWidget {
  const RequestPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.category}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  'residential',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.type}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  'Adminstrivaee building',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.area}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  '130',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.rooms}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  '6',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.bathrooms}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  '4',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.finishingType}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  'Fully Finished',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '${LangKeys.furnishing}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  'unfurnishing',
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
