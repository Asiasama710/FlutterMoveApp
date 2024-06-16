import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/design_system/theme.dart';
import 'package:moves_app/features/moves/domain/move_entity.dart';

import '../../../../shared/assets.dart';

class TFilingCard extends StatelessWidget {
  final MovieEntity move;
  const TFilingCard({super.key,  required this.move});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * .90,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: ShapeDecoration(
        color: theme.appColors.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: theme.appColors.shadeQuad),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '#${move.title}',
                style: theme.appTexts.caption.copyWith(
                  color: theme.appColors.shadeSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }


  Widget verticalDivider() {
    return Container(
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0x14001A1F),
          ),
        ),
      ),
    );
  }

}
