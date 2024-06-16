abstract class BaseMapper<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T object);
}
