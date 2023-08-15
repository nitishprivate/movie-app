import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_task2/app/resources/app_colors.dart';

import '../../../widgets/movie_card.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(onPressed: controller.backTap, icon: const Icon(Icons.arrow_back, color: Colors.white)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      onChanged: controller.onQueryChanged,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter movie name",
                        labelText: "Enter movie name",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder<SearchPageController>(
                init: controller,
                id: 'searchViewUI',
                builder: (controller) {
                  return Center(
                    child: Visibility(
                      visible: controller.isLoading,
                      replacement: Visibility(
                        visible: controller.hasError.isEmpty,
                        replacement: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.hasError, style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 10),
                            ElevatedButton(onPressed: controller.retry, child: const Text("Retry"))
                          ],
                        ),
                        child: Visibility(
                          visible: controller.searchMovies.isNotEmpty,
                          replacement: Visibility(
                            visible: controller.firstTime,
                            replacement: Text(
                              "No Data Found.",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            child: Text(
                              "Start Typing.",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: controller.searchMovies.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 240,
                            ),
                            itemBuilder: (context, index) {
                              return MovieCard(
                                url: controller.searchMovies[index].posterPath ?? "",
                                title: controller.searchMovies[index].originalTitle ?? "",
                                onTap: () => controller.cardTap(index),
                              );
                            },
                          ),
                        ),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
