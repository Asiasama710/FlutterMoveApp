
import 'genre_entity.dart';

class MoveDetailsEntity {
  bool? adult;
  List<GenreEntity>? genreIds;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  int? runtime;
  String? status;

  MoveDetailsEntity({
    this.adult,
    this.genreIds,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.runtime,
    this.status
  });
}