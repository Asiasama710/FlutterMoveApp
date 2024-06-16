import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/design_system/theme.dart';

import '../../../../app/di.dart';
import '../../../../shared/assets.dart';
import '../../../../shared/bases/base_state.dart';
import '../cubit/moves_cubit.dart';

class MovesScreen extends StatelessWidget {
  MovesScreen({super.key});

  final MovesCubit _cubit = getIt.get<MovesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MovesCubit, BaseState>(
          bloc: _cubit..getMoveDetails('653346'),
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ErrorState) {
              return emptyList(context);
            }
            if (state is DoneState) {
              return !_cubit.moves.isEmpty ? emptyList(context)
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 16),
                                  child: Text(
                                    '${_cubit.move.title}',
                                    style: Theme.of(context)
                                        .appTexts.heading1.copyWith(
                                            color: Theme.of(context)
                                                .appColors
                                                .error),
                                  ),
                                ),
                              ]
                              // List.generate(
                              //     _cubit.moves.length,
                              //     (index) => Padding(
                              //           padding:
                              //               const EdgeInsetsDirectional.only(
                              //                   top: 16),
                              //           child: TFilingCard(
                              //             move: _cubit.moves[index],
                              //           ),
                              //         ))
                          )),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget emptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.logo),
          const SizedBox(
            height: 16,
          ),
          Text(
            'No Moves',
            style: Theme.of(context)
                .appTexts
                .caption
                .copyWith(color: Theme.of(context).appColors.shadeSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
