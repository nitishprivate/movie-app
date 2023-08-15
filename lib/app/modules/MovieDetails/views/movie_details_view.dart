import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MovieDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
