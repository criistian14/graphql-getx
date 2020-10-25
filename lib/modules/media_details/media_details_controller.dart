// Libraries
import 'package:get/get.dart';

// Models
import 'package:animelist/data/models/media_model.dart';

// Queries
import 'package:animelist/data/providers/anime_graphql.dart';

class MediaDetailsController extends GetxController {
  QueryMutationAnime _queryMutationAnime = QueryMutationAnime();

  bool loading;
  MediaModel media;

  // =====================================================================
  // Getters
  // =====================================================================
  String get queryGetInfoAnime => _queryMutationAnime.getAnimeInfo();

  void setMedia(Map json) {
    media = MediaModel.fromJson(json);
  }
}
