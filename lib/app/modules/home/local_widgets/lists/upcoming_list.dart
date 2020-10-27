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

class UpcomingList extends StatelessWidget {
  const UpcomingList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<HomeController>(
      builder: (controller) {
        return Query(
          options: QueryOptions(
            documentNode: gql(controller.queryGetUpcoming),
            variables: {
              "page": 1,
              "perPage": AppConfig.itemsPerPage,
              "season": controller.nextSeason.season,
              "seasonYear": controller.nextSeason.year,
            },
          ),
          builder: (result, {fetchMore, refetch}) {
            if (!result.loading && !result.hasException) {
              controller
                  .setUpcomingList((result.data["Page"]["media"] as List));
            }

            return MediaSection(
              loading: result.loading,
              title: "upcoming".tr,
              mediaList: controller.upcomingList,
              messageError: result.exception.toString(),
            );
          },
        );
      },
    );
  }
}
