// Libraries
import 'package:get/get.dart';

// Providers
import 'package:animelist/app/data/providers/anime_graphql.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => QueryMutationAnime());
  }
}
