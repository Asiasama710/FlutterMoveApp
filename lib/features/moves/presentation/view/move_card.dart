import 'package:flutter/material.dart';
import 'package:moves_app/design_system/theme.dart';
import 'package:moves_app/features/moves/domain/move_entity.dart';

class MoveCard extends StatelessWidget {
  final MovieEntity move;
  final VoidCallback onClickMove;

  const MoveCard({super.key, required this.move, required this.onClickMove});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClickMove();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${move.posterPath}"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  shadows:  [
                    BoxShadow(
                      color:Theme.of(context).appColors.shadeQuad,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
