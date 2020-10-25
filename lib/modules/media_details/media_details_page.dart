import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Local Widgets
import 'local_widgets/image_top.dart';
import 'local_widgets/header.dart';
import 'local_widgets/overview.dart';
import 'local_widgets/cast.dart';
import 'local_widgets/information.dart';

// Controllers
import 'media_details_controller.dart';

class MediaDetailsPage extends StatelessWidget {
  final int id;

  MediaDetailsPage({
    Key key,
    @required this.id,
  }) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<MediaDetailsController>(
      init: MediaDetailsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Query(
            options: QueryOptions(
              documentNode: gql(controller.queryGetInfoAnime),
              variables: {
                "id": id,
              },
            ),
            builder: (result, {refetch, fetchMore}) {
              if (result.hasException) {
                print(result.exception.toString());
              }

              controller.loading = result.loading;

              if (!result.loading && !result.hasException) {
                controller.setMedia(result.data["Media"]);
              }

              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Banner With Actions
                      ImageTopMediaDetails(),

                      // Header
                      HeaderMediaDetails(),

                      // Overview
                      OverviewMediaDetails(),

                      // Cast
                      CastMediaDetails(),

                      // Information
                      InformationMediaDetails(),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
