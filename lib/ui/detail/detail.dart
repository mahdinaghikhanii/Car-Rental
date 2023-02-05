import 'package:car/common/dimensions.dart';
import 'package:car/common/images.dart';
import 'package:car/theme/light_theme.dart';
import 'package:car/ui/widgets/box_car_power.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.mediumPadding),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "911",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                        iconSize: 25,
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_outline))
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Toyota",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 15, color: LightThemeColors.subTitlteTextColor),
                ),
                const SizedBox(height: 20),
                Image.asset(Images.porsche911),
                const SizedBox(height: 40),
                Text(
                  "Specifications",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoxCarPowerWidgets(
                      icon: Images.iconMaxPower,
                      subtitle: '320 hp',
                      title: 'Max Power',
                    ),
                    BoxCarPowerWidgets(
                      icon: Images.iconPertol,
                      subtitle: '550 km',
                      title: 'Fuel',
                    ),
                    BoxCarPowerWidgets(
                      icon: Images.iconNacceleration,
                      subtitle: '2.6 sec',
                      title: '0-60 mph',
                    ),
                    BoxCarPowerWidgets(
                      icon: Images.iconSpeed,
                      subtitle: '177 mph',
                      title: 'Max Speed',
                    )
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  "Car Features",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
