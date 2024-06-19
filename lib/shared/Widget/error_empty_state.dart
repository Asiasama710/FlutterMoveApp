import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/design_system/theme.dart';

import '../assets.dart';

class ErrorOrEmptyState extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  const ErrorOrEmptyState({super.key,required this.title,required this.description, this.icon = Assets.noFilm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 80,
              height: 80,
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
          ),Text(
            description,
            style: Theme.of(context)
                .appTexts
                .body
                .copyWith(color: Theme.of(context).appColors.shadeSecondary),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  }
}
