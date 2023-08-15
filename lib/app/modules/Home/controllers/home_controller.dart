import 'package:get/get.dart';
import 'package:movie_task2/app/data/api_connector.dart';
import 'package:movie_task2/app/data/api_factory.dart';

import '../../../routes/app_pages.dart';
import '../model/home_movie_model.dart';

class HomeController extends GetxController {
  List<PopularMovieModel> popularMovies = <PopularMovieModel>[];
  String hasError = "";
  bool isLoading = true;
  @override
  void onReady() {
    super.onReady();
    getPopularMovies();
  }

  getPopularMovies() async {
    if (!isLoading) {
      isLoading = true;
      updateRootUi();
    }
    var resp = await Get.find<ApiConnectorController>().getMethodApiCall(ApiFactory.popularMovies);
    if (resp != null && resp.data != null && (resp.data['results']) != null && resp.status) {
      hasError = "";
      popularMovies.clear();
      for (var element in (resp.data['results']) as List<dynamic>) {
        popularMovies.add(PopularMovieModel.fromJson(element));
      }
    } else {
      hasError = resp?.msg ?? "Something went wrong!";
    }
    isLoading = false;
    updateRootUi();
  }

  retry() {
    getPopularMovies();
  }

  updateRootUi() {
    update(['homeViewUI']);
  }

  void searchTap() => Get.toNamed(Routes.SEARCH_PAGE);

  void cardTap(int index) {}
}
