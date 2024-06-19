import 'package:flutter/material.dart';

import '../../features/moves/domain/model/move_entity.dart';
import 'image_network.dart';

class MoveCard extends StatelessWidget {
  final MovieEntity move;
  final VoidCallback onClickMove;

  const MoveCard({super.key, required this.move, required this.onClickMove});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          onClickMove();
        },
        child: Column(
          children: [
            Expanded(
                child:  ImageNetwork(
                  move.posterPath ?? '',
                  height: double.maxFinite,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ],
        ));
  }
}
