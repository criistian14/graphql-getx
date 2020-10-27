import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';


// Controllers
import '../media_details_controller.dart';

class ImageTopMediaDetails extends StatelessWidget {
  ImageTopMediaDetails({
    Key key,
  }) : super(key: key);

  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: _heightContainer(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Banner Image
          _banner(),

          // Actions
          _actions(context),
        ],
      ),
    );
  }

  // =====================================================================
  // Banner Image
  // =====================================================================
  Widget _banner() {
    // Fit Image Banner (Responsive)
    BoxFit _fitImageBanner = BoxFit.fitHeight;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fitImageBanner = BoxFit.fitWidth;
    }

    return GetBuilder<MediaDetailsController>(
      builder: (controller) {
        if (controller.loading.value) {
          return Lottie.asset(
            "assets/lottie_files/2705-image-loading.json",
            fit: BoxFit.fill,
          );
        }

        return ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Loading
              Lottie.asset(
                "assets/lottie_files/2705-image-loading.json",
                fit: BoxFit.fill,
              ),

              // Image
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: "${controller.media.bannerImage}",
                fit: _fitImageBanner,
              ),
            ],
          ),
        );
      },
    );
  }

  // =====================================================================
  // Actions
  // =====================================================================
  Widget _actions(BuildContext context) {
    // Size Icon (Responsive)
    double _sizeIcon = SizeConfig.safeBlockHorizontal * 6;
    if (SizeConfig.orientation == Orientation.landscape) {
      _sizeIcon = SizeConfig.safeBlockHorizontal * 4;
    }

    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).padding.top +
          (SizeConfig.safeBlockVertical * 3),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                size: _sizeIcon,
              ),
            ),

            // Like
            FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.favorite_border,
                size: _sizeIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ====================================================================
  // Height Container (Responsive)
  // ====================================================================
  double _heightContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      // return SizeConfig.safeBlockVertical * 84;
      return SizeConfig.safeBlockVertical * 45;
    }

    // return SizeConfig.safeBlockVertical * 45;
    return SizeConfig.safeBlockVertical * 20;
  }
}
