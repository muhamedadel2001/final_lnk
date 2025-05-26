import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_photo_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/util/colors.dart';
import 'footer.dart';

class ForthPageAddProperty extends StatefulWidget {
  const ForthPageAddProperty({super.key});

  @override
  State<ForthPageAddProperty> createState() => _ForthPageAddPropertyState();
}

class _ForthPageAddPropertyState extends State<ForthPageAddProperty> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<HomeLandingCubit>(context).titleButton = 'Next';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add photos', style: getStyle20(context)),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        await addPropertyCubit.pickImages();
                        setState(() {});
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
                      addPropertyCubit.imageFiles.remove(imageFiles[index - 1]);
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            Footer(pageNom: 4, title: addPropertyCubit.titleButton),
          ],
        ),
      ),
    );
  }
}
