import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/lang_keys.dart';
import 'installment_options.dart';
import 'option_box.dart';

class PaymentOptions extends StatefulWidget {
  final TextEditingController? insuranceOrDownController;

  const PaymentOptions({super.key, this.insuranceOrDownController});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addPropertyCubit.changePaymentMethod(LangKeys.cash);
                },
                child: OptionBox(title: LangKeys.cash),
              ),
            ),
            const SizedBox(width: 26),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addPropertyCubit.changePaymentMethod(LangKeys.installments);
                },
                child: OptionBox(title: LangKeys.installments),
              ),
            ),
          ],
        ),
        addPropertyCubit.payment == LangKeys.installments
            ? addPropertyCubit.isRequest
                ? const SizedBox.shrink()
                : InstallmentOptions(
                  insuranceOrDownController: widget.insuranceOrDownController,
                )
            : const SizedBox.shrink(),
      ],
    );
  }
}
