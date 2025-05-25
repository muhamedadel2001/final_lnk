import 'package:flutter/material.dart';

import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/property_details_item.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/property_details_icon/rooms.png',
            nom: 3,
            title: LangKeys.rooms,
          ),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/property_details_icon/bathroom.png',
            nom: 2,
            title: LangKeys.bathrooms,
          ),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/properties_icons/area.png',
            nom: 200,
            title: LangKeys.area,
          ),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/property_details_icon/floor.png',
            nom: 5,
            title: LangKeys.floor,
          ),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/property_details_icon/reciption.png',
            nom: 3,
            title: LangKeys.reception,
          ),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/property_details_icon/balcony.png',
            nom: 2,
            title: LangKeys.balcony,
          ),
        ],
      ),
    );
  }
}
