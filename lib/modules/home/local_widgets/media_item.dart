import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Global Widgets
import 'package:animelist/global_widgets/star_rating.dart';
import 'package:get/get.dart';

// Libraries
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';

// Models
import 'package:animelist/data/models/media_model.dart';

import '../home_controller.dart';

class MediaItem extends StatelessWidget {
  final MediaModel media;
  const MediaItem({Key key, this.media}) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<HomeController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => controller.openMedia(media: media),
          child: Container(
            width: _widthContainer(),
            margin: EdgeInsets.only(
              right: SizeConfig.safeBlockHorizontal * 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _thumbnailMovie(),
                _titleMovie(context),
                StarRating(
                  rating: media.averageScore,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ====================================================================
  // Thumbnail Movie
  // ====================================================================
  Widget _thumbnailMovie() {
    // Size Thumbnail (Responsive)
    double _widthThumbnail = SizeConfig.safeBlockHorizontal * 35;
    double _heightThumbnail = SizeConfig.safeBlockVertical * 21;
    if (SizeConfig.orientation == Orientation.landscape) {
      _widthThumbnail = SizeConfig.safeBlockHorizontal * 23;
      _heightThumbnail = SizeConfig.safeBlockVertical * 45;
    }

    return Container(
      width: _widthThumbnail,
      height: _heightThumbnail,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
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
              image: "${media.coverImage.large}",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  // ====================================================================
  // Title Movie
  // ====================================================================
  Widget _titleMovie(BuildContext context) {
    // Size Thumbnail (Responsive)
    double _widthContainer = SizeConfig.safeBlockHorizontal * 35;
    double _heightContainer = SizeConfig.safeBlockVertical * 2;
    // Font Size (Responsive)
    double _fontSizeTitle = SizeConfig.safeBlockHorizontal * 3;
    if (SizeConfig.orientation == Orientation.landscape) {
      _widthContainer = SizeConfig.safeBlockHorizontal * 23;
      _heightContainer = SizeConfig.safeBlockVertical * 5;
      _fontSizeTitle = SizeConfig.safeBlockHorizontal * 2;
    }

    return Container(
      width: _widthContainer,
      height: _heightContainer,
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 1.5,
      ),
      child: Text(
        media.title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1.merge(
              TextStyle(
                fontSize: _fontSizeTitle,
              ),
            ),
      ),
    );
  }

  // ====================================================================
  // Width Container (Responsive)
  // ====================================================================
  double _widthContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockHorizontal * 23;
    }

    return SizeConfig.safeBlockHorizontal * 35;
  }
}
