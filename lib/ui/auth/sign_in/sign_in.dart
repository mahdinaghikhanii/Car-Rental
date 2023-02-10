import 'package:car/common/dimensions.dart';
import 'package:car/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double customSizeTitle = 14;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).sign_in,
            style: Theme.of(context).textTheme.titleLarge),
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
              TextFormField()
            ],
          ),
        ),
      ),
    );
  }
}
