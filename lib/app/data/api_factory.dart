class ApiFactory {
  static get baseUrl => "https://api.themoviedb.org/3";
  static get trendingMovies => "$baseUrl/trending/movie/day?language=en-US";
  static get popularMovies => "$baseUrl/movie/popular?language=en-US&page=1";
  static get topRatedMovies => "$baseUrl/movie/top_rated?language=en-US&page=1";
  static String searchdMovies(String query) => "$baseUrl/search/movie?query=$query";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
}
