import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/design_system/theme.dart';

import '../../../../app/di.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/Widget/error_empty_state.dart';
import '../../../../shared/Widget/image_network.dart';
import '../../../../shared/assets.dart';
import '../../../../shared/bases/base_state.dart';
import '../../../../shared/format_extention.dart';
import '../../../../shared/navigator_helper.dart';
import '../../domain/model/cast_entity.dart';
import '../../domain/model/genre_entity.dart';
import '../cubit/move_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int moveId;

  MovieDetailsScreen({
    super.key,
    required this.moveId,
  });

  final MoveDetailsCubit _cubit = getIt.get<MoveDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoveDetailsCubit, BaseState>(
      bloc: _cubit
        ..getMoveDetails('$moveId')
        ..getCast('$moveId'),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ErrorState) {
          return Center(
              child: ErrorOrEmptyState(title: AppLocalizations.of(context).noInternetConnection,
                description: AppLocalizations.of(context).noInternetDescription,
                icon: Assets.noInternet,));
        }

        if (state is DoneState) {
          return Scaffold(
            backgroundColor: Theme.of(context).appColors.background,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  color: Theme.of(context).appColors.shadePrimary,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    NavigatorHelper.pop();
                  },
                )),
            body: ListView(
              children: [
                Stack(children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(context).appColors.background
                        ],
                        stops: const [0.5, 1.0],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.darken,
                    child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Theme.of(context).appColors.background
                            ],
                            stops: const [0.5, 1.0],
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.darken,
                        child: ImageNetwork(_cubit.move.posterPath ?? '',
                            height: 400,
                            width: double.infinity,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _cubit.move.title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).appTexts.heading1.copyWith(
                                  color:
                                      Theme.of(context).appColors.shadePrimary,
                                ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            /* Handle play trailer button press */
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                              side: BorderSide(
                                color: Theme.of(context).appColors.shadePrimary,
                              ),
                            ),
                          ),
                          icon: Icon(
                            Icons.play_arrow,
                            color: Theme.of(context).appColors.shadePrimary,
                          ),
                          label: Text(
                            AppLocalizations.of(context).playTrailer,
                            style: Theme.of(context).appTexts.body.copyWith(
                                color:
                                    Theme.of(context).appColors.shadePrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _genres(_cubit.move.genreIds ?? [], context),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _moveInfo(extractYear(_cubit.move.releaseDate),
                                  AppLocalizations.of(context).released, context),
                              _moveInfo(formatRating(_cubit.move.voteAverage),
                                  AppLocalizations.of(context).rating, context),
                              _moveInfo(formatDuration(_cubit.move.runtime??0),
                                  AppLocalizations.of(context).time, context),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            AppLocalizations.of(context).overview,
                            style: Theme.of(context).appTexts.label2.copyWith(
                                  color:
                                      Theme.of(context).appColors.shadePrimary,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _cubit.move.overview ?? "",
                            style: Theme.of(context).appTexts.body.copyWith(
                                  color: Theme.of(context)
                                      .appColors
                                      .shadeSecondary,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context).cast,
                            style: Theme.of(context).appTexts.label2.copyWith(
                                  color: Theme.of(context).appColors.shadePrimary,
                                ),
                          ),
                          const SizedBox(height: 8),
                        ])),
                _cast(_cubit.cast, context),
                const SizedBox(height: 16),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _cast(List<CastEntity> cast, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 8.0), // Padding from the end
        child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              verticalDirection:VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: cast.map((castMember) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0),
              child: SizedBox(
                  width: 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ImageNetwork(
                        castMember.profilePath ?? '',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        castMember.name ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).appTexts.caption.copyWith(
                              color: Theme.of(context).appColors.shadeSecondary,
                            ),
                      ),
                    ],
                  )),
            );
          }).toList(),
        )),
      ),
    );
  }

  Widget _moveInfo(String value, String label, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context)
              .appTexts
              .label2
              .copyWith(color: Theme.of(context).appColors.shadePrimary),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).appTexts.body.copyWith(
                color: Theme.of(context).appColors.shadeSecondary,
              ),
        ),
      ],
    );
  }

  Widget _genres(List<GenreEntity> genres, BuildContext context) {
    return Wrap(
      spacing: 8,
      children: genres
          .map((genre) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              padding:
                  const EdgeInsets.only(right: 12, left: 12, top: 4, bottom: 4),
              child: Text(
                genre.name ?? "",
                style: Theme.of(context).appTexts.caption.copyWith(
                      color: Theme.of(context).appColors.shadePrimary,
                    ),
              )))
          .toList(),
    );
  }
}
