import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// Controllers
import '../media_details_controller.dart';

class InformationMediaDetails extends StatelessWidget {
  InformationMediaDetails({
    Key key,
  }) : super(key: key);

  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<MediaDetailsController>(
      init: MediaDetailsController(),
      builder: (controller) {
        return Container(
          width: SizeConfig.safeBlockHorizontal * 100,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
          ),
          margin: EdgeInsets.only(
            bottom: SizeConfig.safeBlockVertical * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Studio Info
              _lineInfo(
                context: context,
                title: "Studio",
                data: controller.media?.studiosFormat(),
                loading: controller.loading,
              ),

              // Genres Info
              _lineInfo(
                context: context,
                title: "Genre",
                data: controller.media?.genresFormat(),
                loading: controller.loading,
              ),

              // Release Info
              _lineInfo(
                context: context,
                title: "Release",
                data: controller.media?.seasonYear.toString(),
                loading: controller.loading,
              ),
            ],
          ),
        );
      },
    );
  }

  // =====================================================================
  // Line With Info
  // =====================================================================
  Widget _lineInfo({
    @required BuildContext context,
    @required String title,
    @required String data,
    bool loading,
  }) {
    // Font Size (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 3.3;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 2.2;
    }

    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 1.2,
      ),
      child: Row(
        children: [
          // Title
          Container(
            width: SizeConfig.safeBlockHorizontal * 18,
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1.merge(
                    TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            ),
          ),

          // Info
          (loading)
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[50],
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 40,
                    height: SizeConfig.safeBlockVertical * 2.3,
                    color: Colors.white,
                  ),
                )
              : Expanded(
                  child: Text(
                    data,
                    style: Theme.of(context).textTheme.subtitle2.merge(
                          TextStyle(
                            fontSize: _fontSize,
                          ),
                        ),
                  ),
                ),
        ],
      ),
    );
  }
}
