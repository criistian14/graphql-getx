// Libraries
import 'package:get/get.dart';

// Controller
import 'package:animelist/app/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
