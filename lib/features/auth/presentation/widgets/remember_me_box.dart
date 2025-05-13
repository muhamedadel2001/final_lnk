/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeBox extends StatefulWidget {
  const RememberMeBox({super.key});

  @override
  State<RememberMeBox> createState() => _RememberMeBoxState();
}

class _RememberMeBoxState extends State<RememberMeBox> {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<LoginCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(color: neutralClr),
          tristate: false,
          value: authCubit.rememberMe,
          onChanged: (bool? newValue) {
            authCubit.rememberMe = newValue!;
            setState(() {});
          },
        ),
        Text(
          S.of(context).RememberMe,
          style: style13,
        )
      ],
    );
  }
}
*/
