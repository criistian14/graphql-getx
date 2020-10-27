import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';

// Global Widgets
import 'package:animelist/global_widgets/star_rating.dart';

// Controllers
import '../media_details_controller.dart';

class HeaderMediaDetails extends StatelessWidget {
  HeaderMediaDetails({
    Key key,
  }) : super(key: key);

  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<MediaDetailsController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
          ),
          margin: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 5,
          ),
          child: Column(
            children: [
              // First Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title Movie
                  _titleMovie(context),

                  // Image Resolution 4K
                  _resolution(context),
                ],
              ),

              // Second Section
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Button Watch Now
                    _btnWatchNow(),

                    // Rating
                    StarRating(
                      rating: controller.media?.averageScore,
                      loading: controller.loading.value,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // =====================================================================
  // Button Watch Now
  // =====================================================================
  Widget _btnWatchNow() {
    // Size (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 2.5;
    // Padding (Responsive)
    EdgeInsets _padding = EdgeInsets.symmetric(
      horizontal: SizeConfig.safeBlockHorizontal * 6,
      vertical: SizeConfig.safeBlockVertical * 1.5,
    );
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 2;
      _padding = EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
        vertical: SizeConfig.safeBlockVertical * 2.5,
      );
    }

    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: _padding,
      child: Text(
        "watch_now".tr,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: _fontSize,
        ),
      ),
    );
  }

  // =====================================================================
  // Title Movie
  // =====================================================================
  Widget _titleMovie(
    BuildContext context,
  ) {
    // Size Icon (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 6;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 3.4;
    }

    return GetBuilder<MediaDetailsController>(
      builder: (controller) {
        if (controller.loading.value) {
          return Container(
            width: SizeConfig.safeBlockHorizontal * 68,
            height: SizeConfig.safeBlockVertical * 4.2,
          );
        }

        return Container(
          width: SizeConfig.safeBlockHorizontal * 76,
          child: Text(
            controller.media.title,
            style: Theme.of(context).textTheme.headline5.merge(
                  TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
          ),
        );
      },
    );
  }

  // =====================================================================
  // Image Resolution (4K)
  // =====================================================================
  Widget _resolution(
    BuildContext context,
  ) {
    // Size (Responsive)
    double _size = SizeConfig.safeBlockVertical * 2.4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _size = SizeConfig.safeBlockVertical * 5.4;
    }

    return ImageIcon(
      AssetImage(
        "assets/images/4k-fullhd.png",
      ),
      color: Theme.of(context).unselectedWidgetColor,
      size: _size,
    );
  }
}
