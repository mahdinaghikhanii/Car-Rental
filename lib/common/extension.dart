import 'package:flutter/material.dart';

const defaultScrollPhysics = BouncingScrollPhysics();

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
