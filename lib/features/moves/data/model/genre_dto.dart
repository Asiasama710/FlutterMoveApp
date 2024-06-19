
import '../../../../shared/bases/base_mapper.dart';
import '../../domain/model/genre_entity.dart';

class GenreDto extends BaseMapper<GenreDto> {
  int? id;
  String? name;

  GenreDto({
    this.id,
    this.name,
  });

  @override
  GenreDto fromJson(Map<String, dynamic> json) {
    return GenreDto(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson(GenreDto object) {
    return {
      'id': object.id,
      'name': object.name,
    };
  }

  List<GenreDto> toDto(List<dynamic> data) {
    return data.map((e) => GenreDto().fromJson(e)).toList();
  }

  GenreEntity toEntity() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }
}