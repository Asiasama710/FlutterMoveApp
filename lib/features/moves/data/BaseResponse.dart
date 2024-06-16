
import 'package:moves_app/features/moves/data/move_dto.dart';

import '../../../shared/bases/base_mapper.dart';

// class BaseResponse<T> extends BaseMapper<BaseResponse<T>> {
//   Dates? dates;
//   int? page;
//   T? results;
//   int? total_pages;
//   int? total_results;
//
//   BaseResponse({
//     this.dates,
//     this.page,
//     this.results,
//     this.total_pages,
//     this.total_results,
//   });
//
//   @override
//   BaseResponse<T> fromJson(Map<String, dynamic> json) {
//     return BaseResponse(
//       dates: Dates.fromJson(json['dates']),
//       page: json['page'],
//       results: json['results'],
//       total_pages: json['total_pages'],
//       total_results: json['total_results'],
//     );
//   }
//
//   @override
//   Map<String, dynamic> toJson(BaseResponse<T> object) {
//     return {
//       'dates': object.dates,
//       'page': object.page,
//       'results': object.results,
//       'total_pages': object.total_pages,
//       'total_results': object.total_results,
//     };
//   }
//
// }

class BaseResponse extends BaseMapper<BaseResponse> {
  Dates? dates;
  int? page;
  List<MovieDto>? results;
  int? total_pages;
  int? total_results;

  BaseResponse({
    this.dates,
    this.page,
    this.results,
    this.total_pages,
    this.total_results,
  });

  @override
  BaseResponse fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      dates: Dates.fromJson(json['dates']),
      page: json['page'],
      results: (json['results'] as List).map((e) => MovieDto().fromJson(e)).toList(),
      total_pages: json['total_pages'],
      total_results: json['total_results'],
    );
  }

  @override
  Map<String, dynamic> toJson(BaseResponse object) {
    return {
      'dates': object.dates,
      'page': object.page,
      'results': object.results,
      'total_pages': object.total_pages,
      'total_results': object.total_results,
    };
  }

}

class Dates {
  String maximum;
  String minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}