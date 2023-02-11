import 'package:car/ui/auth/sign_up/sign_up.dart';
import 'package:car/ui/widgets/custom_green_button.dart';
import 'package:car/ui/widgets/text_input.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import '../../../common/dimensions.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    const double customSizeTitle = 14;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(S.of(context).sign_in,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.mediumPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Text(
                  S.of(context).phone_number,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: customSizeTitle),
                ),
                const SizedBox(height: 10),
                Row(children: [
                  GestureDetector(
                    onTap: () async {
                      final code =
                          await countryPicker.showPicker(context: context);

                      setState(() {
                        countryCode = code;
                      });
                    },
                    child: Container(
                        width: 76,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.smallBoderRadius),
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                            )),
                        child: countryCode != null
                            ? Center(
                                child: Text(
                                countryCode!.dialCode,
                                style: Theme.of(context).textTheme.titleMedium,
                              ))
                            : Center(
                                child: Text(
                                  "Country\nCode",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 12),
                                ),
                              )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextInputWidgets(
                      controller: phoneNumberController,
                    ),
                  )
                ]),
                const SizedBox(height: 24),
                Text(
                  S.of(context).password,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: customSizeTitle),
                ),
                const SizedBox(height: 10),
                TextInputWidgets(
                  controller: passwordController,
                ),
                const SizedBox(height: 60),
                CustomGreenButtonWidgets(
                  ontap: () {},
                  text: S.of(context).sign_in,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).dont_have_an_account,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text(S.of(context).sign_up_now))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
