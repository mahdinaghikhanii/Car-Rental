import 'package:flutter/material.dart';

class InformationAboutCarWidgets extends StatelessWidget {
  final String title;
  final String iconAddres;

  const InformationAboutCarWidgets(
      {super.key, required this.title, required this.iconAddres});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconAddres,
          width: 18,
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
