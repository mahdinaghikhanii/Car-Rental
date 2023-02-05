// ignore_for_file: must_be_immutable
import 'package:car/common/dimensions.dart';
import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';

import 'package:car/theme/light_theme.dart';
import 'package:car/ui/widgets/infromation_about_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDetailCarWidgets extends StatelessWidget {
  final Function() ontap;
  final String imgAddres;
  final String carname;
  final String girbox;
  final String userAccount;
  final String door;
  final String sun;
  final String instantConfirmation;
  final String mony;
  final String coupmpany;

  const ItemDetailCarWidgets(
      {super.key,
      required this.imgAddres,
      required this.carname,
      required this.girbox,
      required this.userAccount,
      required this.door,
      required this.sun,
      required this.instantConfirmation,
      required this.mony,
      required this.coupmpany,
      required this.ontap});

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
                imgAddres,
                width: 270,
                height: 113,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.smallPadding,
                  horizontal: Dimensions.smallPadding),
              child: Text(
                carname,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              children: [
                SizedBox(width: Dimensions.smallPadding),
                InformationAboutCarWidgets(
                    title: girbox, iconAddres: Images.iconGearbox),
                InformationAboutCarWidgets(
                    title: userAccount, iconAddres: Images.iconUserAccount),
                InformationAboutCarWidgets(
                    title: door, iconAddres: Images.iconDoor),
                InformationAboutCarWidgets(
                    title: sun, iconAddres: Images.iconSun)
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
                                    mony,
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
