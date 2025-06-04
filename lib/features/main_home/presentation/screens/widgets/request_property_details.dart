import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/fonts.dart';
import '../../../../../core/util/lang_keys.dart';

class RequestPropertyDetails extends StatelessWidget {
  const RequestPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
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
                  cubit.requestModel!.request.typeOfRequest,
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
                  cubit.requestModel!.request.type,
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
                  cubit.requestModel!.request.area,
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
                  '${LangKeys.floor}:',
                  style: getStyleBold16(context),
                ),
              ),
              Flexible(
                child: Text(
                  cubit.requestModel!.request.floor,
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          cubit.requestModel!.request.typeOfRequest != 'تجاري' &&
                  cubit.requestModel!.request.typeOfRequest != 'commercial'
              ? Column(
                children: [
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
                          cubit.requestModel!.request.rooms!,
                          style: getStyleBold16(
                            context,
                          ).copyWith(color: textSecondaryClr),
                        ),
                      ),
                    ],
                  ),

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
                          cubit.requestModel!.request.bathRooms!,
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
                          '${LangKeys.reception}:',
                          style: getStyleBold16(context),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          cubit.requestModel!.request.reseptionPieces!,
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
                          '${LangKeys.balcony}:',
                          style: getStyleBold16(context),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          cubit.requestModel!.request.balcona!,
                          style: getStyleBold16(
                            context,
                          ).copyWith(color: textSecondaryClr),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                ],
              )
              : const SizedBox.shrink(),

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
                  cubit.requestModel!.request.finishing.name!,
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
                  cubit.requestModel!.request.furnising.name!,
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
