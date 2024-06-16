import 'package:moves_app/features/moves/domain/genre_entity.dart';

class MoveDetailsEntity {
  bool? adult;
  String? backdropPath;
  List<GenreEntity>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  int? budget;
  String? homepage;
  String? imdbId;
  List<String>? originCountry;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;

  MoveDetailsEntity({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.homepage,
    this.imdbId,
    this.originCountry,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
  });
}