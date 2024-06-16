import 'package:moves_app/features/moves/data/genre_dto.dart';

import '../../../shared/bases/base_mapper.dart';
import '../domain/move_details_entity.dart';

class MoveDetailsDto extends BaseMapper<MoveDetailsDto> {
  bool? adult;
  String? backdropPath;
  List<GenreDto>? genres;
  BelongsToCollection? belongsToCollection;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
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
  List<SpokenLanguages>? spokenLanguages;

  MoveDetailsDto({
    this.adult,
    this.backdropPath,
    this.genres,
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
    this.spokenLanguages,
    this.belongsToCollection,
    this.productionCompanies,
    this.productionCountries,
  });

  @override
  MoveDetailsDto fromJson(Map<String, dynamic> json) {
    return MoveDetailsDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null ? BelongsToCollection().fromJson(json['belongs_to_collection']) : null,
      productionCompanies: json['production_companies'] != null ? List<ProductionCompanies>.from(json['production_companies'].map((x) => ProductionCompanies().fromJson(x))) : List<ProductionCompanies>.from([]),
      productionCountries: json['production_countries'] != null ? List<ProductionCountries>.from(json['production_countries'].map((x) => ProductionCountries().fromJson(x))) : List<ProductionCountries>.from([]),
      spokenLanguages: json['spoken_languages'] != null ? List<SpokenLanguages>.from(json['spoken_languages'].map((x) => SpokenLanguages().fromJson(x))) : List<SpokenLanguages>.from([]),
      originCountry: json['origin_country'] != null ? List<String>.from(json['origin_country'].map((x) => x)) : [],
      genres: json['genres'] != null ? List<GenreDto>.from(json['genres'].map((x) => GenreDto().fromJson(x))) : [],
      budget: json['budget'],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
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
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
    );
  }

  MoveDetailsDto toDto(dynamic data) {
    return MoveDetailsDto().fromJson(data);
  }


  @override
  Map<String, dynamic> toJson(MoveDetailsDto object) {

    return {
      'adult': object.adult,
      'backdrop_path': object.backdropPath,
      'belongs_to_collection': object.belongsToCollection != null ? object.belongsToCollection!.toJson(object.belongsToCollection!) : {},
      'budget': object.budget,
      'homepage': object.homepage,
      'genres': object.genres != null ? List<dynamic>.from(object.genres!.map((x) => x.toJson(x))) : [],
      'imdb_id': object.imdbId,
      'id': object.id,
      'original_language': object.originalLanguage,
      'original_title': object.originalTitle,
      'overview': object.overview,
      'popularity': object.popularity,
      'poster_path': object.posterPath,
      'production_companies': object.productionCompanies != null ? List<dynamic>.from(object.productionCompanies!.map((x) => x.toJson(x))) : [],
      'production_countries': object.productionCountries != null ? List<dynamic>.from(object.productionCountries!.map((x) => x.toJson(x))) : [],
      'origin_country': object.originCountry != null ? List<dynamic>.from(object.originCountry!.map((x) => x)) : [],
      'revenue': object.revenue,
      'runtime': object.runtime,
      'status': object.status,
      'tagline': object.tagline,
      'release_date': object.releaseDate,
      'title': object.title,
      'video': object.video,
      'vote_average': object.voteAverage,
      'vote_count': object.voteCount,
      'spoken_languages': object.spokenLanguages != null ? List<dynamic>.from(object.spokenLanguages!.map((x) => x.toJson(x))) : [],
    };
  }

  MoveDetailsEntity toEntity() {
    return MoveDetailsEntity(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genres != null ? genres!.map((e) => e.toEntity()).toList() : [],
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
      budget: budget,
      homepage: homepage,
      imdbId: imdbId,
      originCountry: originCountry,
      revenue: revenue,
      runtime: runtime,
      status: status,
      tagline: tagline,
    );
  }


}

class BelongsToCollection extends BaseMapper<BelongsToCollection>{
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  @override
  BelongsToCollection fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  @override
  Map<String, dynamic> toJson(BelongsToCollection object) {
    return {
      'id': object.id,
      'name': object.name,
      'poster_path': object.posterPath,
      'backdrop_path': object.backdropPath,
    };
  }

}

class ProductionCompanies extends BaseMapper<ProductionCompanies>{
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  @override
  ProductionCompanies fromJson(Map<String, dynamic> json) {
    return ProductionCompanies(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  @override
  Map<String, dynamic> toJson(ProductionCompanies object) {
    return {
      'id': object.id,
      'logo_path': object.logoPath,
      'name': object.name,
      'origin_country': object.originCountry,
    };
  }

}

class ProductionCountries extends BaseMapper<ProductionCountries>{
  String? iso31661;
  String? name;

  ProductionCountries({
    this.iso31661,
    this.name,
  });

  @override
  ProductionCountries fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson(ProductionCountries object) {
    return {
      'iso_3166_1': object.iso31661,
      'name': object.name,
    };
  }

}
class SpokenLanguages extends BaseMapper<SpokenLanguages>{
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  @override
  SpokenLanguages fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson(SpokenLanguages object) {
    return {
      'english_name': object.englishName,
      'iso_639_1': object.iso6391,
      'name': object.name,
    };
  }

}