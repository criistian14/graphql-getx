import 'package:meta/meta.dart' show required;

// Libraries
import 'package:get/get.dart';

// Models
import 'package:animelist/data/models/media_model.dart';

// Querys
import 'package:animelist/data/providers/anime_graphql.dart';

// Utilities
import 'package:animelist/utils/season_utils.dart';

// Pages
import 'package:animelist/modules/media_details/media_details_page.dart';

class HomeController extends GetxController {
  QueryMutationAnime _queryMutationAnime = QueryMutationAnime();

  RxList<MediaModel> trendingList = List<MediaModel>().obs;
  RxList<MediaModel> popularList = List<MediaModel>().obs;
  RxList<MediaModel> upcomingList = List<MediaModel>().obs;

  Season currentSeason, nextSeason;

  // =====================================================================
  // Getters
  // =====================================================================
  String get queryGetTrending => _queryMutationAnime.getTrending();
  String get queryGetPopular => _queryMutationAnime.getPopular();
  String get queryGetUpcoming => _queryMutationAnime.getUpcoming();

  @override
  void onInit() {
    super.onInit();

    // Get Current Season of year
    currentSeason = Season.current();

    // Get Next Season of year
    nextSeason = Season.next(
      current: currentSeason,
    );
  }

  // Set Trending List
  void setTrendingList(List list) {
    trendingList.clear();
    trendingList.addAll(list.map((e) => MediaModel.fromJson(e)));
  }

  // Set Popular List
  void setPopularList(List list) {
    popularList.clear();
    popularList.addAll(list.map((e) => MediaModel.fromJson(e)));
  }

  // Set Upcoming Next Season List
  void setUpcomingList(List list) {
    upcomingList.clear();
    upcomingList.addAll(list.map((e) => MediaModel.fromJson(e)));
  }

  // Open Media With ID
  void openMedia({@required MediaModel media}) {
    Get.to(
      MediaDetailsPage(),
      transition: Transition.rightToLeft,
      arguments: {"media": media},
    );
  }

  void showError({@required String message}) {
    Get.snackbar(
      "Hola",
      "message",
      duration: Duration(seconds: 3),
    );
  }
}
