import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';

import 'package:car/ui/widgets/item_detailcar.dart';
import 'package:flutter/material.dart';

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
                  borderRadius: BorderRadius.circular(10), // <-- Radius
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
      body: Column(
        children: [
          //        const SizedBox(height: 10),
          SizedBox(
            width: context.width,
            height: context.height,
            child: SafeArea(
              child: ListView.builder(
                  shrinkWrap: true,
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
                  })),
            ),
          )
        ],
      ),
    );
  }
}
