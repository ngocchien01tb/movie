import 'package:get/get.dart';
import 'package:movie/modules/home/home_body.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeBody(),
    ),
  ];
}
