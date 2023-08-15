import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task2/app/modules/SearchPage/model/search_movie_model.dart';

import '../../../data/api_connector.dart';
import '../../../data/api_factory.dart';
import '../../../providers/de_bounce.dart';

class SearchPageController extends GetxController {
  String lastEnterData = "";
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));
  List<SearchMovieModel> searchMovies = <SearchMovieModel>[];
  String hasError = "";
  bool isLoading = false;
  bool firstTime = true;

  onQueryChanged(String query) {
    if (query.isEmpty) {
      firstTime = true;
      updateUI();
    } else {
      _debounce.call(() {
        lastEnterData = query;
        firstTime = false;
        getQueryMovies(query);
      });
    }
  }

  getQueryMovies(String query) async {
    if (!isLoading) {
      isLoading = true;
      updateUI();
    }
    var resp = await Get.find<ApiConnectorController>().getMethodApiCall(ApiFactory.searchdMovies(query));
    if (resp != null && resp.data != null && (resp.data['results']) != null && resp.status) {
      hasError = "";
      searchMovies.clear();
      for (var element in (resp.data['results']) as List<dynamic>) {
        searchMovies.add(SearchMovieModel.fromJson(element));
      }
    } else {
      hasError = resp?.msg ?? "Something went wrong!";
    }
    isLoading = false;
    updateUI();
  }

  updateUI() {
    update(['searchViewUI']);
  }

  @override
  void onClose() {
    _debounce.dispose();
    super.onClose();
  }

  cardTap(int index) {}

  void retry() {
    getQueryMovies(lastEnterData);
  }

  void backTap() {
    Get.back();
  }
}
