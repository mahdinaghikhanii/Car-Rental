import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import '../../../generated/l10n.dart';
import '../sign_in/sign_in.dart';
import '../verify/verify.dart';
import '../../widgets/custom_green_button.dart';
import '../../widgets/text_input.dart';
import 'package:flutter/material.dart';

import '../../../common/dimensions.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    const double customSizeTitle = 14;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(S.of(context).sign_up,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.mediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 46),
              Text(
                S.of(context).first_name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: customSizeTitle),
              ),
              const SizedBox(height: 10),
              TextInputWidgets(controller: firstNameController),
              const SizedBox(height: 24),
              Text(
                S.of(context).last_name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: customSizeTitle),
              ),
              const SizedBox(height: 10),
              TextInputWidgets(controller: lastNameController),
              const SizedBox(height: 24),
              Text(
                S.of(context).phone_number,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: customSizeTitle),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
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
                    child: TextInputWidgets(controller: phoneNumberController),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Text(
                S.of(context).password,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: customSizeTitle),
              ),
              const SizedBox(height: 10),
              TextInputWidgets(controller: passwordController, password: true),
              const SizedBox(height: 50),
              CustomGreenButtonWidgets(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyScreen()));
                  },
                  text: S.of(context).continue_),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).already_have_an_account,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: Text(
                      S.of(context).login_in,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
