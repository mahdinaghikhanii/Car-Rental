import '../../common/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextInputWidgets extends StatelessWidget {
  final TextEditingController controller;
  final bool password;
  const TextInputWidgets(
      {super.key, required this.controller, this.password = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
          cursorColor: Theme.of(context).cardColor,
          obscureText: password,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: password
                  ? IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icon/ayse.svg"))
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(Dimensions.smallBoderRadius),
                borderSide: BorderSide(color: Theme.of(context).cardColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).cardColor),
              ))),
    );
  }
}
