import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

class CustomCheckbox extends StatefulWidget {
  final String title;

  CustomCheckbox({required this.title});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: isChecked
              ? SvgPicture.asset(IconsRes.checkedIcon)
              : SvgPicture.asset(IconsRes.uncheckedIcon),
        ),
        SizedBox(width: 16),
        Text(
          '${widget.title}',
          style: TextStyles.searchScreenTextStyle
              .copyWith(color: ColorPalette.whiteColor, height: 1.25),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
