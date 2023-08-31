import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/apiClient/base_client.dart';

import '../models/movie_model.dart';

/// A controller class for the LaunchScreen.
///
/// This class manages the state of the LaunchScreen, including the
/// current launchModelObj
class MovieController extends GetxController {
  RxList<Result> movies = <Result>[].obs;

  BaseClient baseClient = BaseClient();

  ScrollController scrollController = ScrollController();

  RxInt currentPage = 1.obs;

  var isLoadingMore = false.obs;

  fetchMovies() async {
    isLoadingMore.value = false;
    baseClient.get('$baseUrl/discover/movie?api_key=', '&page=${currentPage.value}').then((value) {
      if (value != null) {
        print('object2: ${value['results'].toString()}');
        // print('danhsach1: ${value['results'].l}');
        movies.value = movieFromJson(value).results;
        // print('object');
        print('danhsach12: ${movies.length}');
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMovies();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        isLoadingMore.value = true;
        currentPage.value++;
        fetchMovies();
      }
    });

    baseClient;
  }
}
