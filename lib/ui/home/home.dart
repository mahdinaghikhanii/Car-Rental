import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';

import 'package:car/ui/widgets/item_detailcar.dart';
import 'package:flutter/material.dart';

import '../../common/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 94,
        height: 46,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.smallBoderRadius),
                ),
                backgroundColor: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Images.iconFilter),
                Text(
                  "Filter",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(),
                )
              ],
            )),
      ),
      body: SafeArea(
          child: ListView.builder(
              physics: defaultScrollPhysics,
              itemCount: 6,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return Container(
                      width: context.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(
                              Dimensions.smallBoderRadius)),
                      margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.mediumPadding),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.mediumPadding),
                      child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            label: Row(
                              children: [
                                Text("Search",
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                Text("(ex, Opel Astra H)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface
                                                .withOpacity(0.5))),
                                const Spacer(),
                                Image.asset(
                                  Images.iconSearch,
                                  width: 27,
                                )
                              ],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.smallBoderRadius),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surface
                                      .withOpacity(0.2)),
                            ),
                            border: InputBorder.none,
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                          )));
                } else if (index == 1) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: ((context, index) {
                        return ItemDetailCarWidgets(
                          coupmpany: "Porsche",
                          door: '4',
                          girbox: 'A/T',
                          instantConfirmation: '',
                          carname: '911',
                          imgAddres: Images.porsche911,
                          userAccount: '4',
                          mony: "\$300",
                          sun: 'A/C',
                        );
                      }));
                } else {
                  throw "bad state";
                }
              }))),
    );
  }
}
