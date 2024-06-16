class MovieEntity {
  int? id;
  String? originalTitle;
  String? title;
  String? overview;
  double? popularity;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  List<int>? genreIds;

  MovieEntity({
    this.id,
    this.originalTitle,
    this.title,
    this.overview,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
  });
}
