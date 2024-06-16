class EndPoints {
  static String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String nowPlaying = '/now_playing';
  static String moveDetails(String movieId) => '/$movieId';

}
