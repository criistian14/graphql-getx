// Libraries
import 'package:get/get.dart';

// Controller
import 'package:animelist/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
