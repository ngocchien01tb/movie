import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/modules/home/controller/movie_controller.dart';
import 'package:movie/modules/home/view/item_movie_view.dart';
import 'package:movie/theme/colors.dart';

import '../../../widgets/custom_text_view.dart';

class MovieListItemView extends GetView<MovieController> {
  final MovieController mc;

  const MovieListItemView({Key? key, required this.mc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).orientation;
    // print('object: ${mc.movies[1]}');
    return FutureBuilder(
      future: mc.fetchMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print('object123 : ${snapshot.hasData.toString()}');

          // print("AAAGSAGD : ${mc.movies[1].posterPath}");
          return Obx(
            () => SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextView(
                    text: 'Popular list',
                    sizeText: 20,
                    color: AppColors.kColorTextGrey,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (size == Orientation.portrait) ? 2 : 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5),
                    ),
                    itemCount: mc.isLoadingMore.value ? mc.movies.length + 1 : mc.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print('objectagdahg: ${mc.movies[index].posterPath.toString()}');
                      print('object: ${mc.movies.length}');
                      return ItemMovieView(result: mc.movies[index]);
                      // ItemMovieView(result: mc.movies[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Text('ERROR');
        }
      },
    );
  }
}
