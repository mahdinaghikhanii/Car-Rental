import 'package:car/common/dimensions.dart';
import 'package:car/generated/l10n.dart';
import 'package:car/ui/widgets/custom_green_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.mediumPadding),
          child: CustomGreenButtonWidgets(
              text: S.of(context).verify, ontap: () {})),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          S.of(context).verify_phone_number,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          Text(S.of(context).we_sent_on_ur_phone_a_verifaction_code),
          const SizedBox(height: 50),
          Center(
            child: Pinput(
              length: 4,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
          ),
          const SizedBox(height: 26),
          Text(
            "Resend code",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
