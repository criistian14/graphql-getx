import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app_config.dart';
import 'package:animelist/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Controllers
import 'package:animelist/modules/home/home_controller.dart';

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
              "season": "WINTER",
              "seasonYear": 2021,
            },
          ),
          builder: (result, {fetchMore, refetch}) {
            if (!result.loading && !result.hasException) {
              controller
                  .setUpcomingList((result.data["Page"]["media"] as List));
            }

            return MediaSection(
              loading: result.loading,
              title: "Upcoming Next Season",
              mediaList: controller.upcomingList,
              messageError: result.exception.toString(),
            );
          },
        );
      },
    );
  }
}
