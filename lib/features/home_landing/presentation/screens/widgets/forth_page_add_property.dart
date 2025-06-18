import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/data/models/create_property_model.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_photo_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';
import 'footer.dart';

class ForthPageAddProperty extends StatefulWidget {
  const ForthPageAddProperty({super.key});

  @override
  State<ForthPageAddProperty> createState() => _ForthPageAddPropertyState();
}

class _ForthPageAddPropertyState extends State<ForthPageAddProperty> {
  late HomeLandingCubit cubit;
  @override
  void initState() {
    cubit = HomeLandingCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BlocBuilder<HomeLandingCubit, HomeLandingState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LangKeys.addPhotos, style: getStyle20(context)),
                const SizedBox(height: 25),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 19,
                          childAspectRatio: 1,
                        ),
                    itemCount: addPropertyCubit.imageFiles.length + 1,
                    itemBuilder: (context, index) {
                      List<XFile> imageFiles = addPropertyCubit.imageFiles;
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () async {
                            await addPropertyCubit.pickImages(context);
                            cubit.changeValue();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: textPrimaryClr,
                              ),
                            ),
                          ),
                        );
                      }
                      return PropertyPhotoBox(
                        imageXfile: imageFiles[index - 1],
                        deleteAction: () {
                          addPropertyCubit.imageFiles.remove(
                            imageFiles[index - 1],
                          );
                          cubit.changeValue();
                        },
                      );
                    },
                  ),
                ),
                Footer(
                  pageNom: 4,
                  title: LangKeys.next,
                  callBack: () {
                    List selectedImages = [];
                    cubit.imageFiles.map((path) {
                      selectedImages.add(path.path);
                    }).toList();

                    HomeLandingCubit.get(context).createProperty(
                      model: CreatePropertyModel(
                        type: cubit.propertyStatus,
                        typeOfList: cubit.propertyCategory,
                        apartment: cubit.propertyType,
                        city: cubit.userSelection.cityId!,
                        location: cubit.userSelection.areaId!,
                        floor: cubit.userSelection.floorNom!,
                        rooms:
                            cubit.propertyCategory != LangKeys.commercial
                                ? cubit.userSelection.roomsNom
                                : null,
                        bathRooms:
                            cubit.propertyCategory != LangKeys.commercial
                                ? cubit.userSelection.bathroomsNom
                                : null,
                        balcona:
                            cubit.propertyCategory != LangKeys.commercial
                                ? cubit.userSelection.balaconsNom
                                : null,
                        reseptionPieces:
                            cubit.propertyCategory != LangKeys.commercial
                                ? cubit.userSelection.receptionPieces
                                : null,
                        typeOfPay:
                            cubit.propertyStatus == LangKeys.sale
                                ? cubit.payment
                                : null,
                        typeOfRent:
                            cubit.propertyStatus == LangKeys.rent
                                ? cubit.userSelection.typeOfRentId
                                : null,
                        area: areaController.text,
                        finishing: cubit.userSelection.finishingId!,
                        furnising: cubit.userSelection.furnishingId!,
                        price: priceController.text,
                        additional: cubit.userSelection.additionalFeatures!,
                        insurance:
                            cubit.propertyStatus == LangKeys.rent
                                ? insuranceOrDownController.text
                                : null,
                        downpayment:
                            cubit.payment == LangKeys.installments
                                ? insuranceOrDownController.text
                                : null,
                        years:
                            cubit.payment == LangKeys.installments
                                ? cubit.userSelection.installmentYears
                                : null,
                        title: titleController.text,
                        description: descriptionController.text,
                        whatsApp: whatsController.text,
                        phoneNumber: phoneController.text,
                        images: selectedImages,
                      ),
                      context: context,
                    );
                  },
                ),
                const SizedBox(height: 19),
              ],
            );
          },
        ),
      ),
    );
  }
}
