// Libraries
import 'package:get/get.dart';

// Libraries
import 'package:animelist/modules/home/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(
      Duration(seconds: 2),
    );

    Get.off(
      HomePage(),
      transition: Transition.fadeIn,
    );
  }

  @override
  void onClose() {
    super.onClose();

    print("Same as dispose");
  }
}
