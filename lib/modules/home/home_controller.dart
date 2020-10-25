import 'package:animelist/modules/media_details/media_details_page.dart';
import 'package:meta/meta.dart' show required;

// Libraries
import 'package:get/get.dart';

// Models
import 'package:animelist/data/models/media_model.dart';

// Querys
import 'package:animelist/data/providers/anime_graphql.dart';

class HomeController extends GetxController {
  QueryMutationAnime _queryMutationAnime = QueryMutationAnime();

  List<MediaModel> _trendingList = List<MediaModel>();
  List<MediaModel> _popularList = List<MediaModel>();
  List<MediaModel> _upcomingList = List<MediaModel>();

  // =====================================================================
  // Getters
  // =====================================================================
  String get queryGetTrending => _queryMutationAnime.getTrending();
  List<MediaModel> get trendingList => _trendingList;

  String get queryGetPopular => _queryMutationAnime.getPopular();
  List<MediaModel> get popularList => _popularList;

  String get queryGetUpcoming => _queryMutationAnime.getUpcoming();
  List<MediaModel> get upcomingList => _upcomingList;

  @override
  void onInit() {
    super.onInit();
  }

  // Set Trending List
  void setTrendingList(List list) {
    _trendingList = List<MediaModel>();
    _trendingList = list.map((e) => MediaModel.fromJson(e)).toList();

    update(["trending"]);
  }

  // Set Popular List
  void setPopularList(List list) {
    _popularList = List<MediaModel>();
    _popularList = list.map((e) => MediaModel.fromJson(e)).toList();

    update(["popular"]);
  }

  // Set Upcoming Next Season List
  void setUpcomingList(List list) {
    _upcomingList = List<MediaModel>();
    _upcomingList = list.map((e) => MediaModel.fromJson(e)).toList();

    update(["upcoming"]);
  }

  // Open Media With ID
  void openMedia({@required int id}) {
    Get.to(
      MediaDetailsPage(id: id),
      transition: Transition.rightToLeft,
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
