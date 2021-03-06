import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app/utils/app_config.dart';
import 'package:animelist/app/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Controllers
import '../../home_controller.dart';

// Local Widgets
import '../media_section.dart';

class PopularList extends StatelessWidget {
  const PopularList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<HomeController>(
      builder: (controller) {
        return Query(
          options: QueryOptions(
            documentNode: gql(controller.queryGetPopular),
            variables: {
              "page": 1,
              "perPage": AppConfig.itemsPerPage,
              "season": controller.currentSeason.season,
              "seasonYear": controller.currentSeason.year,
            },
          ),
          builder: (result, {fetchMore, refetch}) {
            if (!result.loading && !result.hasException) {
              controller.setPopularList((result.data["Page"]["media"] as List));
            }

            return MediaSection(
              loading: result.loading,
              title: "popular".tr,
              mediaList: controller.popularList,
              messageError: result.exception.toString(),
            );
          },
        );
      },
    );
  }
}
