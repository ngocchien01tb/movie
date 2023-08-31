import '../controller/movie_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LaunchScreen.
///
/// This class ensures that the LaunchController is created when the
/// LaunchScreen is first loaded.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController());
  }
}
