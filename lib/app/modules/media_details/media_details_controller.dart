// Libraries
import 'package:get/get.dart';

// Models
import 'package:animelist/app/data/models/media_model.dart';

// Queries
import 'package:animelist/app/data/providers/anime_graphql.dart';

class MediaDetailsController extends GetxController {
  QueryMutationAnime _queryMutationAnime = Get.find<QueryMutationAnime>();

  RxBool loading = true.obs;
  MediaModel media;

  @override
  void onInit() {
    super.onInit();

    // Get Media Info Initial
    media = Get.arguments["media"];
  }

  // =====================================================================
  // Getters
  // =====================================================================
  String get queryGetInfoAnime => _queryMutationAnime.getAnimeInfo();

  void setMedia(Map json) {
    media = MediaModel.fromJson(json);
  }
}
