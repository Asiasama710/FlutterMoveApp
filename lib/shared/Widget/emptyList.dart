import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/design_system/theme.dart';

import '../assets.dart';

Widget emptyList(BuildContext context,String title, icon) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(Assets.noFilm,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).appColors.primary,
                    BlendMode.srcIn))
        ),
        Text(
          'No Moves',
          style: Theme.of(context)
              .appTexts
              .body
              .copyWith(color: Theme.of(context).appColors.shadeSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

class EmptyList extends StatelessWidget {
  final String icon;
  final String title;
  const EmptyList({super.key,required this.title,this.icon = Assets.noFilm});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(icon,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).appColors.primary,
                    BlendMode.srcIn))
        ),
        Text(
          title,
          style: Theme.of(context)
              .appTexts
              .body
              .copyWith(color: Theme.of(context).appColors.shadeSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
