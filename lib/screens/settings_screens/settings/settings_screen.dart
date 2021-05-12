import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';

enum ThemeChoice { disabled, enabled, system, powersafe }

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeChoice? _choice = ThemeChoice.enabled;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return Expanded(
      child: Row(
        children: [
          Text(
            'Rick & Morty  $title',
            style: TextStyles.listTileStyle,
          ),
          Text(
            '$subtitle',
            style: TextStyles.listTileStyle,
          ),
        ],
      ),
    );
  }

  _showSingleChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                insetPadding: EdgeInsets.all(0),
                contentPadding: EdgeInsets.all(0),
                titlePadding:
                    EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 16),
                buttonPadding: EdgeInsets.zero,
                backgroundColor: ColorPalette.greyBackgroundColor,
                title: Text(
                  'Dark theme',
                  style: TextStyles.headerTextStyle,
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: ColorPalette.darkGreyColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile<ThemeChoice>(
                          title: Text(
                            'Disabled',
                            style: TextStyles.searchTextStyle
                                .copyWith(color: ColorPalette.whiteColor),
                          ),
                          activeColor: ColorPalette.lightBlueColor,
                          selectedTileColor: ColorPalette.lightBlueColor,
                          value: ThemeChoice.disabled,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          groupValue: _choice,
                          dense: true,
                          onChanged: (ThemeChoice? value) {
                            setState(() {
                              _choice = value;
                            });
                          },
                        ),
                        RadioListTile<ThemeChoice>(
                          title: Text(
                            'Enabled',
                            style: TextStyles.searchTextStyle
                                .copyWith(color: ColorPalette.whiteColor),
                          ),
                          activeColor: ColorPalette.lightBlueColor,
                          value: ThemeChoice.enabled,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          groupValue: _choice,
                          dense: true,
                          onChanged: (ThemeChoice? value) {
                            setState(() {
                              _choice = value;
                            });
                          },
                        ),
                        RadioListTile<ThemeChoice>(
                          title: Text(
                            'Follow the system settings',
                            style: TextStyles.searchTextStyle
                                .copyWith(color: ColorPalette.whiteColor),
                          ),
                          activeColor: ColorPalette.lightBlueColor,
                          value: ThemeChoice.system,
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          groupValue: _choice,
                          onChanged: (ThemeChoice? value) {
                            setState(() {
                              _choice = value;
                            });
                          },
                        ),
                        RadioListTile<ThemeChoice>(
                          title: Text(
                            'Power-saving mode',
                            style: TextStyles.searchTextStyle
                                .copyWith(color: ColorPalette.whiteColor),
                          ),
                          activeColor: ColorPalette.lightBlueColor,
                          value: ThemeChoice.powersafe,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          groupValue: _choice,
                          dense: true,
                          onChanged: (ThemeChoice? value) {
                            setState(() {
                              _choice = value;
                            });
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel'.toUpperCase(),
                              style: TextStyles.textButtonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.splashScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.greyBackgroundColor),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteGenerator.mainScreenRoute,
                            arguments: 0,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 19, horizontal: 17),
                          child: SvgPicture.asset(IconsRes.arrowBackIcon),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Settings',
                      style: TextStyles.headerTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 36),
                Text(
                  'Appearance'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
                SizedBox(height: 24),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _showSingleChoiceDialog(context);
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(IconsRes.themeRowIcon),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dark theme',
                              style: TextStyles.searchTextStyle
                                  .copyWith(color: ColorPalette.whiteColor),
                            ),
                            Text(
                              'Enabled',
                              style: TextStyles.whiteTextStyle
                                  .copyWith(color: ColorPalette.greyColor),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(IconsRes.arrowRightIcon),
                    ],
                  ),
                ),
                DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'About the app'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
                SizedBox(height: 24),
                Text(
                  'An app based on the television show RIck and Morty, where you can access information on their characters and in which episodes they have participated.',
                  style: TextStyles.listTileStyle,
                ),
                SizedBox(height: 24),
                Text(
                  'Illustrating Flutter development only.',
                  style: TextStyles.listTileStyle,
                ),
                DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'Copyright'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
                SizedBox(height: 24),
                Text(
                  'Rick and Morty is created by Justin Roiland and Dan Harmon for Adult Swim. The data and images are used without claim of ownership and belong to their respective owners.',
                  style: TextStyles.listTileStyle,
                ),
                SizedBox(height: 24),
                Text(
                  'The Rick and Morty API is a RESTful development by Axel Fuhrmann',
                  style: TextStyles.listTileStyle,
                ),
                DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'App version'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    _infoTile('v', _packageInfo.version),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}