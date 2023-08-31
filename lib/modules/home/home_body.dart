import 'package:get/get.dart';
import 'package:movie/modules/home/view/app_bar_home_view.dart';
import 'package:movie/modules/home/view/movie_list_item_view.dart';
import 'package:movie/theme/colors.dart';
import 'package:movie/widgets/custom_text_view.dart';

import 'controller/movie_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeBody extends GetWidget<MovieController> {
  const HomeBody({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    var mc = Get.put(MovieController());
    final size = MediaQuery.of(context).orientation;
    // print('AAAA: ${mc.movies.length.toString()}');

    return Scaffold(
      backgroundColor: AppColors.kColorBackgroundLight,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarHomeView(
                icon: Icons.arrow_back_ios,
                textAppBar: 'Back',
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: MovieListItemView(mc: mc))
            ],
          ),
        ),
      ),
    );
  }
}
