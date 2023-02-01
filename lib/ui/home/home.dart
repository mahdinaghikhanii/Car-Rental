import 'package:car/common/extension.dart';
import 'package:car/ui/widgets/item_detailcar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                width: context.width,
                height: context.height,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return ItemDetailCarWidgets();
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
