import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/episode_screen.dart';
import 'package:rick_and_morty_test/utils/global_state/global_controller.dart'
    as globals;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/character_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/location_screen.dart';
import 'package:rick_and_morty_test/screens/settings_screens/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
    globals.tabController = tabController;

    super.initState();
  }

  void onSelectTab(int index) {
    setState(() {
      globals.tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: globals.tabController.index,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyles.greyTextStyle,
        selectedLabelStyle: TextStyles.greyTextStyle,
        currentIndex: globals.tabController.index,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsRes.characterIconOff,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
            ),
            activeIcon: SvgPicture.asset(
              IconsRes.characterIconOff,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsRes.locationIconOff,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
            ),
            activeIcon: SvgPicture.asset(
              IconsRes.locationIconOff,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsRes.episodesIconOff,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
            ),
            activeIcon: SvgPicture.asset(
              IconsRes.episodesIconOff,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsRes.settingsIconOff,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
            ),
            activeIcon: SvgPicture.asset(
              IconsRes.settingsIconOff,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Settings',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }

  final tabs = [
    CharacterScreen(),
    LocationScreen(),
    EpisodeScreen(),
    SettingsScreen(),
  ];
}
