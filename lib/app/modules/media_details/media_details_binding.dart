// Libraries
import 'package:get/get.dart';

// Controller
import 'package:animelist/app/modules/media_details/media_details_controller.dart';

class MediaDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MediaDetailsController());
  }
}
