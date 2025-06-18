import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addition_item.dart';

class AdditionalFeatures extends StatefulWidget {
  const AdditionalFeatures({super.key});

  @override
  State<AdditionalFeatures> createState() => _AdditionalFeaturesState();
}

class _AdditionalFeaturesState extends State<AdditionalFeatures> {
  late List<String> additionalFeaturesTitles;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          addPropertyCubit.appModel.additionalModel!.additionals!.map((e) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: GestureDetector(
                onTap: () {
                  !addPropertyCubit.userSelection.additionalFeatures!.contains(
                        e.id,
                      )
                      ? addPropertyCubit.userSelection.additionalFeatures!.add(
                        e.id!,
                      )
                      : addPropertyCubit.userSelection.additionalFeatures!
                          .remove(e.id);
                  addPropertyCubit.changeValue();
                },
                child: AdditionItem(
                  title: e.name!,
                  isSelected: addPropertyCubit.userSelection.additionalFeatures!
                      .contains(e.id),
                ),
              ),
            );
          }).toList(),
    );
  }
}
