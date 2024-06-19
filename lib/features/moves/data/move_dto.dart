import 'package:moves_app/shared/bases/base_mapper.dart';

import '../domain/move_entity.dart';

class MovieDto extends BaseMapper<MovieDto> {
   bool? adult;
   String? backdropPath;
   List<int>? genreIds;
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

  MovieDto({
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
  });

  @override
  MovieDto fromJson(Map<String, dynamic> json) {
    return MovieDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  @override
  Map<String, dynamic> toJson(MovieDto object) {
    return {
      'adult': object.adult,
      'backdrop_path': object.backdropPath,
      'genre_ids': object.genreIds != null ? List<dynamic>.from(object.genreIds!.map((x) => x)) : [],
      'id': object.id,
      'original_language': object.originalLanguage,
      'original_title': object.originalTitle,
      'overview': object.overview,
      'popularity': object.popularity,
      'poster_path': object.posterPath,
      'release_date': object.releaseDate,
      'title': object.title,
      'video': object.video,
      'vote_average': object.voteAverage,
      'vote_count': object.voteCount,
    };
  }

  List<MovieDto> toDto(List<dynamic> data) {
    return data.map((e) => MovieDto().fromJson(e)).toList();
  }

  List<MovieEntity> toEntityList(List<dynamic> data) {
    return MovieDto().toDto(data).map((dto) => dto.toEntity()).toList();
  }



  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      originalTitle: originalTitle,
      title: title,
      overview: overview,
      popularity: popularity,
      posterPath:'https://image.tmdb.org/t/p/w500$posterPath',
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      genreIds: genreIds,
    );
  }
}
