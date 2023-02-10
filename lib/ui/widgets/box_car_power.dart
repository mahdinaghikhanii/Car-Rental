import '../../common/dimensions.dart';

import 'package:flutter/material.dart';

class BoxCarPowerWidgets extends StatelessWidget {
  final String title;
  final String icon;
  final String subtitle;
  const BoxCarPowerWidgets(
      {super.key,
      required this.title,
      required this.icon,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: 76,
      height: 76,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.smallBoderRadius),
          border: Border.all(color: Theme.of(context).cardColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Image.asset(
            icon,
            width: 16,
            height: 16,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
          ),
          Text(
            subtitle,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 10),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
