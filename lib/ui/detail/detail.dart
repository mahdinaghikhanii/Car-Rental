import 'package:car/common/dimensions.dart';
import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';
import 'package:car/theme/light_theme.dart';
import 'package:car/ui/widgets/box_car_power.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameCarFuture = [
      "2 Passengers",
      "4 Doors",
      "Snow Tires",
      "GPS",
      "Bluetooth",
      "Manual"
    ];
    var iconCarFuture = [
      Images.iconUserAccountGreen,
      Images.iconDoorGreen,
      Images.iconSnowTiers,
      Images.iconGPS,
      Images.iconBluetooth,
      Images.iconManual
    ];
    return Scaffold(
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.mediumPadding),
          width: context.width,
          height: 100,
          color: Colors.black,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pirce",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$250/Day",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                  height: 50,
                  width: 117,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Book Now")))
            ],
          )),
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.mediumPadding),
            physics: defaultScrollPhysics,
            itemCount: 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontSize: 15,
                              color: LightThemeColors.subTitlteTextColor),
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
                    const SizedBox(height: 20),
                  ],
                );
              } else if (index == 1) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: nameCarFuture.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                        child: Row(
                          children: [
                            Image.asset(iconCarFuture[index]),
                            const SizedBox(width: 10),
                            Text(
                              nameCarFuture[index],
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        ),
                      );
                    });
              } else if (index == 2) {
                return const SizedBox(height: 60);
              } else {
                throw "bad state";
              }
            }),
      ),
    );
  }
}
