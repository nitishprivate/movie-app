import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_task2/app/data/api_factory.dart';
import 'package:movie_task2/app/resources/app_colors.dart';

import '../resources/app_values.dart';

class MovieCard extends StatelessWidget {
  final String url, title;
  final void Function()? onTap;
  const MovieCard({
    super.key,
    required this.url,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8),
          //   color: AppColors.secondaryBackground,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 175,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${ApiFactory.imageBaseUrl}$url",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p10),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
