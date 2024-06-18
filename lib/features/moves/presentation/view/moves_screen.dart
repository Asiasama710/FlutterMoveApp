import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/design_system/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/di.dart';
import '../../../../shared/Widget/emptyList.dart';
import '../../../../shared/assets.dart';
import '../../../../shared/bases/base_state.dart';
import '../../../../shared/navigator_helper.dart';
import '../cubit/moves_cubit.dart';
import 'move_card.dart';
import 'move_details_screen.dart';

class MovesScreen extends StatelessWidget {
  MovesScreen({super.key});

  final MovesCubit _cubit = getIt.get<MovesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appColors.background,
        appBar: AppBar(
          scrolledUnderElevation : 5.0,
          backgroundColor: Theme.of(context).appColors.background,
          titleSpacing: 8,
          title: Text(
            'Moves',
            style: Theme.of(context).appTexts.label2,
          ),
          leading: IconButton(
            color:Theme.of(context).appColors.shadePrimary,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
            },
          ),
        ),
        body:  BlocConsumer<MovesCubit, BaseState>(
          bloc: _cubit..getMoves(),
          listener: (context, state) {
            state is ErrorState
                ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("error"),
                backgroundColor: Theme.of(context).appColors.error,
              ),
            )
                : null;
          },
          builder: (context, state) {
            if (state is ErrorState) {
              return const Center( child: EmptyList(title: 'No Moves'));
            }
            if (state is DoneState) {
              return _cubit.moves.isEmpty
                  ? emptyList(context)
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
                        NavigatorHelper.push(MovieDetailsScreen(moveId: _cubit.moves[index].id??0));
                      },
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )

    );
  }

  Widget emptyList(BuildContext context) {
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
