import 'package:car/common/dimensions.dart';
import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';
import 'package:car/theme/light_theme.dart';
import 'package:car/ui/widgets/infromation_about_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDetailCarWidgets extends StatelessWidget {
  const ItemDetailCarWidgets({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/img/porshe4.png",
              width: 270,
              height: 113,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.smallPadding,
                horizontal: Dimensions.smallPadding),
            child: Text(
              "CAIN",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              SizedBox(width: Dimensions.smallPadding),
              InformationAboutCarWidgets(
                  title: "A/T", iconAddres: Images.iconGearbox),
              InformationAboutCarWidgets(
                  title: "5", iconAddres: Images.iconUserAccount),
              InformationAboutCarWidgets(
                  title: "4", iconAddres: Images.iconDoor),
              InformationAboutCarWidgets(
                  title: "A/C", iconAddres: Images.iconSun)
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
                            padding:
                                EdgeInsets.only(right: Dimensions.smallPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Day/",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$250",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
    );
  }
}
