// ignore_for_file: must_be_immutable
import 'package:car/common/dimensions.dart';
import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';
import 'package:car/data/entity/car_entity.dart';

import 'package:car/theme/light_theme.dart';
import 'package:car/ui/widgets/infromation_about_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDetailCarWidgets extends StatelessWidget {
  final CarEntity carEntity;
  final Function()? ontap;
  const ItemDetailCarWidgets(
      {super.key, required this.carEntity, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.mediumPadding, vertical: 10),
      height: 260,
      width: context.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border:
              Border.all(color: LightThemeColors.borderRadiusColor, width: 2),
          borderRadius: BorderRadius.circular(Dimensions.mediumBorderRadius)),
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                carEntity.image,
                width: 270,
                height: 113,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.smallPadding,
                  horizontal: Dimensions.smallPadding),
              child: Text(
                carEntity.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              children: [
                SizedBox(width: Dimensions.smallPadding),
                InformationAboutCarWidgets(
                    title: carEntity.girbox, iconAddres: Images.iconGearbox),
                InformationAboutCarWidgets(
                    title: carEntity.userAccount,
                    iconAddres: Images.iconUserAccount),
                InformationAboutCarWidgets(
                    title: carEntity.door, iconAddres: Images.iconDoor),
                InformationAboutCarWidgets(
                    title: carEntity.sun, iconAddres: Images.iconSun)
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            const Divider(
              color: LightThemeColors.borderRadiusColor,
              height: 0,
              thickness: 2,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.only(
                        bottomRight:
                            Radius.circular(Dimensions.mediumBorderRadius),
                        bottomLeft:
                            Radius.circular(Dimensions.mediumBorderRadius))),
                width: context.width,
                height: 71,
                child: Stack(
                  children: [
                    Positioned(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: Dimensions.smallPadding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Day",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    carEntity.money,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.smallPadding, right: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset(Images.iconDone),
                                const SizedBox(width: 8),
                                Text(
                                  "Instant confirmation",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            )),
                        const SizedBox(height: 13),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.smallPadding, right: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset(Images.iconDone),
                                const SizedBox(width: 8),
                                Text(
                                  "Free cancelation",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
