// Routes
import 'package:animelist/app/routes/app_routes.dart';

// Libraries
import 'package:get/get.dart';

// Pages
import 'package:animelist/app/modules/splash/splash_page.dart';
import 'package:animelist/app/modules/home/home_page.dart';
import 'package:animelist/app/modules/media_details/media_details_page.dart';

// Bindings
import 'package:animelist/app/modules/splash/splash_binding.dart';
import 'package:animelist/app/modules/home/home_binding.dart';
import 'package:animelist/app/modules/media_details/media_details_binding.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILS,
      page: () => MediaDetailsPage(),
      binding: MediaDetailsBinding(),
    ),
  ];
}
