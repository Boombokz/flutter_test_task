import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';

class SearchCard extends StatelessWidget {

  final String hintText;
  final Function onTap;

  SearchCard({required this.hintText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorPalette.greyBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(IconsRes.searchIcon),
          SizedBox(width: 14),
          GestureDetector(
            onTap: () {
              BlocProvider.of<CharacterSearchBloc>(context)
                  .add(CharacterSearchInitialEvent());
              Navigator.pushNamed(
                  context, RouteGenerator.characterSearchScreenRoute);
            },
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width - 160,
              alignment: Alignment.centerLeft,
              child: Text(
                hintText,
                style: TextStyles.searchTextStyle,
              ),
            ),
          ),
          Container(
            height: 24,
            child: VerticalDivider(
              thickness: 1,
              color: ColorPalette.whiteColor.withOpacity(0.1),
            ),
          ),
          InkWell(
            onTap: (){
              onTap();
            },
            child: SvgPicture.asset(IconsRes.filterIcon),
          ),
        ],
      ),
    );
  }
}
