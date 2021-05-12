import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';

class DividerWidget extends StatelessWidget {
  final double verticalPadding;
  final double horizontalPadding;

  DividerWidget(
      {required this.verticalPadding, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Divider(
        thickness: 2,
        indent: horizontalPadding,
        endIndent: horizontalPadding,
        color: ColorPalette.greyBackgroundColor,
      ),
    );
  }
}