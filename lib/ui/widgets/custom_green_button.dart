import '../../common/dimensions.dart';
import '../../common/extension.dart';
import 'package:flutter/material.dart';

class CustomGreenButtonWidgets extends StatelessWidget {
  final String text;
  final Function() ontap;

  const CustomGreenButtonWidgets(
      {super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: context.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.smallBoderRadius),
          ),
        ),
        onPressed: ontap,
        child: Center(
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
