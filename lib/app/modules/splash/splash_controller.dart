// Libraries
import 'package:get/get.dart';

// Routes
import 'package:animelist/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(
      Duration(seconds: 2),
    );

    Get.offNamed(
      AppRoutes.HOME,
      // transition: Transition.fadeIn,
    );
  }

  @override
  void onClose() {
    super.onClose();

    print("Same as dispose");
  }
}
