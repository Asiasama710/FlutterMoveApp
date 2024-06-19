import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/design_system/theme.dart';

import '../../../../app/di.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/Widget/error_empty_state.dart';
import '../../../../shared/Widget/move_card.dart';
import '../../../../shared/assets.dart';
import '../../../../shared/bases/base_state.dart';
import '../../../../shared/navigator_helper.dart';
import '../cubit/moves_cubit.dart';
import 'move_details_screen.dart';

class MovesScreen extends StatelessWidget {
  MovesScreen({super.key});

  final MovesCubit _cubit = getIt.get<MovesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appColors.background,
        appBar: AppBar(
          scrolledUnderElevation: 5.0,
          backgroundColor: Theme.of(context).appColors.background,
          titleSpacing: 8,
          title: Text(
            AppLocalizations.of(context).playNow,
            style: Theme.of(context).appTexts.label2.copyWith(
                  color: Theme.of(context).appColors.shadePrimary,
            ),
          ),
          leading: IconButton(
            color: Theme.of(context).appColors.shadePrimary,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
            },
          ),
        ),
        body: BlocConsumer<MovesCubit, BaseState>(
          bloc: _cubit..getMoves(),
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ErrorState) {
              return Center(
                  child: ErrorOrEmptyState(
                title: AppLocalizations.of(context).noInternetConnection,
                description: AppLocalizations.of(context).noInternetDescription,
                icon: Assets.noInternet,
              ));
            }
            if (state is DoneState) {
              return _cubit.moves.isEmpty
                  ? Center(
                      child: ErrorOrEmptyState(
                      title: AppLocalizations.of(context).noMoviesFound,
                      description:
                          AppLocalizations.of(context).noMoviesFoundDescription,
                      icon: Assets.noInternet,
                    ))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        itemCount: _cubit.moves.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          return MoveCard(
                            move: _cubit.moves[index],
                            onClickMove: () {
                              NavigatorHelper.push(MovieDetailsScreen(
                                  moveId: _cubit.moves[index].id ?? 0));
                            },
                          );
                        },
                      ),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
