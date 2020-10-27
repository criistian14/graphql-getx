import 'package:flutter/material.dart';

// Libraries
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Controllers
import '../media_details_controller.dart';

class CastMediaDetails extends StatelessWidget {
  CastMediaDetails({
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
          height: _heightContainer(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
          ),
          margin: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 4,
          ),
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (controller.loading.value) {
                  return _loadingPeople();
                }

                return _person(context, index);
              },
              itemCount: controller.loading.value
                  ? 10
                  : controller.media.characters.length,
            ),
          ),
        );
      },
    );
  }

  // =====================================================================
  // Person (Image and Name)
  // =====================================================================
  Widget _person(BuildContext context, int index) {
    // Width Main Container (Responsive)
    double _withContainer = SizeConfig.safeBlockHorizontal * 16;
    // Size Container Profile Picture (Responsive)
    Size _sizeContainerProfile = Size(
      SizeConfig.safeBlockHorizontal * 13,
      SizeConfig.safeBlockHorizontal * 13,
    );
    // Size Container Name (Responsive)
    Size _sizeContainerName = Size(
      SizeConfig.safeBlockHorizontal * 16,
      SizeConfig.safeBlockVertical * 5,
    );
    // Font Size Name (Responsive)
    double _fontSizeName = SizeConfig.safeBlockHorizontal * 3.3;
    if (SizeConfig.orientation == Orientation.landscape) {
      _withContainer = SizeConfig.safeBlockHorizontal * 13;
      _sizeContainerProfile = Size(
        SizeConfig.safeBlockHorizontal * 7,
        SizeConfig.safeBlockHorizontal * 7,
      );
      _sizeContainerName = Size(
        SizeConfig.safeBlockHorizontal * 13,
        SizeConfig.safeBlockVertical * 16,
      );
      _fontSizeName = SizeConfig.safeBlockHorizontal * 2;
    }

    return GetBuilder<MediaDetailsController>(
      builder: (controller) {
        return Container(
          width: _withContainer,
          margin: EdgeInsets.only(
            right: SizeConfig.safeBlockVertical * 4,
          ),
          child: Column(
            children: [
              // Profile Picture
              Container(
                width: _sizeContainerProfile.width,
                height: _sizeContainerProfile.height,
                child: _profilePicture(context, index),
              ),

              // Name
              Container(
                width: _sizeContainerName.width,
                height: _sizeContainerName.height,
                margin: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 1.5,
                ),
                child: Text(
                  controller.media.characters[index].name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2.merge(
                        TextStyle(
                          fontSize: _fontSizeName,
                        ),
                      ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // =====================================================================
  // Profile Picture
  // =====================================================================
  Widget _profilePicture(BuildContext context, int index) {
    return GetBuilder<MediaDetailsController>(
      builder: (controller) {
        return Stack(
          fit: StackFit.expand,
          children: [
            // Loading
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Lottie.asset(
                "assets/lottie_files/5856-image-picture.json",
                fit: BoxFit.fill,
              ),
            ),

            // Image
            ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: "${controller.media.characters[index].image}",
                fit: BoxFit.cover,
              ),
            ),

            // If Not has picture
            if (controller.media.characters[index].image == null)
              CircleAvatar(
                child: Text(controller.media.characters[index].name[0]),
                backgroundColor: Theme.of(context).unselectedWidgetColor,
              ),
          ],
        );
      },
    );
  }

  // =====================================================================
  // Loading
  // =====================================================================
  Widget _loadingPeople() {
    // Width Main Container (Responsive)
    double _withContainer = SizeConfig.safeBlockHorizontal * 16;
    if (SizeConfig.orientation == Orientation.landscape) {
      _withContainer = SizeConfig.safeBlockHorizontal * 13;
    }

    return Container(
      width: _withContainer,
      height: _withContainer,
      margin: EdgeInsets.only(
        right: SizeConfig.safeBlockVertical * 4,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Lottie.asset(
        "assets/lottie_files/5856-image-picture.json",
      ),
    );
  }

  // ====================================================================
  // Height Container (Responsive)
  // ====================================================================
  double _heightContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 36;
    }

    return SizeConfig.safeBlockVertical * 15;
  }
}
