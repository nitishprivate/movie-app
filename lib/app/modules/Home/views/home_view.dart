import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_task2/app/resources/app_colors.dart';
import 'package:movie_task2/app/widgets/movie_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.searchTap,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.search),
      ),
      body: GetBuilder<HomeController>(
        init: controller,
        id: 'homeViewUI',
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
                child: GridView.builder(
                  itemCount: controller.popularMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      url: controller.popularMovies[index].posterPath ?? "",
                      title: controller.popularMovies[index].originalTitle ?? "",
                      onTap: () => controller.cardTap(index),
                    );
                  },
                ),
              ),
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
