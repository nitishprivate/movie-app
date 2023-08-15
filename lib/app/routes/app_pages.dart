import 'package:get/get.dart';

import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/MovieDetails/bindings/movie_details_binding.dart';
import '../modules/MovieDetails/views/movie_details_view.dart';
import '../modules/SearchPage/bindings/search_page_binding.dart';
import '../modules/SearchPage/views/search_page_view.dart';
import '../modules/Unknown/bindings/unknown_binding.dart';
import '../modules/Unknown/views/unknown_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.UNKNOWN,
      page: () => const UnknownView(),
      binding: UnknownBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAILS,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
  ];
}
