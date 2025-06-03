import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/property_details_item.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          cubit.listsModel!.list.typeOfList != 'commercial'
              ? PropertyDetailsItem(
                imageUrl: 'assets/imgs/property_details_icon/rooms.png',
                nom: cubit.listsModel!.list.rooms!,
                title: LangKeys.rooms,
              )
              : const SizedBox.shrink(),
          cubit.listsModel!.list.typeOfList != 'commercial'
              ? PropertyDetailsItem(
                imageUrl: 'assets/imgs/property_details_icon/bathroom.png',
                nom: cubit.listsModel!.list.bathRooms!,
                title: LangKeys.bathrooms,
              )
              : const SizedBox.shrink(),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/properties_icons/area.png',
            nom: cubit.listsModel!.list.area,
            title: LangKeys.area,
          ),
          PropertyDetailsItem(
            imageUrl: 'assets/imgs/property_details_icon/floor.png',
            nom: cubit.listsModel!.list.floor,
            title: LangKeys.floor,
          ),
          cubit.listsModel!.list.typeOfList != 'commercial'
              ? PropertyDetailsItem(
                imageUrl: 'assets/imgs/property_details_icon/reciption.png',
                nom: cubit.listsModel!.list.reseptionPieces!,
                title: LangKeys.reception,
              )
              : const SizedBox.shrink(),
          cubit.listsModel!.list.typeOfList != 'commercial'
              ? PropertyDetailsItem(
                imageUrl: 'assets/imgs/property_details_icon/balcony.png',
                nom: cubit.listsModel!.list.balcona!,
                title: LangKeys.balcony,
              )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
